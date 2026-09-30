Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB31CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5jOn257uD+vUpNTAAtc0CjK384g6KS8wG7pHoI4deM=; b=ZJ1xIqqIfO6O0jpMUYg2q1HBmB
	h5KeWWUztMu3RO9dnufo1QUZjZXO7HauazeLrHqUGECXQSNcivOg6LRKa3MK1pfxEgi/w19jdY0vi
	bXuUDzxe+CXWl0Vg0c7gX+0k8Y3hkJhm1CLLgNvDEvzbmL/dkGt5jJU9sqTVW5tb/t06spcxl6M4E
	N/9dp/AjZTAfVRCWMCPN53C9RyUAs/jTOZfk8shg1vGaE5VSoMG/LCWmY8jdx9Mi37ZN5px4fdozo
	L5c7f4b7CwLW/t/xPTtVFuT63OAlkBr6eFuiMRFrdBF09uEAkUP0/dIZQUaesUQNHcWDSNlnytaUT
	56GxP1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvze-00000006RyL-1j2S;
	Wed, 30 Sep 2026 15:13:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvzM-00000006RnS-0Zmd;
	Wed, 30 Sep 2026 15:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D5jOn257uD+vUpNTAAtc0CjK384g6KS8wG7pHoI4deM=; b=j5KEYuL+tJuJx8IENc/tv8VAOJ
	gMqJwfBg1fh6DHTPGbFEPZekD8OmzujRN5BpJmDaSxq/SDyFxhB2hGpTApwYNobnQJSHiXTpPSxZc
	O1Qfy/b5e8FBb0kxT0XVUK6pEfIvE61VpxXGFnI9c589jZT8BAwWqDcJI3//buJy8EzZxucGRU0hP
	K+dQ4OdmsZGRLzm3QaGrH8FgsrghwVLTSk5LOTwsof7/p7KO8P4qjaO7/TdTRS1OsXb5DtfOakr1V
	XgzELvEcuv7AOx2Yicf7eDtXKA0sFejT1BOaQjg5zqS1hncClJdyGKUdB9+AZhZL8uU/iooALskVP
	o8rzo6ZA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvzI-00000003yRq-0QNP;
	Wed, 30 Sep 2026 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790781168;
	bh=S0WsyTGzpzbVbWSeET0rlW9Cuja8kSc60m8JARgfnIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/4FdQGW1AXthZNYknamkkPstOSrQljxfgS/EIAUVJCc5LA6S5EMIra3QmWLjztkv
	 r2VrcyJy6dt1hswLVLZJ+sYTx+tytPmUhj72cY42pF3HTsfYMBGoQjqcVHn/fqTnrh
	 h8IbLBY/t4uiQf/Tdl4oqiSOSwTjbjUdo9aVo4y7+n3GkEZMYHvee/OcztttAfRMN5
	 LLMtFkAv0LKmgAyKFzPaRBu1gThV1zjhFlDWayqdaUVAEuMb4ApqD9XUjppJ4cAxc0
	 6PxkyBXbJHbJ7R68NBKORTbP/BTVCHkLQOYtgOQfsum6R7fWlNtVREx5azpeDFbcfp
	 tCmPEU5+rwwww==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDFFE17E0D39;
	Wed, 30 Sep 2026 17:12:47 +0200 (CEST)
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
Subject: [PATCH v6 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Wed, 30 Sep 2026 17:12:40 +0200
Message-ID: <20260930151241.58233-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
References: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161252_318749_751FD5E0 
X-CRM114-Status: GOOD (  12.05  )
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
---
changes in v6:
- remove pw-bot tag

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


