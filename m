Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EhcPVWiX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8IO6Onz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QShVkM2LJ8JPti4P3lg9N2gtK9rDsPbvy7dUhJpdWr4=; b=EhcPVWiXPNQc+8
	lSZWXMTzs8/XN9aDj3E78FJJnvn9e+GYf5xmJgWA3BFI7DuS7Zi1gMkjqsuxE1T9Z8vuS9L41ggug
	SM4CHvj7B7hP1qmtrprV5EZgXNrOIydCLjCTNe8QHGJV0WJwKKoBdEUdP5WmrIHRsgK9vMBlqzUGR
	2xZbHQR56XJrpvXxIux4I+ZnSu84yJz1Hvz49v5vVz0oK1hFzLVCLMO5HD5AxJSUuA3ljcZgykAyx
	5WiCg83tEce+HDOQkriZox98AOySfIfJzZWafPeh+Ce107/B6jj+MXB4acCZgiXBMwyfVMtRX2rWt
	2c55suYfM6PmGjPkAvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjGI-00000005ENz-24gS;
	Tue, 27 Oct 2026 15:38:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEY-00000005BmV-25qF;
	Tue, 27 Oct 2026 15:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D35043D5A;
	Tue, 27 Oct 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115426;
	b=gGAz2b/ClVxpgQWPMd9PIgRPDw81mQcAUiRgSOIP0RbdgEonvbjJLjiEmlakpLNW7DlL
	 W2wO99R/gB8i5IqGSQ3XlYMM0cPrmownof0LpRbXvrCy0Y/zcl5cVfwi9iAM/FMXodjPk
	 DzJAR0Q8zOlrrBw7VHisJOl9YileN9QGe3uRh9DQNEYQ5ReTidvZEe07pqn/Hh6ZinsMq
	 Xp6wGFhRquchDX4Ba9m9PFjIUZ38f59DGBQmOQD8mUD6/TkRU/MIInDZxbFmOR4ctZVO1
	 clQiVxRwLi+Hhqrcyos/wo10zSKMTCn+PvxCTzAs9fAhEkSfT6lrOMPa12lcLWbAhkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115426;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QShVkM2LJ8JPti4P3lg9N2gtK9rDsPbvy7dUhJpdWr4=;
	b=iBTZy573CmuOZw4k+Y89Nru7N0Rm41VKbyLyZY/xfNwYpvP7BTeaNg9T51pT/aEP0825
	 XS0HF8OnKNae7sL7OM3t2Rc/ZNpscE0otfQW8e6Ug1BBmkWcdh13q2zkHtPEmAnQ/SUN7
	 Qd3B0Edxq64mqNmj8kiSyB2WFhGO7PU8LJX3h41o3lXiS3VkV9zobbnDVO6/7pmNuINt/
	 iYXMXYg0VCUVpeRV3wDjiAixALL+qPF6/+LVl+VLWQiiXo9kDDslF/nNEz423+MQUgEqD
	 o8xozq787cL0U6nh7lK3ri7NdFrQdPK5dB/KdM/Sr0KpvcYOoINJM9ZAryizkZZwtMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C65431F031F3;
	Tue, 27 Oct 2026 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115426;
	bh=QShVkM2LJ8JPti4P3lg9N2gtK9rDsPbvy7dUhJpdWr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=h8IO6Onz8MkhKPU1CNdCpKvpe1gwIeLZln9hTTOr8nOUB5oQcYyfoe53aaKNT4CV6
	 QA76zIbh/UjqMbprsn5TzxWzbhJf3B4n3chIbaKatgkFfRgXyl1HJezr+10nNf+xdN
	 TU+TWH3vvfrNTcLbhLAlgHLP35C+tY1sOkWLyKehXvU7bSxnCGfeiiS7G9XEomYqCS
	 Ic7bGBQFBh45Dd2u98jeeLuAUH0d6oAV0PgPRrckAM05yqtq4TBrzDnlf/AtdG3W7j
	 dZcEHGm6faeLuqAxLIABBVQy7Qp7WgQXwooDDRBa0mmjQbhzjgH9SNUVfmXxFn8X4I
	 1CuKufpAiqg2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7E8BB4515B;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:00 +0800
Subject: [PATCH RFC 09/18] dt-bindings: riscv: add Melon Pi V1 and V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-a210-scmi-v1-9-74d58ce85bd8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=1321;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=h9FV4C+Ue58b+AWtFVeYgWLXZsICp/RdVjsM7aslrBo=;
 b=CXMz2z2iXxjnfF4FICVgZ85JK65I0vMGVNWQqfbZmKmsQaO1DIkvh/uwxjNNP/AuYvBX24AVt
 yUGdlNRrycCBPvwSK75BIYWUSxqlnEQbIurdbFbtLdojF82lIY8jxF1
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/zhihe.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/zhihe.yaml b/Documentation/devicetree/bindings/riscv/zhihe.yaml
new file mode 100644
index 000000000000..92ac0a99a687
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/zhihe.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/zhihe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZhiHe SoC-based boards
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



