Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8893FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67NhHANNx7gYxC40xTcGIRIsdst/NiIzDqY67bnEEbI=; b=hSC3awPTSk2COzJmXLIMzEW5O/
	YLE6ZQJJSmp8lDrSoLF8nhXpcPR7un0e7gBkoylPChfq3f4dJ968PdlN4aO4xia4VzLoxCo3tig9h
	8gLUPmYKqoaPyUNEEsa/2GRkGNXuj7nCgTL2QgHoxM1h6N6vBqyH74s6mqkqfHhod42CahGQ4bWpE
	gpFXPR/Yi7k+TOc06o/A3+ZM1w2Tr3Uj4E1ixb/xBktelpGT9rWda3GaPwxWtyQE9tYlEQHARCMw7
	Q/q7E6qxE1R9YaMhuS5jHb0V4QU6uT9RzEW9wTCNBP+aBbrmDRBoqUKH4lY/nZeqKc6yU9f3tm9FC
	trQiGbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jE-00000008oNj-2fpZ;
	Fri, 12 Sep 2025 11:14:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jB-00000008oLy-3QLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40F2D60234;
	Fri, 12 Sep 2025 11:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DB6C4CEFA;
	Fri, 12 Sep 2025 11:14:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.18
Date: Fri, 12 Sep 2025 13:13:52 +0200
Message-ID: <cover.1757669916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
References: <cover.1757669912.git.geert+renesas@glider.be>
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.18-tag1

for you to fetch changes up to 1ed2786e9ef8f16204dc3f30c46412070cb7140e:

  dt-bindings: soc: renesas: Document R-Car X5H Ironhide (2025-09-11 20:20:33 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.18

  - Document the R-Car X5H (R8A78000) SoC and the Ironhide board.

----------------------------------------------------------------
Kuninori Morimoto (1):
      dt-bindings: soc: renesas: Document R-Car X5H Ironhide

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

