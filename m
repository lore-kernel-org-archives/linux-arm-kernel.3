Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF21ED31A09
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BExGeWQxtEVNv6OQM+naThqTHzsblmqsaTZLZYeFiYk=; b=qwmCsU53jGpIdc3qJoP6wIlPQX
	EBtHMjKz4VP3cgm9QMDo0T8YKy4MroyUzy4rYVJjikfB4E12Za3eXz0l4d4l3aqdkoevULMuScZQV
	tHVpkTaSkxyvNzUhuoaPbJfZA9k12LKFawX+BhRyTjN0M2md4Qk0s3f0L2oKfuy8RsvGgKQ13ftAu
	h84WRQQkdExN0+qDf5ImsqrfVp/41C/aW4CccfIVzz4O1lS/YOIkDvp8oSBwkHfRFEK0V0DJzvtzU
	msG3uwt3Wq1d+ag4FLpjJcWk0NKnRaTGEADrgSnH8cgv/ifAPIkq4WYXw76/dMj63MEeOIy/yt3OE
	t3Ygbk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfr5S-000000080Ym-1Sa2;
	Wed, 14 Jan 2026 02:58:22 +0000
Received: from mail-m49248.qiye.163.com ([45.254.49.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfr5N-000000080YG-2f4u;
	Wed, 14 Jan 2026 02:58:19 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 308f250c9;
	Wed, 14 Jan 2026 10:58:07 +0800 (GMT+08:00)
Message-ID: <2d77eac3-c213-42d5-bf47-4e81b30f9f38@rock-chips.com>
Date: Wed, 14 Jan 2026 10:58:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bba70697d03abkunmb3f2a1de1f8330
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNOTFYaS0tCT0xJSkNMSBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=j9QIudcYTQdvAa4MQgAhI4Fa8GsWXodzhvPhl5TmPHpdmhS0nTyCktPg0RIFRrgmZLLwRm/qqFGxNIFJfR8xsPugPJWrTrV2cA4CdA4+4le2+yxPG9jw1gMy1QgdTWuEIZsV8nlYaKcQoWgaYV3ADLUZV6io90Fwf5+U69oMxa0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=BExGeWQxtEVNv6OQM+naThqTHzsblmqsaTZLZYeFiYk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_185818_223723_201D7005 
X-CRM114-Status: GOOD (  13.17  )
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

On 1/13/2026 9:15 PM, Geert Uytterhoeven wrote:
> Rockchip display hardware is only available on Rockchip SoCs.  Hence add
> a dependency on ARCH_ROCKCHIP, to prevent asking the user about this
> driver when configuring a kernel without Rockchip platform support.
> 
> Before, this dependency was implicit through a hard dependency on
> ROCKCHIP_IOMMU.
> 
> Fixes: 0244539f9a4f3b56 ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 025bd770f499e6ed..1479b8c4ed40ad16 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -2,6 +2,7 @@
>  config DRM_ROCKCHIP
>  	tristate "DRM Support for Rockchip"
>  	depends on DRM
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
>  	depends on OF
>  	select DRM_CLIENT_SELECTION

Thank you for the fix.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

