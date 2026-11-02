Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EE606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3MvOWr/G;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZutfjvTW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aCo6XwDUGKHrJrZqVvT8fOWO5dQALu2JDMEOxosLhT4=; b=3MvOWr/Gmf+YPp4wbsPqZBhVkL
	3oUfLV7Br3hkTSS6jY7JaIM+ITguNZoltkMkrIhg5liXk1PpyK21MRjyTARgJrWWx+dEsFeHOOC2n
	ZPTy85S2xjNVdEOFXFD+gtPUbzrv00ht6sYE6bfhEcqJoWTd9tD2CwTOwS3DlEbaUDVkoxvfm/3tM
	iD4/Btvgkki3cjlE/qLBPgkMFMIjLDE1eaf/2GyWbmkCzdaaK4vli077OYTPGC8La2Hn+spvxeto3
	NTw5DxpJZXP6jZ9hHnZhVo1Xf+/S3lrvORe0CZjPwnbQE5gBUfH5odIFeBJTwvK39GW8era7DKwCx
	hFb5gGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyd-000000009Go-3oEd;
	Mon, 02 Nov 2026 19:45:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxy8-000000008bi-3iiZ;
	Mon, 02 Nov 2026 19:45:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45FE36021A;
	Mon,  2 Nov 2026 19:45:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793648724;
	b=yWcmbEounmY9uf64v9G7aVZ31gcsDY07i/6mPm6qumkRig8ZfmrEcerEgKpVbCKC/TYX
	 EkbBTcQGY4e9UE+xLTZm59QFx6UNioatBpXk91/ryYpi9Ap0d/0W4yjvL+k3IlQdQ9psW
	 mNfaJSqKBjwJX6/tR+lcl4t85v4X0vJ4hSvF+QmpErjbHMcKc1mS4jATiYj0UeT0ocToB
	 jCUcO32NyNly52J0vLlj3eI72TnJBkGs/oIjtmsWwInzUPr10Fr69p0lWe2LIiw1Y4FP4
	 XoJ/KWBXC1ZnkmG6e1OXPYagNejWDsQ++gBZsOV2TVe7gpQH8Yx0LfnLRwdpgMABz3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793648724;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aCo6XwDUGKHrJrZqVvT8fOWO5dQALu2JDMEOxosLhT4=;
	b=MteQcWtSHajKSdjAKRep6PIMxlkuppafRWa2ehywROohs3dID7SAN3BGi565cOvuYN0L
	 R3a/wJwGsAu8o3axQNNZ7J5xpwIHFlOlF8TaKTfi2FxIeMjI2M6Wq7f7sKRyELVtphgeM
	 YXDEF7NiCnjrgfV8lQtJFp5THK2M13NhiHchjDpFoWfzr3nWxsJmYNlGzQX85JDJja/rL
	 SuM1fSSrUnv24EcPzQWYiq2V58I2rKkmt4JlYmUU09rqvRepJ6+83l/NstY3OBYVgUEzF
	 K+l1KBwvNkhLm6sFjAALiGCl5Up3oal6IiOfvLFiu33dOCPOKYMQi1JQr3nyTDKw6JA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E33651F0180C;
	Mon,  2 Nov 2026 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648723;
	bh=aCo6XwDUGKHrJrZqVvT8fOWO5dQALu2JDMEOxosLhT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZutfjvTWEPO1jGYl550spBI5fhcN1W+0bk0lJ718Xoss0uKIU853700AMNV/tHRQr
	 m80mjBTO+YGoDHNCBUK3V2Ia44Hiig9dmbIJsrNCgMS6QLUHbvZG1bKCKguv3du8MC
	 a2/D6nXCyn90NYZX/csgtKtVu2PCYk4vwx7UkG/UgN1lv3bzh183tZIIfxDcU8Dsnl
	 1gfTCZ/chQ0A61Zi63dNkfsIFw8Uy7aHI043rI1TDVzoJ5k4P7hul1guYexSYrOUNj
	 zZ+57iLPpjPRNfZsB+Mpi1JeVHXtPgsha4SoM5KhIhRjR9mytWoDODXgViJksb12Bc
	 AfjLvB6xEuRuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A62FA46641;
	Mon,  2 Nov 2026 19:45:09 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 03 Nov 2026 03:45:19 +0800
Subject: [PATCH RFC v3 16/17] riscv: defconfig: enable A210 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-a210-scmi-v3-16-ee6b31580808@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793648705; l=2125;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=gbFp8UQIqmjgXxLfsth1MuBUL/I680UNXyToqmM6t9o=;
 b=Dh1vBF2bkMeI2CYu4RYDr5VU3Y4Lzwcq1wHwve5KVlRm15AJiGEerFvfdmFnAHx8jRLA7J3Xf
 rGIOiX5jaYICn9CAwkrVPMCQ0Pg4LKJ4MVDn2113pKtBU9UIQ8xi3dN
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Enable the A210 pinctrl and mailbox drivers, SCMI and the SCMI clock
driver. The SCMI mailbox transport and reset driver follow SCMI by
default.

The A210 has 10 UARTs. With the default of 4, UARTs beyond the 4th
don't get a fixed ttyS index and end up in whatever slot is free. Set
SERIAL_8250_NR_UARTS and SERIAL_8250_RUNTIME_UARTS to 10 to keep the
index stable.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..e9275be22e8c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -34,6 +34,7 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TENSTORRENT=y
 CONFIG_ARCH_THEAD=y
 CONFIG_ARCH_ULTRARISC=y
+CONFIG_ARCH_ZHIHE=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
@@ -111,6 +112,7 @@ CONFIG_PCIE_STARFIVE_HOST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_SIFIVE_CCACHE=y
+CONFIG_ARM_SCMI_PROTOCOL=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
@@ -149,6 +151,8 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=10
+CONFIG_SERIAL_8250_RUNTIME_UARTS=10
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
@@ -168,6 +172,7 @@ CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL_TH1520=y
+CONFIG_PINCTRL_ZHIHE_A210=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
 CONFIG_PINCTRL_SOPHGO_SG2000=y
@@ -255,6 +260,7 @@ CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_COMMON_CLK_SCMI=y
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
@@ -262,6 +268,7 @@ CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
 CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
+CONFIG_ZHIHE_A210_MBOX=y
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y

-- 
2.55.0



