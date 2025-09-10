Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8625CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMvaBc5ILZosfLJz7QicffOYOUTv43DwFHq4WnxqVek=; b=UqzCQPf1LzHFLKsGRKu0rfMR0e
	ZXjn0uzT+5pro3a3q2o1U6+WQ2pvqK++RXy0v650yFf+QZ3K4/SAeAbDs7Wa1dPiJftQ063vuiAgg
	PDSovLi6vxekxwzkMegpo70/RjfG/wtYuBUl99Mr4BIdqSDZqY3HMseEQqWQH0AJVHw61CE9m1h8Q
	/+oJyoO+WyddRGTd4JZqKQPq5auAWqcs0UMtb6waLW4SfNJ7GfcK9BmqF4XF8L5q5JkPb+T58IiWr
	0u9gOjmqHcCB1Q15bCBTUy/4za+l3yz+H89d1JQeC4EP+7VwJW/CjPVabtEJSQoE8Wv1e84xZv+Wm
	HVuzZFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTY-0000000Fk4a-3Xrw;
	Wed, 10 Sep 2025 17:19:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTU-0000000Fk26-2YBy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 17:19:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8614DC00071A;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8614DC00071A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524753;
	bh=1KKi3rXfRkN4tFn8faiAwy2fTD+mprZhfMs4WO5qcjU=;
	h=From:To:Cc:Subject:Date:From;
	b=Agw8olj2W5WQDATnl2tQQtbJVRhV8xSHLywnJWXBE2Pcp6Ryti95SpBfD8/lFoKYG
	 85EdcnZvh0UtnSKcKBCqeg4vTed/vnqDU1YZcfG+zBMsLwd5Vo8a76AYz0xr4Vqi4g
	 uGIdPcJD6XWpu7GlPLJ/5rcWM4coLOQrw5cWZRPE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 672BB180004FC;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.18
Date: Wed, 10 Sep 2025 10:19:07 -0700
Message-ID: <20250910171910.666401-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_101916_663509_89CA3E2A 
X-CRM114-Status: UNSURE (   7.76  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64

for you to fetch changes up to 2182fe932dc83eabda207677d4babdd563ae89d6:

  arm64: defconfig: Enable BCM2712 on-chip pin controller driver (2025-09-04 14:01:10 -0700)

----------------------------------------------------------------
This pull request contains ARM64 defconfig changes for Broadcom SoCs,
please pull the following:

- Andrea enables the RP1 pinctrl driver which is necessary for the
  Raspberry Pi 5 systems

----------------------------------------------------------------
Andrea della Porta (1):
      arm64: defconfig: Enable BCM2712 on-chip pin controller driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

