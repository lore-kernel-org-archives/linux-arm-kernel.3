Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2882C44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOa+mdayT91izHVqX1UV1GEgdTHLPH6ORjFi0tHHBv0=; b=Ixxye1RDVZuXL9mOgdTFRjUiUS
	ND4eOiLK0QnQMHluGIxqHXAi2kObbsRW6dqNSDmSR9g9YD3T3eh6SarqYudrYBTE9oqAKMD+wPDrZ
	4oRPF6SOkTONGEk9bS3PedyhB8TpF5PWi8uzj1P9zIiOsAUGDLe9eVUMbzorsKVpHZODPMd32NyXY
	1X6E84jbFzykfIT1FYTba5PTHXGDr8sN0AY4oFGeK/J19o8dUdK9MjriFnzQaf2c8viWTeoxuSkcw
	cWwoK9WMyAwGr5dMcqLcYaeRHSivZiiXjH/rXso+GOBYvYoCyprx/PrCaFcVfZcYlbSnmihZeDHuW
	AivieIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webZ8-0000000HVSl-2I0P;
	Tue, 30 Jun 2026 16:44:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webZ3-0000000HVOg-0IyH;
	Tue, 30 Jun 2026 16:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vOa+mdayT91izHVqX1UV1GEgdTHLPH6ORjFi0tHHBv0=; b=dGGaYZgrhV1zummDrVOCaDk78H
	Bk74aQg223lrNPg8bUn9U7+IyToxjdhshGz5IYqvg2F4mZKQlKdtUOpcIgWAdJ/wmthR1L8icVEPd
	Ur2KUmHFqOgsXQNikzYZXfKcuK95rhtDKztauUGNABEGyhPP5bJVRFTaq4T3ZGZhVOZHMzO5zT2gY
	vj6LtTlxsyt7bttfpUjpTzqgwyu/q3uDQCJpqPmrFpfx2JXIjnr4HEETWhBRouZUBTN9Egc7oXkl9
	zxxceOyAElSA1qXi/YDAyAGvfag9VjNXpwT3v6lCWK8NNwz13osQuf1ylSSlHPnWTaCmtU4UW1i5m
	rfGdNb3g==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1webYz-000000024SZ-0hIk;
	Tue, 30 Jun 2026 16:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=vOa+mdayT91izHVqX1UV1GEgdTHLPH6ORjFi0tHHBv0=; b=j7niABot65FEcsVCf15loxOqUF
	geyqCezj7k36DCt6kV06vZQycUNiwspL1MLfN9LT4A8HqyxcjV9+gvyCAgUr+2bsr3pVFrp0OChUB
	Aupi6lCeMRkOA9pUNGjbprECGtnVFjRJnn556FxqqzAPNkGUkOhl+0CUEoDQi0GkVjY8sDgTrPjhm
	DE73j4M9c8f3g22i431xwAW8xcfhOxV2C41geAQ6Z+HLbmvw64e8ju94ErenGKW7K6CWzVEEJ/crm
	lcWrtSAutyhFmVb8kQU5yKhhdarFqJplOki9cZEr/jeyVfguh+m1rEsrD63SURAVo+hKoeIpJPh/f
	IhcFB3Vw==;
From: Heiko Stuebner <heiko@sntech.de>
To: mkl@pengutronix.de,
	mailhol@kernel.org
Cc: kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	shawn.lin@rock-chips.com,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/6] dt-bindings: can: rockchip_canfd: add compatible for the RK3588 variant
Date: Tue, 30 Jun 2026 18:43:31 +0200
Message-ID: <20260630164336.3444550-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630164336.3444550-1-heiko@sntech.de>
References: <20260630164336.3444550-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_174357_488376_AA771854 
X-CRM114-Status: UNSURE (   8.98  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The RK3588 uses a variant of the CAN(-FD) controller introduced at first
with the RK3568 SoC.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
index a077c0330013..02211ea3ec41 100644
--- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd
+      - const: rockchip,rk3588-canfd
 
   reg:
     maxItems: 1
-- 
2.47.3


