Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD78106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pNYRVJ9exxzvDp0qjffD6KkNxlbYKlcjyjrY+w+beA=; b=STjhxR5vW3pB+lvXPYM/+xHgEH
	z4auNhJ8qF0Pnu1YwVabXV24bqCsIV+1P+MKxBAPKDgZz77VL8UU5BNt8KChll7uGX1J6Mop8G/Sy
	peSxKi/80+jVqwu02rB9vPtnx7eKQ2Etelps/EZ3v50Uso0uDWgBaodJ27M9Zqc7Ked84Uxwq1B+/
	RhdvyfYZUeTdLTuhULJ+VJfi20j04giWFxZbK6ghedxSvJ22vytfH7CvVNjGger3P0B/pL6cSnM6J
	BAzRgyDBAJYHLCK7FGvVEctS3DGv02OyuGdK1+dXaLifjljb1VNDp1dr7EXafWVmDznSV8Rw8HHth
	E4CEiXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xMH-0000000H8Rq-0UTV;
	Fri, 13 Mar 2026 07:54:57 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xMD-0000000H8O1-1RLF;
	Fri, 13 Mar 2026 07:54:54 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app1 (Coremail) with SMTP id TAJkCgD3jHHBwrNpsxoIAA--.34817S2;
	Fri, 13 Mar 2026 15:54:42 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	wens@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net-next v4 3/3] riscv: dts: eswin: eic7700-hifive-premier-p550: enable Ethernet controller
Date: Fri, 13 Mar 2026 15:54:38 +0800
Message-ID: <20260313075438.1633-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260313075234.1567-1-lizhi2@eswincomputing.com>
References: <20260313075234.1567-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgD3jHHBwrNpsxoIAA--.34817S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWxtw1DWr1xtFy8WFWDCFg_yoWrGw45pF
	47urZ5XrWrWr1xA34YvFy09FZxJws7GF95Krn7tFyDGF4q9FWYvr4jy3WfJF17ArWUX3y5
	WFs3t34FkF4vy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4U
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRdWrXUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_005453_751906_34872B75 
X-CRM114-Status: UNSURE (   6.09  )
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

From: Zhi Li <lizhi2@eswincomputing.com>

Enable the on-board Gigabit Ethernet controller on the
HiFive Premier P550 development board.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 42 ++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 66 +++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..5a40be1d2a25 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -13,6 +13,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -20,6 +22,46 @@ chosen {
 	};
 };
 
+&gmac0 {
+	phy-handle = <&gmac0_phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio106_pins>;
+	rx-internal-delay-ps = <20>;
+	tx-internal-delay-ps = <100>;
+	status = "okay";
+
+	mdio {
+		gmac0_phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0>;
+			reset-gpios = <&gpioD 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-handle = <&gmac1_phy0>;
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio111_pins>;
+	rx-internal-delay-ps = <200>;
+	tx-internal-delay-ps = <200>;
+	status = "okay";
+
+	mdio {
+		gmac1_phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0>;
+			reset-gpios = <&gpioD 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca..f1a01d5736a1 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
@@ -295,6 +297,70 @@ uart4: serial@50940000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@50400000 {
+			compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
+			reg = <0x0 0x50400000 0x0 0x10000>;
+			interrupts = <61>;
+			interrupt-names = "macirq";
+			clocks = <&clk 186>,
+				 <&clk 171>,
+				 <&clk 40>,
+				 <&clk 193>;
+			clock-names = "axi", "cfg", "stmmaceth", "tx";
+			resets = <&reset 95>;
+			reset-names = "stmmaceth";
+			eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
+			snps,aal;
+			snps,fixed-burst;
+			snps,tso;
+			snps,axi-config = <&stmmac_axi_setup_gmac0>;
+			status = "disabled";
+
+			stmmac_axi_setup_gmac0: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <2>;
+			};
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@50410000 {
+			compatible = "eswin,eic7700-qos-eth-clk-inversion", "snps,dwmac-5.20";
+			reg = <0x0 0x50410000 0x0 0x10000>;
+			interrupts = <70>;
+			interrupt-names = "macirq";
+			clocks = <&clk 186>,
+				 <&clk 171>,
+				 <&clk 40>,
+				 <&clk 194>;
+			clock-names = "axi", "cfg", "stmmaceth", "tx";
+			resets = <&reset 94>;
+			reset-names = "stmmaceth";
+			eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x218 0x214 0x21c>;
+			snps,aal;
+			snps,fixed-burst;
+			snps,tso;
+			snps,axi-config = <&stmmac_axi_setup_gmac1>;
+			status = "disabled";
+
+			stmmac_axi_setup_gmac1: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <2>;
+			};
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpio@51600000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x0 0x51600000 0x0 0x80>;
-- 
2.25.1


