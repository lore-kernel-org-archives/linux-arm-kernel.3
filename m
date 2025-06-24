Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50925C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk+XTgeIL/IOCQwQu0RnliECYooXRsUtpfEns8lWuFo=; b=fEcgDrgA8kbOJBTmnRICQ4wRsF
	jZ9C3Aui5zCQkJbQxlIIJmB33pn7SW8U/+SCJbDLLv687isy5okFQw2XiFy6AsRcRIDJrt8IK2nru
	hs0YY1rTp9Dybs6HEdPoWR7fMu/uxIz/K4xfAwj4kwwVxS42VioPUZJjn3+bkVBUFEBhVb7Ra1bL7
	lJyWre+69R+PbO09NPTA0FgR66qAlcoc66tz9+4OHDDCYPHG79IMFiLAr44BakSLSVo3HuNa5S03r
	+9USmM4R+DFm984nxITOfrRONcthWxtxPqnwUadRgi1TJQz4UeceOigwAW0ZFu2Aumaxbopa8Tzc2
	afZwokmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBM5-00000006tOA-1pPI;
	Tue, 24 Jun 2025 21:39:01 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9F4-00000006azE-343N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:23:40 +0000
X-CSE-ConnectionGUID: HHyCfxgHQG6urX94NMWHEA==
X-CSE-MsgGUID: vv/z5tRNTHez4vIuHO4g8w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2025 04:23:37 +0900
Received: from mulinux.example.org (unknown [10.26.240.23])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A27F4003FBF;
	Wed, 25 Jun 2025 04:23:32 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Nishanth Menon <nm@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eric Biggers <ebiggers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/6] arm64: defconfig: Enable the RZ/V2H(P) RSPI driver
Date: Tue, 24 Jun 2025 20:23:03 +0100
Message-Id: <20250624192304.338979-6-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_122338_879529_01593EAF 
X-CRM114-Status: UNSURE (   7.63  )
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

Enable the Renesas RZ/V2H(P) RSPI driver for the benefit of
RZ/V2H(P) based platforms.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 42ec6e4ce407..64e7fdad51fd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -575,6 +575,7 @@ CONFIG_SPI_ROCKCHIP=y
 CONFIG_SPI_ROCKCHIP_SFC=m
 CONFIG_SPI_RPCIF=m
 CONFIG_SPI_RSPI=m
+CONFIG_SPI_RZV2H_RSPI=m
 CONFIG_SPI_RZV2M_CSI=m
 CONFIG_SPI_QCOM_QSPI=m
 CONFIG_SPI_QUP=y
-- 
2.34.1


