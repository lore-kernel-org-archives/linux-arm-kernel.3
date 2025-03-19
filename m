Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CBDC36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpAnbZpnbPEdjrx8S3fszfu5ZP76nPhd/BdAl6RhU7w=; b=uxCjZxk7iEZl0ncq1bHSpPs9mG
	dL9ZKke9b7vtO99iq7cBnHkZ74ZRv8+hkNxS22X8Z0DKkQ+vnic2biF2KiCUXQ6O+Ydi4BCr0PGXF
	GzZWUmJlcFiD1/cbddhiEFrzfHkCvo9XiC7XP7NtYNPAG/N49NwHkJKBiYI1dc6ZQpgZdxaZlpSMT
	0ZzjWu3R8TOCE15JL/w9Z4UG8kVzQ0esPcCUvEBryT5kF1kYFb8wqmQTN2fbelAFVd9lMPdCNWIca
	1k29OiYGuwRUXSLzOL/vAgLQwn+sIHNbMyrqNnDEQIvNlriptGNpcarhEUrHepppIi4DdYxrXdItW
	ynlBdpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuufu-00000009FVW-2WUB;
	Wed, 19 Mar 2025 14:45:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuueC-00000009FCf-486U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A99B5C5810;
	Wed, 19 Mar 2025 14:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1936AC4CEE4;
	Wed, 19 Mar 2025 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742395435;
	bh=BYSDp7h8CX/m3JoYwNQT07/clY6Sux/zZEdFLmBfykk=;
	h=From:To:Cc:Subject:Date:From;
	b=MjRNSZZpTUgfeC6T5gO+3cjql67nqnrBgZ/nsBB+BeaAsvniCEW2iycQwZRjMR1Z3
	 HDG1oV2SyIohFFRFfgKgTa8yT/DnokXIqf17/UXhzu1P9vQCs57E5RryPgv1U2f0YM
	 W6/LkcqNc/zbAu4/tYowp8mBW7fHxXkQSzT6ZD7cpkkIAuw813cZTKSOp2TS4VibGU
	 fiBV8uGMMdMrYV+CdSDVFMckdJnYyhIV5uKRT3fzP8MnVJYIj8MUkygKvGx9ge4n86
	 J/WoDSW/wGi0wcLjygKrRXyiZFr5umbKIwaXTKdkuogDlzFtZqL1sYO1lI9uMYVgOP
	 20eZFgiSL/Uyw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.15
Date: Wed, 19 Mar 2025 09:43:53 -0500
Message-ID: <20250319144354.2281720-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_074357_063034_FE1E37AE 
X-CRM114-Status: UNSURE (   8.31  )
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.15

for you to fetch changes up to dd20903cc09ac40e71096370a9564e6523e87c22:

  arm64: defconfig: Enable USB retimer and redriver (2025-03-19 08:46:36 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.15

Explicitly enable the DRM_DISPLAY_CONNECTOR module, as this is used by a
variety of boards.

Enable retimer and redriver drivers used in the USB configuration of a
variety of Qualcomm X Elite-based devices. Enable the NSS clock
controller driver for IPQ9574, the new Iris video encoder/decoder driver
and it's clock controller, as well as the QCM2290 GPU clocck ontroller.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable USB retimer and redriver

Devi Priya (1):
      arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

Dmitry Baryshkov (2):
      arm64: defconfig: Enable Qualcomm QCM2290 GPU clock controller
      arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a module

Neil Armstrong (1):
      arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as module

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

