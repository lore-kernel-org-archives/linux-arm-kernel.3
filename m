Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61E606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KsgXgkwX;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SUFdcEIG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=; b=KsgXgkwXpyYus8
	NdWP/GJLjVu0KPjzGIvumcwC342GAVMNn9jVU1cnHWeDgdoO4j6LIxcQLbX/oAxqGHOEJmQ+kPhPK
	W8BaorO3j38Hq9kL6uvr0szSsrodPM+uwAz4pyY5dW0u0kqhBdlLpN+SPijLSipAvxOnfOfLEEnm6
	HzG6/6I3dDg1E0Rr3u2ETBm1dQssASIJDxy7n0mDB9hc9vRhuKq8GAHDEoqot0JQyQv+l6wXJjJPs
	EBqAD0JXU2c8DARmw2SHMzPefR7GVMLPV8597F0+xBj1CpABFbAAXh6Icc9RV1ZmezEXE9EA+eRZ7
	8lVt9teliLPWmvGGAkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hd-000000013pu-0Ojq;
	Tue, 03 Nov 2026 04:38:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ha-000000013mK-16RY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1993597a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680682; x=1794285482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=SUFdcEIG9mlsfmP723xCYWA6J/XJz0sJN4cHVZRreTpX6b8t/0F4r1c7l6YAgZdGt+
         zFrQRA+52Kzn7U2lBCCuKzSsJVZFxR0bE8SVMdZsIhGltN2xJmyomzQ231cddyTLsZGq
         0XdrYy3nro0TvHAOkOpaFohm4FuxKor2RzQ+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680682; x=1794285482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=ZN424yNkoj/2etZ5vC3higuwzy75xy7qDfpk6B53eTcB07M4AnlWgZxfscm/NJK3yO
         lBjSma7ow4MdaKZOuRqrReeGTlrOh0FLEVtdRDnSveZYLMQQ2LZaDuwGwG8nR64mrS/i
         n+XSijHWW1rSvUZHCCx529Ht1Rx4wXnvmyArgD5pBXR9+NcVVr//eL6g4EJsMe+bDhie
         QSmCawGTEomgU/7Bx2Zp0fvFOJGlu2dkP1EjdUQoepMnRm4fm8q8QdhgVvlGUL6CTpXu
         r2CIOGoeiXTuDSdlXjVGTA4K7eSeB09x17Th37NZBZesos0BT3PK4uyhbuJjj27Ap4TM
         ASxg==
X-Forwarded-Encrypted: i=1; AKwUvBzmDwUBtksS4z+cpPeenvcMo+GxCZqX97cSSWIobISU3kfSFvmwl32iG4WGWgQO5uukiX7NUbLvDceEk0bfDmXE@lists.infradead.org
X-Gm-Message-State: APuU4Z9pZ3Noj+ll/mqMiDgN410g7SoPwnOKXse+C6bjd0MCXofXJVvc
	jfVn5q7AAIhu91FqXVQ4YKdqltw9SmV9XtfJ/QWNZzXJbIr3v0SEnPeEKECT6qI+DtWXdF54xyg
	Inlo=
X-Gm-Gg: AYBFou3PK7bX2f0PtVP9/jn8Xw6SFvnCLqehTK+dOMx+cI7EESXmlrgOB4VnpyaKDw5
	/Dlx4FqkuWJtxkPhwXscdmskZHmFT2568OyH1Bi1v/o0xbH/e+Dt1NHWqxKMI5O1g8ip3ru3KyS
	URZDxAjQzGdN7W+io2Ml6qfBWEz+9CX+cqIf8vyRknNsOe8+sbr6C+BT2ktfh+fD8xAxzEjQDAT
	GstjyuoZXrJWMZC/g/mdp3iiFuWKL/hyPYMLR0nGdxCYRwj21zdhqF/BXqlGmEIieFPqYwK+SfF
	Hj3xGOA83HqIRQM646CNAfScJ0eXRajKi59FF4Sez25D34RwHGgJ6x4VDh5VZeUI9cIUG+wYXkC
	ZwsO1jmw7E9CSutI2EYpJfdg76oJ+v/2dv+FUYmSB/UvjTiXwBrpiuQjMjHe0NHkk3Famj7XG7U
	Lf5+83W0FbixCR61ktzmL00bnS/I06o1Yvwf69OtIU0BQXtPux2rJ5hXENRCUWsngGhpEjAa0t/
	L6tXK8x47Wv6jJHWjbs51UcIhos260A2LGwCJErQYv4rMDL4rYD7wFHZunqnzakJy4aTmfH8e11
	L+JL4pPefI7qzVo+boGGUcCTD9Y/ER23fvza+rzXzK3V0ODFViWjklf0Nt0HR5bwz3n9HSLOtxP
	nheJ0nDzshrRs
X-Received: by 2002:a17:90b:2fcd:b0:3ac:a7ee:6780 with SMTP id 98e67ed59e1d1-3ae8986606fmr10535707a91.66.1793680681667;
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
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
Subject: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:28 +0800
Message-ID: <20261103043734.2179858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203802_325568_5868C4FF 
X-CRM114-Status: GOOD (  18.38  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.56.0.385.gac671c819a-goog


