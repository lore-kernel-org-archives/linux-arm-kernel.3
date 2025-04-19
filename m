Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C60FC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOsQo0dZK86u6ePoYRKpFPkcAhNX39c3BBfeb9fF8ko=; b=qXocG2o4UybRs/qb6xeldbBIIP
	MGuPbj6BQPwYV/pykQw66KEy9YJvIcBa8oNlgW2BHJ+0x8LEyNwFhi5GPhFUn1P+RPA1XWGRkgtry
	0AiNgIy8lPR6tyVuxPGuu36uodmlbeeiN/kGqfQrwlWuhKSsjj/f8Com83+lPqBQNGuF8TGTX39bU
	1rlUOuoLfA5cXDanEMAzA5RaKJr6iZMoeo9KmZ17vagYn3cCx8EsS/xURbXJUsLGm61bqhytxAF/i
	H/YnLJYZrK4EjCgmXFN7KPQ1I0SvoiQNvptnAAzRZmsYYyqfTmtnyRccgpk+U7NPGlFXQH5ea17qf
	NFvy9LuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69VJ-00000001PzX-2Mz0;
	Sat, 19 Apr 2025 14:49:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69TR-00000001Pqv-3gyN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 14:47:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JElEok1216562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745074034;
	bh=wOsQo0dZK86u6ePoYRKpFPkcAhNX39c3BBfeb9fF8ko=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fb5gXpv6yUm8xhHD03n48LzPuHviK1c1g7pdkRVdXlNvikIq2sGjS9p7SBTFFxx+J
	 GKm//lBMopcc3R/mTSQYJnqFROdJY6VI3fVVp+zE5/FV9FeOecYKcLsUB44pPB46S9
	 /wBB+dUyAwJ2YIUq2iYzQdVSteQfHY9z7uur9cKM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JElEdC040165
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:47:14 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:47:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:47:13 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JElAEr127795;
	Sat, 19 Apr 2025 09:47:10 -0500
Message-ID: <fc7b5381-9289-4da2-bab0-e574772bfb86@ti.com>
Date: Sat, 19 Apr 2025 20:17:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: ti: k3-am62*: Add non-removable flag
 for eMMC
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-5-jm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417233040.3658761-5-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_074718_019130_6735B714 
X-CRM114-Status: GOOD (  12.22  )
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


On 4/18/2025 5:00 AM, Judith Mendez wrote:
> EMMC device is non-removable so add 'non-removable' DT
> property to avoid having to redetect the eMMC after
> suspend/resume.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 1 +
>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 1 +
>   3 files changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index a5469f2712f09..1c8b4d13fb491 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -832,6 +832,7 @@ &main_spi2 {
>   
>   &sdhci0 {
>   	bootph-all;
> +	non-removable;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&emmc_pins_default>;
>   	disable-wp;


Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index d29f524600af0..43fcb57b34ebf 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -454,6 +454,7 @@ &main_i2c2 {
> [..]

