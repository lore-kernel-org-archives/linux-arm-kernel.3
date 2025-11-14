Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FB3CE7AA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUaEtKDjgLA8JuRCV/LN8v+kbAIdnlaBt/SyozDYVRk=; b=MQJRf7JREOt4YOH/ZN0i8Iexf5
	uWvYxhLphmJAZIia0wgsg+PiSD6lYUEwlLQ4ffx9qPt8egfhmYCi4voJoTUBL+xMh7cc4ZcBEH5xY
	YaOzkh81y4xw/hJWvhR4L2mtvgCbze/YNj8QmHMpxuyBZEoFO8yq5SEJe4ZkfISqWgMsTvI/TApm2
	KKdlioC/Jh45Spgdy4EUpl+PUI7VYtgJBArGucpj1gPa9RpE6BhNItFJn1oIoPSzMsBQdPWlMjcRu
	L2/kFsZCuUPhawSnrf+ep3nMLm0zRihJyJvDuYlXyd8KsJ5szg0wmQSFCGSPB3B3zD6z6sNrIgSFR
	nsaQiTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr4W-0000000C17j-3cOB;
	Fri, 14 Nov 2025 10:30:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr4T-0000000C16o-0Q0a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5021D441A8;
	Fri, 14 Nov 2025 10:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFF6C113D0;
	Fri, 14 Nov 2025 10:30:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:16 +0100
Message-ID: <cover.1763115232.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763115230.git.geert+renesas@glider.be>
References: <cover.1763115230.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023025_161656_A3D0D611 
X-CRM114-Status: UNSURE (   5.37  )
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

The following changes since commit 4765d59fcf8679372286bc899628c3721dafe456:

  soc: renesas: rcar-rst: Keep RESBAR2S in default state (2025-10-23 16:03:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.19-tag2

for you to fetch changes up to c432180a7d95081353a96fd6d5bd75b0fc8a27c3:

  soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config (2025-11-13 21:21:30 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.19 (take two)

  - Fix accessing forbidden registers from regmap debugfs on RZ/G3E,
    RZ/G3S, RZ/V2H, and RZ/V2N.

----------------------------------------------------------------
Claudiu Beznea (2):
      soc: renesas: r9a09g056-sys: Populate max_register
      soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config

 drivers/soc/renesas/r9a08g045-sysc.c |  69 ++++++++++++++++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  |  79 +++++++++++++++++++++++++++
 drivers/soc/renesas/r9a09g056-sys.c  |  69 ++++++++++++++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 101 +++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |   2 +
 drivers/soc/renesas/rz-sysc.h        |   4 ++
 6 files changed, 324 insertions(+)

