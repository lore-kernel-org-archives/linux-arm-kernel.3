Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549F1C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9lLf0y959h2WWLbHfr5C24AnRQHGQvqNzJlvXw42mcQ=; b=2jGLt9S/zpn0iPq1yw8nRnNRwD
	p7D9zzMYw8kNW/FYJPBmmY7QGmQs0UspR3rUd6nw0LaJxaPVKgbp253IpJs0yhZg9mnntQ9kQUcKn
	b0BZINJXSz9iJjHymH/yYLf/F9MkLg5DuWAPr9ctBEocqk0C+daYohas9x5CxP1Y+9i/OD51TuDsZ
	5JpQHueJo+J6Ig+iyjaP1W6DGgLupB6UNjGspum8SVjfpYBxMIzF+QL6SH91tP6NJ4nfl7laDC+7y
	dL8RK10lOpgnptJlBUs0japNFx0cRTmuldiRd6MLaKPoK2guZaH2fefNzylg/b/hMeM5KJKalVgLb
	CX/hX3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRgD-00000003oMc-2UzY;
	Mon, 27 Jul 2026 20:12:05 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRgA-00000003oM6-3Wx3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:12:04 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 07599C0000DE;
	Mon, 27 Jul 2026 13:12:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 07599C0000DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785183122;
	bh=295z87T5W5iAPJSlT45FNq0uBFxv0oR5n5BJAPMJMOY=;
	h=From:To:Cc:Subject:Date:From;
	b=vUIzpQv1gLqMOnse3MjN+JcyiXKyLQIEqvn1TRxYOWbJwinpnqfSSPiUjkDP2rx20
	 HuDZp3/SKX+s1lCKsjILLhUbH+CpsXABwtNB3FZS7NBwkYv+wRTDhosEE+4dXI/oBf
	 ZOG84YIWbxrSMv5g50Qe05U8oKDHAOCKXdHh+Y84=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E1567ACC;
	Mon, 27 Jul 2026 13:12:01 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree fixes for 7.2
Date: Mon, 27 Jul 2026 13:12:00 -0700
Message-ID: <20260727201200.2441827-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_131202_957462_0FE27F54 
X-CRM114-Status: UNSURE (   8.82  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-fixes

for you to fetch changes up to 5916638dab4de7dd062234eef2ed66447224fc67:

  ARM: dts: BCM5301X: EA9200: fix NVRAM size (2026-07-27 09:58:55 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
7.2, please pull the following:

- Rosen fixes the Linksys EA9200 NVRAM DT size, the 2nd PCIe controller
  interrupt that was duplicated, and finally removes incorrect PCIe DT
  nodes 'ranges' properties breaking PCIe

----------------------------------------------------------------
Rosen Penev (3):
      ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
      ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
      ARM: dts: BCM5301X: EA9200: fix NVRAM size

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi                | 7 ++-----
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

