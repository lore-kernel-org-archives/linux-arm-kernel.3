Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6ED606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2ECpGXd;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=g+DyEpQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=; b=F2ECpGXdWHKBHW
	qYF+HQ5h/wcC4oE5hzyvDf+AIXX7wSSweAd8rfGm5duhWGJGJpaqrV47Wg3AVYCNUO/W5aFw8YIGz
	7kRkp3LhzYmfKGGIEnEC+Jh05akP1rPMG4H50Kj4B0gQ+n6LGOVe201Ob3+CpCI1XSpAXsw4cbZxR
	74+xQKVdol0hL+fhqQLuK95u/GNsrWGwcFRhm21qCfl13F2z8WkuX7hQb8FO5Mi85NC34d4WyBTNp
	5rYH0dKUM93BZ/MN2IbY/XNj1mqpRuecANPuSCR4/dy5VR/FpzSUXsLaY3aw/0BO9KsBrhaSGNmta
	+mU3hwl7FnkK11zxfB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrU-00000002mto-1ZxP;
	Tue, 03 Nov 2026 14:51:44 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrJ-00000002md7-142H;
	Tue, 03 Nov 2026 14:51:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 11B44202BA8;
	Tue, 03 Nov 2026 15:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=g+DyEpQ7o7JHNM2a+ma/vTx96oAKmFoFYxUIVm4AsFQUH8O/q72HusDv5Hf4vglITeZ6R6
	il9HKK6z3MheHC87Z8Y933CzgpemWeWaV8OLAcQZWOfAOE5kl2NbIK2oZDSQlKpfYFtI3d
	94sPh+KWjAiYOJDQn0/p9NLHt9awxMQZZVbvQSIi8i4p8mNRGsb+AdRIro6X2RdPeHLujO
	cKk6kpPtvpFH6kF+cFxHz49ydCfD9RP5NiB+jweqZi/QA7zDPR2xmMtQA/UrBg4eCoi9PR
	3tiecrBnwQT9r+GS1jMuOgaBgGkfwHAhUrPMWEoflJAa21E6UpPb3fXt0r9XHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=TfG9uqD1mbRrSVdlLGSX6ihDYFexs3BpnQ4u1EMWZcwvsy1aitQVZhj+GUbvJv+GLAGL4y
	w2VvuVoOWGBpJBSRdNsOzA7DAzfZV6+qYDnhzjFmUFqClKVSoqNpogSlq8JkjwxTbJ32eL
	uRNl56BpV5574hO5pfjs7rCPovrp4MWjuJxHmPFPm7075JWdHf+OzqXX4ClfK+lY9kqg8M
	YNo2C3aPWjQP1UL0kfT+wQznbRWREAlsJxDM0au/lE9jasbyZOv3QA5zwb2TV9xboS12yi
	Ok8GGLLEX/BBve9qDHbtk0+sG0jCesltaCyuHP89mCn66YLPvY+qng6gpPWOJA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717483; a=rsa-sha256;
	cv=none;
	b=XakO3n4r/H5x+BNOeVPN2Bab8azFGLFjyeNUTnpXb4lMukEW1qrk2sy5VrzCgB1wRQsRCq
	q+55d6BOPErAhqiUuqDLgYzlo+mcDE8aiqWG4fJgCysLTgVgdp9uzCE/RVzowROCjzxom4
	MTem8SmqvuwvMo/lyn3gjrpYgxJXK3Rdy9WE3zaaiU7eH7gQ/voAzxtmfjvl2KoeansGSH
	ZaXRu3WNBWqa5I3fju81FdOPkco+GlD4820syrE5+sW4bedAGMVYUe9dh7e+A8nBHXlbFN
	p+cCKlEXYgPp7HE0Cw0rmnyOaipv6TgN7jU2TZCOfUawg2Otwlgzl+EHJ3hBjA==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-39;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:28 +0100
Subject: [PATCH 8/8] reset: tn48m: Use regmap_test_bits in
 tn48m_control_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-8-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065133_454871_6E66B170 
X-CRM114-Status: GOOD (  10.12  )
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

Simplify tn48m_control_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-tn48m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
index 177ee5127a1e..4c7d7ef7c7a9 100644
--- a/drivers/reset/reset-tn48m.c
+++ b/drivers/reset/reset-tn48m.c
@@ -66,17 +66,13 @@ static int tn48m_control_status(struct reset_controller_dev *rcdev,
 				unsigned long id)
 {
 	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
-	unsigned int regval;
 	int ret;
 
-	ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
+	ret = regmap_test_bits(data->regmap, TN48M_RESET_REG, BIT(tn48m_resets[id].bit));
 	if (ret < 0)
 		return ret;
 
-	if (BIT(tn48m_resets[id].bit) & regval)
-		return 0;
-	else
-		return 1;
+	return !ret;
 }
 
 static const struct reset_control_ops tn48_reset_ops = {

-- 
2.47.3


