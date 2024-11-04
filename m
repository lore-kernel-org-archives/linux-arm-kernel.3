Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1FCCFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XcJwawhZqRXPK0DRxITSYDPbNUWw2cWbdM0jDz0Es4I=; b=0JmqhiVAffnf6J7R3vzj6KIw8W
	IisRvvnaQOjdqaHXi105r2qv3q5nN2LoQS6IhotyKijgic8pL8Z1KH99dpX53q1UaGowGQ6/nZH/i
	vycZ5KGqBGqc6528GXGQsPJKNpd8gi1sWAKuB+qDkZu1cqnUFd+WvUXJvQhULd1pTQfXQ5lrE5ejq
	P4mNJGWHt9k90HrP/9MExqYbznBhFLbofbcXwy+uoLddrqtd2r4/zqNCFaplGpDhQbuimMc1GGv5H
	U04uLqQFJvbxaWrQtJDbM3EfpsH9GzHDRFa2qTULusLo6fqxofsbSyzwgBEW0yEpp5Do0DXkTRTE5
	nV84R8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7szE-0000000D4vJ-2bMZ;
	Mon, 04 Nov 2024 09:03:00 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sxX-0000000D4lG-1nlH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XcJwa
	whZqRXPK0DRxITSYDPbNUWw2cWbdM0jDz0Es4I=; b=eLM8If5EJ/YNb5Puu9fgB
	kTFUC1l9Wys78gSJaByD8OUdPVrTO/9gkGSUaLdYHXB2TllLif78zRsCGp25A3m4
	fFW3YE+8PqAd1s3rm8ztUYm7Uh0m2EUcj/ySXNiLxcV1syN80y1+eWXIdlsuavqP
	IuqGtBtBOTlEur+yx9wwHU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S2;
	Mon, 04 Nov 2024 17:01:00 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers changes for 6.13
Date: Mon,  4 Nov 2024 17:00:50 +0800
Message-Id: <20241104090055.1881860-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXD75LjShnSBmkAQ--.16437S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWkXFb_Ca
	y7Xa48Gw4UGF15Ja4UGFyxZr9rKr4xGr18X3WUtrW5Jr47Ar1UJF1Yqr48Xr1DXF1rGF1D
	Cr1UJr18AryUGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8x-PUUUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAyNZWcoXw6YrQAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010115_901736_A0B8C709 
X-CRM114-Status: UNSURE (   5.34  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.13

for you to fetch changes up to 22b03a4e957e462b380a982759ccf0f6554735d3:

  soc: imx8m: Use devm_* to simplify probe failure handling (2024-10-18 11:13:53 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.13:

- A series from Marek Vasut to probe soc-imx8m as platform driver,
  so that it works properly with 'driver_async_probe' kernel parameter.

----------------------------------------------------------------
Marek Vasut (3):
      soc: imx8m: Probe the SoC driver as platform driver
      soc: imx8m: Remove global soc_uid
      soc: imx8m: Use devm_* to simplify probe failure handling

 drivers/soc/imx/soc-imx8m.c | 174 +++++++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 73 deletions(-)


