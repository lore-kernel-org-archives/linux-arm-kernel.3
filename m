Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C568BC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zUrFIh4qB3rck4ItuBzZG7I7WaPpmbgHQAFBRILUF/Q=; b=UOMNHFKvyF1a8TJc+XryEfpp6j
	fcSJAvhNH0ZitBAmZCmtcTDHb5ckCSDH4cGqQNcrxuq7Ke3YiPBOlhnF4AHulVzQhnC479iD29yuS
	i11uJpsKqIglfXEYgTvOW/hGbEMdxAODSGqT30u1pB5KC1XcEWP6TwBxVStt2Ycaug93E0kz8/q7k
	86JI/2+g50Pfdjh9viv6Sg+SR9uVICGDTli9NOhdBxcJctem2N+C7/eurImWyPQq1PktFCofAIuRC
	4CLXLHbOtviDZ8rSTCFqgekzba6LI0giGB2Q3hpZytcJyBH7OMw/Tn1vcM3bBmCQH3+VBn7H1Pfcf
	xBVqDKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6oL-0000000CXAv-0obW;
	Wed, 15 Jan 2025 17:04:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6n2-0000000CX1o-3r2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:02:49 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6n1-0006zS-JN; Wed, 15 Jan 2025 18:02:47 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.14 (v2)
Date: Wed, 15 Jan 2025 18:02:47 +0100
Message-Id: <20250115170247.1303656-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_090248_956603_7700AB4C 
X-CRM114-Status: UNSURE (   7.61  )
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

Dear arm-soc maintainers,

The following changes since commit 5ae1a43486fb3febd5ce78da13eb354f16d049e0:

  clk: amlogic: axg-audio: revert reset implementation (2024-12-02 17:21:03 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.14-2

for you to fetch changes up to 72bb8275a3b0784a817e0371c49c0110d68bb7fb:

  reset: amlogic: aux: drop aux registration helper (2025-01-15 17:59:31 +0100)

----------------------------------------------------------------
Reset controller updates for v6.14 (v2)

* Add support for A1 SoC in amlogic reset driver.
* Drop aux registration helper from amlogic reset driver.

----------------------------------------------------------------
Jan Dakinevich (2):
      dt-bindings: reset: add bindings for A1 SoC audio reset controller
      reset: amlogic: add support for A1 SoC in auxiliary reset driver

Jerome Brunet (2):
      reset: amlogic: aux: get regmap through parent device
      reset: amlogic: aux: drop aux registration helper

 drivers/reset/amlogic/reset-meson-aux.c            | 97 +++++-----------------
 .../reset/amlogic,meson-a1-audio-reset.h           | 36 ++++++++
 include/soc/amlogic/reset-meson-aux.h              | 23 -----
 3 files changed, 57 insertions(+), 99 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
 delete mode 100644 include/soc/amlogic/reset-meson-aux.h

