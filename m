Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C34ACD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB+WivX/bZUDkHW09KVtbKSqgCWyudm5s43tN1s13ao=; b=YXfZcTsIhZVwlL5bDdialIrG98
	jX+yzw+OlLtNx+uZsfcBr8ALXhY4p/UOXc16w7mfExo36GyF27dTjIhltx/qshC03Qnt5e6zRz6O0
	VokgZ3JmHvoWPcl59+JTiEPEKSGy395DWHhfNMgiOMmmHYfPWmU92wr6YJ4+FvltCdDENY3M5jWn5
	khlf0OC1vnaLxzZwfNbycldjhWCdLOU+iHYVkUVwrvRX0jO7hGAXqhreCAeRrcvUzY5j9Wa9InSGz
	TzGaUtUf8ijyiQZy0ozGgZ809en5gmt7IlX18kM4JXfcVH67aXzGDich8VfTVXAQZsdUzyQt3yLbu
	VrlNuKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssI-00000006yr8-4Ait;
	Fri, 29 May 2026 08:47:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssC-00000006ylw-2mZ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:21 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D1A91ADF;
	Fri, 29 May 2026 10:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044419;
	bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DXxjY7kuuDatg2Xpfl1DoA3MGxufMYT6DpTT83IuSJDPTriU6T28M22X3ptfGRbZL
	 7Zbd2dYriZSRtmT4BC/K5PMrtL7xELwrae1pQN035au5JTNm/gPfPHkI53V1hi0EYb
	 ez3wrLRpz4B7zDUuWiEs+1/b1er5u522Q+gXwSII=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:34 +0300
Subject: [PATCH v3 04/15] dt-bindings: display: ti,am65x-dss: Add
 ti,dpi-io-ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-4-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKMQPas9xGtGiiETzNoyjXweNr7JCVYiumLz
 UaeVh/oYiGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjAAKCRD6PaqMvJYe
 9WbJD/9TE7KWjYwzkrGQujHhJmY6a5owc4EOfE7HdTMjU91bRRejmD8SKywvjPbfErxv4PjI9gr
 M3jCp1bG9yH8OpB9y5nkL4gW5sT8gHt5/hnQUHmOe9ZXiN4GTDkZ1eljJBh4+Ti4nklbau4cw6N
 dcxbLTGe0yLIeEDIoM8rJBN3kL2O6o5Y0iS6EP4sP50Q91bKeUH/uMZZhgJqb4QuZC4vhkgJkwR
 Suia93ezp3iyaMtNWUVtaMlaZOJ3F1vMEuW1ZXQLG2ywf2xB89R75uqTe1cEBqqbclUU96BtYSi
 NVMAB84tnyApOw0KXwNPxHnop7ZF1pkC+Tp8eV5mi4cHv+vQsM4TWm+JgCqS0vlFBz0evwZTgF3
 b6eowUTnFE7JYNw6+AQsDjuhyYq4I4XRh0CwQeV8RJwdRCX2bRb0uCATcxEqRp8e+7eSYpZoz4i
 hxT84RNgi6p92qUrKNR5/g44vEZ0u7r0Rg/HMDFC12V2rnRophzTdah7uxadH/Ddhl/CtjWVXVH
 JgJm8c24ra9fO//SKhMNYrZ94I6LQqe9pFAA1QVEJ1+b4kr7PIQ41Nzs5tLDVGV/Y94L0Kwfyte
 pZnJr424NAGThoC9Ud0Qb9M1dZcLSGXYXVOIYZddqm++7C0SKPpkwKaNdvuYexixM7UxgejJm8A
 SDMXDv0dc5YCqOw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014720_855064_80B5635D 
X-CRM114-Status: GOOD (  11.62  )
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

The DPI output pipeline in K3 SoCs contains the display subsystem (DSS)
which produces the in-SoC parallel video signal, and a DPI block which
adjusts the signal to the external MIPI DPI output.

The DSS IP has registers to configure whether the data and sync signals
are driven on rising or falling clock edge, and on some SoCs these are
automatically conveyed to the DPI block which needs that configuration
to properly output the MIPI DPI signal.

However, on some SoCs the DPI block configuration has to be done
manually, using an extra register outside the DSS, DPI0_CLK_CTRL in
MAIN_CTRL_MMR_CFG0 block, which controls the DPI block's behavior.

Currently the DPI0_CLK_CTRL is never written, so it's always 0, meaning
the data and sync are always driven on a rising clock edge regardless of
the DSS configuration.

Add 'ti,dpi-io-ctrl' property, which contains phandle to the
MAIN_CTRL_MMR_CFG0 block and the offset to the DPI0_CLK_CTRL register,
so that the DSS driver can configure the data and sync signals
correctly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 588d72d4ec0d..902ae2122d86 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -113,6 +113,17 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,dpi-io-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to a syscon device node containing the DPI0_CLK_CTRL register,
+      with the offset to DPI0_CLK_CTRL as an argument.
+    maxItems: 1
+    items:
+      items:
+        - description: phandle to the syscon node
+        - description: DPI0_CLK_CTRL register offset
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

-- 
2.43.0


