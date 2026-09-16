Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85228C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMnF3BDBLVyE/cnSPir8gkf83ZUrMYse381Aw1FfWCE=; b=A9ovPq7NXg4bR+U7666dnyulyE
	uSvof8+DfnS6G4WurmMWNFfXZb6pVPxhLbmTUs0OS4sVFyraRdR8oxj8l4pAy/XrPdAunskX5D/6D
	cDByb6g70sc5fU8tfb1Dqxy8cZwiw01L+KfG8+YJ68kT/dri2KP9hmvQkAj14iaIyT+y+VZojPovn
	hkb4H/IHgVeb5L20/z0CKkbxBqwcVCgRZGyUs/t5nlH8mmxWpzfv1F1/8Lq74PaZaR9PDkAjq6oi6
	o6y+ZcvKfeD/DA9mcJCXk6u92ro/fsN54jEreugbBho7e5P26kogc4zHLlNyXGWGTnAgjaGhi1N/S
	Nt6x6zPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rH7-00000009W5n-1Qjr;
	Wed, 16 Sep 2026 15:10:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGl-00000009Vqq-0LqI;
	Wed, 16 Sep 2026 15:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aMnF3BDBLVyE/cnSPir8gkf83ZUrMYse381Aw1FfWCE=; b=j5p8KXBPmPOqw23xBw4WSFtlbm
	Pqxgx7CRTIo7z0ECrwJKnu1btoXxJlloJfdr0gVRYEBwE+Rz9szmI74B//aOlHA2mjQS9ZLrZ71dA
	7KUeRVs5NMkeV4czB/gX9IUaN2Tz1uZ2HpBW+GH+P9sf3wlE8RDcAhiyhg8LyOAeXco6t7sWpSp+o
	PYol2vPEtIuT3vFRGTMj2OP02zkLe+2ZcuCfC5XeTop6trqjgvjLNdgG7IqP9wpno7XvgSTHsRRQi
	qvtycWdNK7RZCXdOXS1praLKHGTWbedA9c3rhYv6PqBur4bHe57mxH0e2W6Ue92ITtqm5sKRIrCFu
	cFWeLhTw==;
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rGg-000000081J3-3fHl;
	Wed, 16 Sep 2026 15:09:54 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3A5DC2059F2;
	Wed, 16 Sep 2026 17:09:49 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGf-001Fsx-0N;
	Wed, 16 Sep 2026 17:09:49 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:45 +0200
Subject: [PATCH v2 04/17] media: rockchip: rga: removed unused regmap
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-4-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_160951_029660_5CC1ED41 
X-CRM114-Status: UNSURE (   9.60  )
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

The grf member variable is never accessed or written by the RGA driver.
Therefore drop it from the rockchip_rga struct.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 2b4f5694375a4..0e62337f8dd38 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -71,7 +71,6 @@ struct rockchip_rga {
 	struct video_device *vfd;
 
 	struct device *dev;
-	struct regmap *grf;
 	void __iomem *regs;
 	struct clk_bulk_data *clks;
 	int num_clks;

-- 
2.55.0


