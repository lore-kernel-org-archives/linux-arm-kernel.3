Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45BFE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=neOtGy660wrg7yoU7nTMUphYsloLgbcU0e4CDGQ9whw=; b=TxunRaIxNwrpCcI/CTPxSMGI2S
	BoCCUH6OGwP6H0b9ZcJGGqUPl1lUnCFNpJlBidh+kq8Eht6wUQB2DYA4Zn4290AsWB/wXCreahk1H
	QJBEQubLP9XxITtmEAtcu4SXvePWcpCMoxNPBvlGJ5nxVH2hzNKK8FYn8zu5ZS8Lz1WvU/JjeHadZ
	APW28hJ7nQGSXzs8JZctblwDftx7i3vqUalGRWTETj4NOhas8ZYIOT3AIAp0xRaO6ZQJXRMIqokbk
	yKbfTGl2X9rBfAoJkar3rBo6/twpnh1xzf3+WaYn5KdLrMKJuoAhw/D6AR+XMoERZbSQposdPn/DL
	AwSQohtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWf2V-000000018GN-0WTc;
	Sat, 11 Jan 2025 17:12:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWf1G-0000000189m-2Nq5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 17:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA8ECA40582;
	Sat, 11 Jan 2025 17:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F473C4CED2;
	Sat, 11 Jan 2025 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736615488;
	bh=TV4EgiOr0QvNxIquX6LwrbCC+EAwZWTAXAYrvwrxvm8=;
	h=From:To:Cc:Subject:Date:From;
	b=KHhY5vzCaRsnIxvM2lIqM3SGvVAVEuKfQDXnZW1BIrlVdMwxqRZ3G1J2pt7Wo8SeM
	 Kj7+ot43FvoeLCPp/Wpca1aYMV8dgHcD5/eNPxSocVGmTbbrkJjmWv4JQ8T7hXLnXG
	 AJJt/2hw/9OnJf2TSisL6KGv79DJqx+T1pPtfo84QgueGrVgOvPx19RUi7nJAtD2xo
	 4oJV6j0ZveghB+9Oc8huTm6t//FXXXtZ6gYSG4BxV3/hFrh/tx6bC5N+5SWfFARMZm
	 zwCFm28uAsbKU4BUW42Vo0wgSUeJnHOGGZtCw36bDswWhWxMCa5p6y5JqKUz08cDwI
	 RjPEdJtsHp8GA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Prashanth K <quic_prashk@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.14
Date: Sat, 11 Jan 2025 11:11:26 -0600
Message-ID: <20250111171126.369502-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_091130_675323_9D1D6DD3 
X-CRM114-Status: UNSURE (   6.31  )
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


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.14

for you to fetch changes up to e3bab40d5961453545ef39aeb5198d2e718c9693:

  ARM: dts: qcom: sdx55: Disable USB U1/U2 entry (2025-01-06 17:49:34 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.14

Describe the interconnect paths for PCIe EP controllers on SDX55 and
SDX65. Disable USB U1/U2 entry to improve USB stability on the same.

----------------------------------------------------------------
Krishna chaitanya chundru (2):
      ARM: dts: qcom: sdx65: Add PCIe EP interconnect path
      ARM: dts: qcom: sdx55: Add CPU PCIe EP interconnect path

Prashanth K (2):
      ARM: dts: qcom: sdx65: Disable USB U1/U2 entry
      ARM: dts: qcom: sdx55: Disable USB U1/U2 entry

 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 7 +++++--
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 6 ++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

