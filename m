Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C20CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; b=g59aW3CScDutvNAsNJ/5d2GLlc
	un6LMS346fCAeuDZovli0jlOCOmQRFx+wpEDAZm7ynTnxMwOXFLabnZWzh3iPc0oSAhyUDADUdGtK
	BbgMMlMyviQOSy+0U81qOurc2bBotfkBngeJnIDf0YpFc7JwfTKzlO1LeZprYrssQYjIFGbXAnKQx
	ujlX/lqDa7Qcd9Gwbdz3bGH/3YnaVK5VB4x0Jwbzwrmg2+gl+EsYj+c2vxJHDXKf1SOcUR495xFEI
	SaqYduhRnUru7LgLZ9HAefVcSUg/q9yGnrF0x2u1Nl+mdJoNknp8oMEAFRQq4d8vwU+E6T57gYhMr
	9WJ4+36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl7V-00000004MzG-2ZDZ;
	Sat, 20 Sep 2025 00:06:29 +0000
Received: from p-west2-cluster1-host8-snip4-4.eps.apple.com ([57.103.68.97] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl7S-00000004Mwp-3J3J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 00:06:28 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with UTF8SMTPS id E9D2118001B5;
	Sat, 20 Sep 2025 00:06:22 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ZG5RFVk3MlroaRiI1CYiqmTFBLGJzTbGRdNaO6GM2/HR9GGTRJfbl9h3zqeFdjIsshtPwrWwA3NXE7NyAj5P8/Y9pbUgfEoXnPoRhBwwLi3E0SW6iYqhihx9J1I84F5cwgQL1I8akgXUYaCAsDcVV5arRnm2cwoofBdHfpzUsU9GPSqYj0c5Dd2mDQti4sK/JEdRsSxX1PjHlGFsprobTfLngjGIgg74ir9jpV69rnSA7hbxdRmrWEleOg+7rAz2atzGwvwCwJeXqT5fCyYKvKmeDowRH1EABE+FXl/oyHKtLBJfCzPyvV4EtJVsBodaggPKTNnFobcbkTA0uuyO8A==
mail-alias-created-date: 1643268037438
Received: from localhost (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with UTF8SMTPSA id 4A3A11800293;
	Sat, 20 Sep 2025 00:06:22 +0000 (UTC)
From: bryan@bryanhinton.com
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
Date: Fri, 19 Sep 2025 19:06:11 -0500
Message-ID: <20250920000619.2643457-2-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920000619.2643457-1-bryan@bryanhinton.com>
References: <20250920000619.2643457-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dAW34huwMBD2ZGNGRR1ul9YqStwQp_PQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDIyNyBTYWx0ZWRfXzEoCahNX+gc5
 VbEKlIe620R4Lq+/s+eUTa+YgFCvmLMrc4M7J9p+H7ogauKFDvKLiJPzvpfCFg5jfyzmq0x5mal
 ZzaEwv6+92VSFZx7QI7Gr17PC/KzWhMGzyM71C7KQeiPTfl4ByTk7X6JHgkgoBZRx/ckfcU6TXa
 Krz+8zD4v800P/b/5HwOqJjMuE2nwybCqW13PMLe9J4h1qCVf3lXbDPpb/MU7UvOhyihL+Y4JTV
 Lkmgh4AgbXfryTTgH8shtx0npibFvIOshLgF+ZHIRy90yTMEk90npbnowrA+OuyqXqQTYnDOY=
X-Proofpoint-ORIG-GUID: dAW34huwMBD2ZGNGRR1ul9YqStwQp_PQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1030 mlxlogscore=876
 phishscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509190227
X-JNJ: AAAAAAABj/tlP4ypAfY5+cO4DGI33IYboO1Q5JXFUnInF2XSqrLy5TQi4k+81NIroUn9hONuPQFXBCq82VdR2Rc14GWxO8fcmGqcPbxyXcZ4UU3MuPVz/5Ybn78ZidO/V6ceanprgfyZUiTGAwDlm5ZB7Awt1QWNsmyNA3nSdm+FlOfZ5v70X2C/RB+VxPmeexFwolJ7ygUKoTYTzmSX00wdYqXt6WCfH9yD6MXrltLVZ6kd6Th+cb6j6ZNkqBgCqCDP0oZltDTgbkMhatcqRn7TfRuV13reAOins3aT8UYO/h8Nb4V7TY8IBNdpjm96iKCgWPF/s6jn3YMMDFZRIbgTybHn9ySmRWrEF1Z8hjcZHaAotpvZ61AFNfQtfF2AbpybfO/jTKbQeQhAqjgrr+uIrXsZWVyfwlf6XpPi5YDwmBtr0rXEpCzq6NzWfTbxdhxbU7WPCXUj69gO4zbACvYmKDrMwkToyL4x/M6tVI03p0YwXZC5KyrP2YxXo4SaSUbUDFSzrkkKmRt2ghYdc3TTYHoeXhou7tjIPGdH3si7Ehf2i+SM0n2vOIK014zrpvRh3iqLuLwEF/S8sAQigVZ/1DB9GIF6qcyU1MSwGRZiXIgml2t2kkX2WQabEbK4xX3xqVHDzCY35lQpgP5FkMi4btLtbklQQfV2CPwGHuUpcTWmmq2dI6vZz29Yr1WcDe+tPUwPKodVTLQLV7+01x3ut+L5SS2AzqTJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_170626_997570_A5701752 
X-CRM114-Status: UNSURE (   9.60  )
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


