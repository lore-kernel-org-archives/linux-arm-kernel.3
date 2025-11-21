Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14FCFC283
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBugfBz9WW+Z6pDsQ+14VfD8g7WL4gjffYaqAMhBaw8=; b=de1EfcsNSm1DtMuR+8im4pHk2D
	jY87kPSmdHk82Ipmcz/kAc4AJ44tzPxalXsk3O9+in3lMkdVS60H3s1H3vtypEGbCNY/uInSMRFWr
	fyxgKYYaiIhth+e3p6RFm+47baTB7o7ZZLU8UqjWYkPxwb3X70JRuldClDzf4kgBdwsVMVtwHOTgi
	QIUDAbBFTDM6MnI4nVql8Diz6mUnSM5r5irQJDxVmh6ba5fmiqcysVAFwOayygY3YUvxERKZAHWsn
	zqjtBhiKN5BTGLJ5WU6zd1GjLEbMtw0nFur8E25zvWiKNzZCGE5RxcVh/ZeavekdG6oV1tS0ZdtDJ
	MlJHzQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMT3P-00000008cBt-2Eak;
	Fri, 21 Nov 2025 15:28:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMT3M-00000008cBS-3IOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:28:06 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMT3L-0002yc-4j; Fri, 21 Nov 2025 16:28:03 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset/GPIO/swnode changes for v6.19 (v2)
Date: Fri, 21 Nov 2025 16:28:02 +0100
Message-ID: <20251121152802.3619853-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_072804_827531_19F0515C 
X-CRM114-Status: UNSURE (   7.48  )
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

The following changes since commit 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:

  reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16:51:49 +0100)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-gpio-for-v6.19-2

for you to fetch changes up to 527250cd9092461f1beac3e4180a4481bffa01b5:

  platform/x86: intel: chtwc_int33fe: don't dereference swnode args (2025-11-21 15:31:43 +0100)

This is a follow-up to the reset-gpio-for-v6.19 pull request [1] fixing
the build issue reported at [2].

[1] https://lore.kernel.org/all/20251120163252.34760-1-p.zabel@pengutronix.de/
[2] https://lore.kernel.org/all/20251121111534.7cdbfe5c@canb.auug.org.au/

----------------------------------------------------------------
Reset/GPIO/swnode changes for v6.19 (v2)

* Fix chtwc_int33fe build issue since commit d7cdbbc93c56 ("software
  node: allow referencing firmware nodes").

----------------------------------------------------------------
Bartosz Golaszewski (1):
      platform/x86: intel: chtwc_int33fe: don't dereference swnode args

 drivers/platform/x86/intel/chtwc_int33fe.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

