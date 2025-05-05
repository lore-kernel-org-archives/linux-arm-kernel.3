Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E5C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIMKXq0A8VI54WdAzc8G/zM+C2hDegunhDYIm9E31n4=; b=T2rhp6dXURDCD621NKX/x7Ur6O
	evb4ZLH/3NOrweAhWqkoGqTxqznVbIoEsmSWcBMrAhVA4wGFdh6/A4jsocolvx/FCadN1Lo2lg1Za
	KW3U++V/n6FjH94eBYw5hcM+sz6ZZL0Fyz04H7HUiZX+hlxMjMSBH9TXTCLRTngkdhnZ2RE+OcCpP
	9NQWIchxZsGuWZf465TV6JzeiQ8WPKTR1crNqbCPfgcaqEMvT2PNy0euRqftibuegXyH8PmN4c0dm
	yJEuaRYxXCMKuT/P4PzFZ1vtAzmpZ+g4n9ImQ/kvCF3oDNOOlWeduBg2xdy7T2g23CXfmyfE/cDKS
	LWq9us6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzVI-0000000886l-3Lrx;
	Mon, 05 May 2025 17:21:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz8x-000000084fQ-0C0C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:58:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 52E53C0042FD;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 52E53C0042FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746464292;
	bh=r8I8dxX64lKddPXDq8tyZRhDh3NOo88oDYad4mGy5sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fw76ZqY30z3N9stYbx9mRU7xlNZJB0drVVyLGKcw0GO79eZ4foGBynWajay/5+m4O
	 u1bbf0fQ81d8iX+/F6W59T86PZbgEMVBjsxXT4VLdfuA/CScKTNcTzrPrYSrWhWRcE
	 tunXL4oZjfWQqACUr1oLYkwV1xySs/WHeK+Ig3FM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 040A4180008FB;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 6.16
Date: Mon,  5 May 2025 09:58:09 -0700
Message-ID: <20250505165810.1948927-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
References: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_095815_174637_23EB195D 
X-CRM114-Status: UNSURE (   8.84  )
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree-arm64

for you to fetch changes up to c9e81198a750870fcd806b853177108e982a1db6:

  arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node names (2025-04-11 16:35:45 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.16, please pull the following:

- Stanimir adds and enables the PCIe root complex Device Tree nodes present on the
  Raspberry Pi 5

- Rob updates the BCM2712 L2 cache node names to use a more comforming
  name

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node names

Stanimir Varbanov (2):
      arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
      arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes

 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |   8 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi        | 155 ++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 4 deletions(-)

