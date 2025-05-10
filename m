Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ygNenFQSlWZKHuaoFHsCRPZl844027GugW0JBaYx3TE=; b=nWFFd6jwlLsjljtak1nnpaUrJF
	Y8NzNiCcQUiYAC4uQgkDxu5pU7sh2H3KeWD+c9HEgrJyHAkm6Q9dsiVUtRL1Yh3O4zog/NW5k7ANM
	O8E9q9cLaQFlaXtvJOFXGODfrq+ryKrey25/gQi9ir6yIhCfV+s+UldPA5u67GjN0Zfb2uTLiiiJQ
	h4Rwr3FbyQeVAmW1+/qfw4A5e6IRL7Z837FrFeLZF1WXTztyFRRaTXjQ99A/zLA1AsT1x2B2AwsI2
	bfptyYzNPYa7rtQIC3j/xfeSTlv5uGOHn2MPa5j3ciQsKEI+R5rlt08+5uaQ2JGZ7G4q3Qe6LJ3Ea
	RUV2SaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYOx-00000005Dz3-1dhh;
	Sat, 10 May 2025 00:49:15 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYMx-00000005DnF-3sIZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 00:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ygNenFQSlWZKHuaoFHsCRPZl844027GugW0JBaYx3TE=;
	b=eWducVhsMtl+BPa+5dmA1AnRPO73y7sQ/tAANPwwIjYRIWPbm4n9YOIQyShTO1
	FBozbGCKSyZI8c9IjmkUrDvFRufPvQnFrY0HE2pYRzO2IxW1CbSKcZr/RKXVTa0Z
	geTuyUeUptz5M73C6j/N+N0ea/1FSJduxByuijTpQJr+c=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3NyX_oR5oLaCwAA--.3659S3;
	Sat, 10 May 2025 08:46:57 +0800 (CST)
Date: Sat, 10 May 2025 08:46:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.15, 2nd round
Message-ID: <aB6h/woeyG1bSo12@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: Mc8vCgD3NyX_oR5oLaCwAA--.3659S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw45tFWfAF4fWw4fuFg_yoW8JFy7pF
	4akrZrJr1DJr47AFnrXr1DKF98tw48CF1UGr47Jry0kr1YyFy8XFn8Kr95GrW7J347Xw4r
	KF1UJryUKF15ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuT5LUUUUU=
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERdJZWgeoekASQAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_174712_268434_C62F3894 
X-CRM114-Status: UNSURE (   5.81  )
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

The following changes since commit 5591ce0069ddda97cdbbea596bed53e698f399c2:

  arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2 (2025-04-27 21:49:30 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.15-2

for you to fetch changes up to c6888983134e2ccc2db8ffd2720b0d4826d952e4:

  arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout (2025-05-09 22:48:35 +0800)

----------------------------------------------------------------
i.MX fixes for 6.15, 2nd round:

- One more i.MX8MP nominal drive mode DT fix from Ahmad Fatoum to use
  800MHz NoC OPP
- A imx8mp-var-som DT change from Himanshu Bhavani to fix SD card
  timeout caused by LDO5

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive mode

Himanshu Bhavani (1):
      arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout

 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi |  2 ++
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi         |  6 ++++++
 3 files changed, 19 insertions(+), 1 deletion(-)


