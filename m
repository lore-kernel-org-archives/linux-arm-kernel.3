Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D064DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2X4FVc7YuJpnGmwufUpw8DRAIguSnDRybiqMAEeL4ag=; b=hW32MOfQKEh0L/cw1DuEi4y5Cm
	9BcxTjcaIziHZpTKP33xxLfWlUBi299DpDEvoGjHHXl6S8V7BYJyOKGgsbGbj99lVaILmWYfoL2jn
	CzPOy1ALW7kENdJmV5ePW6naYicWPW7wdY0jvkbeNV3K5i7aYFIRQQUyOHfgp8IJmnYsQZD4icXno
	jk4fSmHye4bh7xOd5b8/CxDV5JiY8IiR3G/2r7ZdbUHu3J/w0LdDJ/oYVIaP8OiSENH8tfDEFEYbC
	2PLKkf05MDiV2LkdyzUGuaNobmfcor4BgsK2I2IRbjUAlEilvXTGUJQYCqbNZhd9uQX997Ce6/7lO
	RBe/kPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MTA-0000000E3Ku-3B5s;
	Mon, 13 Oct 2025 17:36:24 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MT4-0000000E3Gl-3NfV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 17:36:21 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 61E65C0000F8;
	Mon, 13 Oct 2025 10:36:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 61E65C0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1760376976;
	bh=M+0WBcWrM1Se9SPdQIxdBmXVcrgxDafQGrr/jA0njjo=;
	h=From:To:Cc:Subject:Date:From;
	b=MRYOw7AKsYSkW2ibWRnp74KN2xiP29bNZPLEMUUtf1ncxGwybpQ/pYHJ4sGUI00of
	 ox5SQohdBLCVSk833brhEuG2x914VmHX6EQ/h9FEisfOhWdhwMTV6HyDaYFXqk/VBc
	 z6rpruwcrtw+i5raHU63sxKUY/sSbGBFvcUM13aQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 07BD318000847;
	Mon, 13 Oct 2025 10:35:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Melissa Wen <mwen@igalia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree fixes for 6.18
Date: Mon, 13 Oct 2025 10:35:42 -0700
Message-ID: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_103618_909533_9B2A7327 
X-CRM114-Status: UNSURE (   8.39  )
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-fixes

for you to fetch changes up to 4adc20ba95d472a919f54d441663924e33c92279:

  ARM: dts: broadcom: rpi: Switch to V3D firmware clock (2025-10-13 10:31:25 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.18, please pull the following:

- Stefan switches the V3D block to use the firmware clock, rather than
  the bare metal clock. This fixes hangs on boot after recent changes to
  the V3D driver clocking went in.

----------------------------------------------------------------
Stefan Wahren (1):
      ARM: dts: broadcom: rpi: Switch to V3D firmware clock

 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        | 8 ++++++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi | 9 +++++++++
 2 files changed, 17 insertions(+)

