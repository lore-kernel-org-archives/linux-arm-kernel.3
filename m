Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2DECA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WppILKb17jpPMEv+abYFK57SGdrfegVHXP1jRhcNhX0=; b=mJqotrSSHGdCVDueCTe/wzZDg9
	mwnyU/MewfcgiuglKyoA6Rnz8nMXlhAdxbqFDWPirF6hWj8EAi+G/g0J4FauQ2C8OdZ2s5fR4vydz
	ZERGNUyR2BOzseugLPdfUelxdOZF3JLnSb1kJzUdxaXCgkWAmtM4iqtbN+AiED2ABUxfkAvkM+Eob
	OVZHZp6DnO2W7ojLyv6QneuyaTyeJOSUJ6+xwTQcfqa3Fr4e9dmSeL91J7eSQzXNi3NUCVBFyupCw
	W+nV1sWjdlM2Yar6czgOlXlvPPApRZ0x7/MeEtM7v6oGrQh2rI2Y966h6FnUHweB4Qx/IHYyHL6R4
	pT3I+wmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqj-00000002I0v-0WmW;
	Fri, 22 Aug 2025 11:22:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdU-000000012ND-0c2z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4D3F7101F;
	Fri, 22 Aug 2025 02:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822423;
	bh=la80gbOKfRBicT11Der9MQ4qlVEV/HY7RqFKZw2/94M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rxpjLxRbXIbcaxq6T4K6TE92bkFYAE8LfiIzTpWeD9Yl0ceUCrYknY1BMR/6mThws
	 2W45FznOSA4dwCkys7s+i4YGddd9lLJhv6iGEh603YfS4jVGdeef5kew3yYBIF3oYY
	 GRY22yL2cUh9Z3Ft+aVG29x/NUkzZ8rwsOj3fVS8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/13] media: imx-mipi-csis: Standardize const keyword placement
Date: Fri, 22 Aug 2025 03:27:23 +0300
Message-ID: <20250822002734.23516-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172804_341682_B9A039A4 
X-CRM114-Status: GOOD (  10.46  )
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

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


