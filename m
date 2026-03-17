Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9366F3382E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/PGyfiNpz3Lip8Mc3PoFXuoIrMxznrKPWZgq2ex2WQ=; b=M9FsQiqqWK5Tf+GZz6GbM2y9TN
	3KNvFGbAKFBJN7kLqFXG5qXV+VBkmzS1tMS8oLveMlIFodKgQkFt54RZBVl15Za8Nlbd0/XJJFdga
	Mo6Luwt7GkLNqbtV27rW8GuRcE9tJE4+5HsBkijZ6YPj+yh09D9BnSGYl8haVMo9U7DRkKzi0xNvR
	9fT+rKV8o7NloY+FPob/AFWm2As/QQz5UpkeUmhlLGiFSpVTQH/gw0aD5+5z0zMWlgot4NmCCkYVa
	fhUx/QU3hrLxuG42DUMGjnqlH0U720c92kKgeI49yg4kouKw/DyzkUQzmcpiduKpGY2kQyBmW68FA
	JcTvbsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmo-00000005sfC-45Wm;
	Tue, 17 Mar 2026 09:32:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmn-00000005sdf-16kJ;
	Tue, 17 Mar 2026 09:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EDF26013A;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEFA3C19425;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=p8cijtpU/HSsGMiP46YwtSX4nNkA+3J4pw4gPojkcGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UxT1sfvbxgTb3B9ITJ/TbmS4lHIDkn/zydRUjoKNKIrt86o+P6srfZAE6loUauh1+
	 BEDPiUtzt4pqLtW5kj/3n+6xTJJ5eSSQGaxZuwz/uwHHbmNtGzI8RMbrfTkhz68074
	 XhSR9XIpKhKT9UFVl/yxv/khTsTKWvzCh6xDdt2S7kTLVn0xo6szzHWitvdvRrwIyC
	 3+aW9n7AW4p4j4ZEPGYRia7joJW27YZYx4hlGGVZbdkaoMJ6gw7RGRkwhYMO6bRLbh
	 bfYlNwsjni81riLPTQ6niTYnTgSY4NwIF+Kz4v7V875O/tXcANr1Fxtd7GOi49u+mh
	 5YEuPx9EUbkrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1441F33820;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:19 +0100
Subject: [PATCH v2 1/9] Documentation: admin-guide: media: add rk3588 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=4703;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=+eC6O18wtYpvs9VlVLfglS6X0TZCIanqcH/7iXnFd4I=;
 b=q11rIe2Goh3Zc4dkARzS0JFn3gmHBBTXW8XXeo89TPokkuSqBK7B646840c+h/eljYONw2tnm
 32ZB5g+PzNrCcXukt6/yl4xHYd4FITsE3izMv3aQjEZ2vrqhX1Bxuex
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



