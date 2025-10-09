Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED41CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MPeuMUNYVwG3ymlRhXbc+slsUvOfDXixxwoUlCxd4mg=; b=5DuJrixQRMsfAz89Uh0zdC9/lX
	BPWFbpFGzC89Rq1CgxuB26bCpxV3J4PdKwWFr9Fiw7KP6A/qNX3sceXdOhLOIRzBKMFqx/HSSIedj
	ig0xlUrCZRs6DP+H/XGEtYONgb1OGf9oPRGvXya3M4cfLtUZk09CxJ2bBq5ensDPmuT9wG9bXTsHC
	dA87eWVNEFzuUwT14Eh7q7VrcQJyGptgJFdTS63/j5dojHpOMkWeBk0ItDxM0Das9nd4qxWH7TOj4
	Nii09hCLSf6Df6xIBP+ar+bBxg8iFxWt/03SoNn6LbbzEhA6E1oQ1nM0SfnRIljVvQA1de5DCsnCo
	nRjltGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zTe-00000007GqI-0yiF;
	Thu, 09 Oct 2025 22:51:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zTW-00000007Gnv-306o;
	Thu, 09 Oct 2025 22:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=MPeuMUNYVwG3ymlRhXbc+slsUvOfDXixxwoUlCxd4mg=; b=wz37Bk7FuSpN/XDnoWtOT57Lov
	Yn5QcLwJn80x8mOdAmWIM0Pl+8uH6XQ6a83YjLkvqcGCtri1s4NiExwYib2fv+pUhb/ia+IAhgFyK
	4TWMBrDvY0sI4/R/UqpIKAr68mGMlfemXy22uNIvY45s/cldp+mgrqn/imBFW7E59H+xoK3G5a4ww
	PvqNmaFjjsAqUoP4Fk2/0XjqekvAbePe13g0c5F0HensA1wnhDLvi1LywweT+7Dja3QQ8kOHZPLFH
	m6THVT3pEZSTfhXmjyUqdQy+qiSDY5NtMAq9oVJuqDbZMV51xkL5lhZKt0G9pY9ysJrcj2XpHJ10f
	4d/PJHIg==;
Received: from i53875bdd.versanet.de ([83.135.91.221] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v6zTS-0007iZ-4f; Fri, 10 Oct 2025 00:51:02 +0200
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
Subject: [PATCH v4 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Fri, 10 Oct 2025 00:50:48 +0200
Message-ID: <20251009225050.88192-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_155106_772669_8B8D144A 
X-CRM114-Status: GOOD (  14.40  )
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

Concerning displays, my current setup is

  DP-carrier -> DP-port -> DP-to-eDP converter from Aliexpress -> eDP panel

which produces a nice 1080p image, but it seems Quentin's experience was
not as nice, as he reported in v2 [1] that his two test monitors produced
dfferent tints, but not real output with:

green tint on a Iiyama ProLite XU2294HSU and purple tint on a Dell P2319H

changes in v4:
- move hpd-gpio down the the analogix-dp node
  As stated in commit cb640b2ca546 ("drm/bridge: display-connector: don't
  set OP_DETECT for DisplayPorts") the dp-connector can't just read the
  hpd-gpio and mark that as monitor detected, instead 

changes in v3:
- rebase on top of 6.17-rc1
- still should wait on the analogix bridge support

changes in v2:
- collect Ack/Review for binding
- address Quentin's comments
  - sorting in Makefile and dp-connector properties
  - ethernet alias
  - drop data-lanes comment

[0] https://lore.kernel.org/dri-devel/20250709070139.3130635-1-damon.ding@rock-chips.com/
[1] https://lore.kernel.org/linux-rockchip/0582b7bc-e5b2-4b5e-821e-8d2c4301579f@cherry.de

Heiko Stuebner (2):
  dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma
    Systems
  arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 119 ++++++++++++++++++
 3 files changed, 124 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.2


