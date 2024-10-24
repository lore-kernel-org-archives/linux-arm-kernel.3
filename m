Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FDDCE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AokxTNaISK7C8Y0auZL2tlFX3OWoHk4I2kEo6v7mOT8=; b=SCbu/Dm93cSM9YtkvkYFdM/zle
	wgVn7R3pDLfmAp2XnbiAUtKgym03D5MGcMpySC+WbBpWKli3QYbn25LSLg3jv4eHHS2/DkFeilTOA
	YExD+CIFiXL1jsp5M0N8Kd6XBTpDVyNiT9ruzjLji0RjV1plzwp/68M+6Z/pdG3AZ860MPN5HmQ7A
	w+f7N9ZM25Vga98QJaSNTDY0MtPIfiz2gMR83Mdum8BOBkEwM6QBGSnFGix7g33MgN5BIWXmwxF3J
	/Q5LlkfE8DBCwBUC6UMeVTbIuP8HQ7xenN7eU7wsL7Bg0ywKID0rVtWSBDoF3c7TsGdmRv2MlEeVI
	l/ji/54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zc8-00000000tAU-0X15;
	Thu, 24 Oct 2024 15:19:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zT2-00000000s3s-2MrB;
	Thu, 24 Oct 2024 15:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F5725C6037;
	Thu, 24 Oct 2024 15:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB4EC4CEE4;
	Thu, 24 Oct 2024 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782578;
	bh=GIiZShzCqbp99Okh9K2VfkZMwriJp7KN0xaKA+283IY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZvPDyC2Un38oYBtXvX62d7ZiTOxbZfyC6ow/5abzyjUw3l5wdjqrX+maMLCxsR4Hd
	 sRNWXU9EdpeaIeGxfMMwYLRbm6VNHAJRUeD2vf5/cGiA2Y8ZpvTLygF1N71EpJJ2CY
	 5W84akyxhzpMGZY0Eulx8m+WnlIKA8CZUqE3GBza5Pi9rhTYPkJjG55F7QSngHM5NI
	 mfuVjIqjRpjLYkSR11vOuiePNEjHfHfr2GW6ABT8jDV0nb+Vu0pzBiOYA6aukTXLVo
	 9hcGC22txWIX0M1ttV5FEfeQjBKTvB/aE4IhyePcahWN12A1RaQarZy/1z65AQNd81
	 tTLlgpCR2iyuQ==
Message-ID: <66e7319a4805b42af2b2a4a20dc8faa9@kernel.org>
Date: Thu, 24 Oct 2024 15:09:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 26/37] drm/vc4: hdmi: Support 2712 D-step register map
In-Reply-To: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_080940_692308_D44CB33A 
X-CRM114-Status: UNSURE (   6.53  )
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

On Wed, 23 Oct 2024 17:50:23 +0100, Dave Stevenson wrote:
> The D-step has increased FIFO sizes of the MAI_THR blocks,
> resulting in changes to the register masking. Add support for
> it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

