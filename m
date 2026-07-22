Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A4BC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbs10KidpIGqlIc5os/QD3BMwoPJkkDhyGReQO8E1Eg=; b=hDKeh0OwLIqwx3qoA/OuiGE9Gl
	gKIh+qCewcW3CuQMkQqAUBok44FJtlMLrSPfkjmoB9yXDEwZRElQWov99arXR17D9B6jlTEk77rH8
	Co7JuQEZeHE/7iDcg2GvG8xevyNGgst68SH0N8nWXbBehosht4d0Ph41ob5CuM2MkG3557KhUItVS
	RH/J54QeMENibJ1W10/w3gTWK/RiIN7uvkD9gYVPUn8cMHdk0PJ85p4rtXM6cSsWp/+2Ji0Mb+zOp
	+Xw6fl/FPzM6avUC3lGWMPIQa8cX3ZSQ77jOWibmHsbc57Fgp+gFmU0Wt2tKA8Kdo42iKlWwfAy5U
	EIEThn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU7L-0000000BXpB-09lR;
	Wed, 22 Jul 2026 10:23:59 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU76-0000000BXfP-2Ogl;
	Wed, 22 Jul 2026 10:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715820; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8nIqaVy2DRAugJh8aw//UBb54MV40uLKDuKRL1RlRkX+MpGQcinX4Og9iqb3+Z6l
	 C9vTi7FtrqrajL9bKCSxY4S69e5YoaXj9FP785NDijsteKl8d3oSMfJ+O0eLtkWFyK
	 bNG6N3Ai7ykyR+R+lEScdY/++kzhcf7gLgUP/yHpFDlaS11CNpuKxBu2ojkO71EU1j
	 RK2jydoXQyr/9pa9yoViRbJJV/EaghpzUisfrEJe/6rzzEHwJirrnsDf47ZFP4KYJp
	 kPi+MXEVF3zqhzY/fCIqZhV+HZhMzZFScF6eLJNacTqFkrlVBn+ttXWzWhvwlEF+Tq
	 pL69BC263WWrQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 70BF04254C; Wed, 22 Jul 2026 11:23:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715819; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDQMFol5QBHHj3Osr3lFNkgmOfBFQ3HLbZ0N14Iuyn3D4GVP/e2erCiWqaO/I0u3n
	 vDdg3N6fLu3cEJCs1HxkpKzVW2c61m/Z+/WiOGdAL1EPqvDxz8YX2JjSJFAdfU840n
	 93TeS/6TRrvENsGMVBQrTSe2HSHrvG67Hansj69c9xhhzRH+MeS7Fwv7t6RnIyiekt
	 sBHMtgtLfctNuQTjSscPdiBiSYfQ1KGFzCVDCItN8NddINsVqBDGq1ckSb0SlbGF30
	 lmh6f0MreVpEmGqoGikiSJ8NjdQyGq8Mg27wQRHzoMgbnOkc1eV+a4I2uqJhidYcvu
	 kHlBw1NVeHQfw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 247FB4252C;
	Wed, 22 Jul 2026 11:23:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Wed, 22 Jul 2026 11:23:19 +0100
Message-ID: <ff9948f8d30ceb0f7d2c962097798dc9ed8a1a40.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032344_747016_F5909D58 
X-CRM114-Status: GOOD (  13.36  )
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


