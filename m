Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC43C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuX1ud78/VxRBT7LeIurfx88B3B30dpQ41jGp+WBhmo=; b=KALF5RMbwRiVoKcE4pJN4549vV
	P9BTR5zb9F7NgGtGXvYBAr4p/C5GtHfIelUTExkUtu8mgQ94DYxENPD6DLy3hywLyehxARVi/6q8m
	U25R0NIh1orb/vi6hvLh7o8+P92A9MTaxboEq8/Ielu8rl854T8CBfpsZsF2Bkfdm8F2XiG1Ln2Ij
	lTE3Mz5u7EJVUAmb0lmGA2IxaYIWhMLQM9HBlRpDYoJHmNrg2wybJlK2wVLkrWAcS6/2Wa9Zcni2F
	I2d2IaVa+70LaIfl4OiZwAixCQqBKMYpBlJZAq73OWUJmbN/5gVWMVfkOuNsIdbOU0JsZK1vcGzuO
	qqvSoF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakbb-0000000HCsL-0pWP;
	Sun, 13 Jul 2025 00:30:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajcC-0000000H7lX-2790
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 12 Jul 2025 23:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nuX1ud78/VxRBT7LeIurfx88B3B30dpQ41jGp+WBhmo=; b=VaM/Z+gfqHRab/scZanKefDnHT
	FznL96XHLdo9qN9y2Kizh69tq5DSqPfkHIa/ADTrVZf3sbybpe486dWOo8snxHmEfy2AKN+6o+X13
	D7mGZkYQ6PR4KCg2bv4diUeXBEo7u2aYEWJ9JnffuVASqs4oWXp19es8xW/YXwv47FN/7SjtXeZeF
	90uoJhyAfhOazzSKPGpjr3EKw+WV6baUxcDRQq9StJpPA9x+KXndvfmCZmZaUy5o1GznLYntKYskU
	SNlFdmCwkoKXT+op/tQYzVJBCLt+RE85Bxo5e63Xg24ZRo1yS+VzF1LwUH4J4UdqkXg2MZ6XjQp+c
	MOm/y4fw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajc8-00000009Uxo-0rc2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 528005C558A;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9477C4CEF8;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362790;
	bh=xZzl/xlzSt8gsN4p0nytxwCdAqxySD8jh31PuuGyOBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHOgR8/eAUWb+TKPF25TOK6Sliz7m1aUYz+j/MLYKMsxt4rKWRZJGo5hPIHSV64zn
	 7of82OAPvifGLUpuHuFDsjdQA92aH7ZkFpmPXS8OiM9eZNvip/CMvh2gfWUfpsJ3l4
	 CkTk+rCEkdibLqaQH8fh3UiGr6mwjUtiZs07/Qkt+YZg1C0SccjXKZMsmT6RS+7pet
	 /YF/SspJy/r11r/BVbRD6U5wKlFEU4eWNfug2GDWZgxrSSqch+PUOQAWyZXRrUKu2z
	 Vu/ThPYn8ewEdUblbxsMvgsAY7zmfj03U8oqUd9gKkQTaGl7/Z/+oEZXpbIf/sMfr8
	 r38CY8t/o97kQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 21/26] drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:12 -0700
Message-ID: <20250712232329.818226-22-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_002641_020866_7A498B7E 
X-CRM114-Status: GOOD (  12.02  )
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

Use the SHA-1 library instead of crypto_shash.  This is simpler and
faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig      |  3 +--
 drivers/gpu/drm/bridge/ite-it6505.c | 33 ++---------------------------
 2 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a6..89ac820a13e1e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -118,12 +118,11 @@ config DRM_ITE_IT6505
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select EXTCON
-	select CRYPTO
-	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA1
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afea..319d956c0a28c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -19,11 +19,11 @@
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
 #include <linux/bitfield.h>
 
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -2105,39 +2105,10 @@ static void it6505_hdcp_part1_auth(struct it6505 *it6505)
 			HDCP_TRIGGER_START);
 
 	it6505->hdcp_status = HDCP_AUTH_GOING;
 }
 
-static int it6505_sha1_digest(struct it6505 *it6505, u8 *sha1_input,
-			      unsigned int size, u8 *output_av)
-{
-	struct shash_desc *desc;
-	struct crypto_shash *tfm;
-	int err;
-	struct device *dev = it6505->dev;
-
-	tfm = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(dev, "crypto_alloc_shash sha1 failed");
-		return PTR_ERR(tfm);
-	}
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
-	if (!desc) {
-		crypto_free_shash(tfm);
-		return -ENOMEM;
-	}
-
-	desc->tfm = tfm;
-	err = crypto_shash_digest(desc, sha1_input, size, output_av);
-	if (err)
-		dev_err(dev, "crypto_shash_digest sha1 failed");
-
-	crypto_free_shash(tfm);
-	kfree(desc);
-	return err;
-}
-
 static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 {
 	struct device *dev = it6505->dev;
 	u8 binfo[2];
 	int down_stream_count, err, msg_count = 0;
@@ -2203,11 +2174,11 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 	if (i <= 0) {
 		dev_err(dev, "SHA-1 Input length error %d", i);
 		return false;
 	}
 
-	it6505_sha1_digest(it6505, it6505->sha1_input, i, (u8 *)av);
+	sha1(it6505->sha1_input, i, (u8 *)av);
 	/*1B-05 V' must retry 3 times */
 	for (retry = 0; retry < 3; retry++) {
 		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
 				      sizeof(bv));
 
-- 
2.50.1


