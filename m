Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A92CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rytQfetHT/8eDI/+MtviowuR9AbKpI1Re4AXCiErncE=; b=fZN4SuRFKPUaJUEhvBXxTzniLu
	G4IWWKDALqU0WRQeuvruZU448OxmDEZ5a6EDDZZujVG1qYJ55QLalI+iFPQAwTKT3epPQuIoBdMz8
	Ns2NI2H1S3zhoq77AO/ZMcXv+jq3U7SK9ubWlDS1920lXhnUrLYSCD1ShSLMCosQ63HHmH3AYT8Ho
	HLGfLBuqe+sCnJBHKF48KrHHqj9xBegsjNdfodOyFjbdVaICaSqUq48BOr/f+kbddWgLU6hREyynx
	PwwUspJySw85y20ZhqysxV0nouthxT12Rj+SUcINyqtlG6TzzCE6ksfnULCV3G+s2g1XghBhFSL5T
	CG8Lp8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtLk-00000005IOV-3qj3;
	Tue, 09 Jun 2026 10:06:24 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtLh-00000005INz-2brj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:06:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780999576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rytQfetHT/8eDI/+MtviowuR9AbKpI1Re4AXCiErncE=;
	b=NPKxOvya8+KOlxS8s4znKr5+1DVYBKAllGoT9fpazBDaqUxYPfV3NSVPUkffyukCkkXGDq
	cVj7yGPD3NsWX1tNr32zWcRIffw/PXnOykLsnWuCP2rXUyqu1FMiu8FVgfUT1xIs3cFrJ2
	7OHfoI8tZT2xdfjwDQy6uFI467LiME0=
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
Subject: [PATCH v2 1/2] crypto: atmel-i2c - improve comment in atmel_i2c_init_ecdh_cmd
Date: Tue,  9 Jun 2026 12:05:53 +0200
Message-ID: <20260609100552.233494-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; i=thorsten.blum@linux.dev; h=from:subject; bh=BzG3EeqRxWR8HYlURE2Sltt0JWppddYvlfDOjL8KzVw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnqTxusha/PDl/mfTViatjBGftSVUr3Cl14Xqkf8XR57 uqEO+W7OkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiNuyMDHt7U8R1LD+WS69P /3aM5ZTdjVLjqrQ9VwLZXH4/OPn0RwojQ9cbnQ2nElc6HGjtPmMn6vC166f2AbPnfonyCgkLNQr 4eAE=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_030621_950953_A43B52EB 
X-CRM114-Status: UNSURE (   9.54  )
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
No changes in patch 1/2.
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

base-commit: 79bbe453e5bfa6e1c6aa2e8329bfc8f152b81c9b

