Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09A7CEACE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAwgCljmLeSzds/qZNduKXgcWBQyRkP73TPbPdmYrkE=; b=ceEKzM/PqR3t7AK13/CNwml0I/
	IFwgC+s6fGWxnV+aav6KlgZaPgpCLfBgJALNrrkQZvSl1rI0QIqi1rbDNA1i1uKxFMDaL1UCBAWR4
	MiS78I1wv/gTBwDSKHFvr0AOhBwu9dceKzBCJCxrkgyz0w2pSUcUEzNbQrBPL/ipBZZ6PwFlIyCEC
	y/mVRwfdNWtCGJCe/aPaqyFmNwICVLMuC1OodROH5AaMBbKjSCVuS59Ab2AUbwgwkyI7fgIWD7s+x
	oEhewevuZiF9dRrzoFr8I1GQ9rbXP2sYIMups752jfcmUXGbf2F71UtrY61mfXu447uNmWZfX3ry2
	mALybeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK2qY-0000000DBqA-2z5X;
	Fri, 14 Nov 2025 23:04:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK2qW-0000000DBp0-3n9n;
	Fri, 14 Nov 2025 23:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SAwgCljmLeSzds/qZNduKXgcWBQyRkP73TPbPdmYrkE=; b=LhmE55MQoWJPMe3gUMAv6eiO2W
	W+r6px1uMCf0SYjbv1v+NMlhNzbABJzbwEO9Xg+tGqSXMsGr8HMKGkjKcymGNCRATcL+sDkY4ugn7
	JbIQIR4Uuz5oQHn3/KR2vv/a3RhrzcTIQ1P0lSer1O/Djgqc/2cqxltEarRs/kxZmRLQC9sxbYcxt
	AWDkduKmoLwAke36ymKojGzkon/rR/uZfDItPEwPQXy235baaNon9VncLfF1mxzKRzZ9F2GZ3wLdk
	Umnf7htlnKUzWW28o5qxLHF4vQzQI+zDFIRp9y1W1V0EfalxAQfJPFKrkq9BLmC4Uvy5xUA5CeOTU
	lUMaDwtQ==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vK2pv-0008IQ-SB; Sat, 15 Nov 2025 00:04:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v3 0/5] High color depth support for RK3576/RK3588 HDMI output
Date: Sat, 15 Nov 2025 00:04:06 +0100
Message-ID: <176316144244.624283.15533493108717304321.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_150448_942636_4E4DEE83 
X-CRM114-Status: GOOD (  10.21  )
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


On Tue, 21 Oct 2025 13:19:13 +0300, Cristian Ciocaltea wrote:
> Since both Rockchip RK3576 and RK3588 SoCs are capable of handling 10
> bpc color depth HDMI output and we've already landed the required HDPTX
> PHY driver changes to support the setup, let's add the missing bits and
> pieces to VOP2, DW HDMI QP encoder and bridge library.
> 
> 

Applied, thanks!

[1/5] drm/rockchip: vop2: Check bpc before switching DCLK source
      commit: b0362c45c401c36412a1305b34a3bfeae35dbca7
[2/5] drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth
      commit: 1ff27c5929ab0f5e34d5062637369ca542a6d385
[3/5] drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
      commit: ba9c2fe18c171fabe0958502e080e000671ac36f
[4/5] drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576 regs
      commit: 97ffefaaf4e9ab3aeddb2273e1a9b2854c481b11
[5/5] drm/rockchip: dw_hdmi_qp: Add high color depth support
      commit: e95b9ff6bfa400d34e1cfcd8062641ba3be821a7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

