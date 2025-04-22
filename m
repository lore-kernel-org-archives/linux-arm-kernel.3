Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E643C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5MJcsDy2OhQnbeBMx1UynLRxiyBn3DMKWGrFzw5aL6E=; b=B7PpsZSytIbJBz+OnzUXsb+EDD
	S59HIuvMZ9Ibqfs7FA4fXXokg2kaleOgGExwzIMO42PXbcGVB5yFuMMnJTNq89Z+zzU5QnHE0UXEI
	ynnTb5XgYqPOvWJpqQWBtyjvlmgRNyOoGw6G1mqZ/xEyJvjR7dTpivHFntZgCRyXS1FicTGjh9W2w
	DjcV8diq7T88hqEsCVkAc6g+d/E/BzyYTwG36eOT7Hxl3dfTYCiqFK2EkdANOF39PtZSU74P677oC
	mnRtpc7w8sNFdRjqEO8+jDLIchpTOY1/DpS+aEK0lmHPS1YrwOdE/j/sWS049bx3ipTaY6yXn5+1D
	3SfUDpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Axo-00000006nPr-2MiZ;
	Tue, 22 Apr 2025 10:34:52 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ASj-00000006fZr-2ixR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:02:46 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 45CFA1F92B;
	Tue, 22 Apr 2025 12:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745316163;
	bh=5MJcsDy2OhQnbeBMx1UynLRxiyBn3DMKWGrFzw5aL6E=; h=From:To:Subject;
	b=VRpkuyDWG8e5xqejt1ao1ybkm89AggTICBQO7j4twnnOd5RQ57W1AqZQmVfgfCKh4
	 v9Wayn4RAIeYnW21i/uXaMNSUsrsdE3imWiph1UoGH1eI5y1IIvPuynzUP50XwpKmD
	 5q2SPiSK4WeOHzbr+6x+vrpKCjqjbgM4gI5eObpCJBthNLbfqVP9kYtKPk6d8noN3i
	 gponeJVFa+9yUJOBAELyn6rq7OK3vLCs9LYGkl/qRywrlpyL/LFtZh0qntEaSyoKNj
	 B0xB+Msvw19QM1ncTHOUG6pg3LdmqxTH5wQhJqY+lDYFBjswkHD6uyQwGBj0SlzMST
	 c0Q4v6NRPi9zQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8qm: add ethernet aliases
Date: Tue, 22 Apr 2025 12:02:39 +0200
Message-Id: <20250422100239.58799-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_030245_847052_61E58AB4 
X-CRM114-Status: UNSURE (   8.67  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add ethernet aliases, they are used by the firmware to set the MAC
address and by systemd to rename network interfaces to predictable
interface names, e.g. end0 and end1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8..eccd0087efa7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -17,6 +17,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		ethernet0 = &fec1;
+		ethernet1 = &fec2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
-- 
2.39.5


