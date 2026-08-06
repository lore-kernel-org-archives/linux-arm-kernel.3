Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93676C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVZRy0YZlCjC9/KWxr/f7SDogbybirs0ZOdMfzAeX5E=; b=dJ9Ee+AwT7HfVUKTejvUAomXxM
	xbB8MkZr7tyRUfFpqRg4DghqaSMWCqdKBp77z1t7JVB+CV8F5nMBgKEunhqluyHGEj7QGfs/hU5KC
	YPZe/kw1c7W9tfOqEGLFET4Fa+kncV0XYQ5RK7aHyTcgPJKsfh6ptWY0qWcqj4J1sh45FayB1e1uR
	beU4DR+SYKCN2z9luBXt9Qk+MuMNCT3NMUMi+c/Imlq4Q+AfqQHLQcwiyLXKwybzyAo64ikHCDloK
	0VRa/73hwPmvUJt7Fpq+3bIkOZRAxjMjCmDLBBuYhQU+V8Uxa4H7QwMsLNxlZHDxbt21MJ/u6+bWr
	99F+QaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwsG-00000005i5i-0llJ;
	Thu, 06 Aug 2026 12:07:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwsD-00000005i5I-2Zxp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:06:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F033153B;
	Thu,  6 Aug 2026 05:06:52 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0A133F632;
	Thu,  6 Aug 2026 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786018016; bh=r9VGBxwF+J0VJMXe/vi44fLPtflZtoQXoDHaJyHXsjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GGKJmMity6kCF4wZUNnHzGepGcdf1SaRohZ8rLzLYO1VxTi0fZmOhXFOXJnUb1Vf9
	 okW11psOZ0rMszXq//5a61um/a4XDtFh74fuswTOVdDdoe608hYchCJ1BUTHAAGX9F
	 dklFELZc0aOaNaGHxF0c2x8fqfYoTiYtoz3VBiSY=
Message-ID: <3c39665b-5fe0-4015-ae96-c97e0ce8e9c2@arm.com>
Date: Thu, 6 Aug 2026 14:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 0/2] net: stmmac: Add support for Allwinner A733
 GMAC210
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050657_742745_549A131C 
X-CRM114-Status: GOOD (  20.83  )
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

Hi,

On 7/31/26 18:30, Jerome Brunet wrote:
> The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
> the A523 GMAC200 already supported by dwmac-sun55i, but with a few
> significant differences:
> 
>   * The glue configuration registers are a dedicated MMIO region of the
>     controller instead of a syscon register.
>   * That region is inside the controller reset domain, so the reset must be
>     released before the configuration is written, and must not be asserted
>     again afterwards or the configuration is lost.
>   * The DMA channels have their own interrupt lines.
>   * A PTP reference clock and an AHB reset are needed.
>   * The controllers do not require a power domain (AFAIK).
>   * The TX clock delay value is 5 bits wide instead of 3, split over 2
>     register fields.
> 
> The DT changes for the A733 and the Cubie A7A board are not part of this
> series and will be sent separately through the sunxi tree.
> 
> Tested on a Cubie A7A, RGMII with an external PHY on GMAC0.
> 
> Full disclosure: at the moment there is a problem with EEE/LPI while
> testing on the Cubie A7A. If the device stays in LPI mode long enough, the
> link sometimes (but not always) goes down, coming back up when the device
> exits LPI mode.

I saw that the MAXIO PHY *vendor* driver disables exactly those two 
modes, so is this maybe more of a PHY problem?

Cheers,
Andre

> 
> I'm currently working around the problem by adding the following
> properties to the PHY node:
> 
> 	eee-broken-100tx;
> 	eee-broken-1000t;
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (2):
>        dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
>        net: stmmac: Add support for Allwinner A733 GMAC210
> 
>   .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
>   2 files changed, 242 insertions(+), 33 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260731-allwinner-a733-gmac-support-163bde10c152
> 
> Best regards,
> --
> Jerome
> 
> 


