Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058A6D10C16
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0TfKIJhJzBxEoeio8uyUm+I+RQoIvnhme6u8bHSaZ0=; b=0htimsTxiZNO3gVME3ssq53/VN
	YKY4klynem6pFoNl2EC9UeRH3551usmOAtKR+pPeWiJw7TlJms3AGxMQr7WSuKjVNyRStRZElO7UC
	hXICgOsw+oVhQDATtLLqfpcc199L54sKLF3Ph4H7OGnsUTFagpcG/QKn7TueFkPVAvblU+Sa5JmKx
	7QbyVDmcdRZTAlIDEye0XMSYQYlT5s0qc5tQ8u23zDLjr5U15vpdb3FTzbU/+diEVVB+LOyW/DAAk
	h/SqD6uwuvEQgBD1uqd6iymflhICOxQQL6zcGj/lQxrBGFZdV4tx/Kb41TCYz2uJUY5rMrv+S4yh1
	B+MtJoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zb7-00000007u5F-04TX;
	Sun, 27 Oct 2024 09:30:09 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zSK-00000007svj-2lud
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 09:21:06 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5988BA0DC8;
	Sun, 27 Oct 2024 10:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=J0TfKIJhJzBxEoeio8uy
	Um+I+RQoIvnhme6u8bHSaZ0=; b=qIBXSWKPRm8AUp8bFyY0gZCHCIew2oBPq9x5
	VWSu8jrr4s4Jr6DYnH+FSDWp/8nlIlGD9BWQ+gbKiDNHSGJ/g2GMy+35pNg8+eE8
	OiVtEfX0zHcAPf2YJ7Opux0QL6+bTcKwsr5M17CTkc6NVCFKqyJMsH344MM/kqlc
	Zrnv+aDnvcT7EVOjOcu0k/hHgmCsoZQq3SlgQGLGFlikUCSkIBn3WTUqRyJJHJsj
	ZqA7lMss5E8mA37hTOIZ5VKmVIUQWyrkUZKFMLyOi9I+c/pbaxcVR7fmjoedmevf
	EFApdsuSRE7bSq7CYQI8BKWuiHZ8hHrLCbBLm+udU+pVYSaJd7hAlrF7WegZAwLl
	mWpL8Zc9wbi4VJV7jtvUldSw2zjBG5S3wTa3vMKsadtce7wlevldB+QQx1Z3HmSa
	FoI98nB8224z5FIeR05meH970c8Zon8Tr8EdqoabxNv3Sgc1W79C4du+T6he1y3O
	sNurIlmu4XzaFsV7lZDWCI8dmfheCMiW73L9+bXoF+ZU9qzoYLSzCVAfW0NV1qUv
	DweMyRd8EeAVZibiFU46bEjGbIQ6XzRDRJrpSb3vikRlBlcavSF6lu90ujMoURjZ
	z/XkTU6IOuS9ub/OO+Fy0AE8mxdq+15qwb5v/pEcWkIdVF1yJoalndhC9egWicCJ
	CkQ93so=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 09/10] ARM: dts: suniv: f1c100s: Add support for Audio Codec
Date: Sun, 27 Oct 2024 10:14:40 +0100
Message-ID: <20241027091440.1913863-9-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027091440.1913863-1-csokas.bence@prolan.hu>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730020862;VERSION=7978;MC=3302600005;ID=156045;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677D65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_022104_880286_4ED400DE 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s now has basic audio codec support. Enable it
under device tree.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased on current master ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
index 290efe026ceb..e4b41bc93852 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -336,5 +336,19 @@ uart2: serial@1c25800 {
 			resets = <&ccu RST_BUS_UART2>;
 			status = "disabled";
 		};
+
+		codec: codec@1c23c00 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,suniv-f1c100s-codec";
+			reg = <0x01c23c00 0x400>;
+			interrupts = <21>;
+			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_CODEC>;
+			clock-names = "apb", "codec";
+			dmas = <&dma SUN4I_DMA_NORMAL 12>,
+			       <&dma SUN4I_DMA_NORMAL 12>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_CODEC>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1



