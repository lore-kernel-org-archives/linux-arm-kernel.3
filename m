Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3347ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 19:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LCd2JZE6WNougagJTMnn2kq3grK0eduAPPd4c0q8mnM=; b=LCNSRQFqncqtBnYbzXjTbJBGVx
	vZbXjxFAcFYVP1oP01tqG9ZurO0f6itAGqZqDBmTVgoUv0kTw+SGljKm57Dt2QJunGTlH20HdFc2p
	DqhFqvKQ8/y1ViWgof25+B/ujoOCt4vgFF58PWJAlAfbvABoHRp4aLgyfCAEniJuiSS39/541UmdG
	yV5PZa/DEAjVysUcZ2CyIZ6dOx4cemBhWtLRNVYiHoX5AtApFXzc48lJojeVfE+bgDzHsf9I9SIYs
	pphqTb3NSajLyVdO5geLzBhebwKM6M5wJbnutjWk3YwLC5GFdk0rzOLATTJ0kvzCtulP6mn6qzgNq
	SMx7cdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrFi-0000000FksN-0Xdf;
	Wed, 03 Jun 2026 19:27:46 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrFf-0000000Fkrz-14jx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 19:27:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780514859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LCd2JZE6WNougagJTMnn2kq3grK0eduAPPd4c0q8mnM=;
	b=ZNBV4wI/e5TtPidtua9p5pkIHm9dbpT5EAzjHPDw/cDFHNao5DM/cdCHTkydtcLmoJBhlH
	lJT1Vc/bcgxnOuVJyT4YD3Fx0RdINiuzcpK19ieudZi+qGcixAMiC7Q/W23hPUtnybRGu1
	QSYRD6pCM1T6mKDJlGSGYOQMJT2PPM4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] crypto: atmel-i2c - improve comment in atmel_i2c_init_ecdh_cmd
Date: Wed,  3 Jun 2026 21:27:10 +0200
Message-ID: <20260603192708.1237715-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=thorsten.blum@linux.dev; h=from:subject; bh=9q6DUpING7t7Xrmg5p0Sx2PWzYhZ78AwiWV6omFLEIE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkKDTwqn85/MRHMvPMxe6Hh79kB1yU3HhMNfehYtU1Pb dOJmHPXO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi7GEM/6xnf5Xxz88V9JNq uSGr/GJr1ZqjPx+IXnsgfsh40upZblmMDP1zeu/uyLLcl8n0Pfdg6l3V2wI8Ti0WuwzNDhzz99l izg8A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_122744_070411_7B08C8E9 
X-CRM114-Status: UNSURE (   9.66  )
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

Clarify that a P-256 public key is encoded as two 32-byte coordinates.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index ff19857894d0..24bded47a32b 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -138,9 +138,8 @@ int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 	cmd->param2 = cpu_to_le16(DATA_SLOT_2);
 
 	/*
-	 * The device only supports NIST P256 ECC keys. The public key size will
-	 * always be the same. Use a macro for the key size to avoid unnecessary
-	 * computations.
+	 * The device only supports P-256. Its public key is encoded as
+	 * two 32-byte coordinates.
 	 */
 	copied = sg_copy_to_buffer(pubkey,
 				   sg_nents_for_len(pubkey,

