Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC282FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJHRPqWKTWyTfPBOd40VwdpOX9kewYtb/ZNyefthoiA=; b=2xF2JcBYfNZLwathzy2NINeLr+
	dIm/D7KWLsGXgODf+BoXA8nDul4whC7jpdg/F4oyMCH+TD9XZ/sZQLoq8anT14OlyWDvmMNdDRhOp
	tiV+hmaR1EAgbnDXXyYVlWAzNalgUeNw2iy33QWAS4mUuRw4Brjy8voFDq4D1QsqDk7+Imlksm5YZ
	h5GaI7eDkcmaKX3lrWypLYz5ot1EwxRqCtxruAnZB7FuVnQT2ufnYzRZc25bEGYE30wFYWCCPuJpY
	gK3OLgadbwauQSn2BlfNEbpqOXE240DttJ1F+IiuRXrSH8yMUjzzdficGtaAEFOa1OL6hNJ9iUDZq
	MkymK2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMRa-00000004xhP-43ww;
	Thu, 30 Apr 2026 08:08:22 +0000
Received: from mail-m82213619.xmail.ntesmail.com ([8.221.36.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMRX-00000004xfS-2BZh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:08:21 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3cbf68ef4;
	Thu, 30 Apr 2026 16:07:59 +0800 (GMT+08:00)
Message-ID: <3756b3a7-7bcf-4881-9a88-874a935cf316@rock-chips.com>
Date: Thu, 30 Apr 2026 16:07:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ipv3: add CONFIG_OF dependency for
 DRM_OF_DISPLAY_MODE_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Arnd Bergmann
 <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260429140024.192432-1-arnd@kernel.org>
 <DI6B0UNV68LI.3PYKFFB0F1DH6@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DI6B0UNV68LI.3PYKFFB0F1DH6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ddd6e30d503a3kunm33c4ba8e2f2b99
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0xITVZNGEwZSR4eHx
	gdGEpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JriyospKZowPAbJu0L56T91/MgoUxUQsXr3KWbPS0Z7HV5jEUX6Ut3Rp/SpmkWYxcRukdw7sMCBowRHQKe+FfsxdTQCAvp687YIPMOGryt+9WK0Cl21tT2GYPXAL8iiuqf146ZHM8XKUddJNlQLllEa0XhkYNeQB1A53Rad0mHY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CJHRPqWKTWyTfPBOd40VwdpOX9kewYtb/ZNyefthoiA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_010820_286855_18612610 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

On 4/30/2026 3:17 PM, Luca Ceresoli wrote:
> On Wed Apr 29, 2026 at 4:00 PM CEST, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Without this, not all dependencies are met here.
>>
>>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=n]
>>    Selected by [y]:
>>    - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
>>    - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]
>>
>> Fixes: ba2db93cf3d5 ("drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


