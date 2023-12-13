// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct LaunchFragment: SpaceXAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment LaunchFragment on Launch { __typename id mission_name launch_date_utc }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { SpaceXAPI.Objects.Launch }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", SpaceXAPI.ID?.self),
    .field("mission_name", String?.self),
    .field("launch_date_utc", SpaceXAPI.Date?.self),
  ] }

  public var id: SpaceXAPI.ID? { __data["id"] }
  public var mission_name: String? { __data["mission_name"] }
  public var launch_date_utc: SpaceXAPI.Date? { __data["launch_date_utc"] }
}
