Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B902DD232CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 01:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjEhf4jC5xnT6sGVRluMHT0B2HAAj6xJis8dbhxb8WM=; b=LqJLENHgDnMdPRYnHo0hHznart
	l48LcTK3GvnELFqZOpRRFMX4hFwT5nYXo2XuQ0x0FvCSRWuT2UEU64IpYm4wMvMir+DHpmpfyJIhW
	SCojt5mW/xqvWwBkk6fABkPP8/JplhdqFmOhCcYoPoSYQ4gwJAQDHOcwEAW++94c7iRHNZ8W4sopV
	ikowSkz7XJGsD+x6WgSOqnYNSyFoEqtDgOOLpEu6O29MOjQCI0hwGjDxRWhoBhQGnOPOJ+nKhz1eH
	2DqdvQhCS3ZUBUKghWQHWJO5URQFZFYlRngmUt7Y4bDH/r7CGR9AbENbFu7/37xdKOFU7Bgny71/O
	TV7004gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1Gb-000000014JO-0PVc;
	Fri, 09 Jan 2026 01:26:17 +0000
Received: from mail-m3275.qiye.163.com ([220.197.32.75])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1GW-000000014I3-1jRi;
	Fri, 09 Jan 2026 01:26:14 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3002cb6fd;
	Fri, 9 Jan 2026 09:26:02 +0800 (GMT+08:00)
Message-ID: <4e01f121-1912-4897-98e8-cb543a501707@rock-chips.com>
Date: Fri, 9 Jan 2026 09:26:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for
 DRM_ROCKCHIP
To: Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-9-kernel@airkyi.com> <4072834.X9hSmTKtgW@phil>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <4072834.X9hSmTKtgW@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ba05c4d8f03abkunm1426e5ab1f2143
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhKTlZCS0gaTUhNS0NDTx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GY6B1+W46frWd3oLL1NM66g6O0EUywg5e7gk4XfQ3+7+led+dGGAoMeVwkHlhjufEtT6S0JKF8Ui/NstMhkxCh8FkpHFb3JVv/f+FQiHYJd8kjAsXth6LNavSgbTlumydJfio2Zlgs31cMsy3m+jrDNfczdZ39KJiNyjhMpbMuo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=IjEhf4jC5xnT6sGVRluMHT0B2HAAj6xJis8dbhxb8WM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_172613_102079_1FFBF27F 
X-CRM114-Status: GOOD (  19.31  )
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

Hi Heiko,

On 1/9/2026 3:03 AM, Heiko Stuebner wrote:
> Am Donnerstag, 6. November 2025, 03:06:31 Mitteleuropäische Normalzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> On the RK3506 platform, there is no iommu hardware. And even on
>> platform that have iommu hardware, it should be possible to use
>> VOP without enabling iommu. In this case, a contiguous memory
>> space like CMA should be used.
>>
>> So this patch removes the dependency on ROCKCHIP_IOMMU.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  drivers/gpu/drm/rockchip/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index b7b025814e72..a056d419190c 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -1,7 +1,8 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_ROCKCHIP
>>  	tristate "DRM Support for Rockchip"
>> -	depends on DRM && ROCKCHIP_IOMMU
>> +	depends on DRM
>> +	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
> 
> I don't really understand this yes+no line :-)
> 
> Can't you just
> - drop the dependency altogether
> or
> - do a depends on ROCKCHIP_IOMMU if ARM64
> 
>

This trick is called optional-dependencies [0]. In addition to the 
familiar depends on ROCKCHIP_IOMMU part, the newly added !ROCKCHIP_IOMMU
ensures that DRM_ROCKCHIP can still be built even when ROCKCHIP_IOMMU
is not build.

[0]: https://docs.kernel.org/kbuild/kconfig-language.html#optional-dependencies

If we just:
- drop the dependency altogether 

When IOMMU is enabled, the dependency relationship cannot be handled 
correctly. For example, the following configuration is possible: 
ROCKCHIP_IOMMU=m, DRM_ROCKCHIP=y, which leads to a build failure.

- do a depends on ROCKCHIP_IOMMU if ARM64

This changes the semantics. On arm64 we should also be able to work
without IOMMU being enabled.

-- 
Best, 
Chaoyi

