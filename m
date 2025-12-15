Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F5CD5B176
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zteZGFvTdGbocRyCkqNfAQQTHdD9S0neX69KCXCczJk=; b=3NMiaKbSCKKllQjxtbebCqoMBJ
	ZjTfjkm6qTFx5YzV64SSjhnijHSl8ljZxs+V/FfX69subvDl3jJ/d/hEJzUbJ0iB2phfY8rlKdhZX
	uMl/u1Iua+grLbqCH8DP6cTVrZX9i8x8Xw+WaPi608TTNqzwdW230SXfA40FWmFEn6niLAyUQnKoe
	L1F33P9jEXicvNaoPhNv2hLPctbQHvbUEcavh0Ht+M9fFmZ4hXNAH7PQGk8g2V9F6CtjG3Ie/2NYC
	qnBkm7Ucu99vxv7IQJQa68CBPw0N8XWBbF0JEE3kde6jk+ZAa+Y7S8hgO7SUuAk6BvTwJBAMsh+8X
	4t0jhpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aU-00000003njD-1ysS;
	Mon, 15 Dec 2025 14:30:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aQ-00000003nfC-2dO7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E397544288;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA85DC16AAE;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=ECIRge4VolAPtMWjM+w9B4pFiGXOGHl1dGi9UBY1dM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XS/JYPfig7JEX+7lPY5AXwkqXjRfzQLYaZ7C8zl16YUHkUsuB7TCJ9E9Bw16tLLVu
	 oLySkVnQDZtNjBYAZbrUwuxBA+B3rd3/CiA2jAyyY5vdTJ4taSly1e5Fih/sVYBJ6E
	 hDO0t86Wbqs3/b4PvOFOPGpUwpvvcrO3P/kxzH7j7bLoWCv4MFkHmjepGab/fYibdt
	 TZGLAIcsJx8rQpNR7Bx5AsRiefu5aAUtKN9/biNpMQZCpp8VMKH+dVgiDAVcynQAC3
	 4iESSd/SQ8u52DKY48Ef1NDxmnW/UrRaQA4Ihwy55DQu9NepoHlk/3qvB6An7n1eF6
	 LTPY8ZuiwXXIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B158FD5B172;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:02 +0100
Subject: [PATCH 2/4] Input: stmfts - Make comments correct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+8T1xTsOJVjn1XL+OiuDFzpjTwMdaheaKiJkn4uzNC0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrVk+/KB6coTqNYuMnIBrB/vm2/YxgSKgeO
 8D5TYOcCq2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 covAEACkdHFzLF0RrJb2jwOKLvgWbj8IznAZvFQpIEQkeIU5AwcTJ1W9s2KF9wToGtq0+B0VWj+
 fhPAsSz1iFl5SYfbBL56CuJp821p0Yn4QY0SyNrahuGyu9n6i900VLzcvB0rWqrR4RV4Bc9UOio
 VUmytGFM0q3f2/tY2pvHMsjhV9bD3DsUOc5e9WiXBViDmgnr7WCIjtTpFyhGRJ4jMw+bA14Y2TC
 07emPYv7j8L2Eq+9sQ4dNmQnP08J4XVlT1049ul3d5gfTNebtKcKoEDQ4rpcSIClPU1ODnMITnu
 rcWLOekQH4/CgsX62gA7rUqVISQJ0O+2XQmHaIdj6/pDLU+iQNaXcaDI7v/moY03HVuDQBpqrJ3
 JD8QnHAjwIRiKKG6EDj+i72lrQ21a3w4MMMSnoGTx3k4uJP8/AE3DLzyIaYf107Hrw0hDyC5ji7
 CbSlohpGYP8vOfzJccv1RnhhfoZeSmVWMPEa6G5mvuHCooAz2qT0d/tWqM3ML1Q2JAfPK6BHfK8
 rgAfBlxaUqI3lwDntbn9r3fNCuGvQwiaYIZiWGuGFEoBMJbANQuULYQEXDf1kY8o0UMfNb+Qx9C
 mS8D/VtdQl5WRPVB2YeSpQZgUf9UMQaa6G+oZaS41jzFGqvw/Di6gFm94TxnUW14NK2BbmeCcIw
 hVftWP6lsLGmQUQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_063006_720687_2DA9C4FB 
X-CRM114-Status: GOOD (  11.97  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

No functional change.

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9f5609524fef6..ad363b3c344cd 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -141,7 +141,7 @@ static enum led_brightness stmfts_brightness_get(struct led_classdev *led_cdev)
 
 /*
  * We can't simply use i2c_smbus_read_i2c_block_data because we
- * need to read more than 255 bytes (
+ * need to read 256 bytes, which exceeds the 255-byte SMBus block limit.
  */
 static int stmfts_read_events(struct stmfts_data *sdata)
 {
@@ -594,9 +594,6 @@ static void stmfts_power_off(void *data)
 						sdata->regulators);
 }
 
-/* This function is void because I don't want to prevent using the touch key
- * only because the LEDs don't get registered
- */
 static int stmfts_enable_led(struct stmfts_data *sdata)
 {
 	int err;

-- 
2.51.0



