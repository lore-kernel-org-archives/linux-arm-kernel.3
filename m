Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD6C105F79A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXTy7lFIKz07psXtmHAPnU8VseQWikqrUv/YODnZLAc=; b=YAjY2aWsxaBVYXUsCtla83AGMo
	cmU1uMSMwNenXLShWriBoR8EsJ6yYXBbNvvy/ydxO4cI/rvRT3JFVmZ3QbICO+at1X8ECll/AIw5/
	v88M+NpRv5LD+khgXdwOe3x2RNhzfJzGTkyn8QiWOqq+RR+quwAP+fNNBgcy+GVdCWl0iQRK8fnz4
	pJ+XqcOHgA9gSL6ZBarIVClbPJbsgIMUTRtBKSKJrT6y3iVPqmdRwYrvFcnXujBoEstUp16v8B8gz
	1KG4zXgRQhAcMMgpMXEUT+Fbit2HBou30W3/hT1o97rD51qAQr1VwPlUE/JD6raLft1g6GUIbya6u
	DznlBVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Nx-0000000HZtg-3mwz;
	Fri, 13 Mar 2026 11:08:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Ns-0000000HZqT-2EuB;
	Fri, 13 Mar 2026 11:08:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67A8842B23;
	Fri, 13 Mar 2026 11:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 051ECC2BC86;
	Fri, 13 Mar 2026 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773400127;
	bh=XXO1mgJUSyiBXvcLxYSRNgFAqNwVHOxXvv/rrOuAqXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qv1ximd0RjtUyn6+1m2xC2WcF2phbUgRpN83QRHUmjPmO3ZZkF6H5i73tDkrk89NL
	 u9g/2P8kbZirB4ujPQ5r/oFfgomI/++McW/Ge0Lb2T46cXfduK+JvrXSTzL9GLvaCa
	 aN+WeW8eQ05j0ZvMNBRM6PHhnqfLK2nDbHwJKV67EM7DTWzH7FimiNW33GGaONbvMn
	 QxxcWaS87oYMOETDgHZG/sjQnr6ul8GnzzW5vSmB7Rtc2KLR/1ldf+qmj2Cf6UtbUx
	 rDFkA15X4yenDdx9WNR7Lw9Dw4GWQvGAsTW8WwDl4BNQy6j/8Ab9VzyYlWteJMhRo3
	 lCnl1YDtFb3bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1960105F79A;
	Fri, 13 Mar 2026 11:08:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 13 Mar 2026 12:08:45 +0100
Subject: [PATCH v2 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v2-1-79d01b615486@collabora.com>
References: <20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773400125; l=1058;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s08WSDTn0nhPoD7fGLExb1f4hgboEjwgozFX96wSHZg=;
 b=PeRPJonf68lTbVKM7payZcqGQXDO/Vy6/VjC8mvpovkjYRhfRZh47oVyabyJxpJGJVeI7nDvU
 cyS8auWrrBrDs6eYhG8wUskYq1BPc7PNem/PJNcOPo5qmuWEQJrnSsc
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_040848_608202_ED57E11B 
X-CRM114-Status: GOOD (  10.28  )
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

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
the RK3568.
Introduce a list of compatible variants and add the RK3588 variant to
it.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb..5e864e92f8a8 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - const: rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



