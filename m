Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF954606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=421Ro/GW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bR7xm1Ty
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=; b=421Ro/GW5MfGGgFQGJ2lQVrMdw
	l5S+EfINBY/ujAS5J3xERpSW44IWrMEpo7mwcy5sJif82rSuPpp4iYk18DBpf6dSoDm0K6ralnE13
	sRvxHVkvs56x7zeIH45xrPdErph78KSmypnFDzCwn9JjspV0pklEpAtctozLsqBjlDw/8qYwI5Gr5
	G/jyp509jddyHFmoCy1niDwZOcA9hg9NV7zQgW0UakegbIjJvW8vYHYy1TN59HxmEsz2D8efWI4fI
	8cMC3T6VOowG3iC1j16G2uImh5lx8WTQkzZlpILJoJeL0DsE6Xvs9/xx9ZRdv8tTDVDzWc+bE3XKG
	FoezR7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjFY-00000005DCf-3AKh;
	Tue, 27 Oct 2026 15:38:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEb-00000005Bp4-12vH;
	Tue, 27 Oct 2026 15:37:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF92143A80;
	Tue, 27 Oct 2026 15:37:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115428;
	b=EGu+2KVzaXW2+DtaK+sP18j54eG/LBIEchI1zB5LzytuA1hgELdJikQB//jZjwhw8pUu
	 i3ztChLrnYpxg9Kqte9uEUCIj+WsZmBoW7mHRLvwYDFAo8dqIRarWbXlue+HwtkjGpi/l
	 yIATVrgHKPHyNCvzplDoHyVHANK55L/a5k6PxKPF/xaC0hnStIy8nAgSEI2F2h/EVMv2Q
	 0uMCPl/htuuMXtK1QLtPDg0TAcppj2s+JSh9hWOCcvBUk4IKx8nPXyB59fVQLq+/YS/iE
	 bBr5I8XbEqLrnXIObmcKUs8VBMZoSulLSGcZyWWsfJCzjLBzqZcf2ZtkgJFr1Xh1UYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115428;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	b=SRvDRoidAwMrjgsTnWGooogBZNNXuMhrh3rPqVTJ0cS3VgR60Yxe/X1x4Gl82b/5xhNE
	 6/R6DNE58TqNrGvLtahYFLPQ4BjOYLYMGP1Nz3rH5elzwl0zM5AGHzwuXiGxigBcfv1C3
	 1ye4FaSuVRE2tR9BlY67rhj66SEG8vX8GkzKZmQWmcRqxqLdPGyvFjnQ6ZWkHoAyr+4BO
	 3+3dyri9inWYO2CbHxmxmmmsKYWY64AbXseYEDFH5nNFbeYFAUued3II0Md8kTJl4kVeA
	 B3ip1G8QqkVpBpaD/dwKPW5Y+MDoGzM5yV5xKz1MIJ9eatWJqtdxdVADvPh8Jaimk2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ED991F01406;
	Tue, 27 Oct 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115428;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bR7xm1TyW/mZ+g+K/JQDfjq+WTR2Q+KQ9xV05YUFS1rrOy4h1D5+At02UypeQSNcb
	 areiyLyVtV4MdZGki/4mpnmGs4eVLPd/CW+fZYVNgLs48LYiIPEgVS7c4vZwOFLwFc
	 z3/n4HuXcNIhI/S6ep2Hyh9LuZ8xBAeCQw+RnmY0+vSKFM9+yWJLlE5GEl13ocI+Gh
	 79p2ZWliSe1hFyoIdFj7Tg3ytQyVYugzlCZz/rvkh9h2+vFSuVLPCdIAHt++z6bN/M
	 brY3RCs4vkYZ+kIr/010xWXKel5iO4FBT2XTRljYkvf3y7Umd4LxlmlWD8CKrCTihe
	 y1p70T1808Tyg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4E7245173;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:06 +0800
Subject: [PATCH RFC 15/18] riscv: dts: zhihe: add A210 module memory
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-15-74d58ce85bd8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=777;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=YcgMhPuDLQowVTt+MvNEeWTBEwtrbKzVnPLSZwTdXCU=;
 b=aUMIJL92mbux7iKL81HC8BugLUrnFHAYSK4Kw4wHQGnOxZD4j4gnfd866EGabI+4vyPwKFYDP
 sZTzA4FsxPbBmnaie1KIQJHeJ87wIlZuzcWbbwJzVsdRHl1t2mYFYd/
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

Add the A210 module memory node with a default 4 GiB range for boot
firmware to update with the detected capacity.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210-som.dtsi b/arch/riscv/boot/dts/zhihe/a210-som.dtsi
new file mode 100644
index 000000000000..a77447e402d7
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-som.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include "a210.dtsi"
+
+/ {
+	/* The loader replaces this reference capacity after DDR training. */
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x0>;
+	};
+};

-- 
2.55.0



