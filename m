Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3AC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH2zXr6lus8uCMWuTAnZze4g4tVYdoizGZWI8PRpeCY=; b=MRKWZNKjrEZ59f10vtPb7VfE3C
	87YcBZ/oqsHxAUW5L5h7LZxHwWSZt+243A8mnMSFiQCQsvbmFA4AyqW54MnPsEQhleqwPvZdvwXWw
	0BdWANXEjsVSJTp2g7WEFK2AIxnCNdzcJQAiIiMAs3Wz67qQfgY/b0KvAZbysaP77hS+9HoNjW9AI
	8QYoUv/zVM9B08wkfu2icJpck+0g/SPatPA6kGKRKrB+6oB9gpi8mXSP/JTpRTSxYMYR8ifENKVpo
	a7kPcGfrrunJZrmezBf7YadZkQtaUhQ/Vf0CC7T7FR8NAcNKBPld5knqtkEsTZc9BF1wvcurmaE0+
	f82myROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU78-0000000BXhy-3TS0;
	Wed, 22 Jul 2026 10:23:46 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU76-0000000BXfb-2Ojy;
	Wed, 22 Jul 2026 10:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715821; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VUPr5NkBbXJ6ZCEnoJ94cJPTHx3NEeN9hEEzOraWppANJcewQPt+QZBNjrfCY8cKs
	 Mclj/4En6hzrRKayQ1ErOQDbavhAgatClvZEdJIe3TLwqviadImcsE3eQj+Gu4BO+8
	 T+MFCKTlSXImatsfZ3QGbG/7yrN8b8w7XAPOeoj5tEbKqMMsvfc6j+0Oufe9OSiDak
	 eQ+zcDmt8FO3j37fWIHKrr6zU3H7aanhztR5vHHmS4FIlR0coNqVqwher6LHJo8jQk
	 /nRfJ6sNqblpSs24Oah+1hT5PGahluXRkba4SDNzd5LWWxjpav9s60kqCDp17Imelh
	 o2Xqx9Y+mK4Mw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 471494253A; Wed, 22 Jul 2026 11:23:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715820; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSBe0T+uNUqE6lYdYPl+glJsWQ8ISBAagSMukBOdLpJ59DGQScSkPmVQcFsjx7Gfs
	 /A/jSXwKYMs3yxfwP/ZaoFqk+4eR2ZX87EUofM5P8HORG78DnToYT+oniXPyEvLv2K
	 i0XRBdv/T0yU41aaMBB8Hpsx5Cq7sea1jwQPQ3z8imYVzD7ILMikuqOtKVeNR6i2cn
	 MW7ErIuqGT242dYTzVEz4fm1I4DTUdeswxUWZUMwYfYdkoU9TOhUEEe/A+XDhYNC4c
	 2XRQ+wfNE2UU/xSy4guGTQAqCEwNdzEasL6xXOnTuWNLHCakIwiOysblzgXgDgltuu
	 2i7Fw1XYpNgpQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id C890742544;
	Wed, 22 Jul 2026 11:23:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/13] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Wed, 22 Jul 2026 11:23:20 +0100
Message-ID: <bb206cf5e5bdf607bafda87ba3af4f8f05c30f08.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032344_749686_62224640 
X-CRM114-Status: GOOD (  12.79  )
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

Make rc_dev devm managed.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/media/rc/meson-ir-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index e7bb107e6a84..abb107d19e8c 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -345,7 +345,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "irq request failed\n");
 
-	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
+	rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW_TX);
 	if (!rc)
 		return -ENOMEM;
 
@@ -358,10 +358,8 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
 
 	ret = devm_rc_register_device(dev, rc);
-	if (ret < 0) {
-		rc_free_device(rc);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
-	}
 
 	return 0;
 }
-- 
2.55.0


