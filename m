Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8533CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6PDWQNI3746KP4iwu+sqKxkUTRstcvfD9uTrFphufcA=; b=EZuW2MfOyfsp2tuYtVIFBxNdMz
	ARBExzAhwPkiW5+TM8ox786HjWX3djvGdjpeo8rjvDNT8hAPI2Xyn/v7T6NHpijoGnJc0tmy9G4YH
	JTq6EEjOICWVPI4yVWiDQZyBp8QMPJQzpvrZdeznYrjBfbzxkZ9PLHOm0ro1lc59ekAfoJlGx1Ceb
	GRoGlOd9XY+uwiAkPMXt63M0MgpFjCMK7jNw1fyWv56qcuBGekIQUSJFOXii0iR/C9ce2ROlKeDRz
	rdmAM0aQFLs4fMmuQjyqoqReMTznad/SJdjkN5JD8/Z49yM7h9jncXobDZDCLzJ8sMPJyLpbThvIo
	Gpi1TNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL69p-0000000GqAF-0kPv;
	Mon, 17 Nov 2025 20:49:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL69m-0000000Gq9r-0JuK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58BAD4040B;
	Mon, 17 Nov 2025 20:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D83C4CEF1;
	Mon, 17 Nov 2025 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763412538;
	bh=LNX/MUXct3+YGTpPeyt0DAy4pLb/SDYVq6fjd8A1QSM=;
	h=From:To:Cc:Subject:Date:From;
	b=jEFgoRav+0aRb13RQ/u6NPNSfk0KDo0YHUQx3q6BvZxTkLrQY8Vaj/Fp2v6QxbUp+
	 jy2JeOn/kjl+ycvGYSO2Kk4SoSYpUEizC8aYv9cC2JP/6ZTCTosPbWzI4IYukSF1h6
	 XA9OwJf1X9xRVxPY04g/uDhUY9KKVn2Be6COTV3r5zFavDCVUmKcrl615Z9WGs5wpd
	 ig2OcAcimaLo86Yx+Pf0YDekkaFjVB3ynFfjgHSxN/kSrt4hXGDGlXd+nRTE6E4n/Y
	 EkUb/tV3fG9cR6uchObtn2dLFjBTrauXNmIp6qkwn92R/wLdBatr8OcgFhk0QrwpYJ
	 tZmUo8iYH9hXA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Fange Zhang <fange.zhang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.19
Date: Mon, 17 Nov 2025 14:53:39 -0600
Message-ID: <20251117205341.3177221-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_124902_158081_6E557AB0 
X-CRM114-Status: UNSURE (   5.87  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.19

for you to fetch changes up to fdc7da1733d9d57c466e386d4242864d9e75c6f3:

  arm64: defconfig: Enable SX150x GPIO expander driver (2025-11-12 14:49:45 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.19

Enable config options for the hardare used across Fairphone 3, 4, and 5.
Then enable Novatek display panels founds on Xiaomi Pocophone F1, and
the SM8750 MTP, eUSB2 PHY found in SM8750, NSS clock controller found in
IPQ5424, the SX150x gpio expander used in QCS615 reference device, and
the support for UFS inline crypto.

----------------------------------------------------------------
Fange Zhang (1):
      arm64: defconfig: Enable SX150x GPIO expander driver

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable two Novatek display panels for MTP8750 and Tianma

Luca Weiss (1):
      arm64: defconfig: Enable configs for Fairphone 3, 4, 5 smartphones

Luo Jie (1):
      arm64: defconfig: Build NSS clock controller driver for IPQ5424

Manivannan Sadhasivam (1):
      arm64: defconfig: Enable SCSI UFS Crypto and Block Inline encryption drivers

Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

 arch/arm64/configs/defconfig | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

