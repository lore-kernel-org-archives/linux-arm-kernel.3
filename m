Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A0CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 05:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxqW1+HVqZt8tNdYWLOekx1h+1GGvAsmtTB9R2oJ/V0=; b=CJgeA+oH6jTF2sQixkAJqvc9Ws
	oGfvk095vvegfFQ4kr+y0ppCZ5sNhE2DkN3oOMzmxmQRKzSyDAJWayU4y8w4DdqZYKWriEmbg7nmb
	T3S/XXX+jJaSjiIGAukBd/blcj21afDgSLUX1xko57uLC93bpC8un2op/aeIBeAoaA/W3PgQRO2jq
	HWNn+2eAUdNipaozBGNlwvqyPiFvnap5sUlmUIwjSLjaGxZRackPnvPWRHrzE1BcLpET2XuuHbXFr
	UvYXYYgZxl5k8pNkgWPdMM7Vta9s8KxtSygxiGHV97J0UU1wBAtjeOxwuAIRpm/rW3Dw7pSGzhZmB
	s5gIGoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfu1-00000004AAH-31eg;
	Wed, 03 Sep 2025 05:19:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfrI-000000048sw-0WHz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 05:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756876594;
	bh=VxqW1+HVqZt8tNdYWLOekx1h+1GGvAsmtTB9R2oJ/V0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O6ZwNqm2xWP5UVmWTAh/vmC9/Iv0DHsjJ9LS1ak4NXOYFWnbcjDIZ6vNXkLlC9YEg
	 OLljPDxHBzYs1mptfy4DnBLEAnujJ8vbmmpnd3Gnd3GunjnkGx9XPJ/zp3JhlMCIKc
	 yblsFpJb/kETW9SUoNODv8q7sxvz7djFActkyYveGNIxVIySrtM6I0KNxkU1ksGdNY
	 B1VEHcsBShr+T3wPmm1J5oORFNBY6ehYLXRBfFl+trkrxjgMyAq2pcuB+xzHn1Qmeq
	 tOnKep1DBIeJsDbMgEQFeSMYD5iBK1rPyzbsYiTZiSAIXOOn61gF21VU6NBelnJGWk
	 UrOpZtsgrpQRA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BF2DB6E02C;
	Wed,  3 Sep 2025 13:16:33 +0800 (AWST)
Message-ID: <ab4c3c62e3b48dfac1bcce15e0aea402d66bc198.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/4] Revise Meta Santabarbara devicetree
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Sep 2025 14:46:33 +0930
In-Reply-To: <175529259974.3212367.16366822597087067588.robh@kernel.org>
References: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
	 <175529259974.3212367.16366822597087067588.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_221636_354007_C1189DB5 
X-CRM114-Status: GOOD (  21.02  )
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

Hi Fred,

On Fri, 2025-08-15 at 16:19 -0500, Rob Herring (Arm) wrote:
>=20
> On Thu, 14 Aug 2025 21:16:56 +0800, Fred Chen wrote:
> > Summary:
> > Revise linux device tree entry related to Meta (Facebook) Santabarbara.
> >=20
> > Change log
> > v1 -> v2:
> > =C2=A0 - add 'bmc_ready_noled' LED and update commit message
> > =C2=A0 - add sgpio line name for leak detection
> > v1:
> > =C2=A0 - add sensor nodes for extension board
> > =C2=A0 - add mctp node for NIC
> > =C2=A0 - adjust LED configuration
> >=20
> > Fred Chen (4):
> > =C2=A0 ARM: dts: aspeed: santabarbara: add sensor support for extension
> > =C2=A0=C2=A0=C2=A0 boards
> > =C2=A0 ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
> > =C2=A0 ARM: dts: aspeed: santabarbara: Adjust LED configuration
> > =C2=A0 ARM: dts: aspeed: santabarbara: add sgpio line name for leak det=
ection
> >=20
> > =C2=A0.../aspeed-bmc-facebook-santabarbara.dts=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 857 +++++++++++++++++-
> > =C2=A01 file changed, 853 insertions(+), 4 deletions(-)
> >=20
> > --
> > 2.49.0
> >=20
> >=20
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
> This patch series was applied (using b4) to base:
> =C2=A0Base: attempting to guess base-commit...
> =C2=A0Base: tags/v6.17-rc1-9-g8e4021078863 (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/aspeed/' =
for 20250814131706.1567067-1-fredchen.openbmc@gmail.com:
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: mctp@10 (m=
ctp-i2c-controller): 'label' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/net/mctp-i2c-controller.yaml#
>=20

Can you please address this warning and send v3? Check that it no-
longer appears after you fix the dts. You can test it with the command
suggested above. More thoughts here:

https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sourc=
es-with-the-devicetree-schema/

Thanks,

Andrew

