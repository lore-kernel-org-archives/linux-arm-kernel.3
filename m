Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FF7C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 05:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGaUrxnPupGN/G94QupN7sqi/0EBTqM+/xSQq20HIj4=; b=VjD1oDb0OAqEFjdAnLcVTakuuj
	LNgIdCUPJcXzWHVC2QADEepuHlsQ3z1T8rdnRm7QjSvHfWM8yDfqIqOaDrAFKZwsRCv+oxClb29Js
	k434Dob1fsWOM5StTIQqZ0D/ahFBsto4RijWOI2DCjWa3HUR6QNPtZXYVbZqMncLD9cKpxuh6RPQg
	WxSebEZXMR9z+ljUxAXPvxPcWMNOmZJ9/Z+rpnj7P1ddNrAcD5xKQIVcZrbhWW5lC2Ef6f0q2LZcJ
	5x2Av2BkHXS7lKTI4JVeGwuveUYoz0YsPwQLO+VgAZU5bnydW/SWKWyWy6IG3HjHUDNBXE8PD1NyE
	CGKp6oIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLA6-00000006W16-2HMw;
	Mon, 11 Aug 2025 05:33:34 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulL7Z-00000006Vob-3RAJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 05:30:59 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57B5UjKe1036119;
	Mon, 11 Aug 2025 00:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754890245;
	bh=qGaUrxnPupGN/G94QupN7sqi/0EBTqM+/xSQq20HIj4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yFHpeB+ucmTh/ltorX1Mz72rh6S2cswshu3GSv3iMBWiypkMidCgpzm+ZToswAwS/
	 N9XM9eELfg7Mku8oh5m+8XokVnqR66d0lDRWZC5ox939jiCBLIxHGHrDd3ajFMGo+y
	 8ehi3gMjla23FWoSfBtHCrkVU9nkjxk/TJMgLHgs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57B5Uj0B2434724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 00:30:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 00:30:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 00:30:45 -0500
Received: from [10.249.145.16] ([10.249.145.16])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57B5Ueij2636883;
	Mon, 11 Aug 2025 00:30:41 -0500
Message-ID: <be073100-31a0-44a9-8837-8c0adaf1c0ff@ti.com>
Date: Mon, 11 Aug 2025 11:00:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
To: Brandon Brnich <b-brnich@ti.com>, <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Udit
 Kumar <u-kumar1@ti.com>, Darren Etheridge <detheridge@ti.com>
References: <20250808155555.2632451-1-b-brnich@ti.com>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <20250808155555.2632451-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_223058_034796_8174432A 
X-CRM114-Status: GOOD (  14.05  )
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

On 08/08/25 21:25, Brandon Brnich wrote:
> This adds node for E5010 JPEG Encoder which is a stateful JPEG Encoder
> present in J722s SoC, supporting baseline encoding of semiplanar based
> YUV420 and YUV422 raw video formats to JPEG encoding, with resolutions
> supported from 64x64 to 8kx8k.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
> 
> Changes in v3:
>   - Add TI compatible
>   - Make node name more generic
> 
> Changes in v2:
>   - remove invalid clock-names attribute
> 
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 5cfa7bf36641..c0a104bc87ad 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -385,6 +385,16 @@ c7x_1: dsp@7e200000 {
>  		ti,sci-proc-ids = <0x31 0xff>;
>  		status = "disabled";
>  	};
> +
> +	e5010: jpeg-encoder@fd20000 {
> +		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
> +		reg = <0x00 0xfd20000 0x00 0x100>,
> +		      <0x00 0xfd20200 0x00 0x200>;
> +		reg-names = "core","mmu";
> +		clocks = <&k3_clks 201 0>;
> +		power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
> +		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +	};
>  };
>  
>  &main_bcdma_csi {


