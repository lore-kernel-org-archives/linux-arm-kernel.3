Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A392C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AbLzH+MA3bJOt84nDVXTF5oPLCOKH82ypWIYuFzcxQk=; b=gxapG1SJUj3+7z1SAVUhxP25fC
	olfekaHLFMerfnpQoc9YVJKPu+przrJG/oCHxerXbEAa9BDc6RUP46XtbtDhhMzg2uNub68i0JiR4
	dSiQ4LTlOFMWU3VNuanl2uW4PI88yuPVaGlRnzTYlr1V3iWN85xwyEye1ARlJKMEvue41RMN4hQCP
	/LATxir/DXYqTZXfrTKKBRRPwuF+sgYmZ2oY066JW68udEXHrcN2NPPmroLPt9GoiK4ogP1hQX+Mz
	mCZX94VZSlZFUeM9AkAB8qSDETW1/MYKNDFdQStpbBm5q9p3spJe8vhjjJ+X0dSFCdXj2ZwICohAe
	6UvqU4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD2n-0000000BMtx-3V1U;
	Tue, 20 May 2025 02:49:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD0g-0000000BMXO-2xXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 02:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 093F743EFE;
	Tue, 20 May 2025 02:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0C4C4CEE4;
	Tue, 20 May 2025 02:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747709237;
	bh=bRSWeSF5IC9AgzEPcvUNyYRCBX/EO3Fvj60XVxbDLH0=;
	h=From:To:Cc:Subject:Date:From;
	b=u410h3WojVBxNfioA2Y9cSjgexGbulubu8V4lxWnMwUJHxpuyIQPl3zqv3Qt0OQpm
	 IrNPEMRPBi0ikIBIEHhTcKxT/RmIu3sQCnxI5Mu/hyMNHEpsc+nz2CoMKyrxglaQpI
	 AGEvUQ73IbkHs0o+jtLxtXfbIk0donxI7KUCZ6rcPhufPMz3If5X+2hUN4SMC3t70a
	 pOiN4UuX1f5CsUsNVDunM8p6f4tpfR/sVzY/mHT2eW+DzFWI7YLu56OBBjQYokeE5i
	 7Xcw7PHvttOFx7sevvHbgoL6FoH4FCO6g08SC8Jn6BWgKXuBWVJz3i9kl6HXWW/IA0
	 GYDnn0oHlXTAw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: [GIT PULL] More Arm32 DeviceTree updates for v6.16
Date: Mon, 19 May 2025 21:47:14 -0500
Message-ID: <20250520024716.39418-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_194718_764434_114A4FD4 
X-CRM114-Status: UNSURE (   7.80  )
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


The following changes since commit f2420037d90a8354594b3da541e19dcbb60c75e1:

  ARM: dts: qcom: apq8064: move replicator out of soc node (2025-05-13 17:00:59 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.16-2

for you to fetch changes up to b2c547cffe2f67e18a3a276905649cc95aa7f293:

  ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO (2025-05-17 17:32:35 -0500)

----------------------------------------------------------------
More Arm32 DeviceTree updates for v6.16

This adds missing LVDS clocks to APQ8064 display controller. The unused HDMI HPD
gpio on ifc6410 is dropped (chip uses pinmuxed hpd function).

Missing timer clocks are added to MSM8960 to address bindings warning.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      ARM: dts: qcom: apq8064: link LVDS clocks
      ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO

Rudraksha Gupta (1):
      ARM: dts: qcom-msm8960: add missing clocks to the timer node

 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts |  1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi        | 16 ++++++++++++----
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi        |  2 ++
 3 files changed, 14 insertions(+), 5 deletions(-)

