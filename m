Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04563CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q+YwbmoC+/eA4WDVc0vSd6+2QtJsGtQPXIIhW0hj5Pw=; b=aCw6XDt4MUclppWLdwfjVD3oMb
	uSfgtOVyIWbJNYygViQurUqnQH0694sUVoq6fKYhOEK+H09bbHJPI6e3mhAY5tPkJSMMDfvP8xmpG
	QuIIlaZValqT8vb4AE4Nz2I48XZNuAPj4KBMzb5O/rKatgC/VNX6mZ/1ITF0yEckgf9IE3n5crycH
	I/XzJpPaK5p2hGVUY/31u4j14HKTBDKjpu9bQzk82FJ6iSmURboYUaVl05TDbSV8AJGbCHk0pn4GI
	V94XzH2OOveUlFfghplKBUpVx/+SEKow+CLvW+biST7uGorxznWGL2PQM+r+RZLDDrjMq+JmUwOYO
	TTaHy/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v09Sz-00000006Hj3-0N2l;
	Sun, 21 Sep 2025 02:06:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v09Sx-00000006Him-169D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 02:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 933B3600AC;
	Sun, 21 Sep 2025 02:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEBDC4CEEB;
	Sun, 21 Sep 2025 02:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758420373;
	bh=XRVEQjw1TfKD68ddI6HdIZfq35WBmMfjMmlYbT5eTks=;
	h=From:To:Cc:Subject:Date:From;
	b=XykrCcViqIFvL3D8GoPzc1FlkdTNNd2yNBSZ1tAwiT9BSHoTgihgWMWX6OTOXZJDv
	 3WmscXJ/je5Zi54mL/COra5VLpYtvwOQZA69FzbdZkUjzk9DRFyH7Swvgym+XtKlJL
	 2MDX+4PV2eDnavsVDqUNrQPnIBKIWjki2OTB73bqpX0uIBHA0f/CaOkzLzKZwYTzJ6
	 pkCThA71JmnBaw5CsI+EpDGE3+XcDg8FxXkzgAxNG5NFZkJ7mIegD0xxGV8mmYbrXV
	 b425PdzjW/t+e3hC8ioYKdSbZg4Gf7y4WQU7GkZBCgCab+HwtxkouEBi56/hcryuV/
	 FrH8KPTxRvUhQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.18
Date: Sat, 20 Sep 2025 21:06:11 -0500
Message-ID: <20250921020612.596098-1-andersson@kernel.org>
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


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.18

for you to fetch changes up to cf0ed173d27a2a832642aa441eb28a4dca53fd19:

  arm64: defconfig: Enable X1P42100 GPUCC driver (2025-08-18 21:49:51 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.18

The Qualcomm X Plus platform gained GPU support, enable the required
clock controller.
The support for Qualcomm QCS615 platform improved, enable the
multimedia-related clock controllers.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: defconfig: Enable X1P42100 GPUCC driver

Taniya Das (1):
      arm64: defconfig: Enable QCS615 clock controllers

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

