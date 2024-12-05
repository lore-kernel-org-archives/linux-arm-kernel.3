Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B43E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGkIEb4D9Pp+P1b6BLNVuyfPuE9svwhu6wtxLA9nH2s=; b=HF0ySJosb3yn2zLHOlmxVJ3iP4
	o48ebpZLyS44lCWfNVQT//6T/PCwOxNt/mrKELfqVAuPjVyNm0shWSCYQ5qXN4ebgH74fFFVI5k+a
	OOhu/ap35QPoAPUpI2ZfzO666OBoGjf/2HrjeDFHwylMPBOdzUTJVgi7CX5hYbcH921qo99HEDMaR
	BeylBNoaVFjNxpBaH0c9XV6AaFXQqCVy+pRbspISnEn2vmYZ427uFVyi3ccI/Ny8TXGtTDTqwj3uR
	r1VeWP+qx6/PoRc6/poFdsD4wxqTJQtQUoBoC95hvKPw9g0Mt9Gn/VVkpN877LMma2WdDzVbbjC5C
	6oz55Cpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Kj-0000000Fa19-3Z0F;
	Thu, 05 Dec 2024 10:43:45 +0000
Received: from mail-m12789.qiye.163.com ([115.236.127.89])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Dq-0000000FXgf-25az;
	Thu, 05 Dec 2024 10:36:39 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cf7c984;
	Thu, 5 Dec 2024 18:36:34 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tim Lunn <tim@feathertop.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: arm: rockchip: Add rk3576 evb1 board
Date: Thu,  5 Dec 2024 18:36:22 +0800
Message-Id: <20241205103623.878181-6-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205103623.878181-1-kever.yang@rock-chips.com>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkwZSlYZSkgZHh1LHU4dTEJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93966493a703afkunm4cf7c984
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6Cjo5NDIhCQ1PHyMvCxov
	Q0oaFElVSlVKTEhISEJPQkJOT09MVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCSks3Bg++
DKIM-Signature: a=rsa-sha256;
	b=TgWTzXUWw2q2NR1exdJuZumgkZ5NCMH3DmjXnsIeD1vSiO+bRplQxnzbj4Xye0Ab0ww/JQx6xD8H/IovZDX17PhM21YM+wj7UDiELScbGeZ7oOOJ6QZKQVPdsnBjKrIoiw8wYWMKeg3YZq4S+Ww0JqXctphCF4VqS1/sDzGQuRM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=NGkIEb4D9Pp+P1b6BLNVuyfPuE9svwhu6wtxLA9nH2s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023638_731203_FC8A4889 
X-CRM114-Status: UNSURE (   6.91  )
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

Add device tree documentation for rk3576-evb1-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 45ee4bf7c80c..b2681a45867b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1016,6 +1016,11 @@ properties:
           - const: rockchip,rk3568-evb1-v10
           - const: rockchip,rk3568
 
+      - description: Rockchip RK3576 Evaluation board
+        items:
+          - const: rockchip,rk3576-evb1-v10
+          - const: rockchip,rk3576
+
       - description: Rockchip RK3588 Evaluation board
         items:
           - const: rockchip,rk3588-evb1-v10
-- 
2.25.1


