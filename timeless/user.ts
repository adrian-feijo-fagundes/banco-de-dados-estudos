export class User {
  public constructor(
      private id: number,
      private name: string,
      private email: string,
      private password: string,
      private create_in: Date,
      private description_perfil: string,
      private gender: string,
      private premium: Date | null,
      private type: 0 | 1
  ) {}

  //Metódos para atualizar o perfil do usuário
  set Name(name: string)                            { this.name = name }
  set Email(email: string)                          { this.email = email }
  set Password(password: string)                    { this.password = password }
  set Create_In(create_in: Date)                    { this.create_in = create_in }
  set descriptionPerfil(description_perfil: string) { this.description_perfil = description_perfil }
  set Gender(gender: string)                        { this.gender = gender }
  set Premium(premium: Date | null)                 { this.premium = premium }
  set Type(type: 0 | 1)                             { this.type = type }

  //Metódos para visualizar dados do perfil
  get Id():number                 { return this.id }
  get Name():string               { return this.name }
  get Email():string              { return this.email }
  get Password():string           { return this.password }
  get Create_In():Date            { return this.create_in }
  get descriptionPerfil():string  { return this.description_perfil }
  get Gender():string             { return this.gender }
  get Premium():Date | null       { return this.premium }
  get Type():number               { return this.type }
 
  //Checar se é premium
  public checkPremium():string | number {
      return (this.premium == null) ? "No" : `${this.premium.toLocaleDateString()}`
  }

  //Checar se é instrutor
  public checkInstrutor():string {
      return (this.type == 0) ? 'Studdent' : 'Instructor'
  }

  //Formatação
  public toString():string { return `\
  User ID: ${this.id}
  Name: ${this.name}
  Email: ${this.email}
  Description: ${this.description_perfil}
  Gender: ${this.gender}
  Create in: ${this.create_in}
  Premium: ${this.checkPremium()}
  Type: ${this.checkInstrutor()}
  ` }

}