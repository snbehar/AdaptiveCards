// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
import { SerializableObject, Version, Versions } from "./serialization";

export interface ITypeRegistration<T extends SerializableObject> {
    typeName: string,
    objectType: { new(): T },
    schemaVersion: Version
}

export class CardObjectRegistry<T extends SerializableObject> {
    private _items: ITypeRegistration<T>[] = [];

    findByName(typeName: string): ITypeRegistration<T> | undefined {
        for (let item of this._items) {
            if (item.typeName === typeName) {
                return item;
            }
        }

        return undefined;
    }

    clear() {
        this._items = [];
    }

    register(typeName: string, objectType: { new(): T }, schemaVersion: Version = Versions.v1_0) {
        let registrationInfo = this.findByName(typeName);

        if (registrationInfo !== undefined) {
            registrationInfo.objectType = objectType;
        }
        else {
            registrationInfo = {
                typeName: typeName,
                objectType: objectType,
                schemaVersion: schemaVersion
            }

            this._items.push(registrationInfo);
        }
    }

    unregister(typeName: string) {
        for (let i = 0; i < this._items.length; i++) {
            if (this._items[i].typeName === typeName) {
                this._items.splice(i, 1);

                return;
            }
        }
    }

    createInstance(typeName: string, targetVersion: Version): T | undefined {
        let registrationInfo = this.findByName(typeName);

        return (registrationInfo && registrationInfo.schemaVersion.compareTo(targetVersion) <= 0) ? new registrationInfo.objectType() : undefined;
    }

    getItemCount(): number {
        return this._items.length;
    }

    getItemAt(index: number): ITypeRegistration<T> {
        return this._items[index];
    }
}