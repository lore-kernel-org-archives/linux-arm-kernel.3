Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53779CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlykcFLhUSQ0PJGJ+H1gXbr7DyN/7ywHVIvhuSb6rpY=; b=MdMB42T3rRCZ5RS+Rq81ZRZ2HF
	qr7yPPG+9sH4UzKW9bMJ0SI30FFDc7iqHrP9rNFu20KLwTl+LXlmHnaeDl0aYfeQ+pANLECNla+I7
	4FTgetlcinNo0wayl9jhrJfnMDrvyREXu7St6YBEAlhaLVOBdDR+kbv0zV2Rr1UI2l8iNGWP54j/m
	HqCOyvD9pxCbClhuBGXW+Exs8wR7uTbP2Na8CY6znU0Q7NfEmeZ6j3u/0AdjH2kklyQZR0/1oIupP
	MAzl/XuYCx2Bdj9HrQqLvy5/W5OZlp9KR0kSTZRUBEHSiGqKfXSW+hBT+O2/Ue/3kvkUtoq5QXfVE
	rTY9NedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBquR-00000005a9z-0dfr;
	Thu, 23 Oct 2025 08:42:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBquO-00000005a95-3NPJ;
	Thu, 23 Oct 2025 08:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761208967;
	bh=sn155PxY4c6KoChuMd294Ou+jNKdIOB15aowevCx2w4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=igiHR0SjfmIarvQk/NjsVaXyggKa7DLNKihy7JDojejk6ToxCdKqI/hSLZccxT67W
	 tpX9hvWL4q8HZc4ioHrQ20yMd/FHDys2VK/g1xh9DQUx0FkxEaO44wEU15zUJUAshd
	 ftfJHXIsACb0ykiS5OVplw8HDNQqdITDPUrKv9Vw8DrTTxaHhYx1SBS6nuWrzHpXh+
	 Jn6MI3ftrjKYPNMOhTsB1Og72LlpKju9+zKvK6b5Yen08RmM1+/+jFqsJwVK6frQUk
	 tlLUpTj2bO8b5fFV/EwIDIQ/2gn4DSvuP5oQ0Z5gtQP27Kws3tXb0vXiWTYCNtGPEY
	 NPe8nR5SyEKqw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77CA917E127F;
	Thu, 23 Oct 2025 10:42:47 +0200 (CEST)
Message-ID: <b25aa269-6dc8-43d4-a3f3-85691ace134e@collabora.com>
Date: Thu, 23 Oct 2025 11:42:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_014257_016460_741736F2 
X-CRM114-Status: UNSURE (   9.42  )
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

On 10/22/25 7:19 PM, Dmitry Osipenko wrote:
> Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
> is backed by a virtual device that isn't IOMMU-capable, while VOP is the
> actual display controller device backed by IOMMU. Fixes "swiotlb buffer
> is full" warning messages originated from GEM prime code paths.
> 
> Note, that backporting is non-trivial as this depends on 143ec8d3f9396
> ("drm/prime: Support dedicated DMA device for dma-buf imports"), which
> landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
> initialisation"), which landed in v5.19.
> 
> Reported-by: Daniel Stone <daniels@collabora.com>
> Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
> Cc: stable@vger.kernel.org # v6.16+
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

With the patch applied I'm not able to fire those warnings anymore - tested on
my ROCK 5B (RK3588) and ROCK 4D (RK3576) boards.  Hence you may add:

Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


