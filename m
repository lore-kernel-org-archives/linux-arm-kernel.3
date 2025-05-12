Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D38C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZxKAouH3fa7mvDa+n8INUrl0YFS4S3/N12U8nU5vgT8=; b=AlKGuePjY5LBaWlvKZAfGbF9Eb
	TNqdkcBn2fQ1gDe/yMAPj/l7A8zWhIyyGfM3ahKQmphC17k2aWpiKTIoFJhu0MmY98YnotEIoiTPH
	1Z0/anm4xlDg2Ux3mhf+3Tn+r/dc2dIGA5n0SHTApBUU/2JFGgXXJdL3Il1hK6Bdetx1jtnbowluX
	EkhiHqUI/Qp+JSexqI5yPmlh1PssU4ys6WL1Pujyy6J9Iv+59LKIXs3a9r5NVJ/Clvu5pcZe+m1Vb
	uZwZVc5kyTh6oBUyulC//y02lO37VegLzZNxAckUwi+e6Hm75GljLlXZfu2hiKsjbEZgBYbSGptmh
	XIIXipHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQbB-000000097ff-1FB2;
	Mon, 12 May 2025 10:41:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQZ9-000000097T3-0mDw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63C5C629D0;
	Mon, 12 May 2025 10:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF27C4CEE7;
	Mon, 12 May 2025 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046362;
	bh=mLLIpyFiRzCKEImiqoPC0v0UcgjN4CKT/HsuUkB/IcE=;
	h=From:To:Cc:Subject:Date:From;
	b=r3Qw7jcMD/AqzhW4ctUfL8NajFvKBzFUpMtB1ePJFtHDeQhR4dqQca3Eg/Qrb9PrY
	 dgawHMrhuqKMKhBC/3+qRAtX8y7+4CCFaa8ZXHo5PSPtwPHErkHcHtBrbVJEleiFGL
	 9eUL6uzvuPP2ywvbrd1ntaemvNEZCUyeX9aJzzcPS43SzrnpI5d+bH8EmI3G2B6VcM
	 JRLN3qHcYnrk443RlHLOKXWtL1S5rDFvTBWOT1yf9Ow7wYLmKMKDq/RkUXIdzDHwUs
	 WfNCgBZuni9n/W07rC/jKAApe57pY+ymWXpJH0mloRc6dkoiLR2VGjx1/MQEytmrTA
	 bYVOJt6cvrbYQ==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.16
Date: Mon, 12 May 2025 11:38:54 +0100
Message-Id: <20250512103858.50501-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.16

for you to fetch changes up to fd0bf2bb32215976c269d6e68c1a12b5815e6c20:

  soc: imx8m: Dump higher 64bits UID (2025-05-09 18:16:28 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.16:

- A series from Peng Fan to dump full 128-bits UID for i.MX8MP

----------------------------------------------------------------
Peng Fan (3):
      soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
      soc: imx8m: Introduce soc_uid hook
      soc: imx8m: Dump higher 64bits UID

 drivers/soc/imx/soc-imx8m.c | 177 +++++++++++++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 69 deletions(-)

