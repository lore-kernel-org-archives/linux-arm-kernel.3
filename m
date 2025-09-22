Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DACCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; b=GkAbrohFpKcTZSMkg8migJga2S
	etR0IqAwWGuWzmqIuQbzmDQ7S9QZvuUhT5vDfjTiWAz7QtLhnnkAHMWQG2ZC7yB58PkZ+Hm9NOj2w
	OheTrwTxrTRt94dUZ56cPv0ap6A3RJ1yOfHygRLVMdfA9sNOvbkhW2aYInBOTJlpzdScrnjjVGsdA
	6kKIQOGTb6H4ddwJ8lZBnR72fAqY+jKsf48VR/I2oy6oaZRJcg7mZDuvj9tvSB80MmpblwARPZaeS
	sItOTJlgcP+SwkAyD8zDokbGISz330+syB6OBtOzfpX418qhHgsYbeg7YlW2a7ROGIZcOmCMgyV9u
	xvIw0tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhK-00000008k76-09so;
	Mon, 22 Sep 2025 03:58:42 +0000
Received: from p-west1-cluster3-host2-snip4-3.eps.apple.com ([57.103.66.106] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhF-00000008k50-02eh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:58:38 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-0 (Postfix) with UTF8SMTPS id 97E47180072C;
	Mon, 22 Sep 2025 03:58:34 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=xdqJdTDl4PTuY5yyelJOWXBYGsD6SFvelOfbzxdGVIVo+Smqm6z3waDMZX0Nu0tYJRuYvrduxBVriNXPO/UgsUDVp+ho2iVlX2NE5pYbE5/P7FanWNSegw2DM3xpom41XdmdmUTf0Xv6VJqLkoV7Vbv9q2qtWKQA8OTJVytkfgXmLp8kgssPvejQdetb5c408zUN8m3iGuwY79Vav40z7DeGRGVDFfC3QXMQuGiMhps2Xd+IYgoIoKBYSYksH+oJYc27s6CwhYkdt+bJIYrRDeI6qBmVw2k+xG329n06/pMu0K/e9g2wJ920rEVRJVorE2tSRhAF6D91HYM/xh2pJw==
mail-alias-created-date: 1643268037438
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-0 (Postfix) with UTF8SMTPSA id BC4341800173;
	Mon, 22 Sep 2025 03:58:33 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daniel@makrotopia.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bryan@bryanhinton.com
Subject: [PATCH v3 1/2] arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
Date: Sun, 21 Sep 2025 22:58:09 -0500
Message-ID: <20250922035828.2941327-2-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922035828.2941327-1-bryan@bryanhinton.com>
References: <20250922035828.2941327-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 16us1-7uQ-icvud8FCfkJX5TH-XTXojo
X-Proofpoint-GUID: 16us1-7uQ-icvud8FCfkJX5TH-XTXojo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDAzNiBTYWx0ZWRfX/kB/Z/VgWHMZ
 bGPcgeuOEXLri78acByacKphJi5QY6QxpNIgU0eqfvlOGcgoei2AgwIutO0uiRtqofCZ4wCXQ+U
 ZvpFTnAhwcrkDG6+YqXt/xmrKiQz4Idk4kI0IZ2lqhjN1OLwX0BTREFrlWdBawqYKA4TIWHgJjB
 cI3U5C13VdJwGjGqmGpgU+E1KseVnIp5ErxTVxMLCshryLsJZOblunz1OhIZbJU+u/KPDN7XhQw
 9wZDwkUplriiC/5i1fnzg0AOma/oajT7YpoBPFZgwRVMCt3B2q2LycXfeM7Ksr4FxyL/zH0Gs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 clxscore=1030 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509220036
X-JNJ: AAAAAAABXmXmdxg3OHjerRfjKPm6KYJ4ABxHzCP9HsIfYf0MFwJKu55EvjTkLDQ8cPXRNPB2fa0JxZY7Vh05caRl49e2FEADvBgp5VfiwRvdRNRPyprdzVYaKxeu0OwqFNcoSa3ZpuT5ibYmCykjgj1L43k/iFy3cLg0ZpKX0IZqujwkkj0E0uqjMtXDZIbQ+5Lp2vFJui6sTDjjBtRgoEhqoUHEh/YKOhsO1k2CbXgrcRs4wvFyMqWrF2gv489aMIMkv6AW1tLwdwuN06xl1CQPsQ2zN9nGPul03wV6WMALvrJFITbxbbneclTaWWNE5sgt0xxUt69JcEAExD8ffXiRNN1NuPMfJ5PrIUafFJ6P8TYzq9DTScvBeGek+r4AUoSHmFX1c1YNEiNVuF/owS+JJPm5ORCY3kA7uyw4Hp1XTyCVmCY/FwqH0M3Rp2BclFd6MFiz8YTvCXj1uYwwvF3qF/vLoQdn8ZB2skIcGsR5pSRcpBGVNIUnUUgB1FccZ+1ZpR7uXOONFso4pHjM1LN0osK9QLq2U1rlGEOFh5uwLc2dqJDpHZ5LHKUqXq6UswtbO6F7mK8wAnvk7+P5tq7ijwlsGO1FwQQOoXE9Wic+0/FbBQl6irSZQNiQpmVrmwgrP2dU/jBeaACZTXUFXJOsnNgKGbBdJobcwoZb6HsLGPt2QcV2ohgMHVQW6orkS2bMfPxTiFmAJL3B71NByxDMDs4VRoXUJF0Yb3DfKHqYmpSp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_205837_055630_4554133E 
X-CRM114-Status: GOOD (  10.56  )
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

Add stable labels (uart0, uart1, uart2) to the MT7981B SoC UART nodes so
board DTS files can reference them directly. This change is purely
cosmetic and introduces no functional differences.

Verification: Built dtbs and boot-tested mainline Image+DTB via U-Boot on
MT7981B hardware; decompiled DT shows the uart0 label present and the
serial0 alias (or absolute path) resolves to serial@11002000.

Signed-off-by: Bryan Hinton <bryan@bryanhinton.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 5cbea9cd411f..4ee7fb83000d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,7 +94,7 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
-		serial@11002000 {
+		uart0: serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
@@ -105,7 +105,7 @@ serial@11002000 {
 			status = "disabled";
 		};
 
-		serial@11003000 {
+		uart1: serial@11003000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x100>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -116,7 +116,7 @@ serial@11003000 {
 			status = "disabled";
 		};
 
-		serial@11004000 {
+		uart2: serial@11004000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x100>;
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.51.0


