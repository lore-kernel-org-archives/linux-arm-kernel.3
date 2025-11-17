Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A72CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QeKhpy+k+Ju0I5n286iJ1jTMBjaoWddMqjTUhFfrA68=; b=BgzyJaRKI+dBEyfrbpmXklr6xa
	DMmpEF5RWv8/yE3VLkiYrfIvQ8eOpCg0SxlsdLWUPho763jmwccXIu9nIZLrVK12DtRzysKlKnT9K
	wLJDOxySVpj6LfQ0P6BXOXWTmJ1c9L5BGR87neVqfldLdJv3510+DDd22SvgrSEBM9vlwf0GziHxH
	wxcMg1UK4DpRsR/1Ct/4ZhEEdP4aG828eMlG0YE5RitaqQqe+YIMA5LlU6bccfwj66IVd7vEKR3MS
	XZoY5QjB6aRtNccPyN3pfTMVKblISHRd+gOtV8rDKUOy9H9YxgnU5ZoGulQV+Bl2pkpXyhE+jlRPC
	STzpOOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6EI-0000000GqYL-2ks5;
	Mon, 17 Nov 2025 20:53:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6EI-0000000GqYF-0lcZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 547D0601B0;
	Mon, 17 Nov 2025 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719E5C4CEF5;
	Mon, 17 Nov 2025 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763412821;
	bh=5mZb4MWOPgD2NLuK8mo1ofEG6fMCr5dXSRetbgXpbL8=;
	h=From:To:Cc:Subject:Date:From;
	b=d4kV/DdGD0cPpNvpq7MH3tU3e4wiZpuCXASeeSq3/oOMPX+HHoruAr6Ps8xhwLPJp
	 +HH2HLm0bXFMPX112pMyuZgXQrq/NBdltVZxY5MoM7T4xv2kx55y4w/2yTIk2xAVXm
	 sK9sQIJKUqxhl1o8ZZzPT+gCxey9HLAsEb4HIhTtM8ieeVQtNW1OoB4lpJ3QnzFKR7
	 AHHO7so75xmRkmLF1YygHK8Xfc6r3fBG3h0B/RzBGo7D7dPwVOYT1hawdaNswQYtbO
	 +7XCqW+lmLmhXl1GGujjrz8fLvFka2XBnezox+0OIns71ef4dFbR/fg+Ce7bOmYNAY
	 Ld3gYrVaYQ9pw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.19
Date: Mon, 17 Nov 2025 14:58:23 -0600
Message-ID: <20251117205824.3178198-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
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


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.19

for you to fetch changes up to 84df51667a196a0eadb22294eed1c6440241d74a:

  ARM: dts: qcom: msm8226-samsung-ms013g: add simple-framebuffer (2025-11-02 12:07:08 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.19

In addition to a variety of cleanups and reordering of nodes, four GSBIs
are added to the MSM8960 platform.
On the MSM8226-based Samsung Galaxy Grand 2, a simple framebuffer is
defined.

----------------------------------------------------------------
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: reorder nodes and properties
      ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
      ARM: dts: qcom: msm8960: rename msmgpio node to tlmm

Raymond Hackley (1):
      ARM: dts: qcom: msm8226-samsung-ms013g: add simple-framebuffer

 .../boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts  |  31 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  10 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  61 --
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  12 +-
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 746 ++++++++++++++-------
 6 files changed, 534 insertions(+), 328 deletions(-)
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi

