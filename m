Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B31BD64060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 23:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0oWJ4kzilKgdCadVuGU9+9B7eF6qf+zm4xOALLPoLMA=; b=OPd8AU9vlzUFeIRVWWUJuy4+Ut
	PuIYS9OkW+07Huwtoe+cfLYYSjTTZPH1uarbAA2It1OyChIQtmW8O8s615314SwVRM0qOFelzbWe+
	zW8lIeywqizlhm15XmMjirhDagA78xyeRmbs0qNTZpZ8uhw5GxjX1bSjlR1B+UXx/oykVGi6GC5uU
	25JKWYJKlocScLwf6UWiV1qL5dSBRal1zRb1je0NoxxjmgJhm6OEBTzWDRgjJUKOEUWWowpwOBMWF
	x5NvIxDZSz3FySUNTlP7XBBQV0lgpz2Gki9wMzj29Z8RvfxBJk4DlU37i5qgRiXk3VWp4r2h4WX0y
	YfI/gS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVeuY-00000005xqQ-102N;
	Tue, 16 Dec 2025 23:56:58 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVeuV-00000005xq1-0bZB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 23:56:56 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1D2E7C001515;
	Tue, 16 Dec 2025 15:56:52 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1D2E7C001515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1765929412;
	bh=+GhQz0HcVABtkaWXGXcZPptUFJwcu/sMoBufxXOMtLk=;
	h=From:To:Cc:Subject:Date:From;
	b=B/8glXIdreocIh9Ji/XcZTn4guKqcoQlJOjx5X/VT/Jy4zAggtsqZmsvG3w5EUdvI
	 eAqU0pByVfzVbYn6SLe26kBUJTVLft07pyzh7+dhYBvEuM80mWX1yTtFYEUCt4yntp
	 fGI6Iiic5vp7SL/0uGAc066KFGeJOTn5spaZ1itc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B6DB218000520;
	Tue, 16 Dec 2025 15:56:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 changes for 6.19
Date: Tue, 16 Dec 2025 15:56:49 -0800
Message-ID: <20251216235649.633331-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_155655_318952_9501CBCA 
X-CRM114-Status: UNSURE (   6.56  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64

for you to fetch changes up to 37c3a91e9730e274fe2eca9703033ae0f154cb62:

  arm64: dts: broadcom: bcm2712: Add watchdog DT node (2025-11-05 10:28:29 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tre updates
for 6.19, please pull the following:

- Peter enables the random number generator on BCM2712

- Stanimir adds the watchdog Device Tree node for BCM2712

----------------------------------------------------------------
Peter Robinson (1):
      arm64: dts: broadcom: bcm2712: Enable RNG

Stanimir Varbanov (1):
      arm64: dts: broadcom: bcm2712: Add watchdog DT node

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

