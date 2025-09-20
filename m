Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE88CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; b=EUgYzGLtdo7q5LRCnSq4jN7UXc
	KFWV2e5qIl5IyuS98K821WdCgZ4hZ3GDYA14OucVXE/HYYoFedX7+12tTdF2YWmAOjM8qcPo0F/oe
	a/dMnpDxy+QRbZ17Qlh6KBLwZGGZQwjTDCwf7frTaEDssNTlMz/jhAhxgJDDLiXhFN8irJh3K45jx
	Pr9oMj2s/IWvUqfVtHnDa8N9M3vHQaf515V6b1xPqVsqSjnV4RnIWZMd3ziCTuy9M3YPmnX30Gp+c
	Aq4Cf2IIagnPI/dUMvWqyDwCrWmq7BCUJdO9Q6GCg0j9k6hP31dXwjZDNqdlmiqhydaNBxp47Z5U9
	4JLs/QgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03dC-00000005pn6-1rxo;
	Sat, 20 Sep 2025 19:52:26 +0000
Received: from p-west2-cluster5-host6-snip4-10.eps.apple.com ([57.103.71.63] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03d6-00000005pkZ-2Px6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 19:52:21 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-11 (Postfix) with UTF8SMTPS id C36AF1806084;
	Sat, 20 Sep 2025 19:52:18 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=BmApqPn4hfaWnHMKj6gYPoM85OiOogScwm6AguIcIwnwW+siyn3vxjZwzqFd37mZ6zDxFVsC3smPzr7ed+WvTDeqVDvI3ExzeI2XlkQKoo1ymJomVJIaSXDrWdMSMVzEN9WPc2HPnsXqBdpH0cNpiZqbvqyrPwCfdIMsCKnJddLz1+3j70Xwq7BWybuVQ4gOiCIb8YmKrpYntpm3BzZhk0v7FdcLM+OwKKnheV42YMLuwtjS3TxulFf3C5jNORoPIV8Ktcm3fUrGO1Y11NEzfqhBaY5tF/E8eRQuPOJNhb9ze0K+XP7yaxPUaGLzKtHU6Cy5uQlpz6Tl1mh3q2Ij6A==
mail-alias-created-date: 1643268037438
Received: from localhost (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-11 (Postfix) with UTF8SMTPSA id 40D1418001F0;
	Sat, 20 Sep 2025 19:52:18 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	daniel@makrotopia.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
Date: Sat, 20 Sep 2025 14:50:50 -0500
Message-ID: <20250920195102.2733949-2-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920195102.2733949-1-bryan@bryanhinton.com>
References: <20250920195102.2733949-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mBhngQ9sjVFgcqTigtoistV_k-tujIkB
X-Proofpoint-ORIG-GUID: mBhngQ9sjVFgcqTigtoistV_k-tujIkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDE5NCBTYWx0ZWRfXxFPJSD5OGktG
 UeLPBUNIy/S47Jzetf6J/BjxXzzzabI64GJPlhbXknJYYGl0J9fTCS0BFPBYYGtpGGTnOs6EXEr
 2ejUaLPloAWxnkVAs+0GjAmVg+LVc5aadIwKyFbr+xPaicpeXHMdyVuyMo8howBJs0g6FWndv7U
 vemQRI37sNJJS3kfG4pjmW9yu3EBlYGTZyFbLDbK3YnZ6hnffKb1JJEQuqm88o7yX5tqyDKCO+U
 /xiXVSh/LJkIh9HMZ5pONdulImxak/wo/C2jNXzDNscEJijaClG5bACFSWYjoLzXYkCvp9enI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=913 clxscore=1030 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509200194
X-JNJ: AAAAAAABU7elWgdKEGifIUerGrdz3AuEfJ8Sw9y2TUnmm3megRUveYhBf2WD2d1Lr06lEVapCSAcM6eEaaP8gfzAgb11lIDXu/aIyrr5WLmFQPDW/r0UocqP//VEbmxAveqC9de2SWEcUwxCZnrsl++7BiOiA0LwqEsyictdElbeJFZbGILSpDbFwmaV/sz8awy/dXUeG4V2LWvvXZO5IdphIJe4/nYTwV9AVXTVqEmiic51a7NE8HZENkwjppfE7Z5BF37EoATzGnhvxCAg9yAtrIhg+J4T/yzGDreA61wW3a23VGpHZUaZBCS8mB6MIwQJVxUGET4+Hu/3X0LfuCkowb6TVOrzlrxMdQJUPNUbCLHniHteYd5vqBlYOrUbxBKFTaSZQqL1R3CmVRvVUpmqbaZ/VMSyQbhDofKA1Ai6RxIFSPdvai6TG3JhezBylKInVX5GrgMQexUU42v1W+vU+9z2zurcpfzOOnTQ+ytY9UxqH0oj6t9rqbn68J3F5b2k0eAN9PVZPERUmmE+wUrN8WX7Z8gpPVb6iW8hS6/HuFRoLEMnnjfph3C8OVYNsD5Lh6Fi8IKsUMEZDvNzNwhJew7LrIPOvAYlIWi3fdZ+v7PBCICT2jy8RcJ+IFHu+A8nePdE80A4P9pZ94l1kvJ/amhePwQVCpB1Mb+ap/7JOq/1Ags1cSCqf/u5OYWhqUnL+FpOj6y5JcTVjO76xIQIOLnYe78DcZPbuLJEIaMuIqcaJQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_125220_619166_4B7B6A41 
X-CRM114-Status: UNSURE (   9.76  )
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


