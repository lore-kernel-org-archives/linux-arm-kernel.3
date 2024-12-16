Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7BFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 03:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAQCDy2qVtRDAgBc2wWc3aI8DLegvBvIK3ABW6tP2ng=; b=t+EwLK4Sgt+Ol6phZBqM71X6fh
	thCjtAj7rAxbqKjTv0n2z8whs6vrJhzBOke8Ljq//td+vEuLEIjC+9U9n7tYF13cVZabhpDYxZvrW
	JK9lVZq2oz9tNZnOZAbMJZpAfrRjh3cGB7Q0xr2vUJkRB7ELaZBHfnpRrrUQMTc7pNFymZ85xjqfA
	ELL2jox6olnoKklSHPI8JqkPrfd7JumbZPkuTC9KkSrzKTn4r7G5E1NzVzZG/MeI/0klXPOvfebz+
	mHAUfee6k1Lx0zncT50D6fUjYe7guFZ+CKVWK2BdTeKs+SVuPUc4ioH5Hc9m8TuBmyb6/vnkGs7bS
	5hDZevaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1Yi-00000008tZa-1EZA;
	Mon, 16 Dec 2024 03:14:12 +0000
Received: from mail-m15589.qiye.163.com ([101.71.155.89])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1XZ-00000008tCu-3j5j;
	Mon, 16 Dec 2024 03:13:03 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5cf798f4;
	Mon, 16 Dec 2024 11:12:52 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/11] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
Date: Mon, 16 Dec 2024 11:12:16 +0800
Message-Id: <20241216031225.3746-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216031225.3746-1-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxKSFZNSB4dSkhNTkJMT05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cd7451d403a3kunm5cf798f4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ojo6PTo5MzIJPiFDSU5DQgsU
	MEgaCxpVSlVKTEhPSEpDTExPT0pJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0JNNwY+
DKIM-Signature: a=rsa-sha256;
	b=hYMi7ukzIZWFpyFu6Iwm6hPJ6LejSbJ97UgKRHvlaNjJhKerhKinToMt0vQECV45v9SQrm43CKeVd4UPROw6mtRBG6yM/nOCICLSXJCUGvv+q1Qv1Ajx19Olqo44tXN/qZ7L3BeMkXSXKwyTyz2askbPZrQjaYDah1OS4TGuRT8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=xAQCDy2qVtRDAgBc2wWc3aI8DLegvBvIK3ABW6tP2ng=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_191302_458467_81DE9E6B 
X-CRM114-Status: UNSURE (   8.04  )
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

Compared with RK3288/RK3399, the HBR2 link rate support is the main
improvement of RK3588 eDP TX controller, and there are also two
independent eDP display interfaces on RK3588 Soc.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add the main defferences of the RK3588 eDP and the previous versions
  in commit message
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 60dedf9b2be7..b82b693532e1 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3588-edp
 
   clocks:
     minItems: 2
-- 
2.34.1


