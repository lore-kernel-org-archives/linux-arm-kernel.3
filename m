Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E373CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNYAu/5xfoUe1Cd1Dk6SgiXruma2zPCXXBEcXxRe+VA=; b=2A1+bZs29mPcwPfx37m9FV13iC
	VPgls9CQrILeXyUnR0CDeFn/kPKf1+F94mRL8jKQZZTBJqNYM7HzIV1mRDTelwGY1wCEu1sIvNNn3
	E7W5iBZmli1rvufalr4CWMps+tzTfZxZwxAC/YB9VTjN5MeIFcx3TqxjIRje75d5oYZPVI0fPxQ2A
	XKlDa3zfQe7pXPzZCviBIGqw3s4B1Y4b0zP5qYHcXBBW0NPW4+nN7yBRlA55ApV4x5jllkdMwNb/q
	zDdUcV01I/+FExDcOdBEnVCgsD8+VE5OdZ+NvnnmkkwDwoaBhUsL/zjflH63MfoidMPvzYu7xhlBr
	FK9YeIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRJ-0000000G43E-0kRz;
	Mon, 17 Nov 2025 12:34:37 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRG-0000000G42P-21a1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MN
	YAu/5xfoUe1Cd1Dk6SgiXruma2zPCXXBEcXxRe+VA=; b=K6GXJqVmPJ+itrIt00
	QIH+G/A1nkcI98HHFunoPjZGdnPJh12iqG8SaPxREHEjfMc0KIZgq57WQ8UXeVs/
	ghBHGAxBsxxTvfJqr84xljuqaZ4yFjA1QpWiIwRo++UNVo+/p6Gq7J4DCR7MpuJ8
	0HWXNxlUOEMHcvxPm0EAcDQnM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S2;
	Mon, 17 Nov 2025 20:34:22 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers update for 6.19
Date: Mon, 17 Nov 2025 20:33:47 +0800
Message-ID: <20251117123358.2009662-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgAnXIhOFhtpoZUoAg--.8347S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw43Aw1UZw4kZr1fJFb_yoW8GFykpF
	43JFWayw48GF4fXryfJw4UuF13Xwn5GrWYkF47Aa1kZF45Awn7Jr1Dtw48XFW8Jry8JF43
	KF17JF1kGF1UCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-Ef5UUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBG6IGkbFlETowAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043434_838943_F5043337 
X-CRM114-Status: UNSURE (   4.56  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.19

for you to fetch changes up to 97a07dd2b559d149598cd49574ce50614752211a:

  firmware: imx: scu: Use devm_mutex_init (2025-10-27 14:43:48 +0800)

----------------------------------------------------------------
i.MX drivers update for 6.19:

- A series from Peng Fan to to improve i.MX SCU firmware drivers

----------------------------------------------------------------
Peng Fan (8):
      firmware: imx: scu-irq: fix OF node leak in
      firmware: imx: scu-irq: Free mailbox client on failure at imx_scu_enable_general_irq_channel()
      firmware: imx: scu-irq: Init workqueue before request mbox channel
      firmware: imx: scu-irq: Set mu_resource_id before get handle
      firmware: imx: scu-irq: Remove unused export of imx_scu_enable_general_irq_channel
      firmware: imx: scu: Update error code
      firmware: imx: scu: Suppress bind attrs
      firmware: imx: scu: Use devm_mutex_init

 drivers/firmware/imx/imx-scu-irq.c | 32 +++++++++++++++++---------------
 drivers/firmware/imx/imx-scu.c     | 11 +++++++----
 2 files changed, 24 insertions(+), 19 deletions(-)


