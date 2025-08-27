Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD48CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNq7FAgo4z92pYyBMMzR/Nsu4N6hHZWc/4w7c520tTQ=; b=S2tunmeXgfesqavaHnnJ6AFt7L
	1rtnhuNLZO/dfvicDeB6rAkDXZpXqyYQ0qWCy7Yk36CYt0EtxIzVRHMbJ8xX0HEPbbjWAYqbgMXQ/
	LKn6y/HgwOdViP34Y1JiA3pGnFxylBQeeCJOCGISBMBNnoVuo6bLQNZQFgbTN76UdeivgApIijDWK
	lQihQcZUMsK92hSP/KXVvf03CDE0IKOYJ+VznAU9aN/UmQseT6k7OTj0I3Fu8GsuEYR5O5zZLhdTY
	ssd1OtcfcFDpHOVTB0b/gW3thVcVsqBBAYWiRZOlSF8BY6V7p6AHAUkiBVMBzdAdzHQ79BkJKiZBo
	23apqLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMqu-0000000GmdD-10Ht;
	Wed, 27 Aug 2025 20:34:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbd-0000000GZ7m-0Vee
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 19:14:50 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RJEfbm1837415;
	Wed, 27 Aug 2025 14:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756322082;
	bh=YNq7FAgo4z92pYyBMMzR/Nsu4N6hHZWc/4w7c520tTQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ABaJO41gCUL5gKb7nixcy0Fq5p22ycOIyf0mY6a/RnwOEz+b+Bj6joJZEGJ5akgeS
	 TGe3U2KZJNqjDgb3Bew0xgr4ng1ThDgsZT9yxkp2foKg79RY07lrkl8+B8bldY/e6G
	 WpPmdKHUFtxyIUsfSb7lF3KOps+XLn90ohJAPpqo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RJEfai3385684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 27 Aug 2025 14:14:41 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 14:14:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 14:14:41 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RJEfHf3567231;
	Wed, 27 Aug 2025 14:14:41 -0500
Message-ID: <18fb75ad-aab8-455c-91a7-f8741289191c@ti.com>
Date: Wed, 27 Aug 2025 14:14:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin
 Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
 <20250812-topic-am62-dt-partialio-v6-15-v2-1-25352364a0ac@baylibre.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-1-25352364a0ac@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_121449_303081_E5644B72 
X-CRM114-Status: GOOD (  13.61  )
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

On 8/12/25 04:15, Markus Schneider-Pargmann wrote:
> WKUP_EN is a flag to enable pin wakeup. Any activity will wakeup the SoC
> in that case.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index c0f09be8d3f94a70812b66c3f91626aac35f4026..d3b0ecdf1a4a4de25ee6121ec9e62d1c7df26eb9 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -19,6 +19,7 @@
>   #define DS_OUT_VAL_SHIFT	(26)
>   #define DS_PULLUD_EN_SHIFT	(27)
>   #define DS_PULLTYPE_SEL_SHIFT	(28)
> +#define WKUP_EN_SHIFT		(29)
>   
>   /* Schmitt trigger configuration */
>   #define ST_DISABLE		(0 << ST_EN_SHIFT)
> @@ -65,6 +66,7 @@
>   #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
>   #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
>   #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
> +#define WKUP_EN				(1 << WKUP_EN_SHIFT)
>   
>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
> 

Reviewed-by: Kendall Willis <k-willis@ti.com>

