Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F2BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 18:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jxtezjtz7Hcw0amgGe7Mm+QhsxFxBH9ZTTIIP2dKcs=; b=U6FkZt5uRoGcZIsIgPIAdgaeG5
	8OXxRfd7QP9J9TCHZVMuyb3cOSPKbquQFVRk6dtML1jdTaktozxJM9KY1DMI3NNNwBPMq2cfqZwoC
	SO4K5k6AohHKlRxQas9fXwQTnIC3dwKjK2YoG7RWhiDag5iA/p2S9k44C0Gtz5l8r8iFhNjU/IcdG
	SpmbSG7QfkMt2sEdNdg9XZ2hBN7Yxqh8BWU0E9YBC091m4sfY0/e+XG+Ic0/n5+kBBHyTmb3yM5sh
	STuJKEHBUmwN5Ek9UXyKz5yFNy0ie5nlUCI9femlvotzrdMNh1fOz4/57RLsNNIWSyQfgyRYu94ft
	71uxo/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMsex-0000000DznF-3EEt;
	Wed, 04 Jun 2025 18:16:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMscq-0000000Dzbw-14t4;
	Wed, 04 Jun 2025 18:14:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C089612FC;
	Wed,  4 Jun 2025 11:13:49 -0700 (PDT)
Received: from [10.57.26.187] (unknown [10.57.26.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D96B3F5A1;
	Wed,  4 Jun 2025 11:14:02 -0700 (PDT)
Message-ID: <921810b5-436e-4402-8304-9ba2eb335ed9@arm.com>
Date: Wed, 4 Jun 2025 19:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-5-237ac75ddb5e@tomeuvizoso.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250604-6-10-rocket-v6-5-237ac75ddb5e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_111408_391348_89693023 
X-CRM114-Status: GOOD (  21.34  )
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

[ Since Daniel made me look... ]

On 2025-06-04 8:57 am, Tomeu Vizoso wrote:
[...]
> diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..9a59c6c61bf4d6460d8008b16331f001c97de67d
> --- /dev/null
> +++ b/drivers/accel/rocket/Kconfig
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_ACCEL_ROCKET
> +       tristate "Rocket (support for Rockchip NPUs)"
> +       depends on DRM
> +       depends on ARM64 || COMPILE_TEST

Best make that "(ARCH_ROCKCHIP && ARM64) || COMPILE_TEST" now before 
someone else inevitably does. Or perhaps just a pre-emptive 
"ARCH_ROCKCHIP || COMPILE_TEST" if this is the same NPU that's in RV1126 
etc.

> +       depends on MMU
> +       select DRM_SCHED
> +       select IOMMU_SUPPORT

Selecting user-visible symbols is often considered bad form, but this 
one isn't even functional - all you're doing here is forcing the 
top-level availability of all the IOMMU driver/API options.

If you really want to nanny the user and dissuade them from building a 
config which is unlikely to be useful in practice, then at best maybe 
"depends on ROCKCHIP_IOMMU || COMPILE_TEST", but TBH I wouldn't even 
bother with that. Even if you want to rely on using the IOMMU client API 
unconditionally, it'll fail decisively enough at runtime if there's no 
IOMMU present (or the API is stubbed out entirely).

> +       select IOMMU_IO_PGTABLE_LPAE

And I have no idea what this might think it's here for :/

Thanks,
Robin.

> +       select DRM_GEM_SHMEM_HELPER
> +       help
> +	  Choose this option if you have a Rockchip SoC that contains a
> +	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
> +	  Rockchip either RKNN or RKNPU, it accelerates inference of neural
> +	  networks.
> +
> +	  The interface exposed to userspace is described in
> +	  include/uapi/drm/rocket_accel.h and is used by the Rocket userspace
> +	  driver in Mesa3D.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rocket.

