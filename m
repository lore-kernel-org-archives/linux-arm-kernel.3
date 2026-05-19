Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93205CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IrJsM3S/N7VYYECV0qM0k4HMlZhKCvskD3jID9rqbY=; b=n/vuyaA3p0mZiDbmxFyAfqVO77
	j/mkw+a5cYzmfVu+tI6eKB2A5JWmVqgD8L1RVAoUIFBz2iifqwJ82rT2XROnx5ukK1Bebadate7sH
	17VLMx02tGjrOUZ5/hJt2y0OxYtZ6e3CPnXPPI+l86fhb19LkHeO/msOyye9sdhQ5i4eXpLs3se10
	gb6OdiWqyQLYwarS27uF5OZc6kzYgJLCHA0luC1Vrj2GDBxpbwJDB3ImxMMDOI0eFQrrd71AsNoRU
	YxtHrYXz4FNXfkUSUYaIe+506N+2L+2trCAs2adTUyYo0fe1BBc9W+c6H3CnxZrPrYJQIOTH+Mgqh
	OPPEGKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHo8-000000016ZG-2PzZ;
	Tue, 19 May 2026 10:36:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHo4-000000016XX-14J9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B431A60207;
	Tue, 19 May 2026 10:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D40C2BCB3;
	Tue, 19 May 2026 10:36:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.2
Date: Tue, 19 May 2026 12:35:58 +0200
Message-ID: <cover.1779185459.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779185457.git.geert+renesas@glider.be>
References: <cover.1779185457.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag1

for you to fetch changes up to 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:

  soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.2

  - Add Multifunctional Interface (MFIS) mailbox and product register
    support for R-Car X5H,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for R-Car X5H, which are
shared by driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (5):
      soc: renesas: r9a08g045-sysc: Move common code to a helper
      soc: renesas: r9a08g046-sysc: Move common code to a helper
      soc: renesas: r9a09g047-sys: Move common code to a helper
      soc: renesas: r9a09g056-sys: Move common code to a helper
      soc: renesas: r9a09g057-sys: Move common code to a helper

Geert Uytterhoeven (2):
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag1' into renesas-drivers-for-v7.2
      soc: renesas: Convert to of_machine_get_match()

Wolfram Sang (3):
      dt-bindings: soc: renesas: Document MFIS IP core
      soc: renesas: Add Renesas R-Car MFIS driver
      soc: renesas: Add R-Car X5H PRR support

 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 187 +++++++++++
 drivers/soc/renesas/Kconfig                        |   9 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r9a08g045-sysc.c               |  33 +-
 drivers/soc/renesas/r9a08g046-sysc.c               |  31 +-
 drivers/soc/renesas/r9a09g047-sys.c                |  34 +-
 drivers/soc/renesas/r9a09g056-sys.c                |  33 +-
 drivers/soc/renesas/r9a09g057-sys.c                |  44 +--
 drivers/soc/renesas/rcar-mfis.c                    | 344 +++++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c                  |  10 +-
 include/dt-bindings/soc/renesas,r8a78000-mfis.h    |  28 ++
 11 files changed, 644 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

