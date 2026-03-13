Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0799105F7B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/PGyfiNpz3Lip8Mc3PoFXuoIrMxznrKPWZgq2ex2WQ=; b=3mmXaRiLtRs60bmSzWH2nnVAvc
	srLEqdWVk+KYRHnBVcijcJUcrPrjYRZdi9CwaPGSclEFTDb86LDILLH2QKwp8aXtyXLT3w/rUkxPk
	On5pmtjqJKTV3gU8iP4W3PDMiuiNgOiEegSN1+m23SLJy9fs2q06ZCM6wAOlCNfGK3/aKwwn8buJD
	XOJJ9njE0kSUhjpDEQydRrUnjWLRgjtcm1ZZR1pv9nFRMlvyDEEHk/sy+306N1Gl5t20cSqfRBf+R
	1nVMd1UUMHNJrqGBHrIYrH5uTrVjGhWELFwIAUyGa0WPjDSvIR7ToVcsBY3eSC1AaKObnDxKi8+xo
	ytiAmkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jl-00000000WTA-05q1;
	Fri, 13 Mar 2026 15:20:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jj-00000000WS8-2gTn;
	Fri, 13 Mar 2026 15:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DCEA6184D;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A9A2C19421;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415246;
	bh=p8cijtpU/HSsGMiP46YwtSX4nNkA+3J4pw4gPojkcGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h2/rFCHbf6Hud1ryNk85IV0SLnZky02BWTdZXmBSOUnVEBk+rdYU5IaLQvlYfdjvD
	 et0O7Xmwh4ANhKJj5T2YWLN9Vlslg8ovPYVoHvII1MURXNTIdiJaF/2ogZBQYUUAsZ
	 LgTFvXR6Ds/wuw299LxWDbrFgYFFrTB2Wi/3ABHX4J8A6J66LBrOBTae+uWL1GWgOg
	 wH1KiIp7VhrinipRBe3epKK53moL4iBsRyOshJM7LjRkkaJrCYeNKnGmUybxsyGaRE
	 1rOuYYhIk7qkZ5LCcaeukAueh2+L7gXdTUN+qUDCDwbMdQFGuRUAkNKpKJaKdqvGk+
	 lGuBwPVT5Et2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286D1105F7B8;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 13 Mar 2026 16:20:43 +0100
Subject: [PATCH 1/9] Documentation: admin-guide: media: add rk3588 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v1-1-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773415244; l=4703;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=+eC6O18wtYpvs9VlVLfglS6X0TZCIanqcH/7iXnFd4I=;
 b=J6olsqoAsI+oprwROgN8QAVyBVhAP/5shVwygmmWFsRcXehyiBlsEglxQwhms3gvE1a7DcLAR
 4AImHgxmm89B7TLoICd+1xm3yBi5jpZ0659Yb4SmjEcItNvic8y6jal
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add a section that describes the Rockchip RK3588 VICAP.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../admin-guide/media/rkcif-rk3588-vicap.dot       | 29 ++++++++++++++++++++
 Documentation/admin-guide/media/rkcif.rst          | 32 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
new file mode 100644
index 000000000000..f6d3404920b5
--- /dev/null
+++ b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
@@ -0,0 +1,29 @@
+digraph board {
+        rankdir=TB
+        n00000007 [label="{{<port0> 0} | rkcif-mipi2\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000007:port1 -> n0000000a
+        n00000007:port1 -> n00000010 [style=dashed]
+        n00000007:port1 -> n00000016 [style=dashed]
+        n00000007:port1 -> n0000001c [style=dashed]
+        n0000000a [label="rkcif-mipi2-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n00000010 [label="rkcif-mipi2-id1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000016 [label="rkcif-mipi2-id2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n0000001c [label="rkcif-mipi2-id3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n00000025 [label="{{<port0> 0} | rkcif-mipi4\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000025:port1 -> n00000028
+        n00000025:port1 -> n0000002e [style=dashed]
+        n00000025:port1 -> n00000034 [style=dashed]
+        n00000025:port1 -> n0000003a [style=dashed]
+        n00000028 [label="rkcif-mipi4-id0\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+        n0000002e [label="rkcif-mipi4-id1\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+        n00000034 [label="rkcif-mipi4-id2\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
+        n0000003a [label="rkcif-mipi4-id3\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
+        n00000043 [label="{{<port0> 0} | dw-mipi-csi2rx fdd30000.csi\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000043:port1 -> n00000007:port0
+        n00000048 [label="{{<port0> 0} | dw-mipi-csi2rx fdd50000.csi\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000048:port1 -> n00000025:port0
+        n0000004d [label="{{} | imx415 3-001a\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000004d:port0 -> n00000043:port0
+        n00000051 [label="{{} | imx415 4-001a\n/dev/v4l-subdev5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000051:port0 -> n00000048:port0
+}
diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/admin-guide/media/rkcif.rst
index 2558c121abc4..fcd7f8cfc5d3 100644
--- a/Documentation/admin-guide/media/rkcif.rst
+++ b/Documentation/admin-guide/media/rkcif.rst
@@ -77,3 +77,35 @@ and the following video devices:
 .. kernel-figure:: rkcif-rk3568-vicap.dot
     :alt:   Topology of the RK3568 Video Capture (VICAP) unit
     :align: center
+
+Rockchip RK3588 Video Capture (VICAP)
+-------------------------------------
+
+The RK3588 Video Capture (VICAP) unit features a digital video port and six
+MIPI CSI-2 capture interfaces that can receive video data independently.
+The DVP accepts parallel video data, BT.656 and BT.1120.
+Since the BT.1120 protocol may feature more than one stream, the RK3568 VICAP
+DVP features four DMA engines that can capture different streams.
+Similarly, the RK3588 VICAP MIPI CSI-2 receivers feature four DMA engines each
+to handle different Virtual Channels (VCs).
+
+The rkcif driver represents this hardware variant by exposing the following
+V4L2 subdevices:
+
+* dw-mipi-csi2rx fdd30000.csi: MIPI CSI-2 receiver connected to MIPI DPHY0
+* dw-mipi-csi2rx fdd50000.csi: MIPI CSI-2 receiver connected to MIPI DPHY1
+* rkcif-mipi2: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
+  MIPI DPHY0
+* rkcif-mipi4: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
+  MIPI DPHY1
+
+and the following video devices:
+
+* rkcif-mipi2-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi2
+  INTERFACE/CROP block.
+* rkcif-mipi4-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi4
+  INTERFACE/CROP block.
+
+.. kernel-figure:: rkcif-rk3588-vicap.dot
+    :alt:   Topology of the RK3588 Video Capture (VICAP) unit
+    :align: center

-- 
2.39.5



