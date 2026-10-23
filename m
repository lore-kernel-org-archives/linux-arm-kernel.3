Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1K8oh+QD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0POjIrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RP+wGLwxKYoAod7GE+6oV0+j3m9xy2QQCT3HXAWVsq4=; b=1K8oh+QDovpImr
	fllwRksUQbpnE2a0E3KdCEA7MkvIQkqiMfvlVGmWjciJgRk0TZyFTYCsK3kVDMUuK9eBEy0Fe5tj9
	eP+pUdUJyVVJzWDngV8HI0jR0riH+82W2TLMMuGzSHSW60aYbJ8RFaGQP72kj1vjXISVdKbwBJizt
	6Bt9b/C6PX+qdsgPgGBD9LX4E3x3hinC1gosr82SBnbbCeMJO/SyGjuBodVZl3a/MYL8/t6/DhmXW
	jyHgQ++cYN109IIYUTuNHuk2QQ7ztYEn++4z0RFZXhBzB3fQ9NcTPRQ72SaXfF9+b1qtgbfx9SICE
	IdRuEROUhPR4DZ95Z9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKG34-0000000GUVK-2nxv;
	Fri, 23 Oct 2026 14:15:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKG33-0000000GUUn-3CKM;
	Fri, 23 Oct 2026 14:15:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D914143437;
	Fri, 23 Oct 2026 14:15:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792764907;
	b=JrWd42xVj69pq+FTg63lFgTFJbwhycvvYy9Pa7VPq6bsS32ciYEDRCO2jvP764w7sUYE
	 nqb6IpuI3CFYN3m75PEK/rafMqG4j6qsgHETFRfZquHNdAWm6JfCjeYYHFP8MA/7Onumo
	 C+FuAlBkYHDfNEZhefHpiKtPe/w11EDgju8ZoV5tAFFeEw3h8oVLuyR4J00+Ed0ehK6cr
	 v5FDncCNYQSmTliTMBPB47bmJvFT+EAJ64O4Ul9VU2Q8qA9U1JJY8LaQlflj08j00QjbC
	 7W/rAC5NxwaCUzzv9Dxg8ggtGTyP9DCybC7/YPyBQT0qL5rYUzz2Zb/CnyjsSqoqXyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792764907;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RP+wGLwxKYoAod7GE+6oV0+j3m9xy2QQCT3HXAWVsq4=;
	b=oXAKippgokboC5eyTHERvOJa6zu5mbCbpTWpqgXN7rq39aA7XIoZn25f7r/q26ifXGGj
	 wRFzfcIAaM8Ot9r+rvU/SMLqNanwLMcJPg6TdWcfaO8Rq2la2eTCGPfJC8In/xPaNyr8R
	 wPoiCXKm9xji6a7YXVCptJAYRqIagYSibiaYK9wFt+yKCOum0uyPbArGVKP4VRERTXv2a
	 L8/Ni44/8g9h9akzDdiSbsOSZGaT61ip8eD/HIiK46JaZ2Ga+eROEOHOJFVsAWPigXwh0
	 br6x+7RumhOOF/KZe1fVoSCrfiZ3iBsxm4D7VjCUCnB3KxF0FdaF6Gld7zE9i9SIO2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3778D1F01825;
	Fri, 23 Oct 2026 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764907;
	bh=RP+wGLwxKYoAod7GE+6oV0+j3m9xy2QQCT3HXAWVsq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f0POjIrbCLOe2J07CNJoOG8nh0WgSDQLeSz/hG4tlgsGSZx/VLoztlv59dVB0wNn7
	 eSSv8A1QValKK+//Efr2fz056SG8k5AwBjZAlYVPOLRv8/lMxsgdsom3FRZfcSnxiB
	 ecFfEJQcyYI1bh6w13w89UOHO2FmmXcjknYS2LLN85pbL0oRFTAloGrOt7yuJVrwSR
	 JtnRmLvLWulgapi19LeCHpAwwBBPhx7s7RFbbswNTl9NFa3zmBqDiX7wgdYF8gWxNn
	 n+WVFuqok5lhhC2RhswlLYnVJkGc5O1K919dnJpcaMbWVCsOwgY+JEg+L+jBCQh1tU
	 psA0OD7bQ/Huw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92D3D44535;
	Fri, 23 Oct 2026 14:15:06 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Fri, 23 Oct 2026 22:14:59 +0800
