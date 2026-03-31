Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4568E1061B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 02:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L28nwQynjGUAAoLskRvsaIHr1lL5JbX3eN1nG4P8m2k=; b=hoRtgPptzNWCGRV+TGEb/sLIde
	/vDmX4H7a7uRgq1p2fBop/jgpUu8975Ay7Ak0OFGHgLWurQbc+ntL1S+bGrFykQturPjclSIkIEkr
	bOUEh+ixaaTZHFfnBhDwrWGbit0ziF/ErYpDeEvoulMujo1HIjF39ZmUzvAVh5zv+wuEIH3BVPLQY
	n088SKO76cSj3+hKn26Ea8GzJrwjNmg9TnQ4xdCeknPOttMQ4Hwx1O4YvTI4Myx6Pk37BFt1trCS1
	tlknMOtp1H6mF0nmh7hORX90KEOD3Qzj5OhLQ8mH9tNQ9aPUQTKV1E+hyHGI67TxlKaspLtEbzAwF
	g7Y1xMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Oxs-0000000CBoe-2AYX;
	Tue, 31 Mar 2026 02:36:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Oxq-0000000CBoV-3BT6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 02:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3D396001A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3677CC4CEF7;
	Tue, 31 Mar 2026 02:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774924581;
	bh=ay7yo9lrEKKlSLW7472SnaQqrDPRw0aD215tIRQQEF4=;
	h=From:To:Cc:Subject:Date:From;
	b=Cki6ikCC42aDEsIaizE+ooo0bU8J568itU2yT+vWvJZUDd1/D8rxJqWpYR59WbxH8
	 YPrH1m1DaNsVRyM6C+oUSrCleg+0ZSXvjWRYyTF9o8b5Bp6CG8E+LJk9RoaJPctl9V
	 +FYbmZIM4JlDvT5r2TbTQFm5CQ24978myxHuvHEeRSdUia00saI1EOt+VixS11dvT8
	 V75l67M2LnThSeAiMRCQdvFzf2EwcRKA7sApzgW3NF7kEu+neBxNKeplaMhna0n60R
	 QvobH15rnFn3q16nLrjjVNOoJLkqpicldHzwa2+2Qispd1CGZZENKZfnGTSSTEH6fG
	 XgfjW9Swkga9w==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.1, version 2
Date: Mon, 30 Mar 2026 21:36:18 -0500
Message-ID: <20260331023618.258887-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Change from v1:
- Correct the commit message in commit "dt-bindings: intel: Add Agilex5
SoCFPGA modular board"
- Used b4 to apply patch

Thanks,
Dinh

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_updates_for_v7.1_v2

for you to fetch changes up to 625af11fb9885f202e028ea5afa0037f3014e376:

  arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts (2026-03-30 21:27:28 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.1
- dt-bindings updates:
	- Document fallback compatible for Stratix10 SoCDK eMMC board
	- Document compatible for the Agilex5 SoCFPGA modular board

- Add emmc support for the Stratix10
- Drop CPU masks from the GICv3 PPI interrupts for Agilex5

----------------------------------------------------------------
Dinh Nguyen (1):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board

Geert Uytterhoeven (1):
      arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts

Ng Tze Yee (2):
      dt-bindings: altera: Add fallback compatible for Stratix 10 SoCDK eMMC variant
      arm64: dts: socfpga: stratix10: Add emmc support

 Documentation/devicetree/bindings/arm/altera.yaml  |  7 ++
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 67 +-----------------
 .../boot/dts/altera/socfpga_stratix10_socdk.dtsi   | 71 +++++++++++++++++++
 .../dts/altera/socfpga_stratix10_socdk_emmc.dts    | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  8 +--
 6 files changed, 166 insertions(+), 69 deletions(-)
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts

