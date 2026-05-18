Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA91CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/CQ7lz9+RdkC15kpfvNVPpujd3d4yue02Wi8fc96jM=; b=qOPZlbIT0x7KDtyCsGaa2nmxOP
	paRyuqK91/q+02LVy7am2LDrBI2mV2fyZZbKrQrNsvuoM9iRffSEswxTLgHOMQHJGMdUz38DReR4H
	lgcDaUgQodP+doukFOq4or1+yBaSzZ0gS3LOI/suGegVL4z+NNFaeyqFElD0kjqHTGLP9Onxp5323
	iIaDD30z583qQHlQXudqN4dy+Y5ACP8I9g86oF0nVi8vrO2zbWBzeGXH5XR9lHhEhjwS/5bDc7VDX
	TvxuDV8t77HL3mrLfdP9qrqsCsRywgDKKg9erO9ixTFbaIReEMlxHLNz9Bz8AOGW9kYYV9+acNMlN
	UxbgJ66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvFk-0000000FF3t-2g2A;
	Mon, 18 May 2026 10:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvFj-0000000FF33-1FS3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w/CQ7lz9+RdkC15kpfvNVPpujd3d4yue02Wi8fc96jM=; b=HlqV4prlewUtuq3twm9vJOiGxa
	sLXCdsa2V95R3jwEHl9Gphi3QdE8HeTs7Sv5IRVMRlwZES2eyR7b8s1MnQHa0t3+ACeYN9/d2+GA5
	otBw6y9yJ6pGH9DTpiur02zaxGgwhggkWGseYUyv96q8WjLkbaTQMU8YdNtzxuNJ+EwzKeC6MVnu1
	c8PcUJ/ZaUydvhKrWcDEOQPSJM7cJjl/98UI2nXlZH4yIJ2r9H9CnEXlpi045Uylz6vpYLUK2iE+H
	e8DQh8mmXTcKJlO4IngGQA4pr6+ldtd38s03SubmVmdYRSF3KsfRt9tdVswnPBLXGHMWzfsdQQZRR
	H9+pSbbw==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvFg-0000000AluC-12PI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:31:14 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1C3C41F8004A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:31:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 988A8B40822; Mon, 18 May 2026 10:31:10 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id ECF89B407F9;
	Mon, 18 May 2026 10:25:00 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 12/16] media: sun6i-mipi-csi2: Fix parenthesis alignment
Date: Mon, 18 May 2026 12:24:47 +0200
Message-ID: <20260518102451.417971-13-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_113112_742035_4BFE3597 
X-CRM114-Status: GOOD (  13.11  )
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

This is purely cosmetic, no functional change intended.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index 682bdd82098c..17a9a215a98a 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -96,7 +96,7 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
 }
 
 static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
-				       const struct v4l2_mbus_framefmt *mbus_format)
+				      const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
-- 
2.54.0


