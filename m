Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8FCCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4mJICxOpJFWxXO8GjVivYdGE86em4xU+Q+XffwEHOM=; b=PD0hArvYgHH9+C5PABcXG7BOuC
	tLEgl/eyTT2tISJ4uI8GqnWQT6V4dXnPv2jyLI5TmnKosj18oij+hLgf05Y9HoaGMinpXojSIy5z5
	olnW6VED5rgCGofrfUx4OhGgQ5Qp3q+sOUASIv5N/Aq/nzP5+87jj2wwMRRDqw5mpW3YTmA9gDc5T
	lLWUAfTUdFFl08hQDW5bXaYQqd1uPqvE5VG5XWjKUruF7h/vO50ZkAHywJfCB5PNy7DNBD7I3bX6F
	GoT4spn379uGhnhlfOU+np1EW8ZQ3H+/LYDl1PIlXfMC1ey48VfL4GlRTUIf7HHuJyP75bseq7cCc
	K7/6piyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEly-00000009QIp-4AGB;
	Tue, 19 Aug 2025 05:20:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEiS-00000009Q2n-2QCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:17:01 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J5GrNl3324582;
	Tue, 19 Aug 2025 00:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755580613;
	bh=T4mJICxOpJFWxXO8GjVivYdGE86em4xU+Q+XffwEHOM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bIjI/FmhuBv+JUm4fuuO17xFFB2/TicreKekTbpIrK43Y6zA4IoDbjj1THRukrd8n
	 NFhfsd7LeqcaKJ0SGgjwV5V+f/GlYpxV0zegOfj0+M7Bsz4z0/A1JhImC9IvoHU1Sq
	 sxHwsdSjdaEvgROdIA4Webvrgj1ElAmC8DTOutzQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J5GrRw156908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 00:16:53 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 00:16:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 00:16:52 -0500
Received: from [172.24.22.46] (lt5cg1457vgj.dhcp.ti.com [172.24.22.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J5Gk4J2463046;
	Tue, 19 Aug 2025 00:16:47 -0500
Message-ID: <f2fff09a-376a-44b9-a421-13202b1079fb@ti.com>
Date: Tue, 19 Aug 2025 10:46:46 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
To: "Kumar, Udit" <u-kumar1@ti.com>, Harikrishna Shenoy <h-shenoy@ti.com>,
        <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <kristo@kernel.org>,
        <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <06a9fa20-e45a-458c-971a-a6f0f1d08004@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <06a9fa20-e45a-458c-971a-a6f0f1d08004@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_221700_710367_A4E20FAB 
X-CRM114-Status: GOOD (  12.88  )
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



On 8/19/2025 10:24 AM, Kumar, Udit wrote:
> 
> On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
>> Add RPi DSI panel[0] as a valid compatible for simple-panel.
>>
>> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/

$subject has typo s/dsiplay/display and s/dsi/DSI
(use a spellcheck with your editor).

Also follow the existing prefix convention for the file (run
git log --oneline to figure out the right prefix)

>>
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
>> simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
>> simple.yaml
>> index 1ac1f0219079..65f486f2bc9d 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> @@ -268,6 +268,8 @@ properties:
>>         - rocktech,rk070er9427
>>           # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>>         - rocktech,rk043fn48h
>> +        # Raspberry, 7" dsi panel
>> +      - rpi,7inch-dsi
> 
> Hello Hari,
> 
> Driver changes should come first to match new compatible before device
> tree changes.

No, there isnt a driver update that I can see in the current series. But
if there was one, then such a patch should be slotted after binding
updates as Bindings represent HW. Besides checkpatch will complain

> 
> 
>>           # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>>         - samsung,ltl101al01
>>           # Samsung Electronics 10.1" WSVGA TFT LCD panel


