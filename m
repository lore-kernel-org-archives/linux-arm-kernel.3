Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE4FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9+2uHjqNkOsWfa/jCLnVaCUKLoFm8UFqnmjCjFnBPs=; b=b12MDoqsp+MnXNibB8xljeG/Uz
	foSfcdzPnP9NUemt/JD+7PSSWPt0zLvLX/3tp8wZRaDpOyhC1zWsNFKm4MaSL6U8XuWTfBSSdSRl4
	4Bq6iLPgAdvb1HDwrab7HH+Hxg/wyOLLG/KikVaDk+lhLgPDASMqeVlpYdvNNajs9hA/XE/EWuO+J
	Z28WHS/6G7b+M/CqjXCegPn8YDU27Mxz2ZZHXFeEvPcZ9a2Q8SedXPskj2bI++B52ILhCn/+W8Cr8
	Y6bRFPX8mn07p5nK7yBo8vd7Vw9y8LfjdiYtwg0ozwVvH9Lo/d97jDXnoTgvV1ST9rcLmdqoTbrSM
	eSA9QgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1ea-00000001OIs-48dX;
	Tue, 25 Feb 2025 20:35:45 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0nM-00000001CSW-20Ph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:40:45 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8F29DC00153F;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8F29DC00153F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1740512443;
	bh=BtV/pAFsj+a8ILX/07KQdzLB7WNhO9wFph0/Tlu4Wog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byFWq+3qGRm/gPwqpnND++U9eyI+MxOG+TGPTGAj0SP8vas8Yq2HQYYnLEiQtuL4E
	 JMwEd9ep6lgK7HY3p2ywiOI3rPYuwR14q/ufnF1hGnOHlQivic11K/XYsjHbQ8hZLf
	 fG/iq1JyILKonXw7FQW+uE6LV8dALO26uBoD9f9I=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 3FE8718041CCB9;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 fixes for 6.14
Date: Tue, 25 Feb 2025 11:40:41 -0800
Message-ID: <20250225194041.1063762-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
References: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114044_590960_2C72490C 
X-CRM114-Status: GOOD (  10.48  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-arm64-fixes

for you to fetch changes up to 768953614c1c13fdf771be5742f1be573eea8fa4:

  arm64: dts: bcm2712: PL011 UARTs are actually r1p5 (2025-02-25 11:23:49 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.14, please pull the following:

- Phil fixes the Raspberry Pi 5 PL011 UART primecell ID to indicate it
  is r1p5 and thus has a 32-byte FIFO

----------------------------------------------------------------
Phil Elwell (1):
      arm64: dts: bcm2712: PL011 UARTs are actually r1p5

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

