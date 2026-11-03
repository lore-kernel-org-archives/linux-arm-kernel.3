Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F961606A7A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAA4wE+2;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KAa78Ztw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=; b=pAA4wE+2y15uQk
	+kBvYplglvJtheQeYrqj/VZtYl90fEBwdE6+QxV4ehIKvJzeEIWPOJKz0on/XHR90SFFTUXcpFohp
	jzpDMxvl+YXEgg47PXYgETCmSKvAl9/3lNeWNSjXmN17cA4EncQQUEYVOetMqWGZCXjurIYlCtNwX
	5MsBQt9g0axqGaOzXOSG6bXled/LK+srQwsF0SxDhcz05fq5NBrOsYTzwaAovBwTsFreIU7+vW8J+
	f3jpPtokVRd9pw7TYQk2sxL0bX6PlzaBezn9urkFjbn9LRC0HP5irLmK97zhHi35YMBapW/4k3LBW
	66F3JmWgfAnS6ljyihQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrK-00000002mgU-2PKs;
	Tue, 03 Nov 2026 14:51:34 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrF-00000002mb2-1J51;
	Tue, 03 Nov 2026 14:51:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D6627202BA4;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=KAa78Ztwi0im+S5+ku7sHnCT0teUm559ffH1TwzYqRswkYglTZDVdkhF/pYcm67wmtGdUe
	/8PqZnVq2z6xunpYaIAuTIS/F9eiyEw+uNrnMHSQR+O//yFWcGhgIEnfunm26SG0l0++9w
	6chHVTehTP2XirbOG1izC6MvJzgLtENKdKT0fqw5cQoEtqnFJ1Eu6+CDsev/Wk+kx2hkZh
	sp/CCT+WPydnHY3Dzj/OQQ+1Q/FSJuJdg+XwnDnA04I8bPKyS64J1VGU3vHMlmO7a8lZiE
	qAeKBnLglNX0o96eD/cpuMBX1BhKNO/DxzbaboBdHugdHz5hJ3wK6LKf6QDOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=HhQpgYVKPvLKL+BGAbeWi7PBsmc6xQTQ4JSh9vYIC1fm7auTiW1Zr7SPljqXWw5jS9P6QV
	TlXGTOjzUiPxQ1+VBmWG24whUAhY8kkw70MsDg++IcITQxaJaf0yEwppNdx8USs6dSQKQL
	FYqrGUH4RhPd3X4q/BNNLkNNz8J6V0UNSEGYQw/eH0TAAUCs0qCgqVnR+Pit4KQ4duHEBx
	VFg4wtmzYEYE9Lw+AY99Rgm9rIBLh+67G5rBZSs/+mrRRJP4tANYRqfvVaqnrWAJw3//nf
	a4DUwvhsaOawPy3KTpj5gh4QsNxjILwZT6fq/iXWSKsJ6vv5f8KnPK6HXtoqkA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=CCNU3gCm459w6r6CYS+Nj/sDbZx+txvufYGgfmbDHq0+EHW8fUGguN5S99pQqOytXRQuDV
	QRRuCBf8ePCkQuzkNqRiXRp6V700tz/qmo2UVjIacEJqvIIEZhh/wZbPrcmOXwdG1pWKdu
	B5COkelZ8rwnyCZvb3n769ABsbGGc6jDkFBLsC5CM8ugDSS4MtIY0zmPtlQ9/HRRsiqaqD
	zaoJqaRKYZKoBiYafMbOP3f7Ogy65CvGqteN/cUO8h9OGW9cKdA/XQY2hjaJgsCMpXXQ8k
	4X4gGv21sbuOUZs+1U93DOZOMSVBJwi/1qwSFUF6cpb6FSpTy+GZCXzPflRNIg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2V;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:24 +0100
Subject: [PATCH 4/8] reset: lantiq: Use regmap_test_bits in
 lantiq_rcu_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-4-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065129_547679_0205FD54 
X-CRM114-Status: UNSURE (   8.58  )
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

Simplify lantiq_rcu_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-lantiq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-lantiq.c b/drivers/reset/reset-lantiq.c
index 652a45890cb2..6d7200b17790 100644
--- a/drivers/reset/reset-lantiq.c
+++ b/drivers/reset/reset-lantiq.c
@@ -37,14 +37,8 @@ static int lantiq_rcu_reset_status(struct reset_controller_dev *rcdev,
 {
 	struct lantiq_rcu_reset_priv *priv = to_lantiq_rcu_reset_priv(rcdev);
 	unsigned int status = (id >> 8) & 0x1f;
-	u32 val;
-	int ret;
 
-	ret = regmap_read(priv->regmap, priv->status_offset, &val);
-	if (ret)
-		return ret;
-
-	return !!(val & BIT(status));
+	return regmap_test_bits(priv->regmap, priv->status_offset, BIT(status));
 }
 
 static int lantiq_rcu_reset_status_timeout(struct reset_controller_dev *rcdev,

-- 
2.47.3


