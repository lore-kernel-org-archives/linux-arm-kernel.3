Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8941D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW1WlL6Uj6bnxN8ctCilm30KNiqpcPz8FkdMjNtQbFI=; b=nneckRWWqdRBud2prXbg+F0UgZ
	xcBqbjhISe7MJnJRvTlmidyH9NHwonXPBHrGBREcrLYkzw3xpOz6+moNQaJFjkuX47MnSHJQ/40in
	hHhIiMIIQrFu5LMJn4nDmDcYfsoB1WeIMOCdM3qy+cVfOBRR+ATXLHS4vcM9bDgH8123EOHqXiIzP
	AulVkv8Nf7WdU5lvZ7IFLLzGe9BczTimv6g5pbz7kyKhKYUEI7Hk/JSNgGTWkvHGjEac4TDIEL6GV
	GJVd0zk88WNlun9jT0Qhq2glQLrq00/9W+sveEVqbSMan0SjsXae0otTxwRcuMQImNqidG2ZEPNnz
	j/C6blzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXhF-00000001yrb-2fi9;
	Sun, 30 Nov 2025 03:01:57 +0000
Received: from mail-m1973186.qiye.163.com ([220.197.31.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXhC-00000001yqm-2KWF;
	Sun, 30 Nov 2025 03:01:56 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b6289cd3;
	Sun, 30 Nov 2025 11:01:44 +0800 (GMT+08:00)
Message-ID: <292ed476-2b5a-4b61-97e5-3b8d8a24c324@rock-chips.com>
Date: Sun, 30 Nov 2025 11:01:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
 <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
 <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
 <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
 <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ad2b589cb03abkunm5eeeb88f8ed4b9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhCGFZIGhoZHk5IGUxJS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bH/DhNXZCVB1zKfiCE5dEAYOh7uxtj5ddQ6V4/zaMqiqir/IW+gdaMZh6nW7aqjG/6xmGCvE2YU+2nIotPNCJCa1Ht1KhfqZOJjg3yAQZfQ4OXYOGjiYXLOontJO1/bsw9UI3ZZ2TEQAVMjsmXLMyflFtAQU3vihIOip6TrbuSY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=HW1WlL6Uj6bnxN8ctCilm30KNiqpcPz8FkdMjNtQbFI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_190155_157110_7CE1FFB0 
X-CRM114-Status: GOOD (  20.37  )
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

On 11/29/2025 5:50 PM, Cristian Ciocaltea wrote:
> Hi Chaoyi,
> 
> On 11/29/25 5:49 AM, Chaoyi Chen wrote:
>> Hello Cristian, 
>>
>> On 11/28/2025 5:44 PM, Cristian Ciocaltea wrote:
>>> The precision was something I initially looked into for CRC verification, in the
>>> context of the related IGT test.  But since I've added the VKMS support, I think
>>> we should not worry about that anymore. 
>>>
>>> Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
>>> display controller level, and that is not particularly useful because it doesn't
>>
>> I believe you can get the CRTC CRC on the RK3576, even when only the 
>> background is visible and all plane is disabled. Feel free to let me
>> know if you run into any issues :)
> 
> Yes, CRTC CRC works on RK3576 for the planes, but not for the background, i.e.
> the CRC is not updated when setting a different background color.  Unless
> there's a way to change this default behavior, which I'm not aware of. 
> 
> My current understanding is that the background color is applied at a later
> stage in the display pipeline, *after* blending the planes and computing CRC.
> 

Which CRTC are you using? If you're using VP0, you might run into this
problem. Please try VP1 instead.

>>> take the background color into account.  Therefore I had to capture the frame
>>> CRCs at DisplayPort AUX channel level, by using the USB-C DP AltMode capable
>>
>> Oh that sounds interesting! I'm not sure how complex it would be to
>> implement.
> 
> That's already implemented, I plan to submit the patches soon.
> 
>>
>>> port of my RK3588-based board.  However, that solution is not yet available
>>> upstream, as it requires further work for cleanup and improving the overall
>>> USB-C reliability. 
>>>
>>> Hence I'll move on with your suggestion and switch to the simple bit-shifting
>>> approach for the next revision.
>>
> 
> 

-- 
Best, 
Chaoyi

