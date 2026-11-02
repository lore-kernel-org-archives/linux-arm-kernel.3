Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DD7606D81F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zxSHDXuX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5rudeN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rmfx7QYlhFdbxH6abqp7/AYToCj2a0IViMkw7PBXQf8=; b=zxSHDXuXO5uQ7xMWQCN3XoNSI5
	t+bbiO20vqRBMlOC4+AcldvKLRnhXE6A4mJqqtgTvamX1rcT52XtR0R8V2PIbbYxZNJD9+tXZsSBm
	1j7p+siQzG/ePZd7Lp1MNajfzyoo92zvwl2867HdZOLhPd85/9cR2zwxguaRY9ksjKEFESs+z/Xqa
	iKcEKvGhe4M8mU6gUGpHoK5TzNqRT0MQaBTIonmscrfGFdnIyUvn9uVf4ioKfVMV3f2m2IfUxvObp
	DGfCDi5n0GYLEMS85vOzfSS/0z/KCVmPMPPcdgLezSVoWPrhVgU2ujUPf1DMOlxTx4/Zugl8NU0zn
	luH/F+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyr-000000009gP-0cao;
	Mon, 02 Nov 2026 19:46:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxy6-000000008bS-29hD;
	Mon, 02 Nov 2026 19:45:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4461B44610;
	Mon,  2 Nov 2026 19:45:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793648722;
	b=sIvOjamXTvZrndOeoaw0Z1RawDRDFjqk3hyNUMPR1P3G2KttkIAZXBB1X5l0TOvZ05Sb
	 AI+gC/N0lHSST4JRte7Yk9f1ReMSg2L0FeycIJqYGsGxoEwdrkGPCXZYToCgb5+ejoHQV
	 Eqb08XdUC4uwMuuuksCxHq2DaJzovlX3gqXYxcrxB8+yNX3AhMQneQpl0xBvya3BRHOSd
	 ybCtR9EghIPZfTgbFEjdeHGhcibfHCurJeVDVIC6wgKvMad5JQEOOYsuS3wYkd/ZzY7PF
	 NmeBkPBS2YvVu6qofPVHCPuyNeqrps27YHnPclrgeLdIAYpOKCNW/SfqEQh3oHd0xPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793648722;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Rmfx7QYlhFdbxH6abqp7/AYToCj2a0IViMkw7PBXQf8=;
	b=xMI+bY0x09fuhFnB0dFX/DogrCXcsLJTJi/An02AZ/ny4M1VhyUNFX5CTxPhEBlsUyG0
	 aQlcfzY/KlxZLwiB1MFCrrdq8zMqY4HOL4Men5hAs5fpSxGuqUQj9hnCc/a23YoM+lzYI
	 07c84BLidSS7S7ocGvlqG2NBy9h9YFcZrhufQHCyQLUUen/YgVYSEtqEasww2KcDwdrCk
	 FMhSOdwdZqI2bI0NkLIFUj8h3rUmDK0pknxhucgN0C7qXatDuseIwJPBNV+76fPRnrLZJ
	 69amymiMzFFUu7HxDfkZTqWfFSp3ujJNfTNmA5hsMPMmtDx4IO3s6N4QbprtOeqxMRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B95B31F00A2A;
	Mon,  2 Nov 2026 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648722;
	bh=Rmfx7QYlhFdbxH6abqp7/AYToCj2a0IViMkw7PBXQf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W5rudeN/9ftHf2uMl3BdPZ05LRbMbd3yveTCJ3gcETNplQP+7wwydsdWBk07mnb2c
	 6IppoNJDPkaHDQrq2ce0HBasQsbS+21PZ9rZ6UI76e8AfnHzhPzD1OBMHTSs9kZDG8
	 BNqvv/VUDRWHoMl7eM/gW7FzNRFBDsfuHf8TI8Dr551JP86QX8R/TcOEz46uqszw19
	 RNQ1JSqTMLtS6T6vAVJ5TVPbkLyryyDAHHwf8Pg5SrGX9KnH1smH1AMJUz/atNT01V
	 rMMALjI+pwrYgXrPonhiuwDD1BM/MO/vIvZVnYmmYlvUe0Rx9F+iifzwL9TTETVq2Z
	 0PIEEdeKApzTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 568294662D;
	Mon,  2 Nov 2026 19:45:09 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 03 Nov 2026 03:45:14 +0800
Subject: [PATCH RFC v3 11/17] dt-bindings: serial: snps-dw-apb-uart: add
 Zhihe A210 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-a210-scmi-v3-11-ee6b31580808@iscas.ac.cn>
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
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793648705; l=1465;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=QLjwbL73GqPkQVnItJ73UGwGElc2NGvSKMH+o+6GPQk=;
 b=GwTMVWufbQ3apHJbtkCx8hlRQnr+EZ3B6ni/R6Ct6tj8GjQaIdyxcUFNA6jzCIbaIHbScNRAo
 NxteGYBNi8CCG2wb3dxhMiBYvRAuuXZM8hNZ8O6SDJT8ZST/KoSAtkO
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

The Zhihe A210 UARTs have separate APB and serial clock domain resets.
Add an SoC-specific compatible that, like the StarFive JH7110 one,
allows both resets.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..a46a87e100bf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -29,7 +29,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: starfive,jh7110-uart
+            enum:
+              - starfive,jh7110-uart
+              - zhihe,a210-uart
     then:
       properties:
         resets:
@@ -43,6 +45,7 @@ allOf:
               enum:
                 - starfive,jh7110-uart
                 - syna,sl2610-uart
+                - zhihe,a210-uart
     then:
       properties:
         resets:
@@ -92,6 +95,7 @@ properties:
               - syna,sl2610-uart
               - ti,tda54-uart
               - ultrarisc,dp1000-uart
+              - zhihe,a210-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 

-- 
2.55.0



