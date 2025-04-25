Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28828C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4BkpaId2cQLJVzZSSqTKt4CRWF10paVXfUx/kEGsA4=; b=X2Jx2ZU41czZxfilNrbQOMmkf5
	tTxBCzitgxDH8hW5WdmhTOJVqzykCSem//F9oONOAfk7jdX+gM2rSkfV1hjewS1bSdGIAtJSEES7M
	0JKcf/fCzerWI2z1UlCcPJEjzAnH5QQw2EUIg2AZUo4VE6IRyibXtgMQlVTQEdRmxou3KxYHzo0v3
	uwyJ5/rqZ9mczcWuR7cBOwk1OvWBsDUSr9/isyS3pii4+Vso6pj2iqC6P2uQowGy4wfX6ANCIRB4X
	TOJLQzuofMtCJhCaizfjthQMPxRHwRxKne7LcRgrzB/boFknkwryTuT2r0vEN7lfw7LHBsiTQQVS2
	safdxdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LcK-000000009rn-1EBj;
	Fri, 25 Apr 2025 16:09:32 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ju6-0000000HPkO-1tTk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:19:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PEJYF32958153
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 09:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745590774;
	bh=K4BkpaId2cQLJVzZSSqTKt4CRWF10paVXfUx/kEGsA4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CMPbCM5jp4F3Yiw9uztBLruU7FwLSPkZCPZkjgPgu83Du9WlEqBsSUFSwdJRssoxx
	 byDduY3gG7zoZlHvfRZ+X+hAjfSveFB5sYdb/Fb/61qQ4KoyUYMFjyGvNTkhGs1dB1
	 ORfVLxKz1LC+E1C3d9M3R0gTLYVq7qklzrN7n9dc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PEJYuU129550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 09:19:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 09:19:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 09:19:34 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PEJXGO019327;
	Fri, 25 Apr 2025 09:19:33 -0500
Message-ID: <1c657cc6-7667-4a59-85d7-a6f6b29c169b@ti.com>
Date: Fri, 25 Apr 2025 09:19:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: mmc: sdhci-am654: Add
 ti,suppress-v1p8-ena
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>,
        Adrian
 Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Josua Mayer
	<josua@solid-run.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini
	<francesco@dolcini.it>,
        Hiago De Franco <hiagofranco@gmail.com>, Moteen Shah
	<m-shah@ti.com>,
        <stable@vger.kernel.org>
References: <20250422220512.297396-1-jm@ti.com>
 <20250422220512.297396-2-jm@ti.com>
 <20250425-agile-imported-inchworm-6ae257@kuoka>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250425-agile-imported-inchworm-6ae257@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_071946_584255_280B7378 
X-CRM114-Status: GOOD (  18.55  )
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

Hi Krzysztof,

On 4/25/25 2:48 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 22, 2025 at 05:05:10PM GMT, Judith Mendez wrote:
>> Some Microcenter/Patriot SD cards and Kingston eMMC are failing init
>> across Sitara K3 boards. Init failure is due to the sequence when
>> V1P8_SIGNAL_ENA is set. The V1P8_SIGNAL_ENA has a timing component tied
>> to it where if set, switch to full-cycle timing happens. The failing
>> cards do not like change to full-cycle timing before changing bus
>> width, so add flag to sdhci-am654 binding to suppress V1P8_SIGNAL_ENA
>> before changing bus width. The switch to full-cycle timing should happen
>> with HIGH_SPEED_ENA after change of bus width.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
>> index 676a74695389..0f92bbf8e13b 100644
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
>> @@ -201,6 +201,11 @@ properties:
>>         and the controller is required to be forced into Test mode
>>         to set the TESTCD bit.
>>   
>> +  ti,suppress-v1p8-ena:
> 
> Do not tell what the drivers should do, but tell what is the issue with
> the hardware, e.g. some cards do not like full-cycle.... and this will
> also hint you that it should be most likely generic, not specific to
> this device.
> 

Thanks for your review, but this patch has been dropped in v4 since
we adopted a new implementation [0] using compatible string.

[0] 
https://lore.kernel.org/linux-devicetree/20250423180809.l3l6sfbwquaaazar@shrank/

~ Judith


