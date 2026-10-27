Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31B606AA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DvrWv6C2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z34K4R3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hwTvj8kvx7kCl+NNi9DA0xJSBtLAzcLn/PCRBAcCdhw=; b=DvrWv6C29MVnfKs2cfuyCCYHOA
	DhQr4Yts6DUBIb0pmzV4OD+7oN8yYePyVWJ0/charfDx15W4cm5I6DFab6fxdoo50ak3xIQt98zV7
	FjcVi5J6NlgLoWCpv8PyV44Gnh9UAkZFBn8grrsE6gm7EovhaSvRXNu0moDyg/1AWOk5UBGUeKzpg
	3J8hLgYOieBkkoQrQbExD3N9VH3bdqov8HtuwYYKtJs2QJzSSpd2cOCjI2mpWdmFwJaMq30tZluWn
	WT8BVpModehAXYrlgHTiwOPVA33sfA/Hf05QWtT138eYXrhWNDxSTrgnIqMj3riC8P2TyMupmiGth
	GCsi1Bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjG4-00000005E06-2PTT;
	Tue, 27 Oct 2026 15:38:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEd-00000005Bs4-3Ybp;
	Tue, 27 Oct 2026 15:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 170D36025F;
	Tue, 27 Oct 2026 15:37:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115430;
	b=UjdZxev0JMh73idLZxrDbx6qNx4eZvvHdOcrFKJ/OYgR5I65c1Mq67zCewYy5xiT67eL
	 fZSuIdeCo38bIipizgjCVt95RJkcLLJcj4xnbN3Rp6kdbDRhftqLcFOT54vz+Q5I9uMIB
	 Fn9U44VWsFCJPLbB08oet3PzMnHyYfRS8843oSz6pdnzltKQxzegMXHSVzILZ72oYHvu0
	 Hgt62NSoDI0rDsGZZuXAZMoD4qv1dyaUDJ+Mj25/JFmNn4aJk2hGUQC4RLjQXQIcVL7cS
	 GImOEyheRa0mVFjlIBmUDEMv1uormwhL+PxtvIZ5mXqNJpLcoS3mqjdJd2TyJbJxWdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115430;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hwTvj8kvx7kCl+NNi9DA0xJSBtLAzcLn/PCRBAcCdhw=;
	b=tQMiOAg2mpNbIvjS6czjMW7d7G3hGdRXCkl2W4vy2gvJRWrG3JHahvaSAYhs+tr5R0WW
	 +o9gDjQ0Qyhbo1ikL6FISEgKOnz9g2OP8HH0KroiVWE9UuJnyqhSin59RPLuza3236L+J
	 j6Mxz4oC8R/LuUONwylz1mbR3XhU6VlRZjX4cgdu9TVw/U0ovoCR327rVqVxIgCkIm6wt
	 A5T0Rc2PulTzsaKcB3M6+WlVyOcm4DutEOf5ca1E/3wEyLHOkl2CVoxnbxepJ923fxpf1
	 /e0VFABxZFdXeDN94oaZa7hI0upWULUjfc6tM9K4oKgUm2GMHOaKBKiq2XM7pbwypaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBF3A1F01414;
	Tue, 27 Oct 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115430;
	bh=hwTvj8kvx7kCl+NNi9DA0xJSBtLAzcLn/PCRBAcCdhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z34K4R3E7KogcCvkEbENyD/hZ5iWtaER/bmrHPZLgjUCkulGF6Oihd3QTK0z+iRRn
	 S1smm1tBnr0gd56A6162lpHDzLbWcU49opxSG7cc20r2W4Z3OvK5kusosx54OpWKpy
	 IfXvQDl569AN6ckIwnBStXeXCzqgBa+935TbOKq4p8nOWXPhotQggbgGdB7WL7kVNK
	 BXSMk/ZWBPUEjaJZHzLdS/Az+No7acy/y3rYWxfrBw0WpoZgTGWx66Lgrdu4lhY2Ei
	 4c9wExsiN13hajinK2/ez6Sa9Y+z+6LffTdDJNqLfUAzuwiaYCLmB0SrjwRCwRJudN
	 UaxD154N5hkIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DA2DB4517B;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:08 +0800
Subject: [PATCH RFC 17/18] riscv: defconfig: enable A210 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-17-74d58ce85bd8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=2441;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=eAfD142qqOegiKKXIl8oNxyczfVf35BqTLu5AYylfSc=;
 b=5rQEWh1ufuQftCFfr2HKZutyk+sL0V2JGANqtYHunqZL6pI1rX1HSHn77Bvu0YAx49muOw7j8
 niuZBUDHXRqDXNLNx4WcrC+3POrtY4mJvuQlWDhp2YA6Gl/dfD+OCN3
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Enable A210 pinctrl, mailbox and standard SCMI clock/reset drivers.

The A210 has ten UARTs, and Melon Pi numbers them through serial0..9
aliases with the console on serial4. With the default four 8250 ports,
the ports beyond serial3 fall back to other line numbers and no longer
match their aliases. Reserve ten ports.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/configs/defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..b4c4aea6eabe 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
+CONFIG_ARCH_ZHIHE=y
 CONFIG_ARCH_ULTRARISC=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
@@ -108,6 +109,8 @@ CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_XILINX=y
 CONFIG_PCIE_FU740=y
 CONFIG_PCIE_STARFIVE_HOST=m
+CONFIG_ARM_SCMI_PROTOCOL=y
+CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_SIFIVE_CCACHE=y
@@ -119,6 +122,7 @@ CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
+CONFIG_SRAM=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_VIRTIO=y
@@ -149,6 +153,8 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=10
+CONFIG_SERIAL_8250_RUNTIME_UARTS=10
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
@@ -167,6 +173,7 @@ CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL_A210=y
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
@@ -255,6 +262,7 @@ CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_COMMON_CLK_SCMI=y
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
@@ -263,11 +271,13 @@ CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
+CONFIG_ZHIHE_A210_MBOX=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_RESET_SCMI=y
 CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y

-- 
2.55.0



