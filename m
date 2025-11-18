Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D6CCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0nXALYficq2cYLdsPhzBWeGzcheK/HRmbHGFZXXVBQ=; b=1NFaADjQJZ4qywQremOxUvMwWh
	MZ3pamDXtYsD14yAuth8G6frmjW8/8MZY8EYCNItmBy5CpfejKfnXmHGk2xp5OLzjZ3IKey6O+2OJ
	8glAeD702ZoBmmMyNTOjCQqOWa2gQQ2Pu8TNnZnc4RxScVtmmDftHZ2tDE0BxXmk0Dl4ZMeRXbMfR
	bL7UbScCdOzjpbdzUBHP7VqwYIGL0m49L/C8adyyDadYZnXm9dEd5P0LwodrjEzKJh/PA9upV/NHR
	kxB3qthyKNnNadn/GD0aQwH+rPJsYetfW7zUqo5CZynbqcmNJFaT5LyyOaPUGV7dfZDOtG2sJiOYF
	QgsU9Fig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAhF-0000000H9O0-2iSj;
	Tue, 18 Nov 2025 01:39:53 +0000
Received: from mail-m83132.xmail.ntesmail.com ([156.224.83.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAh2-0000000H9EY-0yFw;
	Tue, 18 Nov 2025 01:39:42 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29e9c374b;
	Tue, 18 Nov 2025 09:39:32 +0800 (GMT+08:00)
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
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 1/3] dt-bindings: can: rockchip_canfd: add rk3576 CAN controller
Date: Tue, 18 Nov 2025 09:39:27 +0800
Message-Id: <20251118013929.2697132-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118013929.2697132-1-zhangqing@rock-chips.com>
References: <20251118013929.2697132-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a949df9ae03a3kunm07a8ba9e476b5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1NH1ZJHk5DSUNOS0IeSE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kD9D+0G31JBldVFzx/KZq6CFF8hCL6FQ6eZO85HYB5Z1XhOv1ciMKh9GyEa75QQFjJ9bYuJnPrnanI0YYhqDgfKQ+ZlI6GKb1CjiDGp1ons5h8s8JofTbzzG92Ok6QsBymIrp6U6rb2DFd1rij+sGkxElFTBBjSxHJRXFnVT+r0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=n0nXALYficq2cYLdsPhzBWeGzcheK/HRmbHGFZXXVBQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_173940_531551_C9DB5783 
X-CRM114-Status: UNSURE (   7.79  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


