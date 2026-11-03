Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67850606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QvQin0w8;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=L1Z6w3oW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=; b=QvQin0w8SsiIcQ
	iG0xDhlYCIcXnfNR1X66ZwO1DvAbdn1WAX2fKL6mLGq616j1RYaVei/CvOCXLimVNQr337zpwdzD8
	+egKMBJrsp7aFw56cWeE6T/RO8XekzrzD3UlWu2pLPumO5zIg/Kc4d9EDgnmR6OHDy/gPoo/bOl78
	r4HaPxBKtuP6XyGl/Nt4vThYTG77MAyhy4HWmxTmtRY+64O90e68Yn3li8TjJLllk/qprIIKneB7Y
	xHbV/mVDczvm5ZQ6vsQhEhjTKzq1f7SiDFL9c0zrWiMF4X4WZMjXYlhlQ8cWp5b1qWayuT9iNDkGD
	T9Rr2ytj79SZp7JpNRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrN-00000002mhd-0yuf;
	Tue, 03 Nov 2026 14:51:37 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrF-00000002maz-1Iz8;
	Tue, 03 Nov 2026 14:51:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AB3D7202BA2;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=L1Z6w3oWkDzOf8lIRaYEbemBCSRt9CXO4b08GZWltOfPvN1pWKH2csHAAra+Ac/B565s8k
	1D6Mi4JLr5P7jmiPRplXUdDOZAk4VAwaEUIIk7m9VO8cbK2bQvDpVpt+c4d6bLwEWRG4Lk
	w0SLSEoBx/rAec84QSC1GVoofrZ1BQ6C3GXRb51yNkE83gDscVdyQVgceTHWk9Grz5Pn1z
	cOA4nihlNN9Tz3fNhuQzECgMF3nYNspnewuT1cFlGzLjvnu7kF4qQe4WuvtKYscui201u1
	tSscqVgzH7ayLr+NIFQ+Qb1as8fFHHJz10MH4O91o62bv10Ri+OS0KFj884hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=I7ta2EL7OaPSkZiL8pKhQvUioz5W7qWIWrNDxcQ+3dmYTk1/TEk3fXK0Rs2B8libFwxmNj
	zRukQrtSG3pWuTuniJj5y6DatOdgIQa7lG8LK8nyMWejZ6MZkCWcI6BJqbOirKGXu42vKm
	iA1S9hyTHDI/mmvcKYNk8DIfmJn2NNWy+jna00Z2V7Y3S2jNABa3iIdNzLL1Tln/aHpiVM
	Em/gmAY+cWP/U5+x3VFWR68vZkPaDcHc6tKkl7M5oHyY8RO/FbdQ3OSgqpiTGZ9WkD6ZK3
	a4EnqiFSHWYUB7VbGikLzHnIvjcx7ys0GIhavBlIqFRLxPg66D0mzfd9QC4uog==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=c1mLQUJ5miibh/bw59bHEKZA8jr59e8+osaqD3PDeMtsRFrCcrB6jJcKCTyabOj2+H6OJs
	D4DC16e9FRXAcrJ0UJovaO9mdqQfYvWcDlsT3HjuaR16Tr57uT1QAT1rZFa2li0xSqBEOT
	tmYh3NIhmSegxpm46O0+D5pLjykzohNurQubsOTWABksh1lOjoxhGRsOIn/fs+CHBHpwft
	B6zORPC9Pl+ur0jP5AFQKQ6UF9SG0oX1iXYGPqHJLd/rJABNOkvAUtUJUFA65zq3danDfD
	PcQ9ZCv3Pw2ixcDXUdlWkKyJEe6B25uMTybQ5NM/1oRR3UIlpkl7cVNibOupyg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-1u;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:21 +0100
Subject: [PATCH 1/8] reset: a10sr: Use regmap_test_bits in
 a10sr_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-1-1b33607a76b0@pengutronix.de>
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_065129_652400_31FD3EB2 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Simplify a10sr_reset_status() by using regmap_test_bits().
ALTR_A10SR_REG_BIT_MASK() is a single-bit mask, so no functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-a10sr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-a10sr.c b/drivers/reset/reset-a10sr.c
index 99b3bc8382f3..3285f68a72fe 100644
--- a/drivers/reset/reset-a10sr.c
+++ b/drivers/reset/reset-a10sr.c
@@ -67,18 +67,12 @@ static int a10sr_reset_deassert(struct reset_controller_dev *rcdev,
 static int a10sr_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	int ret;
 	struct a10sr_reset *a10r = to_a10sr_rst(rcdev);
 	int offset = a10sr_reset_shift(id);
 	u8 mask = ALTR_A10SR_REG_BIT_MASK(offset);
 	int index = ALTR_A10SR_HPS_RST_REG + ALTR_A10SR_REG_OFFSET(offset);
-	unsigned int value;
 
-	ret = regmap_read(a10r->regmap, index, &value);
-	if (ret < 0)
-		return ret;
-
-	return !!(value & mask);
+	return regmap_test_bits(a10r->regmap, index, mask);
 }
 
 static const struct reset_control_ops a10sr_reset_ops = {

-- 
2.47.3


