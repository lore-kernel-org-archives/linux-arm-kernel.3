Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C63CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2kirqEsMQeMY39R175gsSI+vbf0VkUSUcGwEbjuY5Q=; b=Tr45+qcoh70JFhInFc757zeOmQ
	74pv9cffMFCbntVyv4JtiJZYPEZb4NoPm0AU6JCnv1aQGQ1jhTsqvL5ADK+83rhs14IBml4r0aUyh
	/Wg4nHuTmP1h95Sk7v/xXl0eGWJOKnplxQJJJL6jnf2y1/iUgYl5zVOrwH5lT7k+mqgYkxW4Djsw9
	MQ/2XKp847/RLaODFAS6oDTp5Nb072sFD4LqZHbthwzsDK7aA53Hxhgm1dpWzC6do7XFLMnZ76P17
	OKvVbqYpaan3Xmm6VBfJBJUTZoMnVqLHV7E6DWyZpy8PeUX7sUl9ISSmO/TnhXOCH3bHcEEcCIeVy
	aqgBQK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hvo-0000000HHpR-3YLh;
	Mon, 06 Oct 2025 09:55:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hvl-0000000HHoA-2Jl0;
	Mon, 06 Oct 2025 09:54:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 835001515;
	Mon,  6 Oct 2025 02:54:46 -0700 (PDT)
Received: from [10.57.34.189] (unknown [10.57.34.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6E7A3F59E;
	Mon,  6 Oct 2025 02:54:50 -0700 (PDT)
Message-ID: <2e6141f9-be76-41a4-a851-7ac1c31c101e@arm.com>
Date: Mon, 6 Oct 2025 10:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/panthor: initial mt8196 support
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250913002155.1163908-1-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250913002155.1163908-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_025457_633767_A96407D9 
X-CRM114-Status: GOOD (  19.58  )
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

On 13/09/2025 01:21, Chia-I Wu wrote:
> MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
> support recently. But the soc also requires custom ASN hash to be
> enabled. This series introduces panthor_soc_data for per-soc data and
> uses it to enable custom ASN hash on MT8196.
> 
> The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> be cleaned up and upstreamed separately.
> 
> This initial support also lacks support for some hw configs. On some
> configs, panthor is expected to query a mask from efuse to mask out
> unavailable shader cores from ptdev->gpu_info.shader_present. This
> requires extending panthor_soc_data with a callback to read the mask.
> 
> This is an RFC because the dependent drivers are not ready yet. But I
> would like to gather opinions on having panthor_soc_data for
> soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
> soc-specific code.
> 
> [1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54b32872c59cf5c77779

Applied to drm-misc-next.

Thanks,
Steve

> 
> ---
> v2:
> 
> - drop RFC as this series works with the downstream GPUEB driver, and
>   should work with Nicolas's GPUEB driver posted to
>   https://lore.kernel.org/lkml/20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com/
>   with no change.
> - remove CONFIG_DRM_PANTHOR_SOC_MT8196 and panthor_soc*.[ch], as this
>   initial support is just about ASN hash.
> 
> Chia-I Wu (2):
>   dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
>   drm/panthor: add custom ASN_HASH support for mt8196
> 
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
>  drivers/gpu/drm/panthor/panthor_device.h      | 14 +++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c         |  6 +++++
>  drivers/gpu/drm/panthor/panthor_gpu.c         | 25 ++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
>  6 files changed, 51 insertions(+), 1 deletion(-)
> 


