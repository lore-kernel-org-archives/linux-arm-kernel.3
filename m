Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55030C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fYPmBx734h8aMVi3LVmqJ5rE2UTZl3oi7MbL+EzuaaU=; b=nYq56qGJxj7pSAuQgmYCorRqQg
	M/iyN1fzB+5rd5tJu4EEnJ2WxHHVhiRJSUwZDw3gF9GmxHtXoLzK5iBzfGcP5S4eV3i84N2tfMGuf
	m7AflmBUIm0051s0zhhXHPBI2BTMuiMdJCy5jF+M+WTmC4X/6G4UpuBgHi3MT7qs0qFkgRTTbltGG
	rhlFI2kqzsGipxY8hi7PRRB6LKmZ0+Edluw/44hoQSmQfFoOLUw6X9KNLTgVrWAVVUsTkDhToRO31
	+nOhclJrxQnNzn6tGakKiCHM4IRwzawn80f5laspni/W8DabwIDqsgX+sQusF17Rgg9lm7Q53fc4Q
	MTS5sI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7KS-00000008RO6-0pf0;
	Wed, 16 Jul 2025 18:58:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7D7-00000008QiN-09ue;
	Wed, 16 Jul 2025 18:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=fYPmBx734h8aMVi3LVmqJ5rE2UTZl3oi7MbL+EzuaaU=; b=FcsGtWVJjnpVFq+nyaEvhMIFq3
	zl1a/Px9fLQQA6Z29+QVZCdrEUHr3CP1O2nYM+MsGWC8/37X7ZVwxUWs/mmrc8AFHbIr6he5qbW2a
	cAnpMwqXzsTSnw0zuKGwuxwY5h/WBiGgr1VllmZqOQpn8IX0RF8pg+kj+HdcSv/JZEqZCS1dG7GmL
	jFC+LvbnAHRzA+ApT2l3msLBQC3tTG67CH8tvAECTEki8bwBrI4BdY0qpSLbYIXZXuY5NuZOYUHQc
	8ePuai3O6tT+EspH/YHlSCazXtgPiBWPS+6sVtsmfGJj14GusPybHqsm62ISPY5SV5vIv6k5Z++uH
	rd/hacGQ==;
Received: from i53875a74.versanet.de ([83.135.90.116] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uc7D3-0004Hf-FG; Wed, 16 Jul 2025 20:50:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com
Subject: [PATCH 0/2] Add RK3588 Tiger DisplayPort carrie
Date: Wed, 16 Jul 2025 20:50:25 +0200
Message-ID: <20250716185027.2762175-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_115033_073934_379F4E25 
X-CRM114-Status: GOOD (  11.41  )
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

A board that allows easy testing of the Analogix eDP controller on the
RK3588. Requires Damon's recent work on allowing bridges in the
Rockchip variant of the controller driver [0].


[0] https://lore.kernel.org/dri-devel/20250709070139.3130635-1-damon.ding@rock-chips.com/

Heiko Stuebner (2):
  dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma
    Systems
  arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 118 ++++++++++++++++++
 3 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.2


