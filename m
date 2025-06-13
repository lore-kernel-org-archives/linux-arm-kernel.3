Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4238BC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4h0LpS6xpSGwytVH75yTnoCe+mq0Wger5l74OVyqBc=; b=LQ7JwxDYMVFbENP7OyvSuoDfUu
	HQDSLaVa0DLW1Ha38gl8edLW6tOT85lfHa/nVyhcakawKOe2xb8R+Dqhugu7fceKv5zmpB974jCdx
	rBPZqaJeEu6mh0bauSKb5vX9rbWKixYp0sU0aQeBH6aFqU39e8mftt2J2POy7nBM4NTEVqAuPj0hm
	Cf6iUiBPK770ZIQu5jN6a9lVgaIFINHL6gxRambaN/VyW4PEYW1hHE3gMPIHwvu3uUOnErLxC/mAc
	v5iXwnGBGeg5LZbr4YFSj4Xi9TQqvFg/RAwVa6Wdc9chpNCACE769p+ZLkQkVB4iHoYRz4dW5x5Oh
	8ONc5Mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6DJ-0000000GquX-2RKk;
	Fri, 13 Jun 2025 15:21:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4z4-0000000Gbk2-09DM;
	Fri, 13 Jun 2025 14:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62B3A62A03;
	Fri, 13 Jun 2025 14:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92389C4CEEF;
	Fri, 13 Jun 2025 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823337;
	bh=CQucgb1bg0xXPls5H7qr6pbanXMG619gYuEhe3r6jdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ur3kkzedQWntfr0lGNXGpqQBM2QdnEihDlqla44a5n6yOytZZEuWdRGcNq6Y91SZ5
	 54CjUgweeYK6CndciVGUbjwh4UK5+u9Lu9WSD4RDbChIgCn1kXkse0BUGrt8eUxOhF
	 t5uuj0X3cKmjV5Kf9AplE1T4SNDVUMT1JujcSNwdOHLXt+WZxlICwYL+B2eWdJutUq
	 BYYC/VSwUEst5VJO5gER5ynfRq3Kn6zWZy8kqx+VV9mQ01nbeuzR0XuHyooCDGfGih
	 tV/9MB3R8rmuY+fEUMl5k2lSGvcBtChKwa4nLgCY8CLxyJH5S/2++EPWyG2ad7RcQe
	 gkEm2Y3e8QrjA==
Date: Fri, 13 Jun 2025 15:02:11 +0100
From: Lee Jones <lee@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 2/4] mfd: rk8xx-core: allow to customize RK806 reset
 method
Message-ID: <20250613140211.GC897353@google.com>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>
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

On Mon, 26 May 2025, Quentin Schulz wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
> bitfield for configuring the restart/reset behavior (which I assume
> Rockchip calls "function") whenever the PMIC is reset (at least by
> software; c.f. DEV_RST in the datasheet).
> 
> For RK806, the following values are possible for RST_FUN:
> 
> 0b00 means "restart PMU"
> 0b01 means "Reset all the power off reset registers, forcing
> 	the state to switch to ACTIVE mode"
> 0b10 means "Reset all the power off reset registers, forcing
> 	the state to switch to ACTIVE mode, and simultaneously
> 	pull down the RESETB PIN for 5mS before releasing"
> 0b11 means the same as for 0b10 just above.
> 
> This adds the appropriate logic in the driver to parse the new
> rockchip,rst-fun DT property to pass this information.
> 
> If it is missing, the register is left untouched and relies either on
> the silicon default or on whatever was set earlier in the boot stages
> (e.g. the bootloader).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  drivers/mfd/rk8xx-core.c  | 15 +++++++++++++++
>  include/linux/mfd/rk808.h |  2 ++
>  2 files changed, 17 insertions(+)

The test robots seem unhappy with this.  Please fix and resubmit.

-- 
Lee Jones [李琼斯]

