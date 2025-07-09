Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313C8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+64fnXIXSgNnCIG6if9Uadk28NbjJVWxSfgeT94QG74=; b=QjUgHrOF3sI4kEQZ2qfeRrdlfW
	L/OD0ev4ufl1udqgBjil2cQzGRlQ//Sly2b795ATHIUb+cHCwTTupESthXSGrgz72CCWltOk7Fq+V
	bdUmoM4T+83Zo5DzQYhx9GRuJG6pAnFRRbgJqyiXv/DaIbmrSODRU7Uu8VoCvcjVYjGB9NHPWCVkh
	bQcVkkjTK/k1J+nFZjiUiK85TWdcl/AFgq/JcYXcGXGniW3vcR2kf4yfRXVZx6V0H8SUUNy25ZxFX
	SxpdX84ET/aEaCKTxVxLW92DPZCZsyzD+vJyYGUoExke+ogIV8fDY44AcZC4TTx3mx5KCsklK7+fs
	sNCEs2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoK-00000009xdF-0zEq;
	Wed, 09 Jul 2025 21:58:41 +0000
Received: from [37.205.8.231] (helo=mx.olsak.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYhD-00000009RSW-2PUE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 17:35:06 +0000
DKIM-Signature: a=rsa-sha256; bh=+64fnXIXSgNnCIG6if9Uadk28NbjJVWxSfgeT94QG74=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1752082383; v=1; x=1752514383;
 b=Ot9uvKj88SCNKZXhCwSLc7Mlc+19lqQn3riLUfvGUlHkwpR12dYtzxqtfXX5WgIcETyoHYb7
 3zAcaawntNY5dakJuNcoE1wSv36nxkOGQeX3JcxmCalOcx9b7noP7k3FmYytVXu75jbrtsusvQ2
 B9ukt85xBF8QA8e7X0pQZTdQF37Slb82WPUM6haiBwPokSNNZNNYi6g0qG2RJnAia1gg02HeNAc
 +bbAWjg+znV+Km5vvE31WZ2KBKK/w0Pm3p/T8N4WCbfgnvTkBlbC/NoAmYOng2vON81cbUVH5ma
 4sWmXdFHX1qlpqj/hc2csN530rcCW308NmGI7SLoylq9A==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 66672483; Wed, 09 Jul 2025 19:33:03 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>,
 Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, soc@lists.linux.dev,
 linux-mmc@vger.kernel.org
Subject: Re: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to pxav1
Date: Wed, 09 Jul 2025 19:33:01 +0200
Message-ID: <3379810.44csPzL39Z@radijator>
In-Reply-To: <20250709-spectacular-goat-of-tenacity-ced55a@krzk-bin>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
 <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
 <20250709-spectacular-goat-of-tenacity-ced55a@krzk-bin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_103504_627730_E448BF34 
X-CRM114-Status: GOOD (  11.98  )
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

On Wednesday, 9 July 2025 09:32:06 Central European Summer Time Krzysztof=20
Kozlowski wrote:
> On Tue, Jul 08, 2025 at 07:09:46PM +0200, Duje Mihanovi=C4=87 wrote:
> > The current pinctrl properties apply only to the pxav1 controller.
>=20
> Why they are not applicable for pxav3?

state_cmd_gpio is used for working around a PXA168 SDIO erratum. That SoC u=
ses=20
the pxav1 controller and no such erratum exists on any of the other PXA SoC=
s.

> > Adding one default pinctrl node to a pxav3 controller therefore causes
> > a schema warning.
> >=20
> > Check the existing properties only on pxav1. pxav2 and pxav3 may add
> > their own set of pinctrl properties if and when needed.
>=20
> This should be rather made complete here, because properties should be
> defined in top-level, not in allOf: block. Strictly speaking pinctrl-xxx
> are defined in core schema, but still the binding should follow same
> rule - define them in top.

Would it then be acceptable to declare the pinctrl properties in the top le=
vel=20
and define each controller's respective description: and items: in the allO=
f:=20
block?

Regards,
=2D-
Duje