Subject: [PATCH v2 1/2] dt-bindings: power: rockchip: Add RK3572 power
 domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-add-board-ok3572-c-pmdomain-v2-1-79ddd42e92c1@qq.com>
References: <20261023-add-board-ok3572-c-pmdomain-v2-0-79ddd42e92c1@qq.com>
In-Reply-To: <20261023-add-board-ok3572-c-pmdomain-v2-0-79ddd42e92c1@qq.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Cunhao Lu <1579567540@qq.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Finley Xiao <finley.xiao@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792764905; l=2755;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=yMzCyaLHegkny0sbJwdEkUgADvLcEUSeHq007zGMJrY=;
 b=EbHuNCF42mOSnEIz5wEWNmwrzBUeQ1RCs5I9Xb+Y+gFqCI1taFvla7Kv74MSVxE9Vv+TSNyst
 QS3B9QedJzCBCikkEdR4q5IPsBcPDaHNXdYTx1IsGtL5BC6Z+OEt50L
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Finley Xiao <finley.xiao@rock-chips.com>

Define the RK3572 power-domain IDs. The driver uses the system GRF to
check firewall readiness after powering on a domain.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>

- Added the rockchip,grf property.
- Made the phandle required only for RK3572.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 .../bindings/power/rockchip,power-controller.yaml  | 17 ++++++++++++
 .../power/rockchip,rk3572-power-controller.h       | 30 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index b41db576f95d..f8afb0fabe80 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -43,6 +43,7 @@ properties:
       - rockchip,rk3528-power-controller
       - rockchip,rk3562-power-controller
       - rockchip,rk3568-power-controller
+      - rockchip,rk3572-power-controller
       - rockchip,rk3576-power-controller
       - rockchip,rk3588-power-controller
       - rockchip,rv1126-power-controller
@@ -57,6 +58,22 @@ properties:
   "#size-cells":
     const: 0
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: System GRF with firewall readiness status.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: rockchip,rk3572-power-controller
+    then:
+      required:
+        - rockchip,grf
+    else:
+      properties:
+        rockchip,grf: false
+
 required:
   - compatible
   - "#power-domain-cells"
diff --git a/include/dt-bindings/power/rockchip,rk3572-power-controller.h b/include/dt-bindings/power/rockchip,rk3572-power-controller.h
new file mode 100644
index 000000000000..c2316fa859df
--- /dev/null
+++ b/include/dt-bindings/power/rockchip,rk3572-power-controller.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2026 Rockchip Electronics Co., Ltd.
+ * Author: Finley Xiao <finley.xiao@rock-chips.com>
+ */
+
+#ifndef __DT_BINDINGS_POWER_RK3572_POWER_CONTROLLER_H__
+#define __DT_BINDINGS_POWER_RK3572_POWER_CONTROLLER_H__
+
+/* VD_NPU */
+#define RK3572_PD_NPU		0
+
+/* VD_GPU */
+#define RK3572_PD_GPU		1
+
+/* VD_LOGIC */
+#define RK3572_PD_NVM0		2
+#define RK3572_PD_NVM1		3
+#define RK3572_PD_DSMC		4
+#define RK3572_PD_PHP		5
+#define RK3572_PD_AUDIO		6
+#define RK3572_PD_IMG		7
+#define RK3572_PD_VDEC		8
+#define RK3572_PD_VI		9
+#define RK3572_PD_VENC		10
+#define RK3572_PD_VO		11
+#define RK3572_PD_VOP		12
+#define RK3572_PD_VOP_PRE	13
+
+#endif

-- 
2.34.1



