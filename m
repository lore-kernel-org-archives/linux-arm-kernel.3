Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DC0C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2Q4JL74I+yP3vBTHP6zMpvH8Qweu/Ao1HUpJHRwU8Y=; b=3qX8gvEeL4MS6TQzp/2MmN5R36
	LsTEPg7ifEXUNoICA3+dY16MXeMJ8mLCFndYX5RsgbENIaVJpVTgFt+Hr/HplqDHeVE+K1sDZ0TEl
	Do1St2VCgAu53isSR9imGVzxEERMy3HGBenOQtPDmmjWtaTXkJEtrOnPRf6m1Q2K1B8TkoSJSUo1n
	ENlhnUDg1MkB5JnmxsJzhS/t2q9vu/kcQe7MycCirfwlxPR15KVwa07REkhEzgg3Tu7gv6J2PRFkh
	ihQgGCjUVDJNA1kQ5EYAzJMm08vIto8wdwC6a85/aNOH/dbPWWqJhdDTjXV0ltYMdIQg8JUyx/MgB
	p1rmlYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiJ-0000000A85y-2EBS;
	Wed, 09 Jul 2025 22:56:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbB6-00000009mn9-33Pj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 20:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C04C5C4819;
	Wed,  9 Jul 2025 20:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C85DC4CEF0;
	Wed,  9 Jul 2025 20:14:02 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:25 +0200
Message-ID: <cover.1752090398.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752090396.git.geert+renesas@glider.be>
References: <cover.1752090396.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_131404_805980_EE4F7639 
X-CRM114-Status: UNSURE (   5.83  )
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

The following changes since commit 1cf74da68cffc91b00de7a188aca091f1b956a1f:

  soc: renesas: pwc-rzv2m: Use new GPIO line value setter callbacks (2025-06-13 11:21:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.17-tag2

for you to fetch changes up to 2d9f884ceae80ae5ceba90990fb8d824943602d5:

  soc: renesas: Sort Renesas Kconfig configs (2025-07-08 11:55:31 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.17 (take two)

  - Sort Renesas Kconfig symbols.

----------------------------------------------------------------
Kuninori Morimoto (1):
      soc: renesas: Sort Renesas Kconfig configs

 drivers/soc/renesas/Kconfig | 316 ++++++++++++++++++++++----------------------
 1 file changed, 158 insertions(+), 158 deletions(-)

