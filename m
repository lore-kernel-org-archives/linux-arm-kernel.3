Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC990C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvpwYoZhjpVxxA/g6a5zpGQywEW0TuTGho0bsP99zp4=; b=QswqPICT65u9uEjDJVBSL0mzEX
	T8PYOvdq4KiGkPbe07qGtvEh3/a7SGruXgPBBkKnGqY109UwBOwmIiPHLmwG3Hh3KnbaSmpy+OsyB
	Jgo5o3rcFERfnKTOjusydQhq2GjVGS8BwMdlRyPFzjNVRSOhcDjGpOg7Ui6JSmNuQYrxZs5AqoCDS
	tSTwUKxiBkvnwHavz2zKVsKlIj1y1J/TeH3daHPiNpMAmmdNLligF/uIzWyItLN8yNfVw6GRDytQy
	YOHM+kckE4mbSCe080Yg7mIH7rl2veXBwA5fCrN3PpRE+/eXRqkymrFfM5FlsPx6mX2bUewH382lP
	1ufTMrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1f5-0000000CwKl-1teY;
	Fri, 25 Sep 2026 08:52:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1f0-0000000CwHj-0XJ3;
	Fri, 25 Sep 2026 08:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790326319;
	bh=mpOjposL1T3dyr5UH7B7ZFdWCYljyeFowhjta0L9BQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=foy6aqowyg0kIUYUoGWLRHioASstBH7w9pTGDmG8YCZamjc5Sdu7WbgAOGtlhVcGQ
	 EJaIMD+CE637KhgfQ5yT6iT+fQHsuyXJ5YoCxr25ioPwub52+AEeZQ3Jhvf+dcOSL3
	 XrNlc+1Dxh9Bs2Z4IHbiV5z2e8n2M3Od8md3bBQlpwvORzlrRADwR8GIkm1i5spzQZ
	 cb8T3pAa9JbGV1SYZNzb92mprT6YWNHjyNFpC5mblIvuRO89vUysl0ib6c6xeL1fIE
	 0F7E/Nfck8JTYBMfnWrzyj6GCdkp0rNPFyW5jjuYVQLDH/g75MUlk8TzZdUU6VN8C4
	 Qe1R7uQPWhHqg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DBEF17E0B0F;
	Fri, 25 Sep 2026 10:51:58 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Fri, 25 Sep 2026 10:51:51 +0200
Message-ID: <20260925085152.41852-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015202_359633_BBE3C977 
X-CRM114-Status: UNSURE (   9.37  )
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

nxp,imx8mq-vpu has been tagged has deprecated since a while.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4:
- add r-b tag

 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 19528262810a..69619d2c86fa 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -14,12 +14,10 @@ description:
 
 properties:
   compatible:
-    oneOf:
-      - const: nxp,imx8mq-vpu
-        deprecated: true
-      - const: nxp,imx8mq-vpu-g1
-      - const: nxp,imx8mq-vpu-g2
-      - const: nxp,imx8mm-vpu-g1
+    enum:
+      - nxp,imx8mq-vpu-g1
+      - nxp,imx8mq-vpu-g2
+      - nxp,imx8mm-vpu-g1
 
   reg:
     maxItems: 1
-- 
2.53.0


