Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988ABC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRZNHUqbcuXxDbUm/osOIMCVeI1ZnqX7M1AdEi75dWU=; b=v5/c/qatEmD+qc81jREANng2Ae
	Eu7ALMH+yqGpL0gxuccGCD2oV/gQdb79qhL60LzqoNvp/4PUd8ImosMCfkuhvLuu1lLDfJbuWSa+Q
	vjywawX7tAmGdP085gBE6Ac0VkkBWMsQ9kYpLsEapHgRux4KgAIpY+adE3bhjJDfaBoCjpr8fZvjX
	djgikdiJBPtUDAPyBX/Oxd7zs0C0oUbJ1f3i7KYORYc3jOFmX76sHsh3oHzscAIKaRD0DnqjI+XdZ
	FX4cYlgOKaN/is2TCz5vLW2Ib1BdWP2YWzqcOBWrAQXzI67qFjg+HcadqkzqYvTlcXPkfvDGkIgw5
	AltTt9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMP-00000004rOb-3PBi;
	Tue, 28 Jul 2026 09:44:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMO-00000004rMl-2BNO;
	Tue, 28 Jul 2026 09:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE2F760A9F;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A1D7C2BCFC;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785231867;
	bh=B+Il3voZWOU+NfKjXmq5iEtbdl3/dZmOXmoyBUpXRSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RQt1AqLwLkznKF3DKKp46q8wYr35VOCUD2WZpqzv2DotmazIQLEbjiz7cTYCaL0+Q
	 saDA7JNK0eRSvRlquIAuVApjy0Lzsw33n+TSbGuhz8Gomlh09GtxnXaY7MJnn+P9j1
	 8/ML9I7yQ3kid1yviyywAEhfnj2VxRU6NHDmIuwkDffZETUhQqAouBkrvq0WG5kpkI
	 o3Z1Sn4HTcdzfZ+VJ3wSxjDsirrhAwnohTZ0makZSGHM+6M1vBmhJERfAg/5shISab
	 sdX1tFvJVqnXgGOYwQMcXjOl2ovUy+vZhoLgorc0zS3v3XiGZMO1DqH2WfgReED3iR
	 XzPQsZcdmtCmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C05C54F4C;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 28 Jul 2026 12:42:46 +0300
Subject: [PATCH 1/3] dt-bindings: mailbox: mediatek,gce-mailbox: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-6572-gce-v1-1-750bba32689e@protonmail.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
In-Reply-To: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785231864; l=2656;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=gdmBpbzvMM1k4WMKvCNMXHzy/2AmitDeeVQZLFqJ/iw=;
 b=I7l0tZVnlxUmK7WNVN5xygPbnShw33DIxbkF+tiJSu9jcvQCvXK5Q0Hy4J8iinaN/5Xq7Boxo
 rBXW7pEw9E8Cqn2fBX/7gJn+J4xKv7IaaiduZGi1/ykm0/8rnN3YWpu
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string and a header for the GCE constants.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  1 +
 include/dt-bindings/gce/mediatek,mt6572-gce.h      | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index 587126d03fc6..d6e93010bb94 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6572-gce
           - mediatek,mt6779-gce
           - mediatek,mt8173-gce
           - mediatek,mt8183-gce
diff --git a/include/dt-bindings/gce/mediatek,mt6572-gce.h b/include/dt-bindings/gce/mediatek,mt6572-gce.h
new file mode 100644
index 000000000000..e6d949d76f88
--- /dev/null
+++ b/include/dt-bindings/gce/mediatek,mt6572-gce.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Roman Vivchar.
+ */
+
+#ifndef _DT_BINDINGS_GCE_MT6572_H
+#define _DT_BINDINGS_GCE_MT6572_H
+
+/* GCE HW thread priority */
+#define CMDQ_THR_PRIO_NORMAL		0
+#define CMDQ_THR_PRIO_HIGHEST		1
+
+/* GCE SUBSYS */
+#define SUBSYS_14XXXXXX			0
+#define SUBSYS_15XXXXXX			1
+
+/* GCE HW EVENT */
+#define CMDQ_EVENT_MUTEX0		0
+#define CMDQ_EVENT_MUTEX1		1
+#define CMDQ_EVENT_MUTEX2		2
+#define CMDQ_EVENT_MUTEX3		3
+#define CMDQ_EVENT_MUTEX4		4
+#define CMDQ_EVENT_MUTEX5		5
+#define CMDQ_EVENT_MUTEX6		6
+#define CMDQ_EVENT_MUTEX7		7
+
+#define CMDQ_EVENT_DISP_WDMA_EOF	12
+#define CMDQ_EVENT_DISP_RDMA_EOF	13
+#define CMDQ_EVENT_DISP_BLS_EOF		14
+#define CMDQ_EVENT_DISP_COLOR_EOF	15
+#define CMDQ_EVENT_DISP_OVL_EOF		16
+#define CMDQ_EVENT_MDP_TDSHP_EOF	17
+#define CMDQ_EVENT_MDP_RSZ1_EOF		18
+#define CMDQ_EVENT_MDP_RSZ0_EOF		19
+#define CMDQ_EVENT_MDP_RDMA_EOF		20
+#define CMDQ_EVENT_MDP_WDMA_EOF		21
+#define CMDQ_EVENT_MDP_WROT_EOF		22
+
+#define CMDQ_EVENT_MDP_WROT_SOF		24
+#define CMDQ_EVENT_MDP_RSZ0_SOF		25
+#define CMDQ_EVENT_MDP_RSZ1_SOF		26
+#define CMDQ_EVENT_DISP_OVL_SOF		27
+#define CMDQ_EVENT_MDP_WDMA_SOF		28
+#define CMDQ_EVENT_MDP_RDMA_SOF		29
+#define CMDQ_EVENT_DISP_WDMA_SOF	30
+#define CMDQ_EVENT_DISP_COLOR_SOF	31
+#define CMDQ_EVENT_MDP_TDSHP_SOF	32
+#define CMDQ_EVENT_DISP_BLS_SOF		33
+#define CMDQ_EVENT_DISP_RDMA_SOF	34
+#define CMDQ_EVENT_CAM_MDP		35
+
+#endif

-- 
2.54.0



