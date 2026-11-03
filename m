Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773D66083620
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UxrVMNw+;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KTQ8EfaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X265BLa7eap+hC6jsG4UHQiCMMg6MiP11gMxTREeoPs=; b=UxrVMNw+N4n2gt
	7ut3r6Uxc6vHYDqlH2OhU+7tkhFFLM6TTLwh56qoX7w6xe+AAkQwFr3yS4lGtY4E/XaAUb0V3QccA
	VGeJdL/beBGpubehDfK3WBGVM+RPdnQRUxYCapPV2GhZNJsG2wfqAh3/QHZ+FluFrqwioeacw6jQn
	a9eLdkDmGixE8T3KooXuTERmnq/8zaVMBZZkAML817axrhZCLpaxQczKk72wFKcA8sILFUsUrtYTB
	GTWTYrTJv5u+XTqtou1quKFIbaxvArgr+0ew+o/B4e0gzh0FV+tZn+bsEOgV+GqmQR2LnHlry2UQy
	i48Mg8fw5ZOKnEiJ5ZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrI-00000002mdX-1Fjn;
	Tue, 03 Nov 2026 14:51:32 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrF-00000002mb3-1Igd;
	Tue, 03 Nov 2026 14:51:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CC94C2006C0;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X265BLa7eap+hC6jsG4UHQiCMMg6MiP11gMxTREeoPs=;
	b=KTQ8EfaO3t7b2IgeSfu5l3QnKcGQy4ryDP5+ng+pa2rWScrDG6/6MBLrlnWEYfK+7tuX15
	hInYzlXAP+MMzkqCAWDc65fYwqiiQTz/pHRh790R3wjhS9Jrv8lBLsc9Pfk69GYTWV9B3b
	pAUeHIiZnIMKqCabTFkH9v/P9WrFCWbu4czjJFB+cfcqI0CTGJ+18oO3J82+b0jlaViCtM
	laLYNJUSh8ZKaFJm86nracSclUnNnQiHVUA3l2qkYn8vbr10YGuFs374RVrHgFCxhj+CBa
	rvYEyJJRXwk9CS0+8HtfUXPJ/4mFk69E21U7wpkHRZ3YB5DtAVfc36u5u5I+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X265BLa7eap+hC6jsG4UHQiCMMg6MiP11gMxTREeoPs=;
	b=Tgd5xSbvuorrusawlOCVf2vWZhJO+EKNfDFPkYXFOOHmXzHIGRcA45Fmhk+ThNIbNksNjA
	A91DKpluqC9SnCkxmccRNAKD+/5DdNWICvVnH0fyuYH+A8QkrdD2CcaRCKgkQ/XQMJBgVJ
	FpN0CKPDMIysededJzCiJTrbzPJ1KRN/K6rGq3qcnERtPA1WOcjbQTi7MiYPYTOIfDZlrG
	1P3URSCDOpbzmz8HxWlOivZZZsy1a6mNXuxIefJfYe8U9I6OeaTYbaa8dbqShyh4qwddlR
	26EWxffH39r0vaE/RznclXqjMkqJoVvhpn6UgJYOIOJZCeaatZu9oLUOm+dT4g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=Qb/VfYJCjyGdaSPc095QlqNrSm852yMQ5xYaQEJwSpP3vDGxqq/qr9gtYIVENa4jUiZJa4
	glXbtJ/zD2WNC0HL08qar+we/sRm4GpEj0zJBMdnW77thsTsxr+bZKqOG1tTZZGuWK1KYD
	25O9RaX4EcfXGpo9ROT7PjtAsdA0Ao5sx6BZUF1eYS2Qzb76eQglTaLQbFE3M4KgDPWT1G
	BaEyXy1cyAvW3HJPm627bDbxh/6LYkxbShDiF4rOk1lLUFWpUHkV7V3w74z4tz+qQHzuAm
	b9HUljpA5IlQXJYKWixPG1bu+QnVJaflBiZ4EDEoq4F/uMA7rCFQJEhN3eHwEA==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2I;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:23 +0100
Subject: [PATCH 3/8] reset: k210: Use regmap_test_bits in k210_rst_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-3-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065129_540293_5D65ADD9 
X-CRM114-Status: UNSURE (   8.28  )
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

Simplify k210_rst_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-k210.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
index e77e4cca377d..58ad8be18741 100644
--- a/drivers/reset/reset-k210.c
+++ b/drivers/reset/reset-k210.c
@@ -59,14 +59,8 @@ static int k210_rst_status(struct reset_controller_dev *rcdev,
 			   unsigned long id)
 {
 	struct k210_rst *ksr = to_k210_rst(rcdev);
-	u32 reg, bit = BIT(id);
-	int ret;
 
-	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
-	if (ret)
-		return ret;
-
-	return reg & bit;
+	return regmap_test_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id));
 }
 
 static int k210_rst_xlate(struct reset_controller_dev *rcdev,

-- 
2.47.3


