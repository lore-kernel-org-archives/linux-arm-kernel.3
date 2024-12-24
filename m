Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B7DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tl/tu4Ma3hxADCr1NvTtefCDyNtiOwwX1gtVqm6FISg=; b=tnV9Pjo5zYzbD9zuE+UfOaWHUT
	0XQML/8LLPptV1Swb6XNk6xR2jrXDKQ8EAcoJ3atKTt7rvV+691bdT0Y+xe0THR/z+MfXNesNUtlM
	VHp+v+2QAmFGEr/dFWiQXxQpuinxU3BzDIRemyZSDcgcCLoQna0NhqZSWHZD+h5YpdZyExb1Kdh94
	SwEawNCfUvsPSkvobGEW9c79B1bDsRV6eSfBq3b7JSLybXD+LTsf3R3B7f82sxzxXWOoHRW9fKvj3
	Bl9Ls8TcLxwIKQaC80Umjvhu1NJfr7LL4BqlTtN1IMfQlVNerTjhndK/nBOge5/HXyUpsWh12YbSn
	FTUi98Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ163-0000000BZbY-1xHM;
	Tue, 24 Dec 2024 09:20:59 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ14q-0000000BZRc-3ykw;
	Tue, 24 Dec 2024 09:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=tl/tu
	4Ma3hxADCr1NvTtefCDyNtiOwwX1gtVqm6FISg=; b=CIKPY8dZ0VzvfmW8KZ65J
	yHu5trA2F2Ny2qXXKm3UgHdaPOUZiRpgtmBT4UB4Pvoq6M2ibeV4etehVCb5wNz3
	HX6VoGmHnbrlHh+Qazxc478Rc2Haf/Eb8Ui7ohMslDHaiuJlzlcj/rOiQmNB+WDP
	NtCoAHlObMTO3p01Gis0d0=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCH6oaYfGpnc96lDg--.3901S2;
	Tue, 24 Dec 2024 17:19:24 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	krzk+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] dt-bindings: phy: add rk3576 hdptx phy
Date: Tue, 24 Dec 2024 17:19:13 +0800
Message-ID: <20241224091919.267698-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCH6oaYfGpnc96lDg--.3901S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry3tw4xJrWkuF1DWF18uFg_yoWfuFXEka
	4xZw1UZFWrtF1F9w1qy3yxCa4UJa129FykGas3JF1kK3y8Wr9FgrZ5AwnxZry5Cr4Duryk
	W3Z3Zry3GFnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9Xo3UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxK-Xmdqe1Ai5wAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_011945_465017_0C0C6ADD 
X-CRM114-Status: UNSURE (   8.21  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The HDPTX PHY on rk3576 is compatible with it on
rk3588.

Add compatible for it.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
index 84fe59dbcf48..364db2049ce2 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3588-hdptx-phy
+    oneOf:
+      - const: rockchip,rk3588-hdptx-phy
+      - items:
+          - enum:
+              - rockchip,rk3576-hdptx-phy
 
   reg:
     maxItems: 1
-- 
2.34.1


