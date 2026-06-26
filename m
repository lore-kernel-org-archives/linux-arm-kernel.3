Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF73CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ7wgtXyvk/3FeFYVtkDe9ED7DEv3WBSl1ucjzdxUyY=; b=rIRBrpDlGOXcsHOyZBPvs2c/xH
	NcBb2AAkaVtNayZN/S0nQW+BWPCtXx2a7GAr/nsGDe9l0eUuBwFjU/oPa2I0z3BoCQKXPg5hRnE5m
	AsV8IDI/NiVHimXYyyPuA90TRmcoffxyB96icMXW0jDQ8JomkUpFDsSBGmIWIeC9O7mnaEdapgNJp
	6kjqeDl/98X799i4ZTm9eP5io8bLCl9DG+pdd/vNfeo5ARjettZLLPD262vRIjDY9Q1N52Cn2q7mI
	EpcdGkyA1Zf11wT/gV+YefE2aiRWiyBLwlEa+FdLnlkAr5OGaZsY4d/Tr1rb6PbzMixVh9UByyTud
	uD3g2Q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcu7w-0000000A1Ec-2ohf;
	Fri, 26 Jun 2026 00:09:00 +0000
Received: from ci-2003l-snip4-2.eps.apple.com ([57.103.91.243] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcu7u-0000000A1E9-3xIJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 00:09:00 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id D41541800284;
	Fri, 26 Jun 2026 00:08:54 +0000 (UTC)
X-ICL-RepId: 019f0142-10e8-74ad-a658-05469e604257
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0cZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9CFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432538; x=1785024538; bh=nZ7wgtXyvk/3FeFYVtkDe9ED7DEv3WBSl1ucjzdxUyY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=A+QmsujqOS4jOUxaNydR3ytr/pC7Irog7UXG0XvYfLEZYvT7haKlmiAQpuTt731eoCdN5Xe2G8eUrZD1LkRlqVuskrGLrBKVgHYInLLgmr03ynor5QERotET11Lq2+uO6YIe+Le9cfpf+kPfoenJIdUHwWyPnIn3Pe8yWpxc2bjwEx591y8uPlPyGi2wbHJIdDpDQ5LAX/yRXDCn3uqap0+eu0bNE2BuAHYVfZkCm+78cho3VKt6yM0KFX9lHxDm+sQKpT878x1/JwD6rwBWIr/cFkijHDRWqOnRW7YvHtDBJL7PgCCEu/deIvkdaqVJzUZ7DpYN57cODnO5FDdQPw==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 45965180017C;
	Fri, 26 Jun 2026 00:08:53 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH RFC 1/4] media: imx8mq-mipi-csi2: Make reset release SoC-specific
Date: Thu, 25 Jun 2026 20:06:57 -0400
Message-ID: <20260626000715.1111803-2-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfXzl2hTTyf+UFU
 OufgbIX8ySBfbVloFrhMkgVmNYuVoNY7R+T8/0taSiKkviavsuFD07nBqIXUyJunGfwEXqhO3Bb
 iBW94lsTc+GZInNgDnTE5By1CT8cJehpcqWb0vjUtMjKVvbsK3B0P09SYOeKWgCqSubrXSbBfHC
 ZVsH+9iXR9G5aok0bwP2fMy9FiCzCoBM94YRRpJTEhqmpaeSZtITcESOsyT1AsjvCtfK9i1qnNd
 YDyiol9JzZkIVkqpjK3dhP52ntBiNDywTwFUrp+WKxPqReMSGk9Irxz0Sw9t0y8Cd1wK2GSNunN
 zprrJc4Dp//grnW0RB8
X-Proofpoint-ORIG-GUID: rMND97hAp3EnijlxfVwQdwYJpHhh4OWz
X-Proofpoint-GUID: rMND97hAp3EnijlxfVwQdwYJpHhh4OWz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_170859_035347_B68445CF 
X-CRM114-Status: GOOD (  13.98  )
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

From: Vincent Cloutier <vincent@cloutier.co>

The CSI-2 software reset helper currently asserts the reset control and
then releases it again unconditionally.

That release step is required by the i.MX8QXP path, but it changes the
reset sequence used by i.MX8MQ. On Librem 5r4, which is i.MX8MQ-based,
the unconditional release step prevents the camera pipeline from producing
frames after reset; captures time out waiting for EOF from the CSI bridge.

This series enables the Librem 5 rear camera on the second i.MX8MQ CSI-2
receiver. Keep the i.MX8MQ path on the known-working assert-only software
reset sequence while preserving the explicit release step for i.MX8QXP.

Make reset release opt-in through platform data.

Tested on Librem 5r4 with the existing HI846 front camera and the S5K3L6
rear camera added by this series.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 950793297496..xxxxxxxxxxxx 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -76,6 +76,7 @@ struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
 	bool use_reg_csr;
+	bool needs_reset_deassert;
 };
 
 /*
@@ -244,6 +245,7 @@ static const struct imx8mq_plat_data imx8qxp_data = {
 	.enable = imx8qxp_gpr_enable,
 	.disable = imx8qxp_gpr_disable,
 	.use_reg_csr = true,
+	.needs_reset_deassert = true,
 };
 
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
@@ -363,8 +365,12 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 		return ret;
 	}
 
-	/* Explicitly release reset to make sure reset bits are cleared. */
-	return reset_control_deassert(state->rst);
+	/*
+	 * Some SoC integrations require an explicit release after reset
+	 * assertion. Keep this SoC-specific so i.MX8MQ retains its
+	 * known-working assert-only sequence.
+	 */
+	if (!state->pdata->needs_reset_deassert)
+		return 0;
+
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)
-- 
2.53.0

