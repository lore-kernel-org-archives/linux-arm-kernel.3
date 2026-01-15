Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F9AD44C48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoybRTbvjoQLUuapHZsWO+5J2/voy3mg5N4m2A6AHkY=; b=BvoiUciySvTwzK0aEpvjni6B/s
	PEG+0DOBGbD+E4FqRLlaXW2PlxgCxAGJlByn3Hea2Sa8Z6EjtHcsNqEhEUMtI0xSUPaE/vmmo4RHe
	ZwVmtis0aoQp1VMGD11gnjyJaZkRBRqA66Mfv8G8oRdorjdoc5x2YMpVS6dRmKYpJmJWOQmtqoqrU
	moXI61fSdvNm87JOABD33Deskt9k6UzSPPKmohVYulU9mhA1wvg651wpW5lVMXNJjv283ldxy48FX
	2FUzbfGJZh+QzWJRrKacoFlZs7DdPYwT/IqQut4LvQgqg9JmnMCPVeIndpGPZjg60vPcUEZy+fZvp
	A21iQV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNN0-0000000CPhD-040j;
	Thu, 15 Jan 2026 13:26:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNMg-0000000CPfp-1wa4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 254C244573;
	Thu, 15 Jan 2026 13:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AB4C19422;
	Thu, 15 Jan 2026 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483578;
	bh=NT4vIImuQBNAai3o3RRsGdJjSfvOFTiiuHHxqq49M1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDtrSBexz6ADEHmOXvqVCP4G6vk2aiBHO7htfffM9XdC0WI4QXkjCYjHlmR4N1zSo
	 eiioPC/gRKh88UuGev9F7wI8jRrGlpKF7ALT18/SFGD2klFURiG0a++VUMpPD5YVZt
	 gVX24/RebqhnzOsIZq7u1MZQ2WVZogKs4sO26rsiAq0SkG2PQrxDOg7MMLWqHgLLvb
	 hyyLrGg+2C1gpiptaX+s7ICo7DDfyPQFfu67LjMUo2bApKqk2QxTM/KKR69gOWDF9E
	 i9FNGjTLjCwVGNAIXMafLF3i05A3e1qhSKvBucFs+nZx3mSnTCzyAWLjvGiQDUtgb5
	 HMv4ISK2r7V0g==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/3] arm64: defconfig: enable the J721E PCI host driver
Date: Thu, 15 Jan 2026 14:24:42 +0100
Message-ID: <20260115132558.1522169-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115132558.1522169-1-mwalle@kernel.org>
References: <20260115132558.1522169-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052618_516700_82DA7FCB 
X-CRM114-Status: UNSURE (   9.28  )
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

To enable the PCI host on the Kontron SMARC-sAM67, enable the driver for
it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c4dedfabe41a..fca36c2bd1f0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -240,6 +240,7 @@ CONFIG_PCIE_XILINX=y
 CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
+CONFIG_PCI_J721E_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.47.3


