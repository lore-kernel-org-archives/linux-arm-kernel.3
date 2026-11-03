Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FB1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+xjfw9m;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJi0zXMv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ja/5Mv/Gop/oCSkbd+7+q5gBCpKe4wRAQI2mzWh3K/A=; b=L+xjfw9mi7aLGVGX3hxTHkOzyn
	SPeYuqZ7R0ICiKmRtDl74CYfWQ/sUOwO2X+dK4EaIaYSTAQaqcyinWPAQEYd07FFd7fh/VLnb88qj
	TSgh9nDTk3xSfqW39bpsRfeiFQ4xUvDRazCpJRh+0rCqn6odJTpf6zP8oABUoG1jMcSFGt5plyTWQ
	qLzdjnCojyPzJU18EJsbQRIyAWkRuN9pUibbarUm5sy7atKQ8HMEj5DDP65rrwN20Uho3IbsEJdHB
	YDEp7O2jc74dlz+E6bojrFiJArpCXCZyADUudX9fmq9YydB4+lpmmTYmuFMQ9f8Y/jchSo4NUKaZq
	z6N8WiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ0F-00000003N6F-3t8V;
	Tue, 03 Nov 2026 18:12:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ0C-00000003N3a-2vaV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:12:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D15EA6022B;
	Tue,  3 Nov 2026 18:12:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793729575;
	b=Kcab7kIHKWSY5OR2wy+5jn+DT5z0hkvp/hqb1mZkfThZGaOVnDqJw0r8f6vmzOKJd5tD
	 warCxGkxHNldeWFGslyNDarukCSLv5+9GpoIPWYksyL2AJoB6AwUHW5Nc0u6A6dK2ZYdi
	 bXGavUZbQetXYpWEm4mIcL5vZr8tDOR+8Bii9Z/De0uBSNmGUYa3N/o7kzD/QuRFdcDpG
	 y7LRRCG0GM9XHGP8D7bfTIaQFCWwALQKALW7Nw17hCooAtXuwvIp8KpdUwk3RKrm58Kmb
	 e9WiIJIahqfuNTz6Apjj8N4Z7tbyq8gFeFl4T7IrMKvgRfyBn6fIwFxQSyF31Q5+Oyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793729575;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ja/5Mv/Gop/oCSkbd+7+q5gBCpKe4wRAQI2mzWh3K/A=;
	b=HgCuoLB6IQdRvscUKvVX776/IVk7H/d7FXS6DmoWQxJoeoBsm8p34sLfTnMirhnY+HQ4
	 BoM1txCjrlbWbFR0jHN98Ahuia3cxp01+ZsxIP6TiitJvWeKdGqpbd7PBzdUZN7dVyzsX
	 VZFaShvhG35kGKLk3wIt5dUQodQULzGXoBDUxW/V93yNbei0lQQ0ajeVRZrvTrAGsOlKF
	 WQWNdoRbE3US2IQB+70owdgKkZ7YSQKnMMORYTkCYd4On/gy8dxN6pE+VTsMFil4lkGRT
	 UNYs4rBqF8YbPE0W5JpySu/81xcgQHvvK26xbkK6dj2bpfkJwi7IxtdlmsBx915skhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DDDD1F00A1C;
	Tue,  3 Nov 2026 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729575;
	bh=Ja/5Mv/Gop/oCSkbd+7+q5gBCpKe4wRAQI2mzWh3K/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OJi0zXMvZEbFNQR744kZZclXuAaOdLgDzcnRoyCWuQEGbddkvJjoW0kdfjcTaNL8k
	 kyzc5WVPyHPLHpnLRpykJlH7NNk2Jg6YM20hl15YGSivge/Wb6BrGh4Tlmi3YwGzQR
	 /MpU8u53wEXOBqIyA3UG8AX5JXPlOVsA5Mtz6FmAVKk4AzHP7IdcSdA3l06EwRxsTJ
	 EdfKqm89Cc7UuSi3IuE66zhhmE/wghdkbSGnIViZZSkwrxpTGmosW15pYU+4Ao/YNK
	 rh/g0SmwcC+TPM7NlII58Jj054tQq0IDJXoFr75c3/+WG7nHpIRiQs4pYniC6IhPVL
	 bsI5BLAIlE9Bg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E91046A75;
	Tue,  3 Nov 2026 18:12:54 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 03 Nov 2026 19:12:10 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793729572; l=1598;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YA2Jv1p1SkYZyf+rDzE5uX5RrqHER8WNy18Uw1BptA0=;
 b=BuYXFKVa7bzqfQNlLlL/JpWV4nMUvbYRC0qmNKHkyzhAszW8PB0bokvLsaF+vQSiSGNzvmZlg
 89PcYFMXPqgAHrg/pg8G5LGavtJrFyt3QTheTm3eXX5Oq0SPWpZKSH2
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Jardin <vjardin@free.fr>

On the LX2160A the DCFG node holds the pad mux, overridden through its
DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
populated, and the pinctrl child, on the LX2160A only.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index fc14fd0bf84b..dd6a00ba04eb 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - fsl,ls1028a-dcfg
+              - fsl,lx2160a-dcfg
           - const: syscon
           - const: simple-mfd
 
@@ -62,6 +63,12 @@ properties:
 
   ranges: true
 
+  pinctrl:
+    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
+    description:
+      The pad muxes of the RCW on the LX2160A, overridden through the DCSR
+      view of this block.
+
 patternProperties:
   "^clock-controller@[0-9a-f]+$":
     $ref: /schemas/clock/fsl,flexspi-clock.yaml#
@@ -70,6 +77,17 @@ required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: fsl,lx2160a-dcfg
+    then:
+      properties:
+        pinctrl: false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0



