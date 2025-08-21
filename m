Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98F4CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2rG6cMbgAtz79p88jMJWZJhTOx0x5/DbRqWFZ1JaTI=; b=4Hd4Uxjv+YPHQPKIsRrMoYugOW
	aApMms5wsqtTRC07qOhsSE7w3qpR7gpD716TEY+QjbLCfFWSURXVNYwQjYmtl8cWYq1fW8wKoEP3W
	Co9FFXvSJSutaYcn0V48qLxid8JSiLmYhz6W5naJhFBoKxDQ0327lWLuS1InIKUEy3gn5+LdpenQX
	RZa9/Yc4uGJFw7HZEBcLBF9dHw5E9vnYQwHHYKJNGLWSePhna3y/drQ4nOIYrHeN/borsBnP1aTJ4
	JRhDSQe+uWISi4mMaN57xRx6U1r/EDTCfXdVV9/TrgK0wmxHDaFSKQphXgvSmKdLlAmsSau+X6AZr
	Fvgsj3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7Y-0000000FdYN-3FQk;
	Thu, 21 Aug 2025 03:37:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uossg-0000000FHGp-2SIa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:10:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8D36919E7;
	Thu, 21 Aug 2025 02:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734954;
	bh=djc1VqDhJSWUH2aq2eWbBkRokHwmjR7jp4fL7ZQQIWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I+ckUQAMIknNeMk8ssliR8WmdEzfv2Kyo1dVOFtSaJyjw11K2AoIZEW1ZfCtimjFC
	 hvFkTf04WMNbtuKUdKcWTQuJXIYjGVl8Ywq3RmGheDWKcXobbuPfUEQKGDyFhK3O+e
	 edkKpc/NJV+M5PzQCu/ZQFQqu5wo61AKpffXIgWY=
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
Subject: [PATCH v2 03/12] media: imx-mipi-csis: Standardize const keyword placement
Date: Thu, 21 Aug 2025 03:09:35 +0300
Message-ID: <20250821000944.27849-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_171014_762060_0AADF83D 
X-CRM114-Status: GOOD (  10.75  )
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

The const keyword for pointer variables is placed before the type
everywhere except in one location. Change it to improve consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 46f93cd677e3..0f0863011230 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1029,7 +1029,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *sdformat)
 {
-	struct csis_pix_format const *csis_fmt;
+	const struct csis_pix_format *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int align;
 
-- 
Regards,

Laurent Pinchart


