Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F389C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuZ9uwQBeUF+b4hmsIGTGQY8EO1bupRCXIA6i0KS9io=; b=dDA7Iyxh0Z5X1jtVsTig/EyZqd
	ZQcBIVCOaRPj2KTtwT+xmUWJfpX8JEKbRsZipyGQyeCy6GAWgOhNt5UW0gX3URAhDb153MyMQYGSI
	lBIYFM9M1Z7TGo8mKT+/uSa92v/GVH3JKkVSlo7T2y4V/lkoG/r55uKHGNubOQQtLv5bRab1Q3ZIK
	sckFgzCB+d3bCYupTcxD8W3mwrQisXQ+LVJzCz8Xgw7UWyqAo+kG1/SQ2oPTbJnPvGPYQTv2t9M4X
	/jiKeylKOIWkZpU8TC8oMIYqnF2XmKbiF8f7vp6s7VXBEY8emRZuac1Jg16X0zd5G0ueiCKqzVy50
	47RlpVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigFO-000000065rY-1lPU;
	Wed, 21 Jan 2026 22:00:18 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigFL-000000065qq-1gGq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 22:00:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9CA78C00ED5B;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9CA78C00ED5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769032812;
	bh=g3/bxkBn8gvWh3KBWEL3vyNV4zkCOXwGakLVpiKenIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsqEx+YAl97+H87DVdetV7dTSaYhNc/xaSH8IJqLweQH/FFJpEjIPEv2PNzj+6vU2
	 BfP1i8zJoDMC6n/yislIa2f7YHYtWnoXc7TnYs/LYPMuya4mmYXrle233kN++CS1rL
	 GnQSZGuxRZqGtdRSMOlrINJcOh+Lp5e+jV0ONYzk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7C7FF1A187;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 6.20
Date: Wed, 21 Jan 2026 14:00:11 -0800
Message-ID: <20260121220011.1171930-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121220011.1171930-1-florian.fainelli@broadcom.com>
References: <20260121220011.1171930-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_140015_484514_4985C712 
X-CRM114-Status: GOOD (  10.38  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.20/devicetree-arm64

for you to fetch changes up to a95e1d848972dd7d5cbabd62921b9b85501d891e:

  arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop unnecessary "ranges" in partition node (2026-01-16 13:48:58 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs DT changes for
6.20, please pull the following:

- Peter enables the RNG on 2712 (Raspberry Pi 5)

- Stanimir adds the watchdog DT node on 2712

- Rob removes undocumneted nodes, reworks clock nodes, fixes the
  "simple-bus" node names, and cleans up additional properties and nodes
  for all Broadcom ARM64-based SoCs

----------------------------------------------------------------
Peter Robinson (1):
      arm64: dts: broadcom: bcm2712: Enable RNG

Rob Herring (Arm) (11):
      arm64: dts: broadcom: Remove unused and undocumented nodes
      arm64: dts: broadcom: stingray: Rework clock nodes
      arm64: dts: broadcom: stingray: Fix 'simple-bus' node names
      arm64: dts: broadcom: stingray: Move raid nodes out of bus
      arm64: dts: broadcom: Use preferred node names
      arm64: dts: broadcom: ns2-svk: Use non-deprecated at25 properties
      arm64: dts: broadcom: northstar2: Rework clock nodes
      arm64: dts: broadcom: northstar2: Drop unused and undocumented "brcm,pcie-ob-oarr-size" properties
      arm64: dts: broadcom: northstar2: Drop QSPI "clock-names"
      arm64: dts: broadcom: northstar2: Drop "arm,cci-400-pmu" fallback compatible
      arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop unnecessary "ranges" in partition node

Stanimir Varbanov (1):
      arm64: dts: broadcom: bcm2712: Add watchdog DT node

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 ++
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts |   3 -
 .../boot/dts/broadcom/northstar2/ns2-clock.dtsi    | 105 ------------
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |  26 +--
 .../arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |   2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  87 ++++++++--
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi |   2 +-
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi | 182 ---------------------
 .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   | 114 ++++++-------
 .../boot/dts/broadcom/stingray/stingray-pcie.dtsi  |   2 +-
 .../dts/broadcom/stingray/stingray-pinctrl.dtsi    |   2 +-
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  21 +--
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 148 +++++++++++++++--
 13 files changed, 290 insertions(+), 419 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi

