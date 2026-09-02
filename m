Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CFFC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBvmiL72fAJ8jJ3Wa5Ngf7lvySzdLWObGSlNEBCm2Dc=; b=y+YxPYmRK+iFJs+5ylTRkBrfU4
	DjjDvqTQGXp5gkh9u+9VVvZ6rLwmz0NhwiC+LYC/G0mi5qKkr4xEGfg/kqDiYjxpwCUFKEHKXnqcd
	hlRD4JEPPc1OLptokRArcgzKYbU+jMSx3rlAxR8Oxd8Y53YEgVIHd37FgSKB0ueyyS+weqR/1BPgN
	SBJgZhj0onQigevG/FY9L/BomWAQ5mPpJ9pM+PUSq+6AjvbgwUebu+ok23OWT4K7B+LeEq0gvgnjY
	ur39vT+EV4C681ERVrawMqumpJ28pFYeEpxwwc5dtoX3lwqPJ1nhe6Jr2cFppEIPLeTcBwXY1BGd3
	wY9IYMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iau-0000000EQ4f-28Pe;
	Wed, 02 Sep 2026 10:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iat-0000000EQ3a-0SGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C85160213;
	Wed,  2 Sep 2026 10:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31511F00AC4;
	Wed,  2 Sep 2026 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788346406;
	bh=pBvmiL72fAJ8jJ3Wa5Ngf7lvySzdLWObGSlNEBCm2Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RZpIK0aDEi/GC603PkbYdFX6exJUq+TXNJ0ojoeJiu4Q+dEuvnSSbk6TjJnnKsNrm
	 N6SFVEmvs4k09IOGfysifsajrJ1px5/SQrhjYez9bidBhgSCaEs/xolgAoVeeBhwT1
	 vSJxsEl5eFL7+7IO49Wz0xWtii3nRkx3G16M6trLoZEtDm2XqPVMc17HdaqomxEX3s
	 Z1JzZHccbg2AtqwBMGUttQEKSo5dNZKJlrU8twE0y9fkhYNQU+2BB2wzfHaARv3Q3s
	 RXVKMlDHUsCIkHeb4yHiZHdUrdndkFSJv5WWCTkII5Bn8ANrIvVVhSd7Hr0qX4C7C+
	 i9MdPtc2jRmbg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10.y 2/5] crypto: atmel-ecc - Struct headers need to start with keyword 'struct'
Date: Wed,  2 Sep 2026 06:53:19 -0400
Message-ID: <20260902105322.2048136-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902105322.2048136-1-sashal@kernel.org>
References: <2026083113-premiere-tables-885d@gregkh>
 <20260902105322.2048136-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lee Jones <lee.jones@linaro.org>

[ Upstream commit 71057841feaa6c1b5a80959013e588b2cdf9aef1 ]

Fixes the following W=1 kernel build warning(s):

 drivers/crypto/atmel-ecc.c:41: warning: cannot understand function prototype: 'struct atmel_ecdh_ctx '

Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Stable-dep-of: f07a0d251db7 ("crypto: atmel-ecc - avoid stale fallback key after set_secret failure")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/atmel-ecc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 5dd3e37f6715a..004d87cbfa221 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -26,7 +26,7 @@
 static struct atmel_ecc_driver_data driver_data;
 
 /**
- * atmel_ecdh_ctx - transformation context
+ * struct atmel_ecdh_ctx - transformation context
  * @client     : pointer to i2c client device
  * @fallback   : used for unsupported curves or when user wants to use its own
  *               private key.
-- 
2.53.0


