Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E45FC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qTqD8XHnXnpCzH66fJSE8CBGzOPJsWGe02GIOrSsx/M=; b=yR7HiGN0tDZ/mTEgN1xhfUcZ3K
	YBG2HcHqRimthAJ+0VTnqcnHXEHeF6JZH7F3+isvfsaT3BY7M7dUZdLtce6F0sgqeIXOxOVkW9I/j
	jYgS0OFGFDbujxUnKrp4g1PxAbnXAJOWHk72AIAVrnwRsS4c2NCldPwnykyGOxWWGQmjZqhGrk7Oc
	hHo+U/JilmeMEOLsbI9p3jXOWUX3gLLnBnfn+OMD/QICYpeEjDRJEP9Kd6OKHM/6d2+uMNdJcb3fG
	Oy8nt0oQGuoDlOWOFpnix71lwO6CcyVQyuT+Z7uZN6EsU4mDxg0K/Qd5SPYccp6RKaabPNQwUJ/K0
	OrZyVGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7co-00000004b7h-1HYI;
	Fri, 10 Jul 2026 09:34:26 +0000
Received: from mail-106111.protonmail.ch ([79.135.106.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7ck-00000004b6C-12WJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783676056; x=1783935256;
	bh=qTqD8XHnXnpCzH66fJSE8CBGzOPJsWGe02GIOrSsx/M=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oPpHa34elIXrWQ2qBDuDchAmHHoC1fHSmb+YsLWiTSpntZaJmK8rMpO2Gxm/DkqaH
	 13Pv03dCDl50Li3QBPZRBiifPuS61U/wPKrN0O8aROtls5LcBk29+Kfiu4yzbU8yn7
	 YHsy44XQwBWmNfaIX/P+N+ZtzrTp7RXMqoW7T1euCoXZn2nFzxpuTLDEWO95TST+bA
	 pHTit8ZtmC87FdVFvVd2hyuxRTzaEOrsjQx9qCb4kSzEnwALyyXAtRRkyUqqGKBm/g
	 GRGj/KuDzsCNSxOKlOYfFdUzlIivmozJpDxXqcX4Ym97TEFOoLQ/g+4IuZuUyHEtn1
	 if/dBUj7ZamjA==
X-Pm-Submission-Id: 4gxRVb0VhTz2ScPc
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 10 Jul 2026 11:34:00 +0200
Subject: [PATCH] arm64: dts: imx8mq: Add dcss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJIUGqVzEusPMDQ0LRDhgSw
 t2tuvwW7+1kSAqja7FTwltN55hRngoKQxt7sEo2Va46u6Z0rNPmpxdLMGPJQQAvCeA4C/giXe0
 FztdoKS+eCZ1uv/3t/retjxFh+T7pOD7KPpaCgAAAAA==
X-Change-ID: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783676054; l=1806;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=+SSbmdxaiq0J0wa30iE1zuvjGBNzgjfpAoxryIKdcl4=;
 b=sc+S0NvCxqN9/XLrbs6f0pnZylchIoPD8w2pilECc4TqUMxOnhXBshV4gDioLcjbdkM1qzzXj
 +rIxB3EqvPFAF8bFBRR0O7WMBjzIAswH0IkrMQS5UpuG/5AugIdslMX
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_023423_240055_FE86AFB0 
X-CRM114-Status: UNSURE (   8.71  )
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

Add DCSS node for i.MX8MQ based on the example in the bindings
documentation.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index e60872aeeb49..fb99bd3ad7c9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1611,6 +1611,27 @@ irqsteer: interrupt-controller@32e2d000 {
 			};
 		};
 
+		dcss: display-controller@32e00000 {
+			compatible = "nxp,imx8mq-dcss";
+			reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+			interrupts = <6>, <8>, <9>;
+			interrupt-names = "ctxld", "ctxld_kick", "vblank";
+			interrupt-parent = <&irqsteer>;
+			clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>, <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+			         <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>, <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+			         <&clk IMX8MQ_CLK_DISP_DTRC>;
+			clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+			assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+			                  <&clk IMX8MQ_CLK_DISP_RTRM>,
+			                  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+			assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+			                         <&clk IMX8MQ_SYS1_PLL_800M>,
+			                         <&clk IMX8MQ_CLK_27M>;
+			assigned-clock-rates = <800000000>,
+			                       <400000000>;
+			status = "disabled";
+		};
+
 		gpu: gpu@38000000 {
 			compatible = "vivante,gc";
 			reg = <0x38000000 0x40000>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea

Best regards,
--  
Esben Haabendal <esben@geanix.com>


