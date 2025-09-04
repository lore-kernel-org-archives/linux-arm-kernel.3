Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vIiMVxst1JSOSDSgG9kfNDdgX119d1QZG/ikq3clP0c=; b=zfVNvv32dEeBZxeTbKBV8PfvPM
	mIT1/Wg5NyvfHCLpNw0VkiKTXF4MZJ7Yt6GiF0evOMYzId89ryJC7XiqBavp2GPGU7ppfOfeL8rkA
	CRc2RUyP7EUCXjIolBCgEUXyH4JGWOAVXrY/M8p5XSvZILUjWnohCwyE2XtfSKN07PEQW2Du2fNFV
	jh19QO96DxbKCtdMrfC9Ty1asPkhUYJethc+OhYjGtiAiby96kBDrrWGIvN83SNS4x6JjcIF6FB5J
	OzpCqyi4DKpc5GWVkyxgt2eYYOZDqsr9uQFsLF1WifAAsV1utnQpk/WCyGCa4E7hzgTMj7jvW0/M0
	rLYVPjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG1P-0000000E3xs-3Imn;
	Thu, 04 Sep 2025 19:53:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuByB-0000000CZ9v-2QRo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:33:53 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuBy8-0003Wb-0f; Thu, 04 Sep 2025 17:33:48 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.17
Date: Thu,  4 Sep 2025 17:33:45 +0200
Message-ID: <20250904153345.2374313-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_083351_612639_AFCA50A6 
X-CRM114-Status: UNSURE (   5.66  )
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

Dear arm-soc maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v6.17

for you to fetch changes up to 9a52827a9bbbabb461e87bb41174a96a82c0e8ae:

  reset: eyeq: fix OF node leak (2025-08-27 16:40:13 +0200)

----------------------------------------------------------------
Reset controller fixes for v6.17

* Fix an OF node reference leak in the EyeQ reset controller driver.

----------------------------------------------------------------
Johan Hovold (1):
      reset: eyeq: fix OF node leak

 drivers/reset/reset-eyeq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

