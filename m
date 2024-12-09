Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFCBE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d76oW+hJ02vk47g5jJkDC6wrHjePHlmxkDGSNxOrV/c=; b=Awvc4S4fXNQ7PzPQfwuujV9ypi
	uFEYqCrd3znuTuHv8sNJ0uYb8GHZNPaKUDetvyjHvD1y3X0NOPQ1CuQh/q2ltmJru1a7DmP0oun9G
	dcbzN7UanGWFSRqjjcvoxEX91SW1zQSvpljX0Ol8lE1A9K/EU3Zd/DjVMw6j1LcVaCtUemJNkx28e
	kOyRpI8bHFfgm+zKrrc6bbA8RUN/Jq0O2FfjNEfNDIl7EtaubyfQVPOk5KhG7m3gtYENDB7izvLw7
	0NiXxmwClSSyU1QPesBxZBh9FB7m0AXJq+j0nStSQfAwW/D0Gh+VIhkOFd8X9orkhvxjkfCKsIXAR
	7AILgjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdJ4-00000007ooo-1cHX;
	Mon, 09 Dec 2024 12:56:10 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcyD-00000007iR5-28pp;
	Mon, 09 Dec 2024 12:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=d76oW
	+hJ02vk47g5jJkDC6wrHjePHlmxkDGSNxOrV/c=; b=JN46gX4EZm++x12IfZThB
	9F13bFE9h7hJKoSaR5PG42H8CxQ4JAPFQ7iFsnv+zsecRI0cMID7nVSKNYiA9H5S
	Q7d4xgYjQ6C5qu0unxSTaUzDXDMs+wUHaMtSnXK5bVGEWMwR8iVmSLmB0latttCg
	xCC/UF009CEOSZyFqDKAXY=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgB3ZvLI41ZnB5_9GQ--.40223S2;
	Mon, 09 Dec 2024 20:34:19 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 17/18] dt-bindings: display: vop2: Add rk3576 support
Date: Mon,  9 Dec 2024 20:34:14 +0800
Message-ID: <20241209123415.2782172-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgB3ZvLI41ZnB5_9GQ--.40223S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWrKFW5try7CFWkWw17Wrg_yoW8WF1Dpa
	93CF9rXry8GF17X34DGF1rCrs8XFn7Aa13GF4ktw1xtrsxKrsYgw4agrn8Zr45GFyxZaya
	9F4ak34UJ392vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URHqcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gawXmdW4xoePwABsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043437_930414_2AB0BEBF 
X-CRM114-Status: UNSURE (   9.51  )
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

Add vop found on rk3576, the main difference between rk3576 and the
previous vop is that each VP has its own interrupt line.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

---

(no changes since v3)

Changes in v3:
- ordered by soc name
- Add description for newly added interrupt

Changes in v2:
- Add dt bindings

 .../bindings/display/rockchip/rockchip-vop2.yaml    | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..a44964b6c36a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +38,14 @@ properties:
       - const: gamma-lut
 
   interrupts:
-    maxItems: 1
-    description:
-      The VOP interrupt is shared by several interrupt sources, such as
-      frame start (VSYNC), line flag and other status interrupts.
+    minItems: 1
+    items:
+      - description:
+          vop system interrupt, such as bus error, and vsync for vop version under
+          rk3576.
+      - description:
+          independent interrupts for each video port, such as vsync and other video
+          port related error interrupts.
 
   # See compatible-specific constraints below.
   clocks:
-- 
2.34.1


