Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E42BC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 03:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7Mux6FE7z9fKIoWpY6C8S3xx1B7JjI8DMShzGceysM=; b=HI9DkZIpPB+WlskRiu4rlKIJDM
	Hqq0PhDtlggWC5V9BSd9QSrk9YXyO37A8QPKsqjl/SK/rZc55O2LwoKc2BrBeJvkoULR/ji6DerKk
	nrzB80eX953bBJuGt9PZZgcyrMw19LGrqreQMwr0AwNz0SQVsWCBchC1SvcV4XZFeSiVnZB7Y0esa
	PRZG7GJj6XZ0TZAGOTe7FiZ/UvTACy54FBhnF2oGhjZfHib9X5/DBAunsyH/ZQyc0bgDRBtp5o4BN
	vFmGl95zB4DsYLWUcopkjFC2/R+HgUEgiiHaA1l8BEDmTcKws3ZWBHKrW3vGBo/dUx7eTWJKcJEVu
	rDIMT6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHle-00000009S4D-1Jqi;
	Thu, 30 Jul 2026 03:49:10 +0000
Received: from mail-m128175.netease.com ([103.209.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHla-00000009S3U-33f0;
	Thu, 30 Jul 2026 03:49:08 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481d48273;
	Thu, 30 Jul 2026 11:49:02 +0800 (GMT+08:00)
Message-ID: <a791f935-1634-4e21-966d-6d75bec87566@rock-chips.com>
Date: Thu, 30 Jul 2026 11:49:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: give rk3576 VP2 a primary plane
To: Tomonori Nakagawa <jack@supremeoverlordjabs.co>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729232450.13797-1-jack@supremeoverlordjabs.co>
 <24547ed2-0950-48be-92cb-bbb0e1653258@rock-chips.com>
 <7b6b347d-f5d9-45fe-8255-27e01f23578c@supremeoverlordjabs.co>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <7b6b347d-f5d9-45fe-8255-27e01f23578c@supremeoverlordjabs.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9fb123d26603a7kunme747ba0b4a4eb8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHk4fVktLHRlCGk1CGE5KGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=InTrd8rEXIAzz/o+tE2MmWAT/BagpE1/UvSTJclh6647mKFu5oSGVEKDY5NX9PrMvKoT1W+RcFFCT1rV820atajhNjkP/W3Qsyp55Xzod5LJQWw3w0jlzGbVn/UTkubXh6i+mc6r7HZGPQcQMoQ/uRJPL9XCToxlvFGQcTHNbwM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=X7Mux6FE7z9fKIoWpY6C8S3xx1B7JjI8DMShzGceysM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_204906_999821_B40B1863 
X-CRM114-Status: GOOD (  11.67  )
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

On 7/30/2026 11:39 AM, Tomonori Nakagawa wrote:
> On 2026/07/30 10:56, Chaoyi Chen wrote:
>> The description here is not accurate. VP2 can wire to different
>> display interfaces which depending on your board configuration.
> 
> You're right, thanks. VP2 isn't tied to DP - the VP-to-interface
> routing is board/DT dependent. The actual issue is the plane topology:
> on rk3576 the two Cluster windows (the only DRM_PLANE_TYPE_PRIMARY
> windows) both have possible_vp_mask = BIT(0) | BIT(1), so they can only
> attach to VP0/VP1. VP2's only attachable windows are the Esmart ones,
> which are all DRM_PLANE_TYPE_OVERLAY. So whenever a board's DT wires any
> output to video_port2, vop2_create_crtcs() finds no primary plane for it
> and fails with -ENOENT ("no primary plane for vp 2").
> 
> I'll reword the commit message accordingly (dropping the DP framing) in
> a v2. Does the fix itself - promoting Esmart0 to PRIMARY - look
> acceptable, or would you prefer a different window or a driver-side
> approach for VP2's primary?
> 
> 
> 

No, it looks good to me. Let's see if anyone else has any opinions.

-- 
Best, 
Chaoyi


