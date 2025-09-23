Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12464CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnzpHwo3q7997FFkEs8jwSh1z9SSMeRB7M3+4Ac9o8k=; b=P0v8qJYthnxjZ+/oIDfGP7q4R3
	VNCSJsfO4wJsAj/YzW23lHGuHVX6UYjOFEH8N1TuA2e0VoNAMYNDWMPPJEZUksKQAFbxMP0KZIGpT
	FNhecZjPPNvq2Ellk2i9drIH+TOqGXf/Hv+vQpp4K4YBwJAYQhBeffZlEfAEyZAY9+XLLxczF9Ra1
	V6MA+uLUNTL0B+vX5c7k7rt2plLZklGgYq+egoLcTMgj5q7fob0uLu8uUlwjUhSnH/h+ssFseg7fU
	Bj6TYocEih/Ul+9AdviOzE3T6xreZr1H6QOFyfRxT3RJ6it00TKSz7vvebxohe+WGZsVH4bUjlkY+
	Biv5Y+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rcv-0000000Bz1V-49NH;
	Tue, 23 Sep 2025 01:15:29 +0000
Received: from mail-m1973171.qiye.163.com ([220.197.31.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rcs-0000000Bz0b-2oz6;
	Tue, 23 Sep 2025 01:15:28 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23b3334ac;
	Tue, 23 Sep 2025 09:15:15 +0800 (GMT+08:00)
Message-ID: <5d078df4-4e0b-464b-9c2f-28b9a2669c5c@rock-chips.com>
Date: Tue, 23 Sep 2025 09:15:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/rockchip: cdn-dp: Support handle lane info
 without extcon
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-5-kernel@airkyi.com>
 <gcgiszrrpqkoi3mhajn4i72awbffqv6mayahmnyswoitxxmrgd@nr2z4cpurbwq>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <gcgiszrrpqkoi3mhajn4i72awbffqv6mayahmnyswoitxxmrgd@nr2z4cpurbwq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9974239f4c03abkunmb38508cda8da5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JDSlZDGBhCH0NKQ09DT0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=COY5I7jkTU/zXnYTeQOMUc3ZPuGFmr7/r/7qdm6w5dIx4BIwgxKuHNnKEw48qSuL2b7I94/K+LtFixhilqgXOiMbji0L+k7o+/ueZ9uLqIghKjY/fF4rNBK3sPFb4H4n910b157/pQHZiPerd1v1I9xllp6XzfHxWzaziQqdB9A=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=TnzpHwo3q7997FFkEs8jwSh1z9SSMeRB7M3+4Ac9o8k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_181527_190679_0182E8C2 
X-CRM114-Status: GOOD (  15.61  )
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

On 9/22/2025 6:01 PM, Dmitry Baryshkov wrote:

> On Mon, Sep 22, 2025 at 09:20:36AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This patch add support for get PHY lane info without help of extcon.
>>
>> There is no extcon needed if the Type-C controller is present. In this
>> case, the lane info can be get from PHY instead of extcon.
>>
>> The extcon device should still be supported if Type-C controller is
>> not present.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v4:
>> - Remove cdn_dp_hpd_notify().
>>
>> (no changes since v3)
>>
>> Changes in v2:
>> - Ignore duplicate HPD events.
>>
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
>>   1 file changed, 17 insertions(+), 8 deletions(-)
>>
>> @@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>>   		    PTR_ERR(phy) == -EPROBE_DEFER)
>>   			return -EPROBE_DEFER;
>>   
>> -		if (IS_ERR(extcon) || IS_ERR(phy))
>> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>>   			continue;
> This will break the case when the extcon is present. It should be
> (IS_ERR(extcon) && PTR_ERR(extcon) != -ENODEV)

Yes, will fix in v5


>
>>   
>>   		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>>   		if (!port)
>>   			return -ENOMEM;
>>   
>> -		port->extcon = extcon;
>> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>>   		port->phy = phy;
>>   		port->dp = dp;
>>   		port->id = i;
>> -- 
>> 2.49.0
>>
-- 
Best,
Chaoyi


