Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C32D29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htkP6Pi1hR5sLWZLIAp5bvw4UNy0AcaV5hG702kfd58=; b=qawkAznorG/5DDlAExRKQjT3qV
	QK8aaGoPnc7Ott/VW/s7yJ8jCOfsDpyL1767QITOZYDp6ReY6a0QWDn/zXQgqjTmmXgPjL7AoT0GY
	R7hZpk0SNGuGhfBeU3xnZnK8tU4bv6YMKUChRpHHuYnlt09gyjgaQ6doP3MfQKE67Oey/hXqpwFhn
	FbBtXc1oIB4aTO7BgXpTSE8V/p4AarYIuPD+a6UQdTLpxp6TghgGQdIROgtiDgnmfHKRKp24fJ/Ua
	z8qF8Z3uwvRGAZw/vQ22uy1hgkoRYC+z0g9OooBPMrtr23Hx6CcpfmgaptUylpZ5Bi0E/Thk2pScV
	Za9/LHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfySU-00000008ric-0ewY;
	Wed, 14 Jan 2026 10:50:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfySQ-00000008rfw-0qZb;
	Wed, 14 Jan 2026 10:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=htkP6Pi1hR5sLWZLIAp5bvw4UNy0AcaV5hG702kfd58=; b=UEIBZrdr1CmlYzAy7kRNlvxawY
	IDzrS4vRHXt+fHD+cx3IXvqcDTN0QW8v068Gi1oA4GrB0WKM0yGvFeNIBKfin62LNUuOuV/wfEgrV
	TqZLFUa5ijcXJN095vLknAdY/vkDShw6gMtQggZW/vjh5pySxNxKEmdiAsdSCIC3JK33N9Kucjuw3
	Wbmvadt9deH+XyMLSRtslWTMYoML1KXeGDgqyIiINIvqsOPY1DX2GV7yt+s48I4yPPcUrXs6pJnn/
	NiITrxMGcg4py/kF41oY4Mqw3WGgyspoJr9LXyoTEGy47TxGmoAGnH+/0y6uZId2gtdqMql0FVY7r
	W8PKwZgg==;
Received: from i53875b96.versanet.de ([83.135.91.150] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfyS7-002HSK-Vs; Wed, 14 Jan 2026 11:50:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
Date: Wed, 14 Jan 2026 11:50:14 +0100
Message-ID: <176838780308.4067705.6421121345360126054.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
References: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_025034_291023_11B62929 
X-CRM114-Status: GOOD (  11.05  )
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


On Tue, 13 Jan 2026 14:15:01 +0100, Geert Uytterhoeven wrote:
> Rockchip display hardware is only available on Rockchip SoCs.  Hence add
> a dependency on ARCH_ROCKCHIP, to prevent asking the user about this
> driver when configuring a kernel without Rockchip platform support.
> 
> Before, this dependency was implicit through a hard dependency on
> ROCKCHIP_IOMMU.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
      commit: cd98e73492102a2ff54923f08c37a2780979ac4c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

