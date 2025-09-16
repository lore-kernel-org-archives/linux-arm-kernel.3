Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C94CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJkGfDcwDqP60o/V3NViblQLFb9Y4GSuV/HkoATCsEg=; b=sJLeNuzNlVVFEfr6ESRlsikmE+
	1sxRouhcjv2NaXOU+F0JKahHYkprEftg8p9GWhRvtVF7Sz8CYsZcJAuibOg3xrvF7UsqH71s54djg
	BpDPpcQy5y4R9+/BvDDKeG009gHH6NjNALlc1e4pfifybZoAuXO+UAfUJzhttx6yTGSVtSiRTjTy9
	PAeV8MNcClipMBG+IoK/dIhPEw7Y+/xm1iWoo5jMBV/47Q4kSoF6zUE+oBb9eFYpAFguesF19cUDg
	MNLyaHAlu52xoSpyTi8r4RwcIRHfy33OaOxoaixMzXacUhm6THRULsfOf48HeUBCKIudlNeAcgKFA
	NpK0v70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydh4-00000009JHt-3Nrx;
	Tue, 16 Sep 2025 21:58:34 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydh1-00000009JH1-44MY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:58:33 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58GLwPTp103866;
	Tue, 16 Sep 2025 16:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758059906;
	bh=UJkGfDcwDqP60o/V3NViblQLFb9Y4GSuV/HkoATCsEg=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=oYooj2CAhGlg3wuLBOoaypdro2mgHKDAhTmAlZjjvU4IV4u/6gaCctGYKSqv0ywbn
	 D/7uRLxFF7OT+eo1O2HJVVlJeQ+f34Z9biJwtfOhLHbczaWEl1GTy9dSi0gLCP6gmr
	 e11f51mU/w45gAy0oYuLGlcV7iUh7FR2MPLhK9So=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58GLwPN91839800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 16 Sep 2025 16:58:25 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 16:58:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 16:58:25 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58GLwOGT1970510;
	Tue, 16 Sep 2025 16:58:25 -0500
Message-ID: <3e3de956-e071-461b-ada0-813daa3ef0c0@ti.com>
Date: Tue, 16 Sep 2025 16:58:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
From: Kendall Willis <k-willis@ti.com>
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
 <18fb75ad-aab8-455c-91a7-f8741289191c@ti.com>
Content-Language: en-US
In-Reply-To: <18fb75ad-aab8-455c-91a7-f8741289191c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_145832_144306_CE73EBF1 
X-CRM114-Status: GOOD (  10.67  )
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

On 8/27/25 14:14, Kendall Willis wrote:
> On 8/12/25 04:15, Markus Schneider-Pargmann wrote:
>> WKUP_EN is a flag to enable pin wakeup. Any activity will wakeup the SoC
>> in that case.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/ 
>> dts/ti/k3-pinctrl.h
>> index 
>> c0f09be8d3f94a70812b66c3f91626aac35f4026..d3b0ecdf1a4a4de25ee6121ec9e62d1c7df26eb9 100644
>> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> @@ -19,6 +19,7 @@
>>   #define DS_OUT_VAL_SHIFT    (26)
>>   #define DS_PULLUD_EN_SHIFT    (27)
>>   #define DS_PULLTYPE_SEL_SHIFT    (28)
>> +#define WKUP_EN_SHIFT        (29)
>>   /* Schmitt trigger configuration */
>>   #define ST_DISABLE        (0 << ST_EN_SHIFT)
>> @@ -65,6 +66,7 @@
>>   #define PIN_DS_PULLUD_DISABLE        (1 << DS_PULLUD_EN_SHIFT)
>>   #define PIN_DS_PULL_DOWN        (0 << DS_PULLTYPE_SEL_SHIFT)
>>   #define PIN_DS_PULL_UP            (1 << DS_PULLTYPE_SEL_SHIFT)
>> +#define WKUP_EN                (1 << WKUP_EN_SHIFT)
>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>   #define PIN_GPIO_RANGE_IOPAD    (PIN_INPUT | 7)
>>
> 
> Reviewed-by: Kendall Willis <k-willis@ti.com>

FYI: A series by Akash [1] has been picked in linux-next. It includes 
the WKUP_EN macro but defined differently as PIN_WKUP_EN. The series 
needs to be rebased to account for that macro.

[1] https://lore.kernel.org/all/20250909044108.2541534-1-a-kaur@ti.com/

Best,
Kendall Willis

