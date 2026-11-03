Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408DB606A7A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21tcM0uc;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ICvj5WE+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VI0iedr3l6UnJVhvQ9nem8eALFnLeOipkazoUwv0yeA=; b=21tcM0ucEG3gHS
	5HpON5YjLtDkfgAmi5kxNcGuZRpp0sr1AJf/HlHjy27S5xNufO2tu1t9RWSby/ck+baS2QmGGrPNG
	NXye1ma480bh3c97Ll2YK1M3OPoLmQ7GOm4LsCPwqVb+bEQlPFWywYHy4ljzDQ8wFoDMJltqlmaln
	Sb3GgUhDqwELYKjUj8FkD+vF1+EWrp+WwfUUQYZXfC7em5aeIY3dsCPEgeF2j9A/67gOJzdTsN3dH
	fS4zkcV5ZPpLaFJH9d+nE5rjAueQTkE335Q35o1HP1GsjNHvRFp7n9EwDDwsmzHL2ivSYw0yGq0BB
	MKj/bVSg6gPFf+5PHuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrO-00000002mjn-0Lmr;
	Tue, 03 Nov 2026 14:51:38 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrI-00000002mcu-2ShS;
	Tue, 03 Nov 2026 14:51:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E4187202BA5;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VI0iedr3l6UnJVhvQ9nem8eALFnLeOipkazoUwv0yeA=;
	b=ICvj5WE+/qMkpksveE1cuUdf8x62cyKCNRavmANEo6QpF26Q1n9U7prkdYvQ8p6aKlmxHT
	WxXMnwIzGBp0vTVLPiQIlzDh5SnJEoSIwpdO3WVPstLXliT7MDeulahR+QRTRD9HlyeU+t
	PrgBNL6/ww+oII5JXrzRoip3M6yEP5ETo/L4qtP6gDNtAvNrUoLSY4HP7HNdDR886PqtMJ
	eloY2mmlyT9lgOk0+8q8RFZ/TU6AIKSh7MSCl6/G2Cg1sr311OjTsbkUar+yg+Xg4Nj86O
	bMZRmQ2MDFR1ciRU+rqGr2ZXtYtNji5iUbRNK0HDCuuY9HTtB28UZbjmdTt6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VI0iedr3l6UnJVhvQ9nem8eALFnLeOipkazoUwv0yeA=;
	b=J6Svhfg4f47IA3gpokoOvkGdpVlJiYbImQsmVWJWekBiliqoHSizbON+x6tBje77cpw+Vl
	pO7T0rp6qI+Zjxrvdf4Qt7mw4uSCHSHEQ1eqpKQyo+tnuR4JM3erEWwbJXQGOsISfEzi8C
	CGYqkA5CR9z1wnQSv8q2PzN4wK7U5svIXzeMTkSQ6b1cVJKpVqidMcUBtN2Mjlp9BSeYpF
	si1+2dVVTQLiOplpYqDH6dM+aCdLFEKxQ0I2r91mn+8Ftb9Svh9eapEWyfGXBHSTPga35T
	/vjgrsW4+jL6ozXkFXkJCleBnBAPGJ2/E1PFfTNYDuIcvTqmJVdN0aXGln+C1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=CamiGPHrqXx6rLoBJojRsvaJVAtjQq/DmT/0WlQowAxv7wXui+Fn/VWWuYAsf55K4m7Xgm
	lQo3eCZ8ROkyiZtR2/SkwK+aartL+iqv/Iivheyu/jDWOqGObhePx5vQO8rL920Rb/GzM+
	ejk1BYyHcmgC2uXnCC+n4Wth14TQa/TsTI9r2lCy0nRnxNbm8l/qRTwksE+u62gwxV6KVE
	lRKHw9T96l8iNj7p18A92rXEmB/vGtbpmTU1HhvycKCUL6pdu4kScHpWhtmeNNpvR1ptYz
	reLOYFKYO3MkIZqkpcWbTeqDJq5O1OezGk2nze4IkVhXft6F7zJDOgJ24u4r6Q==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2g;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:25 +0100
Subject: [PATCH 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065132_780091_7F6A0FD5 
X-CRM114-Status: UNSURE (   9.15  )
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

Simplify mpfs_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-mpfs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 8ffcc54ee6f6..ec61b4a1d753 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -63,15 +63,8 @@ static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
-	u32 reg;
 
-	regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
-
-	/*
-	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
-	 * is never hit.
-	 */
-	return (reg & BIT(id));
+	return regmap_test_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id));
 }
 
 static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)

-- 
2.47.3


