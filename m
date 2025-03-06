Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1945DC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEc22yZeoDa6MPEmz1C7gj1j4E0/lkfS2wSNyIyNKlQ=; b=NTUoG+IEMb+710S50xtQ9wGkim
	xHTJu4+6RSAGIVLqkev4GGMiCTJhg9JXJpRIVYf1HNBttEwf0e6LpDrxote0hIXCcWzF6wN6V9WNu
	UdumyG2Lg24tCJ03Nb3t1Dz6YPnUyC6cTzD7SDhLNLwyv2yXAwPMw98ECiv8YqY7AX52ipWyG9YKu
	N2LxZWF20fuBAytqOIqS9yqVaYgzaG8iVra4mzYPHMqIRimvU2dfJv5EjwKQgBISNSL3kQZZxQO6T
	cXsiiXVYxXDyMM4mtCQftln27xU23YruzHEzIev00MCs9HGq65QG2LzgqX5pdJ0mvcWWdCoLlZo+a
	SAIlhyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC3v-0000000BBJ9-23C8;
	Thu, 06 Mar 2025 14:18:59 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAZQ-0000000AxR5-2Vec;
	Thu, 06 Mar 2025 12:43:25 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2b83ca6;
	Thu, 6 Mar 2025 20:38:19 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/2] dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
Date: Thu,  6 Mar 2025 20:38:08 +0800
Message-Id: <20250306123809.273655-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306123809.273655-1-amadeus@jmu.edu.cn>
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUhIVkpMHR5DGE9PShkaGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a956b76c06c03a2kunmd2b83ca6
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ny46KCo5PzJJIjMJMBlIIxQU
	OCkKC05VSlVKTE9KSU1PTEtLSU9KVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUpLSUo3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_044324_823569_3E3E0BB6 
X-CRM114-Status: UNSURE (   6.87  )
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

Document rk3528 compatible for QoS registers.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d67ff26d445..2836e4793afc 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -103,6 +103,7 @@ select:
           - rockchip,rk3288-qos
           - rockchip,rk3368-qos
           - rockchip,rk3399-qos
+          - rockchip,rk3528-qos
           - rockchip,rk3562-qos
           - rockchip,rk3568-qos
           - rockchip,rk3576-qos
@@ -202,6 +203,7 @@ properties:
           - rockchip,rk3288-qos
           - rockchip,rk3368-qos
           - rockchip,rk3399-qos
+          - rockchip,rk3528-qos
           - rockchip,rk3562-qos
           - rockchip,rk3568-qos
           - rockchip,rk3576-qos
-- 
2.25.1


