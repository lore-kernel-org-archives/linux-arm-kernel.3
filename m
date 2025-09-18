Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D68CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/a+FV+ww3CPd0rjTX+NY75wSYcs/Ix8KjUDLHF/6kK8=; b=sTkKkofQUR+yNAOVnA6R88e9AC
	eM4iEC1vJUjeYeKNtYDVM62hbM1wm3bp4XHa9Fonc+DPsF4jspQLA6zW6j2rnx2pJF5AobDP9wjwK
	+wTh1X7EI/HQM4FUg+dgbDDQLUnPObN+qvCt2Mh1jcbZAtXqrZM+CEvo8ZihiT8MnLBkY5jouW7St
	uytrqG/pQ1NOwPe+r5r6YvsySJ6DDdBwnL42KwHvpYAsL1lMgvDOIRgGaF2FVfS1gPl6Vfjg38bcV
	XbqxU5FECSWfI9Dev/iffTJoA2InmhoQcuwCVsmm3/qSC20eaEH8nNzoEJfNdNqxDKlSI+wjK37UM
	8g1VqYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKDU-00000000z6Z-0sQz;
	Thu, 18 Sep 2025 19:22:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKDR-00000000z61-3V8W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E923043700
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 19:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A04DC4CEE7;
	Thu, 18 Sep 2025 19:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758223367;
	bh=uUTkBOCHlpE9jvtDKV3XPScDPvuC3VQ5F2qvTh6jLIk=;
	h=From:To:Cc:Subject:Date:From;
	b=BAbn0Zf07MqY+sjUJIbC5od42aLaFginsyXK8hlH9oUg2mk6nxkaQ60pTMToqssWu
	 MGUoH0/kM4TH6VwokFhtXpBRr16vrUokj3eRtSYrLyFd8i2cTLPk+fCRFUUiQHeL3t
	 LH/D1/GkmDOwDlxq4O4uidaRO0aDu4oztJsWc9OhRrlHnB76IBs6TdAWicXlp4dmvP
	 zTAtgFgn+0HkvRPjnNTxY7aG3H/vavVwiRbq1pHuECeDEcM3p64Y8fvpjYPOBnP0Sx
	 6JeJ3RhMzgK+GEqytC+bfQ7TJ596dwErRQ/oLmkBJhlS0sfS3XzBBzFt6EIfZiNmW4
	 /GALPuaNhiBpw==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC fixes for v6.17
Date: Thu, 18 Sep 2025 21:22:41 +0200
Message-Id: <20250918192241.29374-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_122249_891126_5378CC11 
X-CRM114-Status: UNSURE (   8.17  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-fixes-6.17

for you to fetch changes up to 07db1def8f0aad25612b35377b63aa20b032c86d:

  MAINTAINERS: remove Alyssa Rosenzweig (2025-09-18 21:17:31 +0200)

----------------------------------------------------------------
Apple SoC fixes for 6.17

Just a single commit that drops Alyssa from MAINTAINERS at her own wish
and adds here to .get_maintainer.ignore

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Alyssa Rosenzweig (1):
      MAINTAINERS: remove Alyssa Rosenzweig

 .get_maintainer.ignore | 1 +
 MAINTAINERS            | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

