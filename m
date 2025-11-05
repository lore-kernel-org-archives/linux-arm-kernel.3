Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33733CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qxp96h2I6kX3Mja03vnTA19BKV8e6QrKGlO1/Ok+vOI=; b=B98eM6AiN3HQxJ/Da8hl5Zmpnk
	BU6jqKBlpICFlhN55BeIaO+DPihopl4lLpUwawBR9g+RkmexLFE8Moqzewi/We+XjYaJECteDbJPX
	BrvbfKwJgps33OotBYjAEEXCfnm/sQjUYmGdm1dz1Z4fdqLeavNU3zNMA1AtHKLTz8T+jccigGgwi
	HeRVzXFsNnA2mxfrHVIrs4pGkX8NriGDVEdceMIDfF6J6uTyzW44HZmVWyvSaADkQcbWvQdqr220s
	0Ft1+Wu6vD4y3vh/6d7HLcTC+XECAGqFwf0jOWxhtiGpAnon5xYMwSKdJOQLJOBEPmiSbR9naBTwt
	jSiJjSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGiId-0000000EF5d-2Qyz;
	Wed, 05 Nov 2025 18:32:03 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGiIa-0000000EF56-15aE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 18:32:01 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E7D91C0005E6;
	Wed,  5 Nov 2025 10:31:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E7D91C0005E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1762367518;
	bh=euyM+3gDdbJVoDyKJqxz5X77e6ESc9izIMr3hTGFNAo=;
	h=From:To:Cc:Subject:Date:From;
	b=F6DK0h1tIEFarpFGuFs9seiLVL0OlWqf7UpgGYP7BsuNeo3U7URUMwWt3VMboemHx
	 do3FdwovimTxK0KoUslusORpyELH/yRQKWmXHSEf04W94sKcWUpUl9TsrflZI5ppbK
	 844F5uV89ai9+rogj/0MqKWJNyTpmhm1mzqjgzT4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 90F9818000530;
	Wed,  5 Nov 2025 10:31:27 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
Date: Wed,  5 Nov 2025 10:31:25 -0800
Message-ID: <20251105183126.3923882-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_103200_414561_6B98BD93 
X-CRM114-Status: UNSURE (   6.81  )
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

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64-fixes-v2

for you to fetch changes up to 5e44c5a2cc84bed6b92cdfd9c567fcdb9f792604:

  arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias (2025-11-05 10:28:16 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.18, please pull the following:

- Andrea assigns clocks rates for the Ethernet controller for the
  Raspberry Pi 5 systems

- Laurent adds an ethernet0 alias to allow client programs consuming
  that alias to populate the correct Ethernet address for the Raspberry
  Pi 5 systems

----------------------------------------------------------------
Andrea della Porta (1):
      arm64: dts: broadcom: Assign clock rates in eth node for RPi5

Laurent Pinchart (1):
      arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias

 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

