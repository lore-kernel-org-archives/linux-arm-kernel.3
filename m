Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B83C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81e5U12yQNl/T/++JQb1aWg02Oq1JzXIwoKQeuPOf/Y=; b=bnkHEVsbRCuX+Fiv4KejNJt5ZW
	vDnfQhDTWYXghCMEd67u7DzvaYr2jw09Ibfedi3TzVEy8Llimoth1i08zNnkdDDZO+luKyXQ4xX6E
	+f5lpYFx1Pb/BA+V93mq1qSEis/1cbf1NcaHtKePvcCjUGqn8+idvAyYkqQvMIwtBjd762Bk90qL7
	TIRzDzH/cEv8S0oFInyXAeLp6D7N8ppv+46GQnniGf8PIuJAjv/p8sAD2aMmH0ub0cXiBsVll1l/I
	6nGlYu2fZr9zVPvLoLO2YnxWIANwPvgzdN0i4pPGG0nG3GvPT+VUYCGai0hVCx4lU421SK5dHStQb
	T5ocsV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQo6-0000000DbtO-12gA;
	Fri, 21 Mar 2025 01:04:18 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQQI-0000000DZl3-1jaf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 00:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742517572;
	bh=81e5U12yQNl/T/++JQb1aWg02Oq1JzXIwoKQeuPOf/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hNvtqjzoDLk8nMsNRAwLiBQBq+A/jaZLOBJz+AKXu7nVybKAhi3bpWyAN3UwvUAb8
	 X7W18/K0L0z19l88HAz/Q+IzcU8f5p+yOmbFKNjjC/Vr6SM/ECKFUy1ENppiVPOAp/
	 ls5fZFHmu4slQdo12PDCxxBwT5rPrsOrlZ17+Ww48dGtZIE59RQ/1bEcHzhclY2HU8
	 524k15wq+Y3mMZNo+dFMqrzObb2BHGo0BTtsJ1wRv4OL3ScntyzPkIbI6NMg+wO5DT
	 PuIlnqy0QducLALaoV3cHepsDSaDVxG96w28MCkSn5/NUiqE6ORZLXIuI0PM9Lhd3U
	 Y+ASm+H464Yfg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B61B17A4E7;
	Fri, 21 Mar 2025 08:39:30 +0800 (AWST)
Message-ID: <158f6e8e6c41250d6b88c5f2b5dc6df5d728222b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC
 compatible
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, joel@jms.id.au,
 robh+dt@kernel.org,  openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 jothayot@amd.com, linux-aspeed@lists.ozlabs.org,  krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Date: Fri, 21 Mar 2025 11:09:29 +1030
In-Reply-To: <174233663954.4094319.18412685456723022993.robh@kernel.org>
References: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
	 <174233663954.4094319.18412685456723022993.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_173942_660112_471A9CC2 
X-CRM114-Status: GOOD (  13.55  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 2025-03-18 at 17:26 -0500, Rob Herring (Arm) wrote:
>=20
> On Tue, 18 Mar 2025 12:47:29 -0500, Rajaganesh Rathinasabapathi wrote:
> > Document new AMD Onyx BMC board compatibles
> >=20
> > Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi=
@amd.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
> =C2=A0 pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/aspeed/' =
for 20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com:
>=20
...
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dtb: mbeeprom@50: $nodename:=
0: 'mbeeprom@50' does not match '^eeprom@[0-9a-f]{1,2}$'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/eeprom/at24.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dtb: mbeeprom@50: Unevaluate=
d properties are not allowed ('$nodename' was unexpected)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/eeprom/at24.yaml#

Rajaganesh: Please fix these warnings before you send v5.

Andrew

