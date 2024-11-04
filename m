Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1DED132A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BIpb+v3eh6pvQ7d5fboR2TzVrjCAnUYmOKQ46yHwEA=; b=YrxnxbBqfFCflKhEvZz4Z1l6KN
	oaEAoDWGWzmKGbcDnQg9YbxYEDC/6nC38fEqR632vR9BMbJnvecC4jJyUdXtVZ6RcfPfBkVj/C9+n
	mzvKt/nJyJ+fuay6sesG05hO1+qxatFXPVRRQbZy9L7ia+kvkLgIEe7JCfxtWOLVC5UK3S5/N7Jxf
	AHSriEI9CPeheOxiTVulkY3hCqAwLnKXogwIw2P4hx6KlQS43f2YM+czkm/G16dos7P+6K4kVC5oA
	bLVTcpY6tWoL/6nBqza5OCYuZPgwmDGt1XMfH6bXwxV9qsxCSb2nBmym1G5ZbOUU2bRuPuXTOCua1
	04ZQhimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t2Y-0000000D5SM-18n5;
	Mon, 04 Nov 2024 09:06:26 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sxY-0000000D4kw-0RM5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4BIpb
	+v3eh6pvQ7d5fboR2TzVrjCAnUYmOKQ46yHwEA=; b=lLx1PfYIlqNfRm4AwVm1d
	agbBfEUkshIQIk1F347NR+Bps5my5C1pvJsinjiSP62eIP90MgyH/OmD01YlR9Ve
	ZdaPeePIWfaiNKMaS+CiHqY41ZRVz347U4yt9LXoojlSTkfBH+PnNJfyTuVHwRqs
	UkckpzRXr5E8ZKj6mLUS5w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S3;
	Mon, 04 Nov 2024 17:01:01 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC changes for 6.13
Date: Mon,  4 Nov 2024 17:00:51 +0800
Message-Id: <20241104090055.1881860-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXD75LjShnSBmkAQ--.16437S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWfXrc_Xa
	47J3W8Jr1UCr1jy3WxGr4UXFn2qr17Gry7Zw1ktF47Jr17tw1Utr1DJrW7Xw1UXF18ArWD
	Ar47Jw1DAr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xgA7UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgeNZWcocJlogwAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010116_548230_C974D3E4 
X-CRM114-Status: UNSURE (   6.09  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.13

for you to fetch changes up to 2f76989999a7434e95fabf7d9d9f9449f746c827:

  ARM: imx: Switch to new sys-off handler API (2024-10-22 09:25:30 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.13:

- A change from Andrew Davis to convert i.MX6 PM code to use new
  sys-off API

----------------------------------------------------------------
Andrew Davis (1):
      ARM: imx: Switch to new sys-off handler API

 arch/arm/mach-imx/pm-imx6.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)


