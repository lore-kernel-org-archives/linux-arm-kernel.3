Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93347C369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++Sz5n1hontH0goNn0EnD9AxxcYqzo7gOqQkURmwZVk=; b=VJoZGyTX4wyxbJXeKAd1qurzCa
	zZmOEIDA5+O841FcLmqqIfaReYj21Zo16SX2BI/1c/sV8pdBW7PNnhAKqvZN2gkfuvXKZ02HSy5B1
	zIDwPkomM1aS0D53wrYlcq/UUa8xs40dL2s8F0FqJnifsjvj3Hexngp9q0bupXWdVhDvAaPgRcXmq
	RmhQBWuwGgTT9BLiUMgzM9VAhn+e5imSzU7ndLu9tZlaZG4/2m/XnoMLfUgT0bzhIkH8d/OIqZ6SJ
	zQ/8rmPu60+pl9GUIRieNxp4MTMdpaesf2AZ03skPOu+0FVvO8T7p0XqW4WyayzZP38wRD2MuzSlb
	qWWR9enw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Z1H-00000004Zpv-2ATI;
	Tue, 15 Apr 2025 05:39:39 +0000
Received: from mail-m1973183.qiye.163.com ([220.197.31.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YhV-00000004XLO-1wZN;
	Tue, 15 Apr 2025 05:19:14 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d9674;
	Tue, 15 Apr 2025 13:19:08 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 4/7] dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
Date: Tue, 15 Apr 2025 13:18:52 +0800
Message-Id: <20250415051855.59740-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415051855.59740-1-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGBpCVksYSxlJSk5JSUlMQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637e30c5b03afkunm11e6d9674
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhA6Hyo6EDJPQxovCgwUCiIu
	DUMKCgFVSlVKTE9PTUJPSE5KS09NVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlOTUI3Bg++
DKIM-Signature: a=rsa-sha256;
	b=jhxPUgo9Pa7/KfoOhXGWoh/uIXnW6w7QCxcIC1XLDGxHqexVAUsd46MUd4YUZmYYk6HV534I+owdAuznWqF6Sknku+BdqKqiTe1w3bYQL8oy9iihBw8emECbqAHMO7q50aXihmJ58SOHce9XMWkRvceSfeFCksIaUhxhJtA56DA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=++Sz5n1hontH0goNn0EnD9AxxcYqzo7gOqQkURmwZVk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_221913_685384_CFA7563E 
X-CRM114-Status: UNSURE (   5.89  )
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

Add all syscon compatibles for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

Changes in v4:
- Collect ack tag

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2f61c1b95fea..8cbf5b6772dd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -18,6 +18,12 @@ properties:
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-vo-grf
               - rockchip,rk3528-vpu-grf
+              - rockchip,rk3562-ioc-grf
+              - rockchip,rk3562-peri-grf
+              - rockchip,rk3562-pipephy-grf
+              - rockchip,rk3562-pmu-grf
+              - rockchip,rk3562-sys-grf
+              - rockchip,rk3562-usbphy-grf
               - rockchip,rk3566-pipe-grf
               - rockchip,rk3568-pcie3-phy-grf
               - rockchip,rk3568-pipe-grf
@@ -82,6 +88,7 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
               - rockchip,rk3576-ioc-grf
-- 
2.25.1


