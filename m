Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0227CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8OCB2l+ncUQMl80H2dawRBtZl8BrvrP7FFvN2SV8qM=; b=lmDcmuhXVgZ+gXedisZ5ZjGj4V
	WKk9PkDe+DcT8oeA7SME9yaTzNuSJbW8+HGToyxWwtyDpVsmm59vuIrYAGQMDS9+oRT+xhR4hDwJB
	10w13LfJtCNJ67xs4iiMZ+GxgCjIiihA7lf8TQS9WGsHntXoEgKIFbOtwNWWifrPwJgS9uENt99q6
	4q+TBsQ9ynF1SWTLTHoOGyBcE70V9akkmrOM4j/IhVLbwlan2Y5g8tm+Gx9OOh8Y6QDcuMnS3IxOh
	quPHhceaOyAu14QIOzFndFz4fD1KQvIcwlIICVMfTWfkcFQwZFgpx9OT+6CjHfZHvQgxzhzPAiRGQ
	/9GMUlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1mC-0000000B8JJ-2mhb;
	Mon, 01 Jun 2026 12:29:52 +0000
Received: from mail-m15588.qiye.163.com ([101.71.155.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1m9-0000000B8I1-23VS;
	Mon, 01 Jun 2026 12:29:51 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 409a07d3d;
	Mon, 1 Jun 2026 20:24:42 +0800 (GMT+08:00)
Message-ID: <ba122231-0def-4b62-add7-be3382f07805@rock-chips.com>
Date: Mon, 1 Jun 2026 20:24:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529040530.741336-1-damon.ding@rock-chips.com>
 <20260529040530.741336-3-damon.ding@rock-chips.com>
 <178014803941.21632.16225608049285101452.b4-review@b4>
 <DIW1WGLL0GW5.1BGU194UXN0HO@bootlin.com>
 <17160115-6c30-434b-9dab-b768110cd8d6@rock-chips.com>
 <178031536852.7135.7751258958371598959.b4-reply@b4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <178031536852.7135.7751258958371598959.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e8324b9ba03a8kunme45a265c281ad8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxlDVk5KTh5NTEhKHh5JSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=KegN8No0Ul0g1aqkwFnVCU6MRRiskVQe+WisAx9eAMChEDDT3viYwbhU1XN65LT9ebEvkJOWvihiZci7HRQHo4FUp/8Sn1l+ubqE9gxZ4o8l8cp7xNKXSy8DxHomGPyqLdKVrAMfk0NLXDEi4PZuKElRlVOH2HSQQ8eEjwwsqbw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=o8OCB2l+ncUQMl80H2dawRBtZl8BrvrP7FFvN2SV8qM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_052950_030592_2DC3AEB2 
X-CRM114-Status: GOOD (  14.47  )
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

On 6/1/2026 8:02 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On 2026-06-01 10:59:27+08:00, Damon Ding wrote:
>> Hi Luca,
>>
>> On 5/30/2026 9:38 PM, Luca Ceresoli wrote:
>>
>>> On Sat May 30, 2026 at 3:33 PM CEST, Luca Ceresoli wrote:
>>>
>>> Meh, messed up with 'b4 review' :-/ Apologies
>>>
>>> "This sashiko report" [0] was about an enum being signed, so '== 0' could miss
>>> negative numbers coming from bogus DT values higher than 1^31.
>>
>> Ah, I agree. It would be better to add a new inline function to validate
>> that the lane count passed from DT is exactly 1, 2, or 4, just as
>> Sashiko suggested.
>>
>>>>
>>>
>>> And this was about "Additionally, does this check inadvertently allow 3,
>>> which is an invalid DisplayPort lane count?"
>>
>> Yes, the DisplayPort specification only allows lane counts of 1, 2, or
>> 4. I did miss the check for the invalid value 3 in the current code.
>>
>> (BTW: I did not find a common helper function in drm_dp_helper.h to
>> validate valid DP lane counts (1, 2, 4). I'm not sure if it would be
>> better to add a generic lane count validation function to the DP helper
>> library instead, to avoid duplicating the same functionality across
>> individual DP drivers. Perhaps other DP experts could provide some
>> advice on this.)
> 
> A bool function in common code, to be reused by all DP drivers, would be
> good.
> 
> 
> 

Yes, will do in v5.

Best regards,
Damon


