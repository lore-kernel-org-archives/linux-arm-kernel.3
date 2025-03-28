Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41BEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xm+K+6QmdL1evz0mZ+yxfUZCcJu7K/29bMYYiqKxrYY=; b=z+4G0YeND3sYNRHWAeGatQ8yga
	EwAlFuCZBsnvJWL8uuGzuj7aiam/HcLHt/jN+XEzpBI6khljMVlXaLqg7plr4FdnAnNrPfZcCDPWm
	Ujw3MR8o7369axcfBFWA1OsqR+uFWrjTucPONoZP3DYzibMrWuUSuF+Mv4Hs19yu6VZrUbst5x03l
	fl4IY2Nl8hGbt8FM3l/MPNriBAJm6KH3QtbrJllDRA4PaA+hVWR6ovaflpg7F6UXRUYWAb0SFDjMi
	onrjUQ8YcHjhXHuwXUoyTs2YUznuJS0j8kjP5ryrccFiYp+Wn1cFE91+wEW4P06Q2RKHcCzEVZWNi
	rpCTJ/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyCMV-0000000DsCu-3GC9;
	Fri, 28 Mar 2025 16:15:15 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyCJq-0000000DruF-1VTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 16:12:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SGCOb82157906
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 11:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743178344;
	bh=Xm+K+6QmdL1evz0mZ+yxfUZCcJu7K/29bMYYiqKxrYY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IRxQNM2GHazCM297qQAzmRK5Bwcmac90pPrtqSN8J3xne9c6/htIbghNikNm8f+g0
	 bzl34txTmTuWk7dKIphRFvFDCToQzQRAvHfH6RYZ5h3FPRBpBEe1DZsHdTm29pamXa
	 HmUZOHZ07kwXpAnw67iBsXRKWfyaB7gNwGCEOqIg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SGCOmf128593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 11:12:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 11:12:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 11:12:24 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SGCKTc088176;
	Fri, 28 Mar 2025 11:12:21 -0500
Message-ID: <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
Date: Fri, 28 Mar 2025 21:42:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250313144155.2382316-1-mwalle@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250313144155.2382316-1-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_091230_491983_E34DD08B 
X-CRM114-Status: GOOD (  17.86  )
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

Hello Michael

Thanks for patch

On 3/13/2025 8:11 PM, Michael Walle wrote:
> Add the node for the random number generator inside the crypto module.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> This was tested on a J722S/AM67A. Also, according to the TRM this is the

Could you re-confirm please , after adding this node.  you selected trng 
offered by Linux


> MCU instance of the SA3UL. But it's defined in -main.dtsi. Is this
> correct?

Yes this is correct,

please refer

https://www.ti.com/lit/zip/sprujb3  SPRUJB3A.pdf

table 2.1 Main Memory map, this node falls under main domain

> ---
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 6e3beb5c2e01..e868e006318e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -227,9 +227,17 @@ crypto: crypto@40900000 {
>   		reg = <0x00 0x40900000 0x00 0x1200>;
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> +		ranges = <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
> +
>   		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
>   		       <&main_pktdma 0x7507 0>;
>   		dma-names = "tx", "rx1", "rx2";
> +
> +		rng: rng@40910000 {
> +			compatible = "inside-secure,safexcel-eip76";
> +			reg = <0x00 0x40910000 0x0 0x7d>;
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;

For completeness , this is ok to add this node but should be kept disabled

similar to

https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662 




> +		};
>   	};
>   
>   	secure_proxy_sa3: mailbox@43600000 {

