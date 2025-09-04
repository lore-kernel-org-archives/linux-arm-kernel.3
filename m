Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF94CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJWd2GdqmONSMgXynZQD3tF9E/uol/2oNFgNcJ3L0Ns=; b=SHNtVnnm2fWGn5eBrtHjxKc3xQ
	Q1I6neBYHd62JwmjV840i9rWDjs0thw8GlMkNxb9/GMwV0LfdyX65ogbTIWwPUaDiqJK8RMD2Nxra
	2E7xTkt4mW9aW1Rb4+CkMDksUShV0oI5Mqpj2XbqxWnMog9NhDomaIqcLaCJ9GSJ5BPwrgwg6inzL
	dj4PwrSXxSYGueuuOQ712xfiOFDw7HQde/1QJhxr+HPUY4Ayqa6nFe2lrZe/zyP9m+rhVJxeTcVsZ
	fwV1MzZSbeWNTAZorStGZl3pCwm9a+9/HVuUR1dznh+zWalNs+SBK10h9vzp3ECWsAkxcb4wIa3li
	dh3g9zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Be-00000009RFs-18iv;
	Thu, 04 Sep 2025 06:11:10 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu368-00000009PKj-1VFc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 06:05:29 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58465Ogf2945232;
	Thu, 4 Sep 2025 01:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756965924;
	bh=xJWd2GdqmONSMgXynZQD3tF9E/uol/2oNFgNcJ3L0Ns=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HNqwXsXvhP/lbCutPmWGIszOidN6sA/xFgKFBvfkMUwgJLisT3JW/3M8neprSeUW0
	 pNmnfhNaEA5BFT3y6gA4zVmPHqPw8+nbQizHLc5DhxS+zAM17KF9RF3xepzza1yRN2
	 6+2/KJU1hzM8e4uyjj8gxf0/8Qy0za5x2J9oByJs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58465OTp3599531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 01:05:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 01:05:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 01:05:23 -0500
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58465IMH2500914;
	Thu, 4 Sep 2025 01:05:19 -0500
Message-ID: <c5dd1c02-8538-4b9f-a453-d18e7a30ae30@ti.com>
Date: Thu, 4 Sep 2025 11:32:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
 <20250902071917.1616729-4-a-kaur@ti.com>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <20250902071917.1616729-4-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_230528_487517_264C6369 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Akash,

On 02/09/25 12:49, Akashdeep Kaur wrote:
> Add the drive stregth, schmitt trigger enable macros to pinctrl file.
> Add the missing macros for DeepSleep configuration control referenced
> from "Table 14-6172. Description Of The Pad Configuration Register Bits"
> in AM625 TRM[0].
> Add some DeepSleep macros to provide combinations that can be used
> directly in device tree files example PIN_DS_OUTPUT_LOW that
> configures pin to be output and also sets its value to 0.
> 
> [0] https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
...
> +#define DS_OUT_VALUE_ZERO       (0 << DS_OUT_VAL_SHIFT)
> +#define DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
> +
> +#define WKUP_ENABLE             (1 << WKUP_EN_SHIFT)
> +#define WKUP_ON_LEVEL           (1 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
> +#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
> +
> +#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)

This can be moved below WKUP_ENABLE macro to be consistent

> +
>   /* Only these macros are expected be used directly in device tree files */
>   #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
>   #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
> @@ -53,18 +79,41 @@
>   #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
>   #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
>   
> +#define PIN_DRIVE_STRENGTH_NOMINAL      (0 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_SLOW         (1 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_FAST         (2 << DRV_STR_SHIFT)
...
> +#define DS_STATE_VAL                    (1 << DS_EN_SHIFT)
> +#define ACTIVE_STATE_VAL                (0 << DS_EN_SHIFT)

These can be moved to the top before PIN_* and can be renamed to 
DS_STATE_EN and DS_STATE_DIS

> +
> +#define PIN_DS_OUTPUT_LOW               (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
> +#define PIN_DS_OUTPUT_HIGH              (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
> +#define PIN_DS_INPUT                    (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DISABLE)
> +#define PIN_DS_INPUT_PULLUP             (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_UP)
> +#define PIN_DS_INPUT_PULLDOWN           (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DOWN)
> +
> +#define PIN_WKUP_EN_EDGE                (WKUP_ENABLE | WKUP_ON_EDGE)
> +#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
> +#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
> +#define PIN_WKUP_EN                     WKUP_EN_EDGE

As EDGE wake is used commonly we can use the PIN_WKUP_EN_EDGE in this case

>   
>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)

Thanks
Sebin

