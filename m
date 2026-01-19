Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD3CD29C40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrJaAS7JYhJJZyrtboMuvbqpVPXR+ByMpoxMkZiSUSo=; b=RxfgiYUy/kiBG1EVXuPGLtVI9w
	uUat+oU8UknAKHdvgngkvivaMSIcTgHel2CGDlgkAJboQkT8dOSae+6fIojh91M2Rs5K+oqvw4X4c
	Gjl5Ctq7RRZSG1YfQqKLor1ih5Zn6RiE2DalS4cXkbiM7kJ42ErEJQbx/bfOpuGeMW5GWv61F0hXO
	9rkYr7QspLs2umdejL6oWIG+NSX7G5Vnn3Lp2T5eFvPSZvEUM4sJn7pIDOXL4Y0QIh2LqJxfdIzT2
	6JK77LkL0zEqpPe8HrCV29Q1a1KRbuA3eiqFBx3qA5YMX9hHWHLz07uyBZ0l2ZvjDnTLecfmpBTGF
	hOLHtvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrhw-00000002PXZ-0roz;
	Mon, 19 Jan 2026 16:02:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhreb-00000002PIy-2YRt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6179D40558;
	Mon, 19 Jan 2026 15:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AC9C116C6;
	Mon, 19 Jan 2026 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838336;
	bh=rTjfClrdU+ZLWQCk1mfy8UYKSZu1dS+xZzI6sXKASqI=;
	h=From:To:Cc:Subject:Date:From;
	b=ivmpN5Bo+s8AMNlXQ+DcLUBz88kVKGUMWfQ9W9flczIIdy+/qh7wKJ8bY7Gj0Ycry
	 3MuCs8TGjuJfLZ6xlSE5VSoxhMLSYBXiW+CfXRHyKtu5enghKK/NnQ/WNOe7iBVpyA
	 MDCk4ufY964HCnKuSj/8LBGw7SbGoz8R2CaZ1O+h82IzJps1ruNsj5SE2Pa1ZKhawS
	 GeUYVkRuVCLLziXV9RbLbaVLRzbUAgiXlE0ZRbqQJ5LLY/X8uB1eS4qwxTohhMhYSo
	 dLyC/7/9xsge5b4FLD9c4Izbroadk0RCwOZkgTXsg30P1NW3UQrEOMLSWF6TlCbSz/
	 otJW5Lr0+8f7w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.19
Date: Mon, 19 Jan 2026 09:58:54 -0600
Message-ID: <20260119155854.839183-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_075857_667355_0794641F 
X-CRM114-Status: UNSURE (   8.92  )
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


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.19

for you to fetch changes up to 1f6ca557088eb96c8c554f853eb7c60862f8a0a8:

  arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node (2025-12-16 15:24:10 -0800)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.19

Add missing power-domains to the SC8280XP RPM power-domain and ensure
these are voted for from the remoteproc instances while powering them
up.

Clear a couple of DeviceTree validation warnings in SM8550 and SM8650
USB controller nodes.

Specify the correct display panel on the OnePlus 6.

Correct the UFS clock mapping on Talos, to ensure UFS is properly
clocked.

Add Abel's old emails address to .mailmap.

----------------------------------------------------------------
Abel Vesa (1):
      mailmap: Update email address for Abel Vesa

David Heidelberg (1):
      arm64: dts qcom: sdm845-oneplus-enchilada: Specify panel name within the compatible

Konrad Dybcio (3):
      dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
      pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
      arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links

Krishna Kurapati (2):
      arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
      arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node

Pradeep P V K (1):
      arm64: dts: qcom: talos: Correct UFS clocks ordering

 .mailmap                                              |  1 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                | 16 ++++++++++++----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  4 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                  |  2 --
 arch/arm64/boot/dts/qcom/sm8650.dtsi                  |  3 ---
 arch/arm64/boot/dts/qcom/talos.dtsi                   |  4 ++--
 drivers/pmdomain/qcom/rpmhpd.c                        |  4 ++++
 include/dt-bindings/power/qcom,rpmhpd.h               |  1 +
 8 files changed, 22 insertions(+), 13 deletions(-)

