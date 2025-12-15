Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41814D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0156iSMMYu0jTz1jKCZZ8sdOqpaKJxzwqfY6xwuFp4=; b=YHd9g5xCGBbf9QZfNXX3vSOZOj
	1JxU31mnVw98T47BCdy2an5F4YEzeECu8UroMOpAlvGlHkjwDh1cL68ZmGPwXNDfVjhbroTa6SS7D
	K3JNxjpS++zbWao9B3/vlyicnfzYjCMYxv7vxWsX69iEjgli7dQz4OsXvX39Vp6gvlSUoZTZ3gp2O
	vV40QOLD4cUqrgzNKkN35i1AgtuBmq3W81Yzu+aCb84D/NwRVg5KRZJSS2EZUat/OtcyjveefaxdT
	BKo1kxbaDl/B/HA1gcC1GDiUehmX40xHd4ujzRPsDifNf2U2o0puXM4Bj54YvDJ52UoVrG+MrqrzB
	NDx3RUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aR-00000003nhP-4BBb;
	Mon, 15 Dec 2025 14:30:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aQ-00000003nfS-1skZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E07CB60159;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADDB7C4CEF5;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=YVvjG+ad6pHMfUraBILNT039YVFkeM0faHWTaRTnmfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WdduVxGzhJQVjN6khiLe4OSbXFN3OPJbly6stOErcrXSJZPW+OtXAPfvpqxXNx4Lr
	 R/wfbGNMZn8gTeyQoC65rLrrBCoJCFx0i/ugKopUL5aHaJzlntwPR6sNbXyN0lRdXF
	 5aAW1J/l/oApl/cuNJSgi5Eq4iSGMCGSVXz4O+4dD0LSlHkp8M1O2Wqd/qN9+aaEXA
	 L83Ej0lJZ2hmO6TsaYbX/zAnYPaSL38S0/76nLlf9k9NSBqGZXG2yTOtiTeCnNKnTF
	 M5vXwT0D5D9ZPyk7+QN3pV55GWVyulhgae9wvgBJlSmrQHfgrYkWXFyeDbLxx8BavQ
	 uX54pneNFylrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3C0D5B16C;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:01 +0100
Subject: [PATCH 1/4] Input: stmfts - correct wording for the warning
 message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zOdQuMRtwbT9fTBVbDJbgo/FBNojnDOTgGlU+/RFodc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrMN45yASJj+00VAkGd5xdIZEokXHQ2coVt
 zB6A4cgLICJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 cmt/D/0WqN7Qnefn04HGZtDjWqh6Xd3bFVndWwMvuHkGWgqXin0Zz/PSV9ITNRECWqPY/ijIjzb
 QRs1FjZjoX0fwPn1I32WGLypaGIwk64KWTIY1vegL/Ocrl++34Y2YIBphH6P6uw+n5yzGRK0/Xh
 hAsOWgiN2FwBd1Q3qn98deFk9PJVrPq7YIDeAp7/58aBIUxvdd9kWq/B8bRv2LzufshyTkxNjq0
 LExaY/z3xkYjEwuI2D9mXagWS3doWS4womk7GYxbfcWhTfW9JuLP5X6YxDhXX0efbf34/xet2Yk
 x4t9PEtwiYR53Y0LbJS18egxymFMXJlJezYbUTIxN8OoK+Kcaqceg3CioSQwrOyzxaeRQNizSo2
 hd2sfwAREdCgTfKy9KX7CrGoMvSSxynuHrYP+0785QiwU9+dXb/kV53HQK9hDGqWJ2xTw24zpKF
 hjeGgxU5qQJsr60EzcT8fFnuh3sn7v5EQP3zO3dyCqG3f7RIX4uT5VQnbEO+IEaTq9g+0EdbfbH
 xdtPtlgZ7i9KmKXBNZRGHnKn3HJB9qLBa/K1OgKsLkos6GHp5qLew9HGDlUhouQns6M4qxBT/d7
 cdUy5LSPRkuW+cBEq54O20NMWj/GwWVs7Vfq5x8lGiYfjX3F51KFq90B91xqliZXDkgphc9wqAC
 GPMM7leEGyjXGuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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

From: David Heidelberg <david@ixit.cz>

We're trying to enable regulator, not disable it.

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Suggested-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 119cd26851cf6..9f5609524fef6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -120,7 +120,7 @@ static int stmfts_brightness_set(struct led_classdev *led_cdev,
 			err = regulator_enable(sdata->ledvdd);
 			if (err) {
 				dev_warn(&sdata->client->dev,
-					 "failed to disable ledvdd regulator: %d\n",
+					 "failed to enable ledvdd regulator: %d\n",
 					 err);
 				return err;
 			}

-- 
2.51.0



