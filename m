Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121BDC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 04:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVO7pPvS9it63pRV7s9Xy2kC4yPGFJZs59pPpi//UPs=; b=V0NcCh4KUK20JaFcdZwZMI0bTw
	HybMixXa3MIZg5vonarCIaej7j0A80yzcitwRdgtDIX3Dzh+kr3MNjVdh4PIr7O2aJk1x1719F4Fo
	B93xoVq39wJt+UNonZ7Xz6Pk5HG09RuBlvDulOMKHqxzDBOYpgwWtnAokP6IBYNKukbq0XUWdKRh/
	wfELfYewS1EBI0Jm1VaLL+oCamIJHFuQwF0bCID7t6odCodXrQgpWaBHUvCGX3UfGikkD0Y/xwCHJ
	oO//mYypIlrgmF0Z12cCKvlDC2dOzRsCs8SB2kByavWQC+G5za51TpL5uJnZpCShUmznYk/pjPznE
	2T84L40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAe8-0000000HF13-3WT4;
	Tue, 04 Feb 2025 04:34:48 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAcm-0000000HEux-3uix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 04:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738643597;
	bh=OVO7pPvS9it63pRV7s9Xy2kC4yPGFJZs59pPpi//UPs=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=AZ5+ijlKDQgxKTEifzz0lMAm8+CID+Vq9cW8amOSUOU2Lnrbgnn+RCsZMj1J/bF9P
	 IXpGFNm7WoQQrR5ryZs0gtv7IJQ3SiM/fDn72Ih4I/3VGF2Bp/MKobboggFt1+xwPE
	 20bsV5MIrHoCNcVNagNJVt72f4eopKbWzvG+eqWWe7fsd1hDwWs7vJFg5vOctzsb2t
	 gUfSqg0iYSd5RlppAuDM2qcmEB8YxwbJspydO//mUNV6Xhu+4fceeckJJy3Mn7gSUv
	 EtsHS5/nOLzIYgNbpyy78UmaGA5ttbtGugGQBuhz2hKfevC4/FMBLMO1bOPGqqbJV2
	 T3oJaaY0oFD8A==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D96DD734A6;
	Tue,  4 Feb 2025 12:33:13 +0800 (AWST)
Message-ID: <79b819b6d06e3be0aa7e7f6872353f103294710c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 0/9] DTS updates for system1 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, brgl@bgdev.pl, 
 linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net,  edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com,  openipmi-developer@lists.sourceforge.net,
 netdev@vger.kernel.org, joel@jms.id.au,  devicetree@vger.kernel.org,
 eajames@linux.ibm.com,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Tue, 04 Feb 2025 15:03:13 +1030
In-Reply-To: <20250203144422.269948-1-ninad@linux.ibm.com>
References: <20250203144422.269948-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_203325_180917_CAF98DDD 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Ninad,

On Mon, 2025-02-03 at 08:44 -0600, Ninad Palsule wrote:
> Hello,
>=20
> Please review the patch set version 7.
>=20
> V7:
> ---
> =C2=A0 - Updated pattern in the ast2400-gpio.yaml
> =C2=A0 - Dropped "dt-bindings: net: faraday,ftgmac100" patch sending it
> =C2=A0=C2=A0=C2=A0 separately.
>=20
> V6:
> ---
> =C2=A0 - Fixed dt_binding_check errors for ipmb-dev.yaml
> =C2=A0 - Changed the hog parsing pattern in ast2400-gpio
>=20
> V5:
> ---
> =C2=A0 - Improved IPBM device documentation.
> =C2=A0 - Added the hog parsing in ast2400-gpio
>=20
> V4:
> ---
> =C2=A0 - Removed "Add RGMII support" patch as it needs some work from the
> =C2=A0=C2=A0=C2=A0 driver side.
> =C2=A0 - Improved IPBM device documentation.
> =C2=A0 - There is a new warning in CHECK_DTBS which are false positive so
> =C2=A0=C2=A0=C2=A0 ignored them.
> =C2=A0=C2=A0=C2=A0 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb:
> gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of
> the regexes: 'pinctrl-[0-9]+'
>=20
> V3:
> ---
> =C2=A0 - Fixed dt_binding_check warnings in ipmb-dev.yaml
> =C2=A0 - Updated title and description in ipmb-dev.yaml file.
> =C2=A0 - Updated i2c-protocol description in ipmb-dev.yaml file.
>=20
> V2:
> ---
> =C2=A0 Fixed CHECK_DTBS errors by
> =C2=A0=C2=A0=C2=A0 - Using generic node names
> =C2=A0=C2=A0=C2=A0 - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
> =C2=A0=C2=A0=C2=A0 - Adding binding documentation for IPMB device interfa=
ce
>=20
> NINAD PALSULE (6):

Why is your name all in caps here but not for the binding patches
below? Can you fix that up?

> =C2=A0 ARM: dts: aspeed: system1: Add IPMB device
> =C2=A0 ARM: dts: aspeed: system1: Add GPIO line name
> =C2=A0 ARM: dts: aspeed: system1: Reduce sgpio speed
> =C2=A0 ARM: dts: aspeed: system1: Update LED gpio name
> =C2=A0 ARM: dts: aspeed: system1: Remove VRs max8952
> =C2=A0 ARM: dts: aspeed: system1: Mark GPIO line high/low
>=20
> Ninad Palsule (3):
> =C2=A0 bindings: ipmi: Add binding for IPMB device intf

This one needs an ack from Corey if I'm to take it.

> =C2=A0 dt-bindings: gpio: ast2400-gpio: Add hogs parsing

This one needs an ack from Linus W or Bartosz if I'm to take it.
However, it's also causing some grief from Rob's bot:

https://lore.kernel.org/all/173859694889.2601726.10618336219726193824.robh@=
kernel.org/

As the reported nodes should all be hogs the name shouldn't matter
anywhere else (as far as I'm aware). It would be nice if all the
warnings were cleaned up before we merged the binding update. That way
we don't cause everyone else looking at the CHECK_DTBS=3Dy output more
grief than they already get for the Aspeed devicetrees.

In order to not get bogged down it might be worth splitting out both
the IPMB- and GPIO- related patches like you did the FTGMAC100 patch,
and then I can merge what remains (from a quick look they seem
relatively uncontroversial).

Andrew

> =C2=A0 ARM: dts: aspeed: system1: Disable gpio pull down
>=20
> =C2=A0.../bindings/gpio/aspeed,ast2400-gpio.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +
> =C2=A0.../devicetree/bindings/ipmi/ipmb-dev.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0 56 +++++++
> =C2=A0.../dts/aspeed/aspeed-bmc-ibm-system1.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 139 +++++++++++-----
> --
> =C2=A03 files changed, 147 insertions(+), 54 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-
> dev.yaml
>=20


