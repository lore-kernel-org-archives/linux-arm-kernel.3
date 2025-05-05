Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C51C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwKVGluI6Z1XTNMcl7UtpPbNlQRuCgs7pkbLH/tjS8k=; b=iPCaTKNXwuylN/9Qp04p/ElPSd
	8efoQNpK9fpDeps5tD/YyGWlIgMOt5Xo71f2JOuxIs16hFJHC1TKgcVRo7DCKOvtMQGnQBsTEglA4
	rcwNoLnqio0gYEGz2msULISrTCxW2v1ATjePXltiiCY1vO0/MVkEEDg25cL9STf5P5JSEyVOywU6Y
	UF38+PSETaSBZku7twA1ezHDDO0fgwSpyeIlitgq8NATaMexwUXy7NxLFjk4qlWT8pgWRm2R9M72/
	odmjHZj0E8OJuz2mBjP7ylfG6tPNWkcTjcgXY5uhT4NqTN9t8YSZF1AYopXF+SibWG8ShHUtm0aqa
	MQS9v0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzXF-000000088Lx-2DVL;
	Mon, 05 May 2025 17:23:21 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz8x-000000084fP-0C4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:58:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 71380C0005DD;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 71380C0005DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746464292;
	bh=sTUeceWJnk252WaHsNSVB6NIhfPcsKmY74JxFMSgfD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnwi+q7pSrmquR+KOvetVtMzYCrQaZ+bO3Ux37FyOtQGLE7wXtJvSE2kIefAfSFMM
	 1kfVBkNMMgQvZztKHUv5cPccoKL1kbqGYWk0do1On4DEWF9ugexgvtT4p05NLQrJqI
	 mD0RIDfponG+qu1oF2IVwvYwzLz6pDxhdzCLcZuM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 257D318000A4A;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 6.16
Date: Mon,  5 May 2025 09:58:10 -0700
Message-ID: <20250505165810.1948927-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
References: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_095815_174706_D29C6EA1 
X-CRM114-Status: UNSURE (   9.06  )
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/drivers

for you to fetch changes up to 29f526ed681551e20928169ecfde5a576e20b900:

  bus: brcmstb_gisb: use dev_groups to register attribute groups (2025-04-07 10:35:43 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC driver updates for 6.16, please
pull the following:

- Ovidiu updates the brcmstb_gisb driver to use the dev_groups instead
  of manually adding those

----------------------------------------------------------------
Ovidiu Panait (1):
      bus: brcmstb_gisb: use dev_groups to register attribute groups

 drivers/bus/brcmstb_gisb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

