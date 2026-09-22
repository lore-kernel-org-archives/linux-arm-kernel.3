Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF578C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m9HjGywjPaQr5NFO+zlg6UR9BceYwmkoX5kRlGU4PwM=; b=fpoTknfu/FcmfFTK73BrPO1KvU
	sZ2bd4ZFVMNxoEEAyFdJOotsSL8ZKN5ekNiRZs2xo6JDKG+Whf08SSBcmn+UYVcXgvODYAYAl3mua
	55IvNp7BV4KaOgCm0ZRfygABqtG0X6U9C/Mx6iTqRd0VEls/DaOHUtdCaugjEce9sFw6+8UglK60r
	VEpV7R55kwJ9hzAclxLdG0gLG41bHZSCAVAGcRGu/NELoyQCp56jiPFz7Uy5Fv5FvmhNASlJrvZJ2
	ghtLpyBJIeomsZzCHwf6MrkpxDcl0lXjL5MqiVoEOpiGtJnWASXqPMKyQPi+LJ+YrwAuo60ZUbTFj
	56E6rMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Q2-00000005Ut3-2Mrn;
	Tue, 22 Sep 2026 13:20:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Q1-00000005Usg-0b4j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DF0C60200;
	Tue, 22 Sep 2026 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FEE1F000FF;
	Tue, 22 Sep 2026 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083220;
	bh=m9HjGywjPaQr5NFO+zlg6UR9BceYwmkoX5kRlGU4PwM=;
	h=From:To:Cc:Subject:Date;
	b=nfcQaXYsRW6faJYRdUKJ5aPfQ3kzWOknnksNW0BJkblAJ/T+7/aj83G8fZjUBbTvZ
	 eTzxtS5P4F+STY3hGuHo8MLi8sM0AxeDX2RtJVHxvSFcgAl1fjvo03SlRhpj+TZ2fU
	 1rnArbAjaGf+yCCo2rYk178CRjOARJ/20J6T6/MwvyIz204JeSB90REhwE0Jf7N1SQ
	 aohcn5yCKICdIRZshYJhwGNfETSfiPx50NNMXxVWlyfaIcTgbAuq5mv42ofqAtok0r
	 rSOdo0i0QVMASiKzAhyes6auC2+SVKCOlsIVaJA8CV9AgsdB8FH3JQlDM2+bvgvXJI
	 Z/6k+2xJ2y1Wg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dale Whinham <daleyo@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v7.3
Date: Tue, 22 Sep 2026 08:20:18 -0500
Message-ID: <20260922132018.358932-1-andersson@kernel.org>
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


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.3

for you to fetch changes up to 35ce3c571297aee13c6da604d022929fd1aa9efb:

  arm64: dts: qcom: x1-denali: Fix microphone distortion (2026-08-31 10:08:35 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fix for v7.3

Fix microphone distortion on Hamoa and Purwa-based Surface Pro 11.

----------------------------------------------------------------
Dale Whinham (1):
      arm64: dts: qcom: x1-denali: Fix microphone distortion

 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

