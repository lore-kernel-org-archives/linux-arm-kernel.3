Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB55E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4e1obV0cPgwgcDo8hxgun6VysOTGhY7lznRi05MbxUo=; b=N3md0M3YMcCUX5YjTzFEYTPNnN
	6GtVcV5RovQZ4dY1uvsq6rpL1487zzHGUl5ib5bDWREyDJGITocIktqc1ju4+26Z70lBDq/jn9eDV
	ckO/aRX821maWEV4WQ5JtM94XNklFbPy2P+FvFrF1DiWtnbey/erDJ6loc9n3MYTrFq8i88T17qDQ
	IcKYLc4zPgWU3/RWpqQnCRgjmcZ5xGERDr96fIg5JPU6apcXMYpKyuKc+YBwR0PGrsF5bJrS0njoX
	x6Q9mNeTG60hPtpE/GlRK00CFeCN4lxJ1GVS0pS/l2QG8kDSJl4jSLRTS23T7Rxvx5z9gUZ66ImlY
	CZPByigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0Dq-0000000BUNG-1wsI;
	Tue, 24 Dec 2024 08:24:58 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0Cd-0000000BUIc-4Awe;
	Tue, 24 Dec 2024 08:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=4e1ob
	V0cPgwgcDo8hxgun6VysOTGhY7lznRi05MbxUo=; b=XFOUyotvyRIhch8RN2oEj
	a6coWCFhfprvFsF2HxT78buQS8B2Y9ZwSBBk2fp2+PEGq33VPGLBady9lOWLeaMT
	cKXmEgstp/orNNB9cXPHCebNIJq8CHTuE+Ic5SyVw2hzjKZD6J7ZoudWAh0JMJT8
	dVLALRjGWfE9OQFc2ya5PE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3R1F0b2pnfyNbBQ--.5317S2;
	Tue, 24 Dec 2024 16:23:20 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] dt-bindings: soc: rockchip: add rk3576 hdptxphy grf syscon
Date: Tue, 24 Dec 2024 16:23:09 +0800
Message-ID: <20241224082315.264091-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3R1F0b2pnfyNbBQ--.5317S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1rGw13Ww4UJr43CF45KFg_yoWfJFgEya
	4xZw1UZFs5tr1Fgw1DAayI9Fn8Aas7Kr95CF4UAF48CayqkFZ5KF95Xw1akr18W3WxuFyf
	ua1IqrWUGanxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1yrW7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMx2-XmdqaMi32AAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_002344_877332_87C0A3BC 
X-CRM114-Status: UNSURE (   6.18  )
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

Add hdptxphy grf syscon compatibles for rk3576.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7eca9e1ad6a3..61f38b68a4a3 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -23,6 +23,7 @@ properties:
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
               - rockchip,rk3576-gpu-grf
+              - rockchip,rk3576-hdptxphy-grf
               - rockchip,rk3576-litcore-grf
               - rockchip,rk3576-npu-grf
               - rockchip,rk3576-php-grf
-- 
2.34.1


