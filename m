Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A6CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg/wxNDlDGejcpYhDbQUNn4X6pECHdSGzNxkCuMyiXA=; b=NTsP1To7W5CqK5VFbhOv9PFiqL
	0QQi8dLgPXJAaRehGMLpFvQ3uVffFTNh2u7aqZpe96zsZp6DmAirivUcfBCypOZgmZp3XKIfLnsM8
	9MuET0NSFS8KFlgZEb9vwdkJp0TOOKKJzJidRgSGfsVPxR37KxLg2Nb2cIrKvc+18lMqDI0F7wiLr
	P4tJH92+zAW+7HPDZJobUK0/FlukxzbqnZq0wteaHIDSykqNQ7fKpYh9T8bQb7D8hO50J7Sek1sZ7
	g4YBfHB8we3CsbET9KhClkzCUwYoEaCXG7+1aFhRKyGJN21HWOcQ9T5BQ9kLI4Rja3lWhLEt0GCfa
	mZxpCd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogUU-0000000DFqD-2sbX;
	Wed, 20 Aug 2025 10:56:26 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofg3-0000000D4qj-44fX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:04:21 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KA4Awu3170873;
	Wed, 20 Aug 2025 05:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755684250;
	bh=Bg/wxNDlDGejcpYhDbQUNn4X6pECHdSGzNxkCuMyiXA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mEKy38OCJYJjiL5hbZQeX59/TDkd1HvrdDP+aBPsOYK81A8vFPxSzWqKw/pfjI343
	 0ryP0VzsISe3sZKNOzbiuaau0lDM3TZoOmJmTI/s0+u7xdECyJoLFjhrPb8v/VgZFt
	 +aeqOJ+xcQrN5Uf2XrO33oauZeWnZanyx9K8C9ec=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KA4ABj1973989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 05:04:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 05:04:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 05:04:08 -0500
Received: from [172.24.22.46] (lt5cg1457vgj.dhcp.ti.com [172.24.22.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KA42TR052951;
	Wed, 20 Aug 2025 05:04:02 -0500
Message-ID: <fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com>
Date: Wed, 20 Aug 2025 15:34:01 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
To: Harikrishna Shenoy <a0512644@ti.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Harikrishna Shenoy <h-shenoy@ti.com>
CC: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <kristo@kernel.org>,
        <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <s-jain1@ti.com>,
        <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
 <8a31d1c5-4233-4696-bf8c-58f5db68d41f@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <8a31d1c5-4233-4696-bf8c-58f5db68d41f@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_030420_098998_5BBE54FA 
X-CRM114-Status: GOOD (  10.62  )
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



On 8/20/2025 11:06 AM, Harikrishna Shenoy wrote:
> 
> On 8/19/25 06:54, Dmitry Baryshkov wrote:
>> On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
>>> Add RPi DSI panel[0] as a valid compatible for simple-panel.
>>>
>>> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
>>>
>>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>>> ---
>>>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
>>> simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
>>> simple.yaml
>>> index 1ac1f0219079..65f486f2bc9d 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>>> @@ -268,6 +268,8 @@ properties:
>>>         - rocktech,rk070er9427
>>>           # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>>>         - rocktech,rk043fn48h
>>> +        # Raspberry, 7" dsi panel
>>> +      - rpi,7inch-dsi
>> It's powertip,ph800480t013-idf02
> Could you please point to any documentation for this?

Git log would point you to it: 

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc

>>
>>>           # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>>>         - samsung,ltl101al01
>>>           # Samsung Electronics 10.1" WSVGA TFT LCD panel
>>> -- 
>>> 2.34.1
>>>


