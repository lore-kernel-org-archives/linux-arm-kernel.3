Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D49CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fDCx2wauG1rJG+aqredz8TtKUiumMgk4/Dso4HOMAU=; b=nWqEi89WuPYXDqiH5IRRh9HbRx
	5kh2Kh5zGcaaV3YQ1tNlrBRZk8e/BLMNZL6AQbEIXh0yTJYxtiYfxeJcMKQoHd7FVHvbmkgKc3y3d
	SMFF35bQ4JQW/KW+gDPVgoBSVwPO8p08k6CfK+VE4d4E4q6LEck3248fCxNf2cVSo8vaY2gWutcR6
	xbE+dm35DLskeQw7oNDEMLs9Nx3gMQydxRmKVLf4v/bXJ91tGp91PlsCLCeDRtBgLIDqKLKupwSHn
	DNlcn4p9reRgTU4kb7joCiyYwUTXz0CMIzTYHeBkHw+HgKEUVOBlyOjG+45kMj1emsunNeu7QFNnq
	87KI7Dhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Gn-0000000BmB9-2MDw;
	Mon, 01 Jun 2026 20:29:57 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Gk-0000000BmA1-0xBc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:29:55 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8E78FC0005C4;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8E78FC0005C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1780345791;
	bh=iMta9s/9mDkRPLWFlvFYKz5OtGb3VgRCNtGqVYpFQwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JKvpao5im8rGANlgbFdqDN2XQJQfQkW7ROfjS6Cc4jliXUyoS1/3j/p094oHiHM0L
	 62DhrPIOKjjxIIhgWGS63Y8Y4J6E7mlDD5J/IIlwPV5AO1Cjf90kFVDn9BuGp99xyi
	 EoIOpBS8TZ6+LeLfOGAK/zGshb9Ekxr9TmKoG870=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3DACFACC;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom drivers changes for 7.2
Date: Mon,  1 Jun 2026 13:29:45 -0700
Message-ID: <20260601202945.1195228-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
References: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_132954_361554_8E0A9CED 
X-CRM114-Status: UNSURE (   8.98  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/drivers

for you to fetch changes up to e8f908b91550dad3274b5ab3bb0e779ca9d80aff:

  firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST (2026-05-06 12:35:53 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers changes for 7.2, please
pull the following:

- Justin changes the soc_device driver to be more modern and consolidate
  the initialization

- Chen-Yu updates the BCM2835 firmware Kconfig dependency and adds
  COMPILE_TEST

----------------------------------------------------------------
Chen-Yu Tsai (1):
      firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST

Justin Chen (1):
      soc: brcmstb: consolidate initcall functions

 drivers/firmware/Kconfig         |  5 ++-
 drivers/soc/bcm/brcmstb/common.c | 88 +++++++++++++++++++++-------------------
 2 files changed, 50 insertions(+), 43 deletions(-)

