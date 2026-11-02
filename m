Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA17606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i1/Mbhh8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrVzVqGg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q5sP7zJDVKsg8tL+CekeKmX0pZ6GZsu9tbiTl6q7uqI=; b=i1/Mbhh8nGh0J4DPFkgWaB6iDy
	xmOuC2cUsTHu4JOuK6zRsLveTg/jKw6ngatT2xnbyC0rh6wpPD3uxaBxQKedl6oPUTDcnIeAixTTv
	V4xBZ8EG47xUTS321FdJwtWkdp2NSHPcORUxX+VsRWFfIkzxnEa6yJ/aETiTc9+cXQGYqFt/H7k+y
	E2Bm94WApqRzDiLIjb/+9rqWJNsF236JO4HYc3AE+3HW4hjZcclHN7Zjy5ERjuMSMq4W+DavwdLmz
	dNsB75DVeiXvKnbx+XZg4kVSZTCnpYryiuSuh9iIudW+TdEARqAMzWkONMryl6g/RtoIlGj+1Nw0J
	BhWB6SUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyl-000000009So-0uqP;
	Mon, 02 Nov 2026 19:46:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxy7-000000008bb-1mWE;
	Mon, 02 Nov 2026 19:45:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3064D40826;
	Mon,  2 Nov 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793648723;
	b=mY1Cc8eZ7z58nZ+a7sXJGVslzEh0iAgKTf/2st7/jYZy9rG10M+f4leyvn07emefCd1z
	 seDWKdUIujxaTPXCGEh99iNvC0cu6rmjjjlGjdGgVSsDuTWDEE1lFkEaYJszC2gtWOdPb
	 r28LPNN4CnKuy4TnXyAnnGM3K+WL0BdXFE4DxTHX4HCAU3kKqFZQSax1Su7VjC0tqQURM
	 H8VRDbgJvrhfZorHMfb4eVNEjLZDioUaubvG4zlsUMjp9TTk0viWrnuHh2FUupNWRY4pB
	 hhzaiu1dqgvy+UzG+bSUhNHGHY287UavbluA/VHPj8uo9JSdTZjHaw/SrExdxcIBz5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793648723;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q5sP7zJDVKsg8tL+CekeKmX0pZ6GZsu9tbiTl6q7uqI=;
	b=yFW0KCSR9nJtOe6yOGOKw0HgPiIE1h5czbb4aHYCNP1//AGRNlYGpWl6IDYLDqOUp3Eo
	 /mdEPvq0uQb+3cKv96AtR5p2vh9y/B0oNIOZ7F3I3kJcWHthapGmW7mROcWOYbwPdv2Ro
	 oEbYVeOlBJAUx29rrG/mygLba2ga8xhV490PTU11oTH+rqkJ7BkUZKhVJ98OuOvZNwrEp
	 FiZtPolmDUhWbmLAkIhTvjkTfWgoCu9AEr/zTRgmsC4NRol6uSaarTRL+FDmOrQrZogVp
	 igzXAP2OzJSYYzQf8bjsuVFCJs6AnvScOZu+8J4lX/B+gfhUZAEgwJrsQIehNfWoxUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE1041F0180A;
	Mon,  2 Nov 2026 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648723;
	bh=Q5sP7zJDVKsg8tL+CekeKmX0pZ6GZsu9tbiTl6q7uqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MrVzVqGgG2NFYPEkyVSCloBEPVZh55NsYQLKqe6CG5FrFf3Fyrr55qkKdhszCZpLP
	 /prCgX2hIO+As6RDXlfw8mXp81ls9tMCMozOd96P8IMy1qRbhnpDcz0WpD0uZc+g5K
	 Mm6eiJxssOZtjwk1e6o2K7YuODvYl1zvzstYVmWJon/SwDEOXsCSBYpZT7XGNg1Kk/
	 OB1U2qRGSUtxf+5s1AgVhVlv2f5iPjd3GXDb1NOr4Xcgfo2HOit8hh6LLh/gSPvFbs
	 KqzdfVPUj9sTpPTmcBtQM/WP/aWIyY+bC3gz5O2Jki4953V5rNpRknE1HkSnXHoiDR
	 gTyRW346Shn2g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 96A274663D;
	Mon,  2 Nov 2026 19:45:09 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 03 Nov 2026 03:45:18 +0800
Subject: [PATCH RFC v3 15/17] riscv: dts: zhihe: add Melon Pi V1 and V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-a210-scmi-v3-15-ee6b31580808@iscas.ac.cn>
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793648705; l=3373;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=oY4cd1y5LBziUvIW+aG4iF3iEAIqMm4nbEZQYJakX5E=;
 b=0QUOckcOgdi00x96GxaCYHXqAzOf45yMAotlvmrxpn8ZF3p90BpvmPnd8mP/zRvFFnRsrWM/w
 K/37RwOZ36zBUOmaL9zufz6Ll6bxG5qY2cEG+9q4rmFCsnoG5mCgT4A
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add Melon Pi V1 and V2 with the UART4 console on GPIO2_0 and GPIO2_1.
Use serial aliases to preserve physical UART numbering.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/Makefile                       |  1 +
 arch/riscv/boot/dts/zhihe/Makefile                 |  2 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi | 55 ++++++++++++++++++++++
 arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts      |  9 ++++
 arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts      |  9 ++++
 5 files changed, 76 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..445edde8f107 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -12,3 +12,4 @@ subdir-y += spacemit
 subdir-y += starfive
 subdir-y += tenstorrent
 subdir-y += thead
+subdir-y += zhihe
diff --git a/arch/riscv/boot/dts/zhihe/Makefile b/arch/riscv/boot/dts/zhihe/Makefile
new file mode 100644
index 000000000000..553102091d4f
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ZHIHE) += a210-melonpi-v1.dtb a210-melonpi-v2.dtb
diff --git a/arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi b/arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi
new file mode 100644
index 000000000000..52015f6de5f8
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include "a210-som.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+};
+
+&peri2_padctrl {
+	status = "okay";
+
+	uart4_pins: uart4-0 {
+		rx-pins {
+			pins = "GPIO2_1";
+			function = "uart4";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+
+		tx-pins {
+			pins = "GPIO2_0";
+			function = "uart4";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts b/arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts
new file mode 100644
index 000000000000..a88e9b949c4a
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "a210-melonpi-common.dtsi"
+
+/ {
+	compatible = "zhihe,a210-melonpi-v1", "zhihe,a210-som", "zhihe,a210";
+	model = "Melon Pi V1";
+};
diff --git a/arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts b/arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts
new file mode 100644
index 000000000000..71752471c5fb
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "a210-melonpi-common.dtsi"
+
+/ {
+	compatible = "zhihe,a210-melonpi-v2", "zhihe,a210-som", "zhihe,a210";
+	model = "Melon Pi V2";
+};

-- 
2.55.0



