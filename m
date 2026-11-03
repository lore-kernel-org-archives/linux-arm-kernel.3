Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC5606A79F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oKzJngbU;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WKTMj+Km
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=; b=oKzJngbUGdMJGD
	WbEU9C5oyzjmq0Ariw9ZZ+nMdzE24ILjbEQlTt67M5qfYughDyvEtHNzOhGtvvSGMVicR9cc8DAZY
	/2qiPuAY/avERHc0f4JhtYAVcYgLY0u3stH+FkKdocl4eNKNrEXn6+NHm+CB0mJGxX4oC+uJZlqnO
	3UZYnaUVON33RDhmTNUsd5mb2eshXPYPqzZgiFE/zgaSgkiGpzSjB5HLP+a2y2P+nEj3DSuqssjtj
	xQHPWF2NCc03fKcxAdI/l33o9kVsi6BKGtsDcFvRWWCvkQWCvvChgGDREeyuGZ1CzSQe7o+JKj/S/
	7pTcYQzHyAwpMZLEDgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrN-00000002miI-2Dka;
	Tue, 03 Nov 2026 14:51:37 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrF-00000002mb0-1J3A;
	Tue, 03 Nov 2026 14:51:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B7A12202BA3;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=WKTMj+KmDTHBPX8XUQzi97LuwpRIDtdiY+gjp20NiCnwAM7dWV66VeEjPc6iQ1jyMklCvz
	k5yZ8J+I51aXRtkc0dNrFnywmJ6Fu1V0rkMx/aEyGonMI7B0EgYvc0ylmiElEUpPxodBv4
	HIXkBaLmOEnmnN1lbBJtujA7CaMbJo8fSesSdyM34G6v7mm6ItURTJub/M6KnLAUiw2BXN
	spaalgDYgMHLrl5Ndyfhjajr/uvGk1tNkIOqjuSPmp6Ut9zO5HUvtEwq3Y4qm96VfLVV38
	hK+lXP/hu1RYt+/IJinh9GXQQPuA31tDoWSgJEse0sA6xCXrtbfIa0caTU05WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=Pydoe9+YuAun8je+1LN7fMftjjtqC9lVrA6PsVtOUsvUnBTEj9B5Ngjm9c8nEMTs4A4TAI
	mMFMB2xNb9WIfEGzGpVCD65tOeLt0jPoz8KUDGNQfZgvnE2zcxrdsCiJ77XZlB06cE/TeO
	N/qtCtotol3dsv/H7kBFvkbapqUvti0QhAZ2eDZsXrIScQ+C5NQAH8slBtxwaVHikMPetF
	6uuNg7I9IDgK6DC1xLIeeOAKK3+w5lBQ3yvg+drcamGf20bV1BoL0b7G5AsYmGOFzKuz/K
	s8IHrKnOqhMB/8szBz0fRW5IQriNyWDNiyipkvw0DeNLrV0940l4ZJf5oldjZw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=da3AGn1qEjrKNrQJAvz+pFtvP7xbugrgt8VN+Meeq3pJ7wwFjo3Uk215rqUzqdVk3Fa3iR
	Jz/9TrlEIJsIihi+BRilr07fA3uHLFQ94uulr5eHpSpEGdqaxOukbx/Iev1EThPOAAmSjh
	jA8uigv0F2I12hfZsqt52vXUhph9dxDAXa/shPwIg9ntsLhminAvTSo/T0YD4iNJdCAyOa
	P12ZrATHvgAiQK2p71swrZBurJnIt9NlLL9eCwLRMviPRNFfTW0tQud0wyObsSElB1jB1k
	o9MBgzvEsAsI6CwA5lW8aj7rTwERlnmu8poyXRQ0HoUgfl3gqUknDOmUsVwn1w==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-25;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:22 +0100
Subject: [PATCH 2/8] reset: reset-intel-gw: Use regmap_reset_bits in
 intel_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reset-regmap-test-bits-v1-2-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065129_544390_48289217 
X-CRM114-Status: UNSURE (   8.20  )
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

Simplify intel_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-intel-gw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index 0db64cc8a282..4cac2a8b0108 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -112,16 +112,11 @@ static int intel_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
 	struct intel_reset_data *data = to_reset_data(rcdev);
-	u32 rst_req, req_bit, rst_stat, stat_bit, val;
-	int ret;
+	u32 rst_req, req_bit, rst_stat, stat_bit;
 
 	rst_stat = id_to_reg_and_bit_offsets(data, id, &rst_req,
 					     &req_bit, &stat_bit);
-	ret = regmap_read(data->regmap, rst_stat, &val);
-	if (ret)
-		return ret;
-
-	return !!(val & BIT(stat_bit));
+	return regmap_test_bits(data->regmap, rst_stat, BIT(stat_bit));
 }
 
 static const struct reset_control_ops intel_reset_ops = {

-- 
2.47.3


