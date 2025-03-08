Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480D4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cIkpMMOrooRfoB89nv81A52fCW7P0hiA+4NtK19/7lM=; b=lI4wJ9lxcqng4ckgZvU417TDZx
	6e34BLAR/jIC8vtiUNIMNUP4hTdqlBMOL6l/fLJBf9oqwZ+y56c/kI8qnkt/hUPYssRx141i24rdr
	4C23wRZgKlqs6fIlJ6Y5w7OQ+MnkXSOFMTJjK/WsGTn/6HpDIoQu+Pl6GItbrHSpbrY12RH0jzP8E
	2z7S9tWlbe9qIh9T8jHY9y9j0DQBuCmNYeCMAZIDy4BtC3AhVdqNs2OA58fbqkyQROHmXig2NmBam
	UgwgmwP67AKH/U9JSy84dNJyNQg4sVBN0jCxZPGw8qmkE6AHRYVxOTNZsx2qfXCi+C+eBp7hkmYj5
	iIIlRmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvlj-0000000Gljj-31BF;
	Sat, 08 Mar 2025 15:07:15 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvk6-0000000GlZI-1em1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:05:35 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 27291C003DF1;
	Sat,  8 Mar 2025 07:05:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 27291C003DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1741446332;
	bh=B+Gq/2+MF8fl1OnIPd3GKAn4DQ0rzPiBBwdtmpyDsZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=mwnpKLxAzG+nX2ywY5/RN0cXhYU2n/mAakXUwREpQhtOO4mckC+JqV2hFvwAgL/li
	 fqzRpzVLktbEljWVbQabIcZfnXJ5rovgX9XO8njs8j1C/hLkFeRk6pUOXwrg0Sg6Gb
	 mKpWh/2dmiU7YKdKpRa+qpP8ezh50grhoUj+QRdw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B64D61800051A;
	Sat,  8 Mar 2025 07:05:31 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Tom Brautaset <tbrautaset@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree fixes for 6.14 part 2
Date: Sat,  8 Mar 2025 07:05:28 -0800
Message-ID: <20250308150528.1900822-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_070534_541575_47ADC6D0 
X-CRM114-Status: UNSURE (   8.52  )
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

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-fixes-part2

for you to fetch changes up to 24d4c56dd68906bf55ff8fc2e2d36760f97dce5f:

  ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC3200 (2025-03-08 07:03:46 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.14, please pull the following:

- Chester fixes the switch port assignments on the ASUS RT-AC3200 and
  RT-AC5300 routers

- Phil removes a Device Tree property flagging the BCM2711 ARM timers as
  not being configured which would have prevented the use of vDSO on the
  Pi 4 running a 32-bit kernel

----------------------------------------------------------------
Chester A. Unal (2):
      ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC5300
      ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC3200

Phil Elwell (1):
      ARM: dts: bcm2711: Don't mark timer regs unconfigured

 arch/arm/boot/dts/broadcom/bcm2711.dtsi                | 2 --
 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts  | 8 ++++----
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts | 8 ++++----
 3 files changed, 8 insertions(+), 10 deletions(-)

