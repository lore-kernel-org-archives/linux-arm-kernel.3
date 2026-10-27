Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76945606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=06nPXA2k;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5/jYBOM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q5sP7zJDVKsg8tL+CekeKmX0pZ6GZsu9tbiTl6q7uqI=; b=06nPXA2kdC0Q9Nm8t+fEc3YCuJ
	Ks5JLX7eJpFbAW5vn3LdOG7EkkVcoXyJKcg4z84U29bQHjbWStlqNN29775Zk4DOq3ukrsqREXo27
	ig2zwCkfdhvheO/seqUJDSHhN1BDZPmLeVUL8e79iBBgomftRUabkWc6yi6wk8j+KJfQAs9ANoTao
	W1MdNcQ6vU268l+SMFwTj76K9x0AxE5m+x3m/Qla4zZ9P36Uab6z8r9NOQ3flewB8T68A3rhVq6Qw
	XrhR04Fw+hJG2lA6oZl7QPBa1kWf+9J5gp0efC3JS791Tv4fJQD6aKsB5gLeevEWppnaXcZeMq2hZ
	5x2tbr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjFY-00000005DDB-48jh;
	Tue, 27 Oct 2026 15:38:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEb-00000005Bpd-32Hv;
	Tue, 27 Oct 2026 15:37:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72CCD43D86;
	Tue, 27 Oct 2026 15:37:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115429;
	b=WwP3l3zFIke3eIhqzf06II2bPE+MSD5JIoTKwNnIWXAJFDKaU/d+mjQq9VS6VxPU2H9P
	 fR1qPAo1DFp6eNy/lF2RhooigvtxheVl4aUef138j3RbAjABEKpYFXIMwfqmklWupfVIG
	 c9bckL6z3GkuPaa3E71fem8gljz3t6wao4Sl+MPzGsID59XhWathywLQno3WcvdyofKlM
	 UrTN+b/t2ge2X0CZa6qtPqv0y73F6WVw3NqpGOiwboAXfu3lZhAfSS/s9/i4lGDz2r3Ge
	 Wg1ypj89FRKL07wAffd2nE+hnn0vpZK3Tt7s3q3ZL7AUxgaBl4jI3ewSA2dM8W6aKiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115429;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q5sP7zJDVKsg8tL+CekeKmX0pZ6GZsu9tbiTl6q7uqI=;
	b=kdcZbdN77xYGgp+RI102ad2eN8JpPpOxLsYZm5LMv9B0AceV735HynuGGFsT0nAbqwZy
	 7DVNiIF+gl6cnvQEyDzt9/w8piGqmsr6pw85QgSyxfX4TfIlc+neQXd+ODjQzZkf6EWOV
	 M/GRNQOshCeIBttzgtPT1LHFfNMgXtSn3BQ/SdF1Sl7eZnRQGiKXN7eolKvVKeqrDoGft
	 btiDZzfTI2ySM/pCRmPN7inHpHBTKlHbaAYqIRQvucL3GMBPUtqS82CH9L/A/QLcFRVbQ
	 Cv/l26cWAOkBerBzh45vISnnjUgmY/DUa3J18soQiQhGAuq68dSFVabk6iiUJnMWJlw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 735A91F01408;
	Tue, 27 Oct 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115429;
	bh=Q5sP7zJDVKsg8tL+CekeKmX0pZ6GZsu9tbiTl6q7uqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=K5/jYBOMynzC0NNf3smd+hYP3hXm2F+kTFN4AncaIQO/qXU6AWaWoAL3SLXFMYuZU
	 B1NALvBBakgDIUTbmHik9ZeR8QHN/onpb4mRe25CW150pkCnOc/KTplHItzsVL4096
	 TkFr9yOB5xBWGlftJSSSenW4Y84gAWLrmf0iJGl963O5CSvZdhEXSDwbNAnl0fEOba
	 xY8gripuaPsO9JxT0QWTkYwEEd2aMt8Sz0BKmymGmN0bklDO9kuUqIcEFBOKNglfTN
	 lp8uQAvbndrDy2mjzdeL9WEiJ9MPgQY4P2TMT66cVjoMmy8Xa9I8dT+a6Y1bGZPs46
	 zjU5MLRwwFgcA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF6A445177;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:07 +0800
Subject: [PATCH RFC 16/18] riscv: dts: zhihe: add Melon Pi V1 and V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-16-74d58ce85bd8@iscas.ac.cn>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
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
 linux-serial@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=3373;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=oY4cd1y5LBziUvIW+aG4iF3iEAIqMm4nbEZQYJakX5E=;
 b=4tiMJ27dq3Tmofw0aIhQnF/GFOKjJZclGrfTcCcOZ7U4KV5DotcDPjRSTf9e99e1z17caZh2u
 WaAJAiTV8wjAkN0lTpG1Wndpa3NLV+shRaP/Yd7Q0QoCnNHHmrDzrmg
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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



