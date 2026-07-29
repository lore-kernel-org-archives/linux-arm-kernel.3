Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B1DC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FDrTaCU9jAV/fV+/AQrSwe7XnD7/SMlHXRCxwMBs9I=; b=q+6s4TuNjtW4GTenn/iOIeAE7V
	oaY0XqPCMWpmCickYCaIB4HXiUM02dl2FR2aBdnXJiOPD34V+ukRHOm7hl038SUXb+TpdlQkpir4z
	nupdFZN/Y/wM57RMUxQSBna8pQfe9OXTkbJhqt27r9nsrxUAPP2JO9HYfT4iPPDEujc3tOZ4O9AL/
	gsJWH6wGGeI8Se6PWwVljsoQ6TQWLJtzpFg/7AjLjBJsr1Rsx7FTSwUkMo1lnF+Zd+WpNTT4ybxkz
	Hd0tZ7V/V0sX62Y/eJVkoa4EC0ia/Pdz4CkXftGA0VLdbajItNB+A+r1TEtjeJhKdtP1D7wNWN25b
	ULSNOGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67s-00000008O29-2NVn;
	Wed, 29 Jul 2026 15:23:20 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67p-00000008NzX-2pEJ;
	Wed, 29 Jul 2026 15:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338594; bh=DtSRpaDqclNo6U2QeRpHGIfjJQ060yIsBqj5BnAVUds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kRZ8KGAOL6EqVgxyRAdfiAx/PJNUqZgOafokziLGPQwBEjxQDCkoEz7Cd0SfZPC7J
	 Rvm9LwFzvIvdSTpUxq5s0U82Hd9iufuxQd/JHFSP0aG8MQa+1+zueHZ/4UVqoyW3jl
	 uIHTqIdPx2ojbJWSZxE387+0Hnb0ZTqo95wA/6uagMoUHX+xqJEdWnnp6KD7vX/hcw
	 27K+o7qe4u4GQm1CW6ILHtjM+vMDbr56koTRsDs1jgJp5nBJGgPrRFdKUbObNhHPBt
	 xgzmnZPx+IoPlZTOcg2lxdtDviuNTBBeE5zQRG/RIx9cqRLK7Hnid0LT5L7kNtw4XO
	 as4CvZ0GgzuKA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8734D4253C; Wed, 29 Jul 2026 16:23:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338593; bh=DtSRpaDqclNo6U2QeRpHGIfjJQ060yIsBqj5BnAVUds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lKUuARmW0Vn7htby5uV2rHilrxDdlmglNPpjFcciCvKE0sDFwL24CQGjPWcgGDnQg
	 VYtNPwuAdaOxzMadtz4G7gQ2hYcOFE+StrRtpE7eeduvzY40xAkpoeTTMxTBTqvr14
	 rIdhE2Oko0L6gSgV1MwiggWxtceIW+Zw+B64AdHH7FGkSU+V8tiJCF6FmbwqivQs0Y
	 51jBvjP4YHuG9ldRxn+J9VHOSq23Rd7ZwqUNBleaXHdja+rE0auN05fGCEQkndmoek
	 J3oY0ITRGM1q82pxpUJktIJxOaRXFQZuygrudxWQEYuyYOPst6AE+QQRmf8zIpub2t
	 HldXKq00paMJQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 071BF4252C;
	Wed, 29 Jul 2026 16:23:13 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/15] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Wed, 29 Jul 2026 16:22:45 +0100
Message-ID: <0a0066a531aedbcb18620cac5897cb91c78a5188.1785338381.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082317_850637_9A43DED3 
X-CRM114-Status: GOOD (  13.02  )
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

clk_prepare_enable() needs a call to clk_disable_unprepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: stable@vger.kernel.org
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index fded2c256f2a..e7bb107e6a84 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -288,8 +288,8 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	if (!np)
 		return -ENODEV;
 
-	clock = devm_clk_get(ir->dev, "xtal");
-	if (IS_ERR(clock) || clk_prepare_enable(clock))
+	clock = devm_clk_get_enabled(ir->dev, "xtal");
+	if (IS_ERR(clock))
 		return -ENODEV;
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
-- 
2.55.0


