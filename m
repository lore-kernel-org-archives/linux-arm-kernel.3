Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0265EC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81GtGDRiZM+Jr0wJzxBhCbyhZtquK96lZBNVpjzzudI=; b=S9am+SXo4xmyDMVh5eMNvMlgZc
	ViC+uQRT0Wt7xKmkqZqV6HduceFDEuH/guwSeCG4OmQoTHTJD+BPeVTzVvHooUYE6Al6EJknN1Fxr
	vFxMlxZiGj/XqvbSGI7EaFlhJoIyM0usftweAb/ZHzPa7FqKJ39Iiwc73CMt9Oq5hWMhbYfEudMOK
	hjWh99wi/NlOpr2pBVnh7tHh3WLoGs4Dx5I1kqTUAHds0PK4kiLsnE6FoPWJmS+BSmBOCG3oxdLXW
	H26oRfc1CvbQ1TWKMFaIJsB43ba2ZUBxVa6YUosh4nnYSiB0tC9o8oJLi4zoz3FftUydHkOIaWd0r
	C0RYEPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6PZ-000000001Qp-3eKa;
	Mon, 28 Sep 2026 08:08:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6PX-000000001Of-0mTp;
	Mon, 28 Sep 2026 08:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790582909;
	bh=L3JAfB9rDunDZGmTzNF37GovFkFyKSeuFBXo+WBYgYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCLVTpalmsZm6V97YVjwFW0qFcnkPFNAuLRheXOu/pjoqVROmUrgHF0c8GX9P2xaS
	 FElLrJBXMcPaN8/GyIvfZdK3xfqqmmW3OR+eMccjYn3vJJU62SRt6R5mxjYuPYz1Qi
	 t+FuBnMdikUVjZ+juU+TPRt9ZKYElVP/pYlNHrEXemC0JOdcFY6G1QymhwIHeydTvq
	 d1MXQaKgZB/mnCfngmOw8ZYcmMNvdPW0WWsSCk1xL3cstSyyguiAtQmQiiQrdYcPE8
	 31t38XrorwJCl4FyCWXven5G5zNj+vGbgM4v6k77blBSnO0INiYtt8/bDsS8A9bCwu
	 QwzuSIoQ8M3Bg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B70F417E018B;
	Mon, 28 Sep 2026 10:08:28 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Mon, 28 Sep 2026 10:08:21 +0200
Message-ID: <20260928080822.19553-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_010831_375574_9082BCF1 
X-CRM114-Status: GOOD (  10.35  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

nxp,imx8mq-vpu has been tagged has deprecated since a while and
driver emitted a warning when this bindings was used.
Vendor DT use the following node before they moved to mainline driver:
vpu: vpu@38300000 {
	compatible = "nxp,imx8mq-hantro";
	...
};
but that binding has never be documented.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
---
changes in v5:
- add more details in commit message
- add Conor Dooley accked-by tag

 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 19528262810a..69619d2c86fa 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -14,12 +14,10 @@ description:
 
 properties:
   compatible:
-    oneOf:
-      - const: nxp,imx8mq-vpu
-        deprecated: true
-      - const: nxp,imx8mq-vpu-g1
-      - const: nxp,imx8mq-vpu-g2
-      - const: nxp,imx8mm-vpu-g1
+    enum:
+      - nxp,imx8mq-vpu-g1
+      - nxp,imx8mq-vpu-g2
+      - nxp,imx8mm-vpu-g1
 
   reg:
     maxItems: 1
-- 
2.53.0


