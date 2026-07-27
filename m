Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67BBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+j8jMIEb2s4XnrD16ueuoMKw2FHVerpyybL2scdGtY=; b=NtV6xfmRN7ljNuSodoZGC4T7B6
	g20Ym9CwUqAkHnKiz4VOKvf4VviD8GRNlzNCuz+HjnOo8U+jm0WqeT1S2dsShkRxRS2IiMQ57pZbs
	5cmi1gBjpp8NTHBihLdoqVmdIHNbssL7VdnKKSJwqYYKuzTdXgLnwqGN6WR3ISGv9SaB62ATJI0I+
	teuO95MY3W3MstQkFlwsgf4oUbgVkPCFys2MlnnlyeXqjh0Vo2O4CAHOxuC51x4nCkIdj/6YQJxHu
	ypgKOQfwaAOLH24lYId4Ir52Pgpi28SGbzeUyeyPQa96dgg3gkokQ6VH6ubNjXggM6mEobtKb8xhp
	4Mwy0Kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLFA-00000002pXs-0DOt;
	Mon, 27 Jul 2026 13:19:44 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEm-00000002pKK-3cuQ;
	Mon, 27 Jul 2026 13:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158357; bh=MjWQ07Kksq4lkvfRIc1nFy1BvBlXTzQS5OL4pj1+KgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YI4OE07DBYkJZrFRURRjrgAHMhXA+Cek9gBQP+crgcuBx+AGpVskpq+ucjfLBXSRa
	 FJHXRe/mOQj8QdIjCK3UIkYSlQNIdYbnHydePkAKqM33i/U/iFMnzToESmJJZRYtAO
	 yd6ocLjedA4adhU2Hxm9/wtSwiAQMg6axwXWzDZQ90qZUXtW/WpkKJ1cXZHJvXHJ8f
	 f2RvC7Jo3j5zCkXSUewKm8mtgkqBK+1Nhf6VtI9VyudbVizwS7+Y5nzeDccF2gSTv3
	 rYXiPdZHgiqy3D6kN0DgEsgZMq+m41x+LYKNIDjCj0wa9p7MlgcVo6KLG1tt18NIX8
	 qQNp8xjHp00cA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C547F41CD1; Mon, 27 Jul 2026 14:19:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158356; bh=MjWQ07Kksq4lkvfRIc1nFy1BvBlXTzQS5OL4pj1+KgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lstHC8/mp0d0iKpjM5tnpW0QnO2ajuwI0hwTQOYMewCQSqmHg1ieANEyLAfs37uFs
	 4P1f5xaSr3YLDZLDx8jzcypexUgBoV67UUhpO5N2PH6u07UgsU3Yeu0vvFKc5sIO0q
	 N7Q7tUEWr17XdbbwIWCaGDxiLJDteNUROSwHJp6TtD9GUdjT8N9Y+XdX2WyXqhIDG7
	 Oymifu9He5wiT76AZK07OqxYkm/8cUcgcqc7yJjwvo02RVmsGM64h4JdgHujai72xg
	 LyirARdi0FXk7AtfpLVOM46+/mGLWTc6tTyPmsTF0W4LPaoIFY1bMUPejBswW1Dw3z
	 +5pk7bRkmcNWQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 283EA42534;
	Mon, 27 Jul 2026 14:19:16 +0100 (BST)
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
Cc: stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/15] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Mon, 27 Jul 2026 14:18:51 +0100
Message-ID: <4674de80dfb7ab8c4a66282be26260ce4e7c9055.1785158244.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785158244.git.sean@mess.org>
References: <cover.1785158244.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_061921_041710_06BD208E 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: stable@vger.kernel.org
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


