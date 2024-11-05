Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD580D40D08
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SU8DwkNDTzeQ2NIK+yrgU5JF0OSH+sCfFE5Eac/5L1o=; b=AOEaBY4GG1Wz/e2R7+PELO07To
	FjIr38BwcgQWjkMZif0Sr9brpM33C38alZPJv/A0Sui0+momY6SQRbYGU0ovTx5v1OgG3IMDg4ZA8
	+hsMAubI30n+5x16r9ZubaiAEKjx67UhHk2dt77Dhl7cqLMbfzHEC42Hcm3khu5cK215PauIL10gI
	EGf9omWWQ7mxE8m6evKAM2QdapOgb2dpoOItr22W1oyisqULg8IXDlr1Pl0Po7sauR3xIoxGDe2+I
	4btMv7EVAzDJJDs7anpFIuvWcfUI+T6+z1rKbmhQXqNI6jjx5v77qYnSPObZlApk0XBdbiw0IMEfw
	8EVTl6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8T6A-000000017Fg-3h9J;
	Tue, 05 Nov 2024 23:36:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8T4R-0000000172F-1MQA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730849685;
	bh=SU8DwkNDTzeQ2NIK+yrgU5JF0OSH+sCfFE5Eac/5L1o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LSI/exDIwaTfqG20PDM3xVYWO4hEIO011twPHfviMD7kYq8tmjuruuV5scTmfWXUo
	 PLpzOR4VeZR6BazKffzpoBqfihezqQ5rqTkrB5TwxQq5xW8dU44xlRq1gb7WEDDwPM
	 ob7xrZzfkoOG8hhZYKEBXmVPV777crqx4z59yXxBLxBUzkz35SyLmL54mlZB5eslnW
	 Gks3AYlypU74C0L1j+bxnKGXNAbSonX93xWZn9IPSKCZGdGrOyrU3Gwz4vlwh0zuKn
	 YAb/LJxfkEKUNb4yW2zfLW65a09HK7nwFOPOYZWOUADL+LjdoD/3oYHELgEPIq9pl7
	 cdHCmd46bCKBg==
Received: from [192.168.68.112] (ppp118-210-162-114.adl-adc-lon-bras34.tpg.internode.on.net [118.210.162.114])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 91CD16B1F7;
	Wed,  6 Nov 2024 07:34:44 +0800 (AWST)
Message-ID: <ebdc6c112457db0ec73b43a404e240052dd3c7e4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Conor Dooley <conor@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Naresh Solanki
 <naresh.solanki@9elements.com>, jdelvare@suse.com, Conor Dooley
 <conor.dooley@microchip.com>, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org,  sylv@sylv.io, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,  linux@roeck-us.net, Joel Stanley
 <joel@jms.id.au>, conor+dt@kernel.org
Date: Wed, 06 Nov 2024 10:04:44 +1030
In-Reply-To: <20241105-regroup-busily-adbb9b342abc@spud>
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
	 <173072771091.3690717.11563964377469449295.robh@kernel.org>
	 <20241104-saturate-device-d020a0d7321f@spud>
	 <f468a5c0a0112cee35815fb6c7b7f9933934adc2.camel@codeconstruct.com.au>
	 <20241105-regroup-busily-adbb9b342abc@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_153447_611359_88F498B9 
X-CRM114-Status: GOOD (  36.23  )
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

On Tue, 2024-11-05 at 18:53 +0000, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 10:39:34AM +1030, Andrew Jeffery wrote:
> > Hi Conor,
> >=20
> > On Mon, 2024-11-04 at 18:49 +0000, Conor Dooley wrote:
> > > On Mon, Nov 04, 2024 at 08:39:21AM -0600, Rob Herring (Arm)
> > > wrote:
> > > >=20
> > > > On Mon, 04 Nov 2024 14:52:14 +0530, Naresh Solanki wrote:
> > > > > Document the new compatibles used on IBM SBP1.
> > > > >=20
> > > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---
> > > > > Changes in V4:
> > > > > - Retain Acked-by from v2.
> > > > > - Fix alphabetic order
> > > > > ---
> > > > > =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | =
1
> > > > > +
> > > > > =C2=A01 file changed, 1 insertion(+)
> > > > >=20
> > > >=20
> > > >=20
> > > > My bot found new DTB warnings on the .dts files added or
> > > > changed in
> > > > this
> > > > series.
> > > >=20
> > > > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > > > warnings
> > > > are fixed by another series. Ultimately, it is up to the
> > > > platform
> > > > maintainer whether these warnings are acceptable or not. No
> > > > need to
> > > > reply
> > > > unless the platform maintainer has comments.
> > > >=20
> > > > If you already ran DT checks and didn't see these error(s),
> > > > then
> > > > make sure dt-schema is up to date:
> > > >=20
> > > > =C2=A0 pip3 install dtschema --upgrade
> > > >=20
> > > >=20
> > > > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-
> > > > sbp1.dtb' for
> > > > 20241104092220.2268805-1-naresh.solanki@9elements.com:
> > >=20
> > > Really? This many warnings on a v6?
> > >=20
> >=20
> > I understand that it's surprising and disappointing, however these
> > warnings are from the Aspeed DTSIs and not directly from the
> > proposed
> > DTS. Many are an artefact of history, and I'm (slowly) working to
> > clean
> > them up. Recently I haven't had any time to dedicate to that
> > effort,
> > and as I'm somewhat responsible for the state of things, I'm not
> > prepared to block other people's patches and push my own
> > responsibilities onto them.
>=20
> Ah, you see that's where I would say "no new warnings" and get the
> submitter to fix them ;) And were I the submitter, I'd want to
> resolve
> the warnings rather than run into issues down the road when things
> get
> "fixed"/documented.But I guess that's why I have the schmucks task of
> reviewing bindings innit..

I have to manage that in tension with my concern of people simply not
upstreaming their devicetrees in response. I'd prefer to have them
merged upstream than to encourage more forks in this corner of the
world. If people would like to take the initiative and do the binding
conversions, corrections and devicetree fixes themselves, I'll
definitely review them.

>=20
> > I've been replying to those proposing new Aspeed-based devicetrees
> > to
> > separate the warnings they're introducing from the warnings that
> > already exist, and requiring them to fix the issues they're
> > responsible
> > for. I hope that I'll have time to continue to improve the
> > situation,
> > as this is obviously a tedious task for me too.=20
>=20
> Well, it is your platform and if you're confident that these nodes
> are
> correct despite the warnings, who am I to stop you!

I think where things stand currently is a bit fuzzier than anyone would
like. The nodes are not incorrect to the point of being non-functional
with respect to their intent, but clearly they're not so correct that
they do not have room for improvement.

Andrew

