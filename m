Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA84C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCe2jlYqgmYdsKTqxHV+zNuMNWku2qaKvILRO2g7d1k=; b=nNQULhTjpJv5j+LcNbUl2njD9n
	W9dVJVKKNfJXv5P0IkpMw+NRhsz8Uw+WR6k2+TfCfrLIsX7j1H19hrh9PMwtRcs8B39AW/3yQmCmk
	BSXQ2HimLOH1fLkscopBBpG7KjFJfcgmeJe4G4toSMdV64DODLW4LWpw9xi442Cb5M6IPx3/lHXLq
	tx17rYi/SuZth9/koXxZT7e7AUzVi5M/9NftHefLoyhI5gOKIwW8TSvW7zOZyo1JHcFgvawzET5hS
	gCtkrAfherihgwWPyCA9SYAIBUze1gzwYRk/3l8oKGfKVp3kj0lMfwIeHvgeuRYa2gXpGjxZ6fq5s
	dMT0cMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbcl-000000074cq-0Gzc;
	Thu, 27 Feb 2025 11:00:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbYd-000000073eS-32rv;
	Thu, 27 Feb 2025 10:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gCe2jlYqgmYdsKTqxHV+zNuMNWku2qaKvILRO2g7d1k=; b=mZCQsiU8HZvV7jkLzjo+lal+WH
	LsfjYGypihPdUloXEmpXdNrHBkHWx9rYAq4f8TF1eTVSj7VY4Q1KjO+X+Z2EkHhmgZcP0UaPQt9N1
	v5++30LaFz2OlWbladXzqwhkDsgVmWTNnxK92HabyCIKYJ5eTwwTkeIS/eKmcojIPANyirlFBkJBH
	vc/uGbfRUMyKCSd5BYWHDzqP2ybgkSq6aZvdB+mYX1aw9DSVbpIkWLvLDiDQlCJsF+Z/kjmkQ+iiW
	DyLqTeK0saCCFZJJnm+i2I5BzFRl+yHjRK8cFs76X8UuqWOIjTY9PXmb9aQVKZODZspjqIaBmJvmm
	0d+221uQ==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnbY8-00008f-2X; Thu, 27 Feb 2025 11:55:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 00/15] Add eDP support for RK3588
Date: Thu, 27 Feb 2025 11:55:15 +0100
Message-ID: <174065370895.4124124.17821350735219515790.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_025559_759313_2CD63452 
X-CRM114-Status: GOOD (  10.72  )
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


On Mon, 24 Feb 2025 16:13:10 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=927765
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied, thanks!

[01/15] drm/rockchip: analogix_dp: Use formalized struct definition for grf field
        commit: 2bf9f610494d75cfaf3c8a0cef93135ce83f7254
[02/15] drm/rockchip: analogix_dp: Expand device data to support multiple edp display
        commit: 718b3bb9c0ab87bc90914799e6999bf4b1ecc67b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

