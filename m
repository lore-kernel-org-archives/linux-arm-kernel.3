Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5644BE69173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF4/ZNsAK1S1Q0ruvMfpDSairoKQHeLYMeqLyk6oG4w=; b=smB/LSL5SyoAhufX/jtOQObCIG
	OEaBUF8m5eygF5zpZSmeMZIGLzuoLkNN41Gr/veJKe1u40T0ypZatYKnTzYJZY6wDEztITlYJP6yu
	MWDCrLN/FLP4Fl+IJOEDtLIOpIyR46bC0fye+mZGZb4VY4gNLqIngELa6LGhJ/DJWpX9N/Yk26VsI
	I/k1ehTQaaVI8FGgvBFd63Cen4l/yB/2/nN5ft70raui0HIjeGfZ/VsRlc5RjD8SshUyBZgzHjT2j
	bgbmplex/sCrrsHCSM4FDc0c6g6ieaNFhoJka7nB+vNg3b/fWulqaqqILA7sgUFR9Wn3DdlQ58xms
	VDhs/q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWOj-00000002pKs-43xe;
	Fri, 22 Nov 2024 16:20:45 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWLC-00000002oJ6-1AqB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:17:07 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DB85FA07F6;
	Fri, 22 Nov 2024 17:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=gF4/ZNsAK1S1Q0ruvMfp
	DSairoKQHeLYMeqLyk6oG4w=; b=jkstMUKR6uP9DJG117rIpSBtSfT4RLi0NXnq
	/Vl8cprilhGgoNsUfeR9+nrhZN9z2NlnGa7xuBQxQfgXdMoGNbckO7anFVRet/h1
	IpkJA5uKUbT1yCBI2R2XXpK38j9BAf+Kll6xE66cnj5Z1T2QRYuIYJ1dkO6TdwpB
	yaXfFbdd0NBxVTjah31vRmx8UO2oD8USLlshascmomVYnJ4uJ0KmK5UEbcEGt4zZ
	tnK2hr1WmaRVs1+nBCksqRKQ0RpvE9EPCZ5U+TcicVidv6ZxWwrtwrK4q6+oFTJY
	3GSq+XCHVY0GncrHk0ke6SJGcUcq3pcMa3VXaV/L20rjDHP5IDJ1yHYck6VZUmo0
	LAto7wBWezQcj4h4lbNmj6kbVs3KEhOPA0x2uvmloMnwq2TuwkpAp2wAVAFdA5+t
	OeIOhNR8mnJ36lVvrKp6kxUztClesvgnk4NL3I6x+kVPc+NG37r/isQsvyCNEYuP
	cRT7HjVMkUp9h44sALoI+lpiLfdC2PIqAB8ubNc7ALG2R5/P2/OT2GS0S3rHWyXf
	7uWMhf5psGMeURL0CUXixityrHB88pj70mIjbMN1YM6Ilb2dhFfj0omtZ8oNQv44
	RvyKKrFf7SsYsbbY8Wj+16bShONC65u7S7yHtwZNH7qaK+zhpbW+6wMUBeIALm1a
	LtjZ+oo=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v6 5/5] ARM: dts: suniv: f1c100s: Add support for DMA
Date: Fri, 22 Nov 2024 17:11:32 +0100
Message-ID: <20241122161128.2619172-6-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122161128.2619172-1-csokas.bence@prolan.hu>
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732292224;VERSION=7980;MC=130815470;ID=75612;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855607263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_081706_479932_A3AF05E3 
X-CRM114-Status: UNSURE (   9.48  )
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

Allwinner suniv F1C100s now has DMA support. Enable it under device
tree.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased on current master ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
index 3c61d59ab5f8..290efe026ceb 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
 #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
+#include <dt-bindings/dma/sun4i-a10.h>
 
 / {
 	#address-cells = <1>;
@@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
 			status = "disabled";
 		};
 
+		dma: dma-controller@1c02000 {
+			compatible = "allwinner,suniv-f1c100s-dma";
+			reg = <0x01c02000 0x1000>;
+			interrupts = <18>;
+			clocks = <&ccu CLK_BUS_DMA>;
+			resets = <&ccu RST_BUS_DMA>;
+			#dma-cells = <2>;
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,suniv-f1c100s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.34.1



