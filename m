Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09059E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jsLdGdXIlN+AA0KtWArsCvTWvxuEeik+CHILqtBUq4M=; b=0qzeNLVxL0hdEVuLI6720FzRrf
	m9xa73gHQp+6MNoSoW+dNVpRPQF1fxKRDME4yzSamPxIqYpMqoZJN9d5Fvm6FCU60VSewlSBXPfFn
	ZanLma5lli0Nke2D0ZITFl45cgxgUaES7tLW18g5+ZL3JxBRmH455l72sl0RhrKlkO4IX3jYBIXUo
	oGjH+beje0/ACSmO5ok/XU+9jg6631phzuD6nkKmRHn+FVhMsrrTwyfznPWT3wQ1vaxtPNPgYjrlf
	mQUr8GOUvVIsa4ueOsiyquv3CZgwaxEMGv5Qp7nU2BGhiuYqFHbkx4NY3hQbK2YEgCZzIAE39kCxT
	+GkVRy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcuP-0000000EbN6-2e2y;
	Tue, 17 Dec 2024 19:07:05 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNctK-0000000EbJo-1I6g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:05:59 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C888FC002812;
	Tue, 17 Dec 2024 11:05:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C888FC002812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734462353;
	bh=vs5rp5d5c9Z6qD3l4kuiM9llqUe6bKbdDZzhxWJhbdw=;
	h=From:To:Cc:Subject:Date:From;
	b=DQSYmL35wBwr51b40eML5x7VbNYD4l+GVIyA1eEuWqJPP6L3ZT588gMYGewxu+WkK
	 /fYATQkbEB5aDBXrKRnNsYNpl4lDCsU+xp28UlSiPYr65OQvtKls38QdqnVXxr9V2B
	 srlVs34WiUzxEDflAgO/eE12TD2dKkRhNvsMo+AY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 7291918041CAC6;
	Tue, 17 Dec 2024 11:05:53 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Willow Cunningham <willow.e.cunningham@gmail.com>,
	Willow Cunningham <willow.e.cunningham@maine.edu>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.13
Date: Tue, 17 Dec 2024 11:05:47 -0800
Message-ID: <20241217190547.868744-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_110558_461724_3ABAB60F 
X-CRM114-Status: UNSURE (   8.60  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/devicetree-arm64-fixes

for you to fetch changes up to 058387d9c6b70e225da82492e1e193635c3fac3f:

  arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5 (2024-12-17 11:03:22 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.13, please pull the following:

- Willow corrects the L2 cache line size on the Raspberry Pi 5 (2712) to
  the correct value of 64 bytes

----------------------------------------------------------------
Willow Cunningham (1):
      arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

