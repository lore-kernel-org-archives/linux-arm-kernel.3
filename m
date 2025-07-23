Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gc7jxMLVybdHk7DgSun6tr7+libXogPdGfREbeOZcBM=; b=aQhwgXD+PqvQr9Zweehak4guWZ
	MpIo4VYlXZ9z+B0EoR4uOoCWU+EVJJXQitJf0Fg1PGFHkRwWVjgO+dGLcop4/l5I/K7OqPNri4j5u
	40xqSDAv/v1IdlqVTBKx6gqbKUFkpkwx7AlgQYxBQltub+V/W41e8zl21GHENa+IGR5jQGWks7MV/
	4hcBARgeVgINOrFq6YyyT92X4jOuwVlFbsAp7L+6MWkcWq3IlcA1tj96jj/abKL658om2/L/eQUG5
	gIG8Li+ck9OKNlI5rczDTTV+A9eJs2lhW9LGqI11f9qJ9Ypfz5H3SxFVGVhcdwlUSh7Au3qfl/Vdp
	LaQllRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueexM-00000005p1k-1Hvr;
	Wed, 23 Jul 2025 19:16:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueeq6-00000005oDP-2Zzd;
	Wed, 23 Jul 2025 19:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=Gc7jxMLVybdHk7DgSun6tr7+libXogPdGfREbeOZcBM=; b=eeRm4pL/BTcPjmqST4Vw5jSTRw
	kyw7P/NRIR5G/LTjlkNI0rB5HdQ1+1WDjQvaROGzkwxYUY4ERqD8rAqQgb+VPOWVj1TSSzaNP1+cJ
	2HuAy4BAWLGqEF2SUtgs9z+6rJbf0VPiaosd7oW5NuJqQZIrSoPM/oW4Kyn7PHBh+vhsF1SUoe6U2
	tz0nINYTxY7YbKskJzTqj9pnJYzNGuSnfVDBDO/l5/h3l1HHVEjjheN2FarqWdjbj6JRekirbiy23
	B5h37vyB9NJcZoKsdUlZEg5Gbhw0RbK4EPMC66bwZ8U2frpMe8Lz4Q3IJx6RtAA2ae7vnkWHJaias
	CbvCQY2g==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ueeq1-0007Mn-0F; Wed, 23 Jul 2025 21:09:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com
Subject: [PATCH v2 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Wed, 23 Jul 2025 21:09:02 +0200
Message-ID: <20250723190904.37792-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_120918_649641_9046ED13 
X-CRM114-Status: GOOD (  11.97  )
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

changes in v2:
- collect Ack/Review for binding
- address Quentin's comments
  - sorting in Makefile and dp-connector properties
  - ethernet alias
  - drop data-lanes comment

[0] https://lore.kernel.org/dri-devel/20250709070139.3130635-1-damon.ding@rock-chips.com/

Heiko Stuebner (2):
  dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma
    Systems
  arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 109 ++++++++++++++++++
 3 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.2


