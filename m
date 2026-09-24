Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78073C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+W5GVZbMS8AF8UgNsvhb4yu69fzS0DIt4VlnWwQMTg=; b=J+KWB2+hh2zwKxfHm1wvSoBb98
	3ARSKlDSJ6osujbLTKYpH88HhdVEM3MM5YhTmd5KBisEmNeGm/QMVc4O6bHVwAqMz1oDGXZW9/uJF
	mGnzXfpNK5ivIhpYp8dZVEBwdSZgt4p93do8kgXCcIvvKVju3CAh/GsxByobgM7qUg/FkWn1SLl+J
	qrxpNodgAN33hEzHj72sXr/uyyyxHDWarhzKmBhZJq0Yn7V8cXLnjcfkSDQQRiwjRFx+tpqditXmh
	59bwo2QWFWP1pCs/9210V/tYF8f41WYO1c9OYT0x+vx4zCwDNQ7Q46kIQhLZiWziy0wVAjp0iUuwS
	VNzuD1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9j8j-0000000B2o9-0oma;
	Thu, 24 Sep 2026 13:05:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9j8O-0000000B2en-2Rv7;
	Thu, 24 Sep 2026 13:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b+W5GVZbMS8AF8UgNsvhb4yu69fzS0DIt4VlnWwQMTg=; b=fhXIVVCBfrruSaBtFt7AHLtSg1
	Vq9KB2pVxQwEXez4tPHRhqk9NHm5KL2vRLcgu4DQ6ra0Zq41kefMBp6oZKfOWeaIyG6nZ16m/eIzG
	RDHfTaaISaLaf+/VnthnaNh1B618/gOY0rf8CEo5lc4lYIJ4i02GGzpnt1cCmO0sarFj0rJIb7pum
	MlGZHwhZWqJGfYO0qJihO5M6B5W2oC7wOwWMQhVYocH8xY0RZctW5/ha1ie0DoxncD47HvsVU2r00
	byZQ6jauNvU90ByhN9Ua6vZSaoUgsKo9wkrMz0pGBQDw96PVhpXLxhiReP+9fByiSVEOC8Hci1fwW
	41vABFYA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9j8J-0000000G0LY-0xGH;
	Thu, 24 Sep 2026 13:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790255101;
	bh=3poIeVbRfxg5Z3ob25q9qs/14cK1PAKJLUIFhin/dtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSPClPQwZvLmFbWOVo4wA1yZNGkeCmYzIZFyYh0Uk1ANqwNegBHk/R1edqWszFbGI
	 mUZUjvqEke3wyOKn4L8+jr/KK276lJVwj8LWcHlnxLfSfkvdhgZ3TAnumdwJvo8Gf9
	 KYg9F+ye9sp9XyDvCa4wYt+pb7tlcyg31AEvfrDQQJNZP4Dn4FsbHodtWRA9fpeoNm
	 uTP1Yp9bpU13OoXllyStZaJcDbShIF+B4UJOUooSLB8c/oIfngh+8d6mk98Y2iWY0H
	 MykyoiN2Yrgoyk0/MmWvPG2K/BjNWh22BSsyA8sVezBVemrkXY0oc4HvVUA7n5PK+E
	 7CwH+WIw4VREw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA00C17E0A66;
	Thu, 24 Sep 2026 15:05:00 +0200 (CEST)
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
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Thu, 24 Sep 2026 15:04:52 +0200
Message-ID: <20260924130453.196299-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_140505_935705_5C5E19B5 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

nxp,imx8mq-vpu has been tagged has deprecated since a while.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
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


