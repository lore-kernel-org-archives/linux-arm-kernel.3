Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE21C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBTtWXqSEkiFxNr7zo956GfLKMTUOahRm4j/m6rfUaw=; b=xCKnwGS3Fytn1eOEiAWPzjYCoW
	399v7ARioBUeVyNvwPG0F1enxS5LETrlT0cyTon4E2QqHJ76ysGJySSn6jBPU1eMOw2xWlMGb0tPb
	tu/57v6FTvqEO5MV5Tvhi0CNskpOWpr9Sw2ejMmSWoIS+eO+Td8Vjtq7VX4hGFnLYOMplolj96rux
	vFHQoowj/qDK1t6OAhwFkVfD4mphEt8ojq9N1PJZpllwhpDwXmXbTgDbYPDCvMnjDIhvMSgoMFanR
	5nCkehpi08SnXXxg06Rnx7eMxMkki65ayznk1PiHMurnyMnXLntC9/egwQZ1zOM2ESFfnuOakv6A4
	xyOqiRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ11-00000003AT0-2LLH;
	Mon, 09 Jun 2025 00:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPup-00000003ABO-1g62
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 08 Jun 2025 23:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kBTtWXqSEkiFxNr7zo956GfLKMTUOahRm4j/m6rfUaw=; b=oS/Mmbbei5zFWlRa0kDGexMLlJ
	im+UfhZJHD0+RE1HjmKN6etlGDH4Homcvcd+D/jO/M3ANdlvA2lmqLeGPxU5Z2HZH9dGZJM6NSWh7
	pT+odSXDj7cUZbD27StorSWLVGqpQM9P4GeLQT6Hw7Fxd8VhykqQdPU0KH43IS6TDk6c7JfmP39uv
	Kzkda16PhQ7CZoJn/EUATUVh2wQiIX8UcuWSnqJEnPAkVWVZD4n9rmH1NfukJInvnui+hw/jxDdo5
	sAqYWIXkkBJ20ju3WhsTmhyawB2o6xDnF1J0MTL7es0ihvpc7xiZGQTXO3NEf7aN7W0BiJDluZoPx
	fMQwgLYg==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPun-00000001YkT-0aa4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EDB7122A;
	Mon,  9 Jun 2025 01:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427129;
	bh=lGvUIS82JYxssO5IZ7LKynUT3kVxA3Vmqhyhr1r/lW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jfLvWx1nPCTHxijxgLANtloh4TXrvp+feTnhbCcIeBFMKgPTKdKgMlb9TwF3Gq6+H
	 GrSl1TxbxxZuDqyjOzQjLML+vhYyxJOeT9rvM2KqtYP+RLTTGkkkCq4dy+UNz+1XwQ
	 TPvMzBpgbcsAc4Uj1P/FF6uSs4dQpUdFYaiMmPvU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] media: imx-mipi-csis: Fix field alignment in register dump
Date: Mon,  9 Jun 2025 02:58:34 +0300
Message-ID: <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_005901_423861_B79D7ABA 
X-CRM114-Status: GOOD (  10.33  )
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

Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
register name length, resulting in misalignment of names printed in the
kernel log. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d59666ef7545..b652d59851c2 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -895,7 +895,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(csis, registers[i].offset);
-		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	pm_runtime_put(csis->dev);
-- 
Regards,

Laurent Pinchart


