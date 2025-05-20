Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E81C54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZqqHvzFLjHHEV9oJ5s/EwVZhIP7og8h/ocr2/2dMK8=; b=4BTBtMRbSyA7ZDirCW4Je7X0iY
	SNbC8WIAJBjBVjJ4BKOCi5fCso9reOdr0pWBbPlOcs5tkGaZDtrVC7KZBwXxhklmEtHjC3Sx7BURo
	OF9bgirpkclM26zXbHWZheRAy48WL/mR31EG9FosvRFVQI67xYQwP/xenzkkHrxvxHe/tjwHGpQY5
	YK5KaNKNDlgjSB0yeUYaSR9IaUbNKGDH2xQNL89qriuUgVUpxoAZy5z2VaPrSmlkHP0XbxoDeBBhs
	GwJu6QLjn5piswUvjYjMe51knoEAsXgpi8tSZhsS76tD99ZjKZEhmGV8DW97PgIEYNxfQGX9fSAho
	6EgyLrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHDB9-0000000BNyC-32s6;
	Tue, 20 May 2025 02:58:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD2c-0000000BMpj-1Vpa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 02:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C84D461137;
	Tue, 20 May 2025 02:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02ACC4CEE4;
	Tue, 20 May 2025 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747709357;
	bh=p8OR9g5qeP2t+5pRzCPVweDnZtwMfDrbmmjdw6Slo84=;
	h=From:To:Cc:Subject:Date:From;
	b=K+93xLYukR5nWKNpQcztUB2skjomCUd0PJbYfAVnPHPoOMkonYuOX464Y4VlJNHkD
	 HMnehk0lgNvWxNI6B2CdYTBBVSkSC4kih+1M4007f/5uz0Ufa/9nCqktkwqJFHldgB
	 3seaGrfCJ0oXOMVIuySyulEEdIYqW0LEG4R3gs3bIR37F2sF+4mFMleFgu7ZfWlRyl
	 8eY9axbdpPWpuec9/mrfO/p6crKep99KW2zkZLDbO02cwhpO8dh49FQvRRZ/Jt4NYR
	 a+80D7PXOhjoUX5QFCDKn7C0vQEE0fSApH5bmTND7fANXWW8XGr0j9YP1FpC0qL3F/
	 W1S20nosIPLeA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	George Moussalem <george.moussalem@outlook.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.16
Date: Mon, 19 May 2025 21:49:15 -0500
Message-ID: <20250520024916.39712-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
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


The following changes since commit 2c04e58e30ce858cc2be531298312c67c7d55fc3:

  soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16-2

for you to fetch changes up to 936badf282388be78094e55bd5e2c96f86635e48:

  docs: firmware: qcom_scm: Fix kernel-doc warning (2025-05-19 18:04:28 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v6.16

Allow HP EliteBook Ultra G1q to use QSSECOM for UEFI variable acecss.
Add missing compatible for IPQ5018 TCSR block. Fix a kernel-doc warning
in SCM driver.

----------------------------------------------------------------
George Moussalem (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018

Juerg Haefliger (1):
      firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q

Unnathi Chalicheemala (1):
      docs: firmware: qcom_scm: Fix kernel-doc warning

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 drivers/firmware/qcom/qcom_scm.c                     | 1 +
 drivers/firmware/qcom/qcom_scm.h                     | 3 +++
 3 files changed, 5 insertions(+)

