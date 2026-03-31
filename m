Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC3A10F9303
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 21:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQ3SaH4J67B9h2NCOtZ43yq5sIdxKCAkxJ5TjrHOuhY=; b=dP5uIpZyJoXawEvQqe0sgfTTpG
	uzlUJmhU1O0ZIRrUZ7o6jvy3AjXYfFIUIo3Db5YjMuDM9oKvEq24oAseVwqzeBqRZkWlpf6sdF4/6
	C2QWBYMPifH+gDhyMFQDKQhFYWB4Hoa4yDwGPjcn5qIeK9atHrPDnggJBNUfHhKF17TuOh1jYiQda
	2hAdZ9DZQO5/0vocF7PDyw3W3e944owu/uIA/w/Sl3AcUe173HiCwbwsxhWqQQuvokPV9UqNa3X3V
	FELgbWfaln0xX6AOk1ta0T+9tammocaAegqCNmzeOtBsy37jU8rKH6wtH4oVk3TmLOFn6ZW9gJu7S
	Vv4oI7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gRT-0000000DZBD-2WJE;
	Tue, 31 Mar 2026 21:16:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gRS-0000000DZB2-3Sxl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 21:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E019A60126;
	Tue, 31 Mar 2026 21:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA640C19423;
	Tue, 31 Mar 2026 21:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774991765;
	bh=/Zuj465z+SJXeuy8BFVva/2T89KUCArNO4FegDfx9oE=;
	h=From:To:Cc:Subject:Date:From;
	b=o3gTmA2S/CH8s2brCacnXtwcIc8+v4oRzecEPqcJ874UO+DZ+POF0HD8aLSYjkAr+
	 9rTKEPtsuxZNGQlLxfeqaDwJFHxcaiqwJjE4/M6EPDgeAOsoixISqzgNaDAe7rGmdr
	 KWXpo7IWoN8CFpQJmNnXR0fcrdDbCdUX0pwfenarZ2z5NkZC2sPVriHVQjXEIPuuZ0
	 V84O2UD1pGTuWB3nek/enBCN613qa4csw1lkt7n/D51nIATeFh3tZmGldpNxJ5quXo
	 +agOcmOyrLfMB/pS8hE9l11Fdc0XI363OY8VCR5WCYNdvUhK5MwdFpDRj67GyEbUaX
	 0yl6OnKwtWdDA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.1
Date: Tue, 31 Mar 2026 16:16:02 -0500
Message-ID: <20260331211602.959960-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.1

for you to fetch changes up to 6453ad0865b68ab0de5873c1a8bb4addbbde5c19:

  ARM: dts: qcom: msm8974: Drop RPM bus clocks (2026-03-31 15:59:12 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.1

Qualcomm APQ8084 is incomplete and hasn't seen functional contributions
since 2016, so drop the platform (for now?). Also drop a number of
unused IPQ-related dtsi files.

Lastly clean up the RPM bus clocks in MSM8974 interconnect nodes.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      ARM: dts: qcom: drop apq8084 support
      ARM: dts: qcom: msm8974: Drop RPM bus clocks

Rob Herring (Arm) (1):
      ARM: dts: qcom: Drop unused .dtsi

 arch/arm/boot/dts/qcom/Makefile                    |   2 -
 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts    |  34 -
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts        |  23 -
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           | 852 ---------------------
 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi    |  37 -
 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi           |   8 -
 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi    |  37 -
 .../boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    |  37 -
 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi    |  37 -
 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi           |   8 -
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  21 +-
 11 files changed, 3 insertions(+), 1093 deletions(-)
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi

