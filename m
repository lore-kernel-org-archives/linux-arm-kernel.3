Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AC606D812
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ICCQU9da;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BuNEFe1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O3an+/q3JaFkFvnjOlTdpdXG9frcgBLFrKEyJdxf5OE=; b=ICCQU9da9+Y0+r
	EKeoEpC9GTtPha24sJ+ouf7s3lWoInNGOFxT7jwU3Dv11zv4fpDy5ooR0zgv7J4Vxj5zOX+nqRiPQ
	WJ3c/eUB7hzsGgcmiXvHYgxl/oWWsxU4pSIRycMNOVxw4zf79aHo1+EZ+kd9Xd2kWzHJ3nkDv6IGa
	YM/oPpbagFUkOhWRO03zmFu4Vitk+3uCkMjaD4N/gBdd9/rGV6MRhirks3Kyta5ETT9NqPBTaxyJ8
	ebr5WH7OT2MgDhGwaCR1KSW/c/IMvkjiNrWCHtZSCf1Wq7F3KpbGUW8TL7a87duebetJC+FRt0Ee8
	07Y0zek0miPSFiIrvKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxye-000000009JO-3I68;
	Mon, 02 Nov 2026 19:45:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyA-000000008dr-0ru2;
	Mon, 02 Nov 2026 19:45:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FD174465B;
	Mon,  2 Nov 2026 19:45:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793648724;
	b=SbeRy2vnjST4rVn/xZbnvrA7q4EN0F28T+c1ZnXJpna9RhRS6hV4/FS4HtlTVorFwLQx
	 I71iiU12CeQuQ/kifT06NONn4F02PBfPbXEiO1HqYPmgr+7JgqZhnXbIF47WZt5zGraEb
	 Ko5uZ2d6lJWIvXn7bs8kxIYsLwV+ihJT/bPlebOP61kngdETE3VhxczBAXGHLGOfuZyKW
	 FNlMkFemQPToc8r/qrcH7zDS4A3MC3M3EOeooezXT9O/Ml6G5eGQ4ms63nlobwNUjECXc
	 27Ly8Y68DkfjIfC4isQGrNDl7JMqzSwhdFH39FiwYWjlsz7hTYaPO1NV7t2yS2xDrRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793648724;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=O3an+/q3JaFkFvnjOlTdpdXG9frcgBLFrKEyJdxf5OE=;
	b=E6/9ox+E+mFMpuSvyuoqqKfOp2BI8kZwpWjH+Lej5EyB7xXojKSB48tVEEb0/RJpdhtK
	 H6sXqfhveLgsmLuZdS7Bsc0/U+FulrhIR1wiZCThd3qzROVSNZmJK1F7X/47ADwlQcfsV
	 vk0BBnOU5MA/Vjl4RRM4jX/zPA22ldFpJSnwMXXd3bH8+lWe/dMxtQ3brSIUU+b9vfE+J
	 TwRiJIvXmX+4rOIPmLy8UE3ML4db/Vcr1NJav+CFWfBFIK1yc+TkByRD82H53HiCpvrgu
	 57xAZtIV26QGMlkEvHZNmltHTe7oMGdDyQbnWq8a6WarBQRoOY/UI7UdvuuN0zQeg+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6903B1F00A18;
	Mon,  2 Nov 2026 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648724;
	bh=O3an+/q3JaFkFvnjOlTdpdXG9frcgBLFrKEyJdxf5OE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BuNEFe1hSy4cE3FW/67KnZOMITNSCO9vDBG5qGk3IkzVxhZCeIDzQGXtfBK/QWoAJ
	 2yMz9CRg12pnPhHlYL7PWwUlfYjQDvv1kOk1MA2975L6ug4xGxDnH6T/z5x8z+I3Ln
	 tYrpzlfolinJ5evdKeVpBkj1P4P0vDru7OLKZwbQ40dNNpJ9Vik+/PvzM3aBg2VrTl
	 5S3KngCNF7YyM96aJKZhQ086EFIMFo6si5d3teTFv37DVqbWSUV4HpGHLD9lpDBx8u
	 C1z1rEM52YZVLR457Dz+5fpZI9i4/U7Mm/LQcJjPooRX1FoarksOz0TC1jUDZuYBQw
	 BlIfQGE/DFc8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 389C146625;
	Mon,  2 Nov 2026 19:45:09 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 03 Nov 2026 03:45:12 +0800
Subject: [PATCH RFC v3 09/17] dt-bindings: riscv: add Melon Pi V1 and V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-a210-scmi-v3-9-ee6b31580808@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793648705; l=1374;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=on0k3/ROjA851j7Dksi+n9Xdm06/pOAfayb1Q0RsTuY=;
 b=yw0IrnyLTxmztJavqYfKhhL2myTsoZy7TMwCtCKz6+Y7dKW/IYH9BiFXU9mExAFIIVwQZTeoY
 i4l298DpxJ8Axd6Vf7Va9DUyyrhEKnbacj0VmCMJjtdnxOHkT0/9HKB
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
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

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add bindings for Melon Pi V1 and V2 with the A210 module. V3 uses the
same board compatible as V2.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/zhihe.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/zhihe.yaml b/Documentation/devicetree/bindings/riscv/zhihe.yaml
new file mode 100644
index 000000000000..aa778275ab5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/zhihe.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/zhihe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zhihe SoC-based boards
+
+maintainers:
+  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Melon Pi V1 and V2 with the A210 SODIMM module
+        items:
+          - enum:
+              - zhihe,a210-melonpi-v1
+              - zhihe,a210-melonpi-v2
+          - const: zhihe,a210-som
+          - const: zhihe,a210
+
+additionalProperties: true
+
+...

-- 
2.55.0



