Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE97EF99CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VooHUkILlEX22HM+1BGptL6pUZJWCXhW2aLCAvE9vk8=; b=dlUOmps98TF1VlVYFvceDW7BKX
	ymysvLYrAewdrc8Cpgkx/hXQzW/rOTGLH+s9YWkigHdoL07is9Rz/hmXd16i9UwRg0pSwlXN8r4r/
	HGtS/GmYPoAG6/aJPptd4xfdEDdukZ4oiHE57CL81httZc4Df7bOnLIdveMpntbqCF+s5V5ypT2ij
	dF6a9gIhugym8rhUHHW3o1zF96Tb6wfoqMwc4Ax1gTR5SsF9OQvTMkN0eBWe183RdqSXwhPwY0RZO
	/q/LpgaaAdXN0b5eZiHHAU7e7bYsQgHIkywinf3ZHDvsj1YWhoea3fbk+18YmImHFBww7kOG+eDp3
	W2W59wkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyIg-00000003o50-0oPV;
	Fri, 13 Feb 2026 18:53:58 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyIZ-00000003o2E-4AWx;
	Fri, 13 Feb 2026 18:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VooHUkILlEX22HM+1BGptL6pUZJWCXhW2aLCAvE9vk8=; b=S+w/EO25Iw0KjjlzEY15Yq5eng
	wc6jSMH1Abhtv/ZSCdCAQRvaQSCzltFU62TF07r9ibhIRC0JcmOzKEfieh8oWimEfbffT3/pZRXJa
	fR0/3BibLW8KHzB6CqsCHJIWrdTYAeH3y0dXkC++I6STZeZo97H9ciVwxgkrE7O5t7atlZSIXPquf
	FaB6zHHjds0b0q4qXi1DunPFeRH8HtOQw9b4PAaytyD7Jnhtev3nthh2k+VLFIO1dbQUxnsQm5daG
	P0s5WRJXDNSLcL7NMysLbXlgQOdhkdQfuF6v7C4ono182lWiw7H7Ma1/AxUMhWo75om69g5t4wv60
	LQ18U4CA==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIQ-000Sqv-JG; Fri, 13 Feb 2026 19:53:42 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:55 -0300
Subject: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
In-Reply-To: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=SXWOiF7riXcp5Tqr9aEaZy6vMsWyYl4q2EW7PvyU9gw=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3Mnif2SqX0u6MgSpyCyhGxMZzZL4MbZXRgRu
 t4pFmMz/JiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJwAKCRA/8w6Kdoj6
 qkGUB/4pxbwzh3KhFyKOzblO+HwdyoUDKseNz6oOQ9Z7CjdWxHn1B0350PaFJnbkWFMRPguYnan
 65Nnlg21IN8P9z3w6XmQginz0nNeWZ6dagnfii2/75z3MIQBpoT2ZaWvGfm+juoQnbB+/R/VbFc
 OJIONbrnxyMIDAlhmZPti8oHxGK9U9kLtacsF9afN/nkC2KrIos2+0ydifCRKWFVQfAAAF4qXuV
 0s+SE0o8QjOwE7lkLgliXr5eQuXtdY+Cx6pqzfB19h/xEPz1w117EG7LJS+r2iLQuUuaCkszrjJ
 qYXc+jh+OY2S5EMUW/eHujJ2wOnwel1Goka3Omu0ME1fsJ8+
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_105353_167081_95BE6FD1 
X-CRM114-Status: UNSURE (   7.20  )
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

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. Document this behavior so that clock
consumers understand they may need to set the rate to minimum before
disabling for meaningful power savings.

Suggested-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666cf6d02baa8be11c 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *hw)
 	u32 state = 0;
 	int ret;
 
+	/*
+	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
+	 * actually power off the clock. To achieve meaningful power consumption
+	 * reduction, consumers need to set the clock rate to minimum before
+	 * disabling it.
+	 */
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
 	if (ret)

-- 
2.52.0


