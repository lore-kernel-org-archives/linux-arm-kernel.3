Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372B2CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/36RmqJt6eoRAK3D90At1Gpdeix6tGcnS2SxkFLWJps=; b=Dtv10XQ1QDUM1Y3QVhfVHJGqVU
	GrmhatVAt0UIrGGuvn2OwhK6LJMVkWhS1rnz92imDggEikQi3/12MfY0/4TUc18OsooRVpT5lY57q
	b7kbfSBShVMzlcmKaO63zzyYK6OMC+e4BPhcg2JGNToTKTx6NeFuUBg4GRxopYPF09NTw78OtePyi
	sYSByj8gGgmjxIjIQG4EGGuzjr652hvnYhULf6eIunh8MXB3DQoDPcQXEbtD0cNi8r7cF8dsnreur
	SdkkOkMfO1D3W60jaePfimDKTQiWQtJs8LmTuYoclDe66mItMIl9kvpxU0VSlNMR0uirJ936aDEkH
	0JAAxWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSA4-0000000A1lC-0SKm;
	Thu, 13 Nov 2025 07:54:32 +0000
Received: from mail-m3289.qiye.163.com ([220.197.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSA1-0000000A1j6-0IVD;
	Thu, 13 Nov 2025 07:54:30 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29728c005;
	Thu, 13 Nov 2025 15:54:22 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v9 1/3] dt-bindings: can: rockchip_canfd: add rk3576 CAN controller
Date: Thu, 13 Nov 2025 15:54:17 +0800
Message-Id: <20251113075419.482940-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113075419.482940-1-zhangqing@rock-chips.com>
References: <20251113075419.482940-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7c355b8803a3kunm5789752bf03ab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01KGVZLSUwZQxpJTU0aTE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=B1NZ1c94EwmBVPVRgqWDLvvlMCk6XKfixqX3LRH6ZycAUsxh/er7t9RtavM/kwYWkT4+hQs/kO6Neol+HmmhWUojCJ4/n5LL0VgddJQw0VEJvT1p3o6e37VDrWb+DDnqLjdyf0J5aTgC8QRfCvVlXAGXP6iowTN+mVarNMc6URA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/36RmqJt6eoRAK3D90At1Gpdeix6tGcnS2SxkFLWJps=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_235429_283625_BFAB4539 
X-CRM114-Status: UNSURE (   6.94  )
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

Add documentation for the rockchip rk3576 CAN controller.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
index a077c0330013..d63c8c8e3f45 100644
--- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
@@ -16,7 +16,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: rockchip,rk3568v2-canfd
+      - enum:
+          - rockchip,rk3568v2-canfd
+          - rockchip,rk3576-can
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd
-- 
2.34.1


