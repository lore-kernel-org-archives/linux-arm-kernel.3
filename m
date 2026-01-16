Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB34D4A5E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 01:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LkUWOWXKl9G8yXPR1eulHmtakm6kDYpJNDSloOeIcLo=; b=43wIcyet+awgpFyqVGHnXbWEzG
	SEWqQA2fSI29tSbFTdAJGKzBzuee2nc3xEdD+JakUBjmB0U/tqGhgsU4uG8tDFSo1JkdpMH0eFUzK
	pGr16oBqaqYDUwLGYCfuAw1x1ea6VudULiu/55XSMCaJdsp7rfnsONW9BzTzqAlnfuGL6+x9OcIu/
	3GG8MDhJc8jx8cXHZ7VJCXklud7iVak1DauXkvjW7vZ5BBIMdPAmFnZXF5hqjCg+wCxYXFYnmmmSv
	x05zVKe/Una3aitlexuoAcKqGGtDAs+cUF4UR+KDWPfoLjqBz/1dwzTecIGyf/NFB5+DrSmV7gYai
	9UGwbzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZ7T-0000000DRQG-1TBr;
	Fri, 16 Jan 2026 01:59:23 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZ7Q-0000000DRPv-3rMi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 01:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768528758;
	bh=LkUWOWXKl9G8yXPR1eulHmtakm6kDYpJNDSloOeIcLo=;
	h=Subject:From:To:Cc:Date;
	b=XX0w0J9deEUHlWxsecb8zMblx8zHhb6/mQaA0xISVC8twjMGp9EpkcE5Ha3fpLzux
	 ei6fWRYJbq+6tAt9zgT6Chx4xlOdd/zrhbQRMvsLeiZj8BorHO2o6WgpGWrKpaT+Lk
	 cDw91RM4RmATTAjlHp6TK8aazLsjiheDhbE8EIJwTKRb9NKjkci7bzkPJz8N/yxU+g
	 7paOXXPsnblM5+98R/lSa/XyallT62f4oH2LpXPSyM15s8BgaojSJENTF/JOmjubZB
	 IxYA78cBL5mzLCvMg0aLeU45/XMG/19I7XcPhHmXcDHwxynMh/Zqaosak20U1pwmoE
	 t1kUznqUKPE4A==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 78B6A64705;
	Fri, 16 Jan 2026 09:59:18 +0800 (AWST)
Message-ID: <c7002883dbeadf44069ef5e8cf573d9f2aefc899.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: second batch of arm devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 12:29:18 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_175921_182710_0AE00010 
X-CRM114-Status: UNSURE (   8.88  )
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

Hello SoC maintainers,

The following changes since commit 459a5aa171c0f13fcd78faa9594dc4aa5a95770b=
:

  ARM: dts: aspeed: bletchley: Fix ADC vref property names (2025-12-17 15:5=
3:31 +1030)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.20-devicetree-1

for you to fetch changes up to e600933b6e518397b3f256dddd233e5d8e6cff93:

  ARM: dts: aspeed: ibm: Use non-deprecated AT25 properties (2026-01-08 20:=
04:23 +1030)

----------------------------------------------------------------
aspeed: second batch of arm devicetree changes for 6.20

New platforms:

- Facebook Anacapa

  The Meta Anacapa BMC is the DC-SCM (Data Center Secure Control
  Module) controller for the Meta OCP Open Rack Wide (ORW) compute tray.
  This platform is a key component of the AMD Helios AI rack reference
  design system, designed for next-generation AI workloads.

  The BMC utilizes the Aspeed AST2600 SoC to manage the compute tray, which
  contains up to 4 AMD Instinct MI450 Series GPUs (connected via a Broadcom
  OCP NIC) and host CPUs. Its primary role is to provide essential system
  control, power sequencing, and telemetry reporting for the compute comple=
x
  via the OpenBMC software stack.

  For more detail on the AMD Helios reference design:

  https://www.amd.com/en/blogs/2025/amd-helios-ai-rack-built-on-metas-2025-=
ocp-design.html

- ASRock Rack ALTRAD8

  The ALTRAD8 BMC is an Aspeed AST2500-based BMC for the ASRock Rack
  ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards.

Significant changes:

- Switch IBM FSI CFAM nodes to use non-deprecated AT25 properties

Updated platforms:

- bletchley (Facebook): USB-C tweaks

----------------------------------------------------------------
Cosmo Chou (1):
      ARM: dts: aspeed: bletchley: Remove try-power-role from connectors

Peter Shen (2):
      dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
      ARM: dts: aspeed: Add Facebook Anacapa platform

Rebecca Cran (2):
      dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
      ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

Rob Herring (Arm) (1):
      ARM: dts: aspeed: ibm: Use non-deprecated AT25 properties

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml   |    2 +
 arch/arm/boot/dts/aspeed/Makefile                          |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts     |  637 ++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts   | 1045 ++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts |    6 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts        |  128 ++++++--=
----
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi             |   64 +++---
 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi             |   64 +++---
 8 files changed, 1814 insertions(+), 134 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dt=
s


