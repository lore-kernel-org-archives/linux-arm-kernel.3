Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5CCCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D4H+JnTZW6KO04WWEAQxwl+7TOTxRSkwLBTB8ksO/ts=; b=QtsD08RCpMuj3ytxwWNFQfKbWT
	pZ+46rSud7ar5w5J9EYO8dcU5JiVSvRZkftQUXUsUjmvdBH1j0/eAutOjDYSQg8aARvrrAqIWvigG
	1ANjmla8NyCejVJXulbzMiqkoH4Zi+B4qLr5ayvTad3alTsu0Y2GURnBPu4vGSzkAet0PEEJZry/L
	8yYbAUx/iAs9yWV7hzDnSPa1V9M0SH4nMlhIRlQSWZD5yjuoVUD0i3NWIHSZaRpyJ+SCuj40AUKw9
	BRZgRnkKX/mziqhYvRbmpEI18IGammD85dMISP8jp6pgTG5qdqktnlhEiZXuirhuxVk3+YR5IUbGu
	RSg4TnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Gn-0000000BmBE-2fSC;
	Mon, 01 Jun 2026 20:29:57 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9Gk-0000000BmA0-18rS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:29:56 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3982BC0000E3;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3982BC0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1780345791;
	bh=G4oU62CUQadvll5EAWMjruuePvHqhrGR1ahicdrQqRY=;
	h=From:To:Cc:Subject:Date:From;
	b=n6llIeD1cKjfF70q91nbAZYrPBtGiVYT3KNpDGE/h5YXoafjNNfXQxG7N5Jte4u4N
	 a4UkGCByYrXtv0bsECZKdiUAK7khA+g7ogoY0jcwDjelLv3y3gU3ypMM4bqthAD/so
	 tZBHOpHBBpaGzlg6hZHj1PWD9NIsGIVUqD6oQ/Go=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1EDD3AAB;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Jinseok Kim <always.starving0@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 7.2
Date: Mon,  1 Jun 2026 13:29:44 -0700
Message-ID: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_132954_360785_E947B962 
X-CRM114-Status: UNSURE (   9.69  )
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree

for you to fetch changes up to 245552af869d35ae27cac2121696dd630f15b3bf:

  arm: dts: bcm2711: Fix typo in gpio-line-names (2026-05-29 11:13:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 7.2, please pull the following:

- Rosen moves the Meraki MX6X pinctrl configuration to the PWM node
  where it belongs, also fixes the USB3 GPIO for the R6300v2 and
  EA6500v2 routers

- Jinseok fixes a gpio label for the bcm2711 systems (Raspberry Pi 4)

----------------------------------------------------------------
Jinseok Kim (1):
      arm: dts: bcm2711: Fix typo in gpio-line-names

Rosen Penev (3):
      ARM: dts: NSP: Move MX6X pinctrl config to PWM node
      ARM: dts: BCM5301X: R6300v2: fix USB3
      ARM: dts: BCM5301X: EA6500v2: fix USB3

 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts               | 2 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts            | 2 +-
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts     | 4 ++++
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts      | 4 ++++
 arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi | 6 +++---
 5 files changed, 13 insertions(+), 5 deletions(-)

