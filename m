Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BAD606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wt7VdE/X;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CeMndGP1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=; b=Wt7VdE/XOYPGK/
	1yATBPLXBj6HjNBkCjwmtTQRepYuts5Snpusc/ZOtBucmtKLvaGzp1cuZEbK8kAmviM+mzbOWF2mj
	W+YUDfy8qsW2+jks5k+cfshO8WchEVcs1QnT0n1ouy23fAKKCbEw5pteuQl3b4u6wRifjEAIA8b9l
	TD++3lw+VYnEqSmxO8ZLTBn28MxnN5K+ZFbE8IkNPk21H0UUFqLufu/nqBBUL6sBCqKpkr0AREOPp
	hPRVple1X+SO20f3KDaZodIQCwSzp4XCtyaPkFi18CaQo4/IrXZwWLZ98egX+3fMyFkJRYwgAjikh
	JBmcDkxCUQtgkfAr/B7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ho-000000013zg-3hVz;
	Tue, 03 Nov 2026 04:38:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hj-000000013ta-0lID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ea138a3497so23751625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680690; x=1794285490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=CeMndGP1WDemGwmVlf3diEZfAThF2vAVLRic/1K3Jt/fwKAGuF/nW4AnCJzNOEENvC
         BmuTrziVhwOXX67snIBJ9IBgpPWAaLAouKa1rZGTi/FcaRYVrceQa73DBddbIiFagd8w
         tYWT/x+3Hf2YZ9r1RKKgrR58+EdAeT8izgQmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680690; x=1794285490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=2d3+9vnYtJN8WGhIzJxEbKkM+LlNnZBbuFjg5TRirkXNfkLzRPIdr0kG9xpiSntWuW
         NDxbJ9OmSC1ivSfiaeox4lUO6vU3t1bj4TOiqx73zcuZyueKU6wNsOPDV7kpFc9OFDNH
         zV0unuKfyyrz323FkBHNJSdeVqI/DjwSlYtHkzja7Vqg121S/69kGcQPcCUCzutD3Ru/
         VHeVKxm4s72eJEAjotj8Dl/cqgjyeVrKhufBq1ILQ9Y1P7fJkeWCtdbYbenKDNOlSfGm
         WhOw/2qUBzZqg+Q3fgn4N4k+c1W2Zsx+LOQN9VoiaA/yHiuzmNz8fnU6m7OpBU+d4bPW
         0lrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxutWImIA/ErUh+TZz6mOc0tvW04H3gaN8Z9mKA7qphaQqJzl500MRxYKh3tpErUmJ6T7XHntF9YYI8s554KwUi@lists.infradead.org
X-Gm-Message-State: APuU4Z/35YCSOEui+Y6smGst5zMsRceTK7yyB+4rjKEAu7TzbhHbsIxu
	UVqnfFMQacIgY0lPVUzn7hUQtPnkmZGGAeREZMnArx4RfMuwJwvs6TmJZOeBU7riaw==
X-Gm-Gg: AYBFou3aqfbrGIwijCRN61wlcxfpwY7GXgKs3LqXXdCZaFaY8HHALPHDYPWvOO08bk4
	VPX5y0wnieYWUI3Ug4oHgoUqfDE18yfbrF9hK7yjpU2/QUkLtkrVY5xXRjBT+HDKrKbBiv26Jaf
	RawjARgH+oXhGK+hikvAUaYLqM3+EMbM5JXagp+ev+ycdAX+ABCJ6JTCKxTn1JvrN/76kvm4eBA
	2JdTYI4i1dhWS3WgKOka3/qFyKooW+It9NfVEaVE0pyW5LDJ6axNqjoaM8GWXYAlqQQq+6Gvfql
	DF+Ykd2SoP3uZ0UQrdJFRO26U3TuIdNJk6krKk5BJ8h+KUbHGawqECwzDIvYlJF5YxN8YFnhfbq
	rMgu5i0/sjZXElH2yI1x4faTXUnFfgKhUzidGAYXMu0y4QtGeWW2weNaWRWEKkEJ72cGWC6wcdD
	36kJ369kDBvaHSIubMNS9HlURICvZG974hn8E88nPhcPR/4NF7dTP9BC/Fj1br9l7seQWcx51Y4
	6DeB+0VC+r0n2L9dB9HMfzs/FMWqSj3hfKtLvzqVGlUhq208oaksgQ7uRAYVTE3edzOTlL3+40G
	FtLAUUdfiO5wtb+R5ZgvBa4sl88iWAc87Gu0u2XQRlJWXd+1ppbVT1i6xnWDxm+AbFG9zPBmY/Y
	Nsx6dP1ikLPK3
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr7369616a91.14.1793680690189;
        Mon, 02 Nov 2026 20:38:10 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:09 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue,  3 Nov 2026 12:37:30 +0800
Message-ID: <20261103043734.2179858-7-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203811_226142_1A27BB0C 
X-CRM114-Status: GOOD (  22.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a I2C component is found, its device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is a high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the components that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Fixed typo in commit message
Changes since v5:
- Only defer regulator disable if a device was found
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 97ef58bb4c04..f52ab3f54933 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -238,11 +238,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -359,7 +371,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -405,7 +417,8 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_ena
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	/* defer regulator disable if another device driver could enable it in time */
+	i2c_of_probe_simple_disable_regulator(dev, ctx, device_enabled);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.56.0.385.gac671c819a-goog


