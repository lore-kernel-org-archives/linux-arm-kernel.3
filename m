Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1318C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dXrNvzFEwTnXTRDjKuPyJdSsIoFSJx6o/cMMTvBChdE=; b=JeuSRgigNRB1MOWOtsP55qnr3R
	LenKKkXxzjqEZvgTkHIGDqZ0KFOEW8mH9ZbIp/E/QEfZ/Fq0sCFi/LODYYIKShnVpG99B8UdMXlna
	Tyiv02BUD1SVXQdn+MFb8kUk3p4wdIaHlHtjUzg3OInVYyCfoRInqZsUD1f9kF3RGEzs1SyKMFm+K
	cSnlaDhTtCgZA2L3plEcv9ZiQF1m18RCwyHOcqGS1S9CQi8uBLesf1J9u1E++Rqn9YjUefCXUFADS
	BC8vAZYIIMZarhpQImQtCB04/Nd2tV0PBWXSxwqCQ/xhdPyNGz4lOkdkAVSOYzdq0azqX/e+nAsPr
	aovg2v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDxk-0000000A0yl-1QcE;
	Tue, 21 Jul 2026 17:09:00 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDxg-0000000A0wd-3sUh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:08:59 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 08BC8C0000E0;
	Tue, 21 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 08BC8C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1784653734;
	bh=2GNkgOjfx7RIocLM0CmhReELD/lA/lYDcSHiga2Rdp8=;
	h=From:To:Cc:Subject:Date:From;
	b=po02jqgcIfrK+K48mLSGiPKp2iYCKXyiED35eKji+hMQrfafE+O8i3hs0bRThpYJ1
	 AUo8IBBuUg3/Z50iIpVDGAIb4pZSljINfW9QCuU919Y0vOjZWCexxuHBOZXdBh1WAY
	 0rDtWfchYhsGA/pw2tkmdmrdaeurKcXHYQtRChjc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E04BFACC;
	Tue, 21 Jul 2026 10:08:53 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Daniel Drake <dan@reactivated.net>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 7.2
Date: Tue, 21 Jul 2026 10:08:51 -0700
Message-ID: <20260721170851.3581392-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_100857_008562_8979E8C9 
X-CRM114-Status: UNSURE (   7.65  )
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

The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-arm64-fixes

for you to fetch changes up to 75952cfc7752c52a2b692b59d34ce160d3edabb2:

  arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer (2026-07-21 10:04:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 7.2, please pull the following:

- Daniel removes the non-functional EL2 timer interrupt which is not
  connected on 2712

----------------------------------------------------------------
Daniel Drake (1):
      arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 --
 1 file changed, 2 deletions(-)

