Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87074C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDg8LyTwf6Z5RZfJ2WcwAVMbQDI394/OUmNQpCPItl0=; b=uN17CQ2nq5DWsqpiizshR+w5cx
	VuV8LwP8qFGR/b56qZ/wDpxO0WV9IXZzrSV6jX2wDNbRWMkscxOEozYNvPQDtND0XNQjzUpBDVPvz
	mRkPHT8LcKt2HaJl3raE9pYrfp8D2s5girS+n0brvdi9bEFbojpfIiqioMNchtZzThih0ezkBspR7
	BgylIODBZ2kywr6uKli3wLwcauZA/T6HHIG/dzKJO07gbIHGrtgPURPZmVMmPkup5qdGNMmKo17Kw
	mjHhIo9907/TuVb0LEQ0mOxQeoKiNEN42fYUMRnosRZra+UW6/7+C5TWhX8EXbd6hpVH6ShKRbAVX
	G4SJqojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGov-00000007kDH-3Y98;
	Wed, 12 Mar 2025 07:48:05 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGht-00000007j3H-1ipL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hDg8L
	yTwf6Z5RZfJ2WcwAVMbQDI394/OUmNQpCPItl0=; b=njprxXF8Bppm24AkPfqjN
	7EbCLpa0AuOG4Tt3D0lIHuDbeLNw+8LwzM79+7v1ZO8IoTrBIsxF1gmmuulOYCLP
	PVjXPZdTED09GZ73BsP6G8IxFARi9vzPCf77mOeDq+hIhFShhO2fwqXPy1nNzkIm
	8SD78swPiSAUFtVl1pm5d0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S3;
	Wed, 12 Mar 2025 15:40:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX SoC changes for 6.15
Date: Wed, 12 Mar 2025 15:40:02 +0800
Message-Id: <20250312074005.663165-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgAnwdRtOtFnQ6_FAA--.2767S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrAF1DCrW5uFW5ur45KFg_yoWfGFX_GF
	9rJF4xJr1UJr13Aw15Gr10qr1UJw1kGFyUur18tr4Utr1Iq3W5Jwnrtr48Xr1DXF18GrWU
	Gr1UWw1kJw1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xgA7UUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhEOZWfRL8cyTQAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004049_773930_56C2897F 
X-CRM114-Status: UNSURE (   6.05  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.15

for you to fetch changes up to 4f8ec94af325d501904d7e86363bd162004161bd:

  ARM: imx: mark imx53_suspend_sz as unused (2025-03-11 10:57:51 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.15:

- Mark imx53_suspend_sz as __maybe_unused to fix a possible build warning

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: imx: mark imx53_suspend_sz as unused

 arch/arm/mach-imx/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


