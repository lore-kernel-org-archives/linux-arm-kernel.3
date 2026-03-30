Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79B310D14A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ASEifMOFUVZYfXc+vkjj1DDYY78/egy6FfruqDOAuzs=; b=Cl/QOlnrlwbN7wctReN7Pdhp81
	vDBVS4TblcKeRyx7wbMcSELMdkm8a2j57imJ1SVBbv8Z0xtq/dZXTkxZD43yFxx8FddMgxOF5D42n
	ilMxSicC/E7VN8ghXSnHe+DOFITeiedWohJ9CgIZRdm9RCV05T9Ro4j9MDYPBjapiNGbxChwsMCoF
	D3XynjRDgv71L3I16iIQu4/UU9oSPUC5PykFhdBxldmyqpKRpEnX+C5j0kZuiOBo5MaZETWWTWhB8
	KWnpE/osTNHj3T3vuDUDG1Qerr5BuYaok31RJ3FyZkdBaig81oW4ZP/5sxqxfBXlAsQ1c/c5t95WF
	w/8N031A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AnZ-0000000BADg-01yt;
	Mon, 30 Mar 2026 11:28:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AnX-0000000BADY-41Qs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14E6A600CB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAF6C4CEF7;
	Mon, 30 Mar 2026 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774870126;
	bh=/kIe06bQ1ZqdXxCqLUyAT+Aw6K5Z0TFaajwnV5ej9X4=;
	h=From:To:Cc:Subject:Date:From;
	b=eQyvAvve9HFbrQsXGQxGSG6EM+gbhlTHeZT76QlEzJZrdjr8+w9z9oiGe5kN55Csv
	 t/OXGvNeAc5vAWQ8Q9BiipvxAbdzHgLQoEtXyIP4NOSU25u4AGQxHVBD3qoFM3G2v3
	 zQKW+Jp92QfqYLe4hQhWXqDnOFQeh3NFbUL/WzlwBZefNiBOB/Y6ohwYezg5wC0t6r
	 TIndDZc4UaOr1NjSV5DuNwSLjkDtKXy2widMLlaMk229wZuHz4qZh6sFpJwYooNf5i
	 hsF7h78jBUENKLs1IjFZo/OLP/GgdQwFQWVGFKVYgX3VjrzGfMHfCm2ScVA4AKbsFv
	 GrMZRdwgGzGJA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.1
Date: Mon, 30 Mar 2026 06:28:44 -0500
Message-ID: <20260330112844.240664-1-dinguyen@kernel.org>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_updates_for_v7.1

for you to fetch changes up to 9d29bcefcdbec4498fe0539e6d8a4e7962d92489:

  arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts (2026-03-10 21:10:05 -0500)

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

