Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51163CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDHf5/aY9RxOz5FV7uq8q69gY1cP6K45tQ3VpSCmP9o=; b=Qf3PuF7yFwUAE15fko1UAfKHUr
	jdUFcvYvSxgt3YKBzHAadxM8zOZvOeT1nJCAxLsMQvrdXSqd8Abvnf3DkxGQTemA1CRpWXXUlb/Fd
	Jgp5LJLsCy7tKfijpEWksyUf/VJPX6F6pnjgwsGyoDExTBg6eul7TPekrXqsUMWPr7IS0YePizm/B
	e4PDr54S6Z1QOAoutQUrRBadFcOl45I+eND7pep7CHynQxAmh8gVn3koYumKc3zDRbZGCnVd+OpZ7
	FT9SL78av+5eozTkg5aYywqhxZYzSn8GKaTAObpJoOKcQ1YN6INgzDqWh5W/KzETTesYEWg/cWGze
	KToC4/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSNg-0000000DV3a-0P6v;
	Tue, 02 Jun 2026 16:54:20 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSNd-0000000DV2s-273D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:54:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780419252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dDHf5/aY9RxOz5FV7uq8q69gY1cP6K45tQ3VpSCmP9o=;
	b=onr5R3S6IV0FVEyP7jQYiW3GLLFdOIKt92yjOqNdejNhuM0lcQTseIKhFM6xDa/X05efY8
	Q3zHyultqO+hb7PRKxp0Iz6C0xvUrtb9gaSZuNjfeAs16tJ28Wq0qOzjdiZYMztwpcBl2n
	Jy7ywEoMvNLIazsvsElLMqucpZAysTE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - remove stale comments in atmel_ecc_remove
Date: Tue,  2 Jun 2026 18:52:49 +0200
Message-ID: <20260602165247.977197-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=thorsten.blum@linux.dev; h=from:subject; bh=kZbngbyc9gF7nErlK2uWFwjBZCYgFqsy/5bwFGeh140=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnyXPESsTzBHPwaAu++MbOZJqR67tkSedXOLr3m2wLTA p/ORK6OUhYGMS4GWTFFlgezfszwLa2p3GQSsRNmDisTyBAGLk4BmMg8cUaG3jWbHD0l0jRst8r/ vFXGWx/3O9x/4ql6Jm3lucUVTB1nGP6XBawtip997eIfWyG2G7zS38rZ4r4Kbt+tVD/7faTLgeN cAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_095417_680218_1E88BC18 
X-CRM114-Status: GOOD (  13.50  )
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

atmel_ecc_remove() no longer returns -EBUSY since commit 7df7563b16aa
("crypto: atmel-ecc - Remove duplicated error reporting in .remove()")
and is a void function since commit ed5c2f5fd10d ("i2c: Make remove
callback return void").

Remove and update the outdated comments.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9c380351d2f9..e6068dc0a0c1 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -347,13 +347,11 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	/* Return EBUSY if i2c client already allocated. */
 	if (atomic_read(&i2c_priv->tfm_count)) {
 		/*
 		 * After we return here, the memory backing the device is freed.
-		 * That happens no matter what the return value of this function
-		 * is because in the Linux device model there is no error
-		 * handling for unbinding a driver.
+		 * That happens because in the Linux device model there is no
+		 * error handling for unbinding a driver.
 		 * If there is still some action pending, it probably involves
 		 * accessing the freed memory.
 		 */

