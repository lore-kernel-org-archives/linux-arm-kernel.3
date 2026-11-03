Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5896606A7A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UtKpU8T1;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gXUw3ken
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=; b=UtKpU8T1wCrOsS
	70m4mPATVF8ISI1sZtUjOjDsFEG/3b2fV7m1Y5e+AL6qq8jHj3Rq1eSzJFBOieAewfNgqVOvPjKeI
	ONBXsjjyzHFaTBF3Oj4hF2iu6Vylnhu217n2JSxK1+DExykvCLbE5eqwHQLFFSVDUWY7s7x3CLomm
	aqMSmtfAuHJ0LUvQ/E1VjUAjkyqTI5Igx+mYJNAbAIBXvXTuJoy5XDI1aFAvn3Xh0SehlLfoqEe3t
	pvtn5TL3D5LSBoDBeS5CzBzHqpZ/AyYGoHqi1xqFZvslXIaMSjWvSO38Uc7p30Z0B4TMNCf7QIh/S
	rLWWdJDCgu3QMSku1GvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrO-00000002mlC-2S4A;
	Tue, 03 Nov 2026 14:51:38 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrI-00000002mcv-3eUg;
	Tue, 03 Nov 2026 14:51:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 09B5E202BA7;
	Tue, 03 Nov 2026 15:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=gXUw3kenAOHy81kL+vv2K7IOPs6aw8p2bD1xmRe4QGQMJAncxohyX8lL2+/4NmLcxw5zF7
	mFFzdX2RSThlC4DlHfeMt8KOQmlgd95GgKtQtliYHcrQ8t5p4TDpnXD9ruSHOdMz6H6Mds
	CyRvPYvBI8RQz9JZQ9JGudWlywpHOh4eDhKnBrsyputLkjFOk9ldiUtalmIKWJTIuCKY4K
	KaBWul4pJjP1tPAdUPwS5qEhpblNtuwIO9VJwzRVCuLrpo+fPp4ldwsRyOpENMsLL3bRfd
	Y49EcXPmpJC2KfUb/o5XkbneZ7MxBEgzLDCOBtRcMziPnXjXMRGhxEOlC4fkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=XUIvd0+sx0cGLLTaqXUXMoEx3vqGA0RLnrU26DNwH9apY4p9PWGJQm7Ara2huWUUWcrd+z
	v+ODrQnrMUtB3JHzk2XWJ7gusalIDxGWmwQPOFF9fQx4bR3umGEs8yemhKqcCVVIwC3gkd
	LsTpdxB2qjrqBA6RSXTd8p5/R27C87ta8v7FjWnSGoTEzqyKKxCJePnClVg7rUlK7qVopy
	Gg+bgrCtryDPsoxNXSGxCBx//el8L70t/T6c8pkCOdX5LbqG5NM5NwpD4UYIrWvryVUDBo
	BBQLJC0pbU30PIMN312DCGPNYqT8FgrDhmgcXXaPhudhD0gSgFbW8HKij+G+CQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717483; a=rsa-sha256;
	cv=none;
	b=N7PFxaRjSKcGd+szhY3KkNR9tHNn1YxRFcAPe6LO9O62nKqFLoeQe7tvhZOYmnLm3HnguL
	DzWIujL3PgrJeISJrDrr+00NjZ1U2h4/hjYfvBmuo0XxsAcyyNDi8rzHIxNu+tCeCwb9Bj
	rgHhM1IQaLZudtIZ2rHw7teelMlQji3U6pqfer4RxhSDJZcNF1bERQgx2HO/p5h8w10MOg
	Legj8m4LyQlJm3MQiZG/20E8REVAR5TQJq0lqOoF2TQGGb5X2Qv2LKLRsqkkHiSPmSwTpB
	x6to1oIi2tkcXwfxH3jB4Av1IjXVxDrpris1/BHVEbOri5yjjrrJH1T+NCrpXQ==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2z;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:27 +0100
Subject: [PATCH 7/8] reset: zynq: Use regmap_test_bits in zynq_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-7-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065133_082130_E236B6BA 
X-CRM114-Status: UNSURE (   8.31  )
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

Simplify zynq_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-zynq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-zynq.c b/drivers/reset/reset-zynq.c
index 688b512882ec..b7a0445aafcf 100644
--- a/drivers/reset/reset-zynq.c
+++ b/drivers/reset/reset-zynq.c
@@ -67,17 +67,11 @@ static int zynq_reset_status(struct reset_controller_dev *rcdev,
 
 	int bank = id / BITS_PER_LONG;
 	int offset = id % BITS_PER_LONG;
-	int ret;
-	u32 reg;
 
 	pr_debug("%s: %s reset bank %u offset %u\n", KBUILD_MODNAME, __func__,
 		 bank, offset);
 
-	ret = regmap_read(priv->slcr, priv->offset + (bank * 4), &reg);
-	if (ret)
-		return ret;
-
-	return !!(reg & BIT(offset));
+	return regmap_test_bits(priv->slcr, priv->offset + (bank * 4), BIT(offset));
 }
 
 static const struct reset_control_ops zynq_reset_ops = {

-- 
2.47.3


