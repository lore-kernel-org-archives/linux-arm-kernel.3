Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13847C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7Htl9Df1LvoDg/xuDVBZtNKC+GUXSgILBfAbw/Yrr8=; b=G0qf7vctvuyCELA/et+LpfKunr
	y/lbQy4Zskofjjx4r+0m13rUAkGEZ1m8hu0Gqh2dG8F/vr/xJ940qbYXt/VEbOSatcnPE2WlRqExL
	kfhN5yGER+2txfpAy03yzffX1Y1Is1dhjSgRMx9vnO+0gefaH+OLpDDDVEos2EVsNU7b9/pnsJJLv
	/x3kAYR8Anb93saleTXGv23OlgIEMqG70DPQRLOhcc0eZQPIvyxj7i+xo7jpIEefjXHLkNOAazXzr
	TnSvkTqkijA2ut7tdo+la83pT/oZTuIDYJ163AqdNDduGAY88Ddbiu3+r8QHjN2DPVX9nB7N4sC6R
	4+UODoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqLw-0000000Ca38-2liO;
	Tue, 13 May 2025 14:11:28 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqIp-0000000CZkr-0Z27
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:08:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D921FC0000FD;
	Tue, 13 May 2025 07:08:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D921FC0000FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1747145292;
	bh=WemnVThzCyQ5qTlrfFam/oOOdbwwb/2UhX8WWEZMbrc=;
	h=From:To:Cc:Subject:Date:From;
	b=BPxtObz3rYVMAAyqtfr6+InskLRw8DDWSwdoa+3uF293iSxfzBNYZZdr82Sv1h3rm
	 lMf+VbQNE+pMJSiC2haA/WiqY4R0vSbboVDPwBa68/j4Zxm7Un5m0cD2qB3+wvnyHJ
	 DGByc1fx0kNLW0hyLS32E3xXKgBdrG6qeLIYbMDA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 827BC18000530;
	Tue, 13 May 2025 07:08:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom maintainers changes for 6.16
Date: Tue, 13 May 2025 07:08:08 -0700
Message-ID: <20250513140808.2047729-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_070815_425134_96951E8F 
X-CRM114-Status: UNSURE (   7.88  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/maintainers

for you to fetch changes up to 840bb13005f2d0d2a9fd912c1660551a46654368:

  ARM: broadcom: MAINTAINERS: Cover bcm2712 files (2025-05-05 12:30:07 -0700)

----------------------------------------------------------------
This pull request contains MAINTAINERS file update for Broadcom SoCs,
please pull the following for 6.16:

- Krzysztof updates the BCM2711/BCM283X entry to also match on the
  bcm2712 pattern to cover the Raspberry Pi 5 files

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: broadcom: MAINTAINERS: Cover bcm2712 files

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

