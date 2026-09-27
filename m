Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE7C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=copIDOk9MPWo/ov98Kor/uunS41vMva72FnQRKJ6hn0=; b=EDYpxjeU0j6e5FeZmwynBB42Pm
	S/6/49XRuHS0sg+z+h29hRGynwZd+0JG0VUT36OwsU01NhtbUXZnmlsMinqcvti4XpcrJY/jlwEu8
	zz58hUMJoeWozzMmOH78rpSPRITQqgzrXy0lfbe5A122a45sNBDpVqJHd0RYKw0eFDisTfx8rA5Lr
	YKFGDFBcZyeq39sczP8xId0SrMIBLKOba88WB5TO44sZswoWH2m6ciu6J3oEZNOzJsAM2KbBKJ3XY
	h0wXFO9BCJ6kc5MadJvOzUy0Qf9Srnbb16I/ZcySTZLj+ZTlcscVQgTypeUX43pxOgFI+78KMR3iZ
	cmEUIbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApI6-0000000GPbu-1rSG;
	Sun, 27 Sep 2026 13:51:43 +0000
Received: from [117.135.210.4] (helo=m16.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApHw-0000000GPX9-1RgX;
	Sun, 27 Sep 2026 13:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=copIDOk9MPWo/ov
	98Kor/uunS41vMva72FnQRKJ6hn0=; b=eyjhIqByEb7NWcYOuRw1WM89U7ynErJ
	AbdwcUOtGjoVYbZcb4aU+6a63pWFjJ/EhooZD9bq38TQ1Bkb1ddTQpqjIDBlqEjI
	Lb0CdcP2JrJzBfzwt5xi1fRbZ1oyyxQsIh9GhgTliA1DSeQYn277gFySRddjorC4
	PdsLcJNdNRWs=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
Date: Sun, 27 Sep 2026 21:51:28 +0800
Message-ID: <179051708845.31632.10915026963421643453@163.com>
In-Reply-To: <179051707448.31632.10412780322071844492@163.com>
References: <179051707448.31632.10412780322071844492@163.com>
X-CM-TRANSID: _____wD3X6FgH7lqPRllBA--.6436S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry3CF48Cw47ur1xCr1xXwb_yoW3ArXEk3
	WxuF15uFWrXFyFgw4rAFs7WFyqvw42krZ3AF1UAF1kA3yvkrs3KFZ5t342ya4xWr43urn3
	CFn5tryxWFnxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj22MUUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gDoVmq5H2CLkAAA3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_065132_826014_EF846335 
X-CRM114-Status: UNSURE (   4.02  )
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

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.

Signed-off-by: BG9OXA <bg9oxa@163.com>
---
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board
-- 
2.43.0


