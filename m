Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D5ACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvpCeul1OPk71aWNBtuBifUPK9X0RxxbmWPhiOMRmIs=; b=c9WkouNAkzmzXC8WfqLgOtTRoq
	VNpY5E9IsxqlLneFaAPLBRZfnw8ozy7A1jmoJm8fD7j0R8F7M9rWsAubEByhkxJL6cnEDl+904xzU
	WcrpR5+x5b6/FPh/kUdtv5l4+pGUpzSQJTBT5TL3zK8zcfpkyJoVqrktY7XiLVYfIP0xurCPadhUU
	VpgKWtkkmP/XQodgW54/SNnH/AW2uxXCHObKWpVzKzNnyFloqw5tVfYF4TEirhVW9GWbCSQjO8MbZ
	exWTlWzKNr/FFw8k6DETLZoIb/HfIDaEbuCZSNbDnNieMXj8ps9omgfatHYcuF+nXNnySUSW9eelk
	vZ2FS5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFLK-00000009TPg-32Em;
	Tue, 19 Aug 2025 05:57:10 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFHl-00000009T94-2RRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:53:31 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J5qqtv2883261;
	Tue, 19 Aug 2025 00:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755582772;
	bh=QvpCeul1OPk71aWNBtuBifUPK9X0RxxbmWPhiOMRmIs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p/g/daPsXyy5VfsDqZTEPm/ceGvl5X3BHwzG9zAaGIw35rZkYtXdYRGO4iH0kZr4G
	 rhGEYOghB93/iYmwSaIP661LnKmZRC3UJBcQJcJiEdNMAKGHXmklO+qyvGzMxwOldV
	 dclQA4v91WwOoq93a6gbjP+XY6sXEKbTnjqaronM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J5qqla367345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 00:52:52 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 00:52:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 00:52:51 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J5qhie2220996;
	Tue, 19 Aug 2025 00:52:44 -0500
Message-ID: <0268561b-8a3b-4508-bd28-3b47f5a8b754@ti.com>
Date: Tue, 19 Aug 2025 11:22:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
To: "Raghavendra, Vignesh" <vigneshr@ti.com>,
        Harikrishna Shenoy
	<h-shenoy@ti.com>, <neil.armstrong@linaro.org>,
        <jessica.zhang@oss.qualcomm.com>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <kristo@kernel.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <06a9fa20-e45a-458c-971a-a6f0f1d08004@ti.com>
 <f2fff09a-376a-44b9-a421-13202b1079fb@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <f2fff09a-376a-44b9-a421-13202b1079fb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_225329_712713_09A7A852 
X-CRM114-Status: GOOD (  14.53  )
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


On 8/19/2025 10:46 AM, Raghavendra, Vignesh wrote:
>
> On 8/19/2025 10:24 AM, Kumar, Udit wrote:
>> On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
>>> Add RPi DSI panel[0] as a valid compatible for simple-panel.
>>>
>>> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> $subject has typo s/dsiplay/display and s/dsi/DSI
> (use a spellcheck with your editor).
>
> Also follow the existing prefix convention for the file (run
> git log --oneline to figure out the right prefix)
>
>>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>>> ---
>>>    .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
>>> simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
>>> simple.yaml
>>> index 1ac1f0219079..65f486f2bc9d 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>> @@ -268,6 +268,8 @@ properties:
>>>          - rocktech,rk070er9427
>>>            # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>>>          - rocktech,rk043fn48h
>>> +        # Raspberry, 7" dsi panel
>>> +      - rpi,7inch-dsi
>> Hello Hari,
>>
>> Driver changes should come first to match new compatible before device
>> tree changes.
> No, there isnt a driver update that I can see in the current series. But

correct current series does not have driver changes.

I would expect driver changes as well, which should come before device tree.


> if there was one, then such a patch should be slotted after binding
> updates as Bindings represent HW. Besides checkpatch will complain
>
>>
>>>            # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>>>          - samsung,ltl101al01
>>>            # Samsung Electronics 10.1" WSVGA TFT LCD panel

