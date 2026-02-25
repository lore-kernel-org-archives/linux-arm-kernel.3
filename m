Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27845FD3769
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WJG08+HerIJq7FGH+QsHPeZygf+7BoP6SPsmloQtUrE=; b=dOKVDKZ4VrcQPO/wDDEQ8R6gs8
	xyj+Tj0SMje5XJDNpPPt3KkFa8ijcFANVxdJOXIiWbO3ull/uDhs7rHIkw1TUWDBsz4ZD2i3ZDqqg
	eGxz+HGj9ji0mWr6UHc649e+Imy6XUQREZJIEaXqqidh8mxeq0THV+l6rvvSJaoxi3sPJmPEqwx3e
	VTh6BytACX6owUqXFMb3XuO1j8PNeo+zyKRgrBFSBmQH+l89tytqF4F7l1BI+8eNj+Z9VnYs2ikvB
	Ee/USDezV/k5xZjCFFHObsPkOQS4eAzqwYQ/F9lq578hWEICgWEsFbFLzyiq05kVh2Nrt5HWUPLxL
	LzWKOJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvH6q-00000004PQC-1fMJ;
	Wed, 25 Feb 2026 15:47:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvH6o-00000004PPr-07ft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 15:47:31 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvH6l-0000Pl-3d; Wed, 25 Feb 2026 16:47:27 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.0
Date: Wed, 25 Feb 2026 16:47:26 +0100
Message-ID: <20260225154726.468149-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_074730_065822_5CC8F6FD 
X-CRM114-Status: UNSURE (   6.63  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0

for you to fetch changes up to e0cf84109bc6c6768337123f1de24ff56b41c91b:

  reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)

----------------------------------------------------------------
Reset controller fixes for v7.0

* Fix NULL pointer dereference in reset-rzg2l-usbphy-ctrl driver for
  renesas,rzg2l-usbphy-ctrl devices without pwrrdy control.

----------------------------------------------------------------
Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

