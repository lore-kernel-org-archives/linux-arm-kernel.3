Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9753E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CRzs+lBteckHuBiMPASLvCpYpP9+LhqXWoobnD31UvA=; b=Z1VnHDa/OtUONRPUlpFFOeI4x0
	MNMsqA5DfmUj9mzItccGZH3RAc/w4+ZTNAXiut7CyoszeQVKsr8ou2VcoOINA/ThXoIMvkb/fLArF
	3Wqm5HUvWxo2WJOwSJOZefSU3MvMQUN8eD5xnpzgAckjLef3oMzRkHP7hXBarPLAEcXOjmtYox1l/
	v2OwRdOibFRRq6d9JJfC8WI78qva6jEy+bpX+wcIQGm3MRTkAzl73YWkQGZwBxAWuk3MwM9xFSNYY
	s9IXuM16ShIVZVVUbe6tWFiPhhu6VsWg5Cmxf5VVCnsqhTHeOFkH6dRbTZMB45PS4Tkp9zZYO7Voi
	1i9G7aHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNKC-0000000GdXX-1Ibq;
	Sun, 05 Jan 2025 09:53:36 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNIg-0000000GdOe-0Zvj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CRzs+
	lBteckHuBiMPASLvCpYpP9+LhqXWoobnD31UvA=; b=fLxZ+zBgWI8P5hD4HoLHb
	L5eywEIW7d9KwzWNkGKdUwNJB0icGlTyO9CA0RMDZSenBydCrZJCMrjfhqlRzKZj
	KqAbOgYeho959U8FNi6cM+8+vUTHchg8VF7kFyqvlaYORy/ACHNTUKUz/HVK+e7j
	Z4EmkgBf41TRNUJc/Qoil0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S2;
	Sun, 05 Jan 2025 17:51:43 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.14
Date: Sun,  5 Jan 2025 17:51:34 +0800
Message-Id: <20250105095139.714590-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXGWwuVnpnZZRPBg--.62165S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWDJwc_CF
	y8Xa4UJryUJF17Ja45Cr10vryjyF47Jr97AF18KrWUJr47Jr15JF18Xr4xXr1DXr1UJF1D
	Jr1UXr18Ar4UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbc4S5UUUUU==
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAjLZWd6TKsXngAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_015202_572332_576EB3D1 
X-CRM114-Status: UNSURE (   5.70  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.14

for you to fetch changes up to 0b4dc35529f87d99fca91b259d50f54613bf9ec0:

  soc: imx: Add SoC device register for i.MX9 (2024-12-09 20:31:39 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.14:

- Add a SoC driver for i.MX9 (Alice Guo)

----------------------------------------------------------------
alice.guo (1):
      soc: imx: Add SoC device register for i.MX9

 drivers/soc/imx/Makefile   |   2 +-
 drivers/soc/imx/soc-imx9.c | 128 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/imx/soc-imx9.c


