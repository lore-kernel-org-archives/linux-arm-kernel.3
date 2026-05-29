Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AB3CD6E4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrWprUaEUJ+ig1t4kpR3FeKU/JR1o4U7A36BRbmknbo=; b=v2b0Oc5NSNVhLRyIdGOVrl5e8T
	sIj7RwLFRyoWEMGNUOrbquzoABCzMKoQOi4xq8i03s0fjafPFGVgcGqhzPWxAQ1ypiMwAalkQB3bU
	7G+p7TIhqQB7PiI26Kz+Apt+yztpU0GDJzRGty1Jk+S2rY6mhSF84F4E5uMyOEG5UfU7Hwh+CsXMu
	pGwmVUI1Wr/kjGka7NVVAImUJRlyyBLkFl27AZHKSsgyR1NT8TkkiqLfF6LDI0YE6DWpWnM4vICCo
	VhVsADfp24bc5dfQhXbhBBX+q/AyTcTF8/TTV6DbAuG5FOn8ZnFBRa6WHZPN3VVA5Wxo9XRRfwECx
	xYddiqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssJ-00000006yrN-0nwl;
	Fri, 29 May 2026 08:47:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssD-00000006ymS-3ghh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:23 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D7A20F9;
	Fri, 29 May 2026 10:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044420;
	bh=uYpBzCI5/EIYS0A0eORGLebFKyluSlYajSBf8Czw3RM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i6bYvpr/Wh5Ll82dXtpjLWBx8b6W8KAMX/VhGN/qqqix/6bfkDFXqUty5auM0dml6
	 9mWdOCaCiBVtu+2I01wl+1/Ose5sio6fTvlG5hzvYp1e2ZQ5SSL6PyUqeHgPebx7fX
	 1N1ib0JYuQ4JgeJmkYKhfECGYck04E0hSrwhuRSA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:35 +0300
Subject: [PATCH v3 05/15] dt-bindings: display: ti,am65x-dss: Add AM62P DSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-5-7fefdc5d1adf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3512;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=uYpBzCI5/EIYS0A0eORGLebFKyluSlYajSBf8Czw3RM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKMbB14c2XE4t0f3oamTKKmG1ZiaLbx/63K6
 6XxG0PYyuCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjAAKCRD6PaqMvJYe
 9cs2D/9b/3lUX5/1QkZrCDXNlrtP/DySHlPixDNAkXipv7uOfcugtM8KbX5QJFkdTZ1aoJdpSzP
 lcXWyYBuwqK4ju0rflXnOEgqgZUVh6OVbP0qLNZVcJ2Fb1ONCxp0zmPD5d+22hUB80mSdvca3lC
 rcvDUJTGjGE77wCvkJ0vw4Y6rO1C7X9d4C2gEU37E8JlujuDe9YyzkW0vKY5GM4lIgk6+hKuTZy
 h3jXCZ8P2ssggJr0cPeo37W1iqkkuZJFJGdT2RjGWtotHTsXgGTxs/WMMgyc6ukBp2wYRUjK7xR
 P38oLzDOyPreyYKi9PqZhKP+A/UsC2yVeCiAV82ebQJnCI9FAII86PA1BxJmo5fXFq6YeUA3ohL
 5sT5D2AMSgy5JgoDX90dNmINHQphONRqFLx7CoSCIZ4wGiFv/WmY4jb+C2jhJHvCHlwNA3P4ay8
 f4PpUOU6IGMiQRCxxFclFOJLaO0SR5uzEkCJbCMKwYGzF8n+3sr6O3UxsH2QgFxMppK3Jf7Sq/Z
 qAit7SjO+vIez781FSqOSOeH8BDP3Hi/I+TfglX4jfPx2i0gwsWnyOWaqqY8cYYHXgqwGrWGXdl
 vgGO8fVo0URNsylI5qsvzBNA9l735d3T3PycHku7TLyqYlDqY5lgSqIYkK5IRBVKKepQk6E91Iy
 J+deiWB1yjnUVgQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014722_064963_830AE320 
X-CRM114-Status: GOOD (  21.04  )
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

TI's AM62P, J722S and AM67A SoCs contain same implementation of the
display subsystem (DSS). There are two instances of the DSS (DSS0 and
DSS1), each with two video ports (VP) and two video planes.
Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
DSI TX and a MIPI DPI output path.

DSS0 supports:
- VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
  clone mode.
- VP1: DPI

DSS1 supports:
- VP0: OLDI1 in single-link mode, or DPI
- VP1: DPI or DSI

The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
between the DSS instances. Thus only a single VP can output to DPI, and
a single VP can use an OLDI block. Note that in single-link
configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
be used by DSS1.

The DSS IP itself is compatible with older SoCs. While we could use
"ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
on the safe side in case the driver needs to do something special for
the dual-DSS case in the future.

Original patch by Swamil Jain <s-jain1@ti.com>

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml          | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 902ae2122d86..acb7ac635097 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -28,11 +28,38 @@ description: |
   On AM62A7, the first VP is tied off in the SoC, and the second VP is routed to
   external MIPI DPI pins.
 
+  AM62P SoC contains two instances of the DSS:
+  On AM62P DSS0, the first VP is connected to two OLDI TX instances (the second
+  TX shared with DSS1), the second VP to external MIPI DPI pins (shared with
+  DSS1).
+  On AM62P DSS1, the first VP is connected either to the second OLDI TX, or
+  external MIPI DPI pins. The second VP is connected to either the external MIPI
+  DPI pins or a Cadence DSI TX.
+
+  An important note about OLDIs on AM62P:
+
+  There are two OLDI hardware blocks. Each OLDI has certain configuration that
+  has to be done before it can be used. The OLDI blocks get this configuration
+  directly from the DSS block, via DSS registers. However, as a single OLDI
+  block can be used either with DSS0 or DSS1, the source for the configuration
+  changes according to a mux. This mux is set according to the OLDI
+  configuration registers in DSS0. Thus the OLDI control paths change at
+  runtime, and it is not obvious how to structure this in the DT bindings.
+
+  The solution used here is that each DSS node contains the OLDI nodes that can
+  be used with that DSS. Thus the DSS0 node has two OLDI child nodes, OLDI0 and
+  OLDI1, and the DSS1 node has one OLDI child node, OLDI1, so three OLDI DT
+  nodes in total. The two OLDI1 nodes thus refer to the same piece of hardware,
+  and they cannot be used at the same time. The selection which OLDI nodes to
+  use are chosen in the board dts files, so assuming the dts files are correct,
+  no resource conflict can happen.
+
 properties:
   compatible:
     enum:
       - ti,am625-dss
       - ti,am62a7-dss
+      - ti,am62p-dss
       - ti,am65x-dss
 
   reg:

-- 
2.43.0


