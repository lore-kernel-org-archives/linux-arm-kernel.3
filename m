Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783E606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kh+r21X/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owOJweco
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=; b=Kh+r21X/3/hoBn
	Qg+0bXMZq9kZXcsDtSYv4qVuPrjiHRw61ivWYnLRJYcnMt8v9vaVWHEt78SFeO/yqxOdUc0MiHIeU
	wQWZ17W2NW3jt6t5T3wwOq01A7Psl0BFb2o1G/+EmoNEdnlcKxKMBs1742ZPEovZe5aln5FNBpbQe
	x4bXhPAlIh5azZmsbcdZC2k4DaVS2JV3e60tZJNneZhZFAYAXTGreNtCxq09P+TWo2FfIWINusz4B
	lRPCiW3BdY4CzsJTtsMHFIyywWpRzevI75SskOPWO2m/JyZtckc45TEXZ7b0qbqaj3SokHAkHaaWo
	+ynZ75MeHUndoVZj+bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdC-00000004hYN-06kc;
	Tue, 27 Oct 2026 12:50:22 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd0-00000004hL7-1XeB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:11 +0000
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so27119211fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105408; x=1793710208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=owOJwecovPC03Z+2qdknmhyYGK3K33nLiwV4XMWLgS4JhtB8Zjibl/HhBpYX1Z6sgJ
         phLp4qXauywRmzfyKdA9yRMxoORiYlPnmBQNYQdZpL99/kd+bp0JoavNN1y0xDJfWiig
         YeSG7Vbj8DGUPzOhYuQf3+UBLVKq11Ht+2zzDLlB711GkNvGDqjMBA4HkvyIN0fAwvLE
         gHtoBHVlgnpIl5pDXW5hSYtyl0nGb6TcOLzicYTttpamncfglLVRLa2Vz4Sznz7iznjq
         v0KoeGRxxgNOcVBIOhThjHtoxtNWJaTQSdvFd0kc4TlKXoikB9M2Ly1yvxK18icpJmry
         qDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105408; x=1793710208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=cQAxPAxf6rcPMNtkuzDDJV7uSq12jOZvz7iLsSYcyBxoL0KwQqe2Ab4oFRSt5xhLwT
         PgdMWumkSvSFiQ6WSnyRmIjQ8wqa0mcRpJA2La4FrOoXefMNVGffuGZeaAB3DMeqyd37
         0Az4qMSdwLL+vzdTUd+FJ1ASB3go8iIKJA1v3hVIH67PGh4xsmdK1rzuMDxftz3gOs8d
         9BFo4c26D5RsVhv8Ge/1BmRF37gXOSL/VujHDKfganAPLrA0qFcqwENLdBfX00bJdBeu
         hkgV6nuKq/7h6lxICnxzC+BaH+kjMF6KIqqQZwxsPj4bRFV/U40iZgBCLsfFsDgRqGHH
         rU3w==
X-Forwarded-Encrypted: i=1; AKwUvBxcb75rlS683wcp9XNs5Ta1XC0nLiC4NFZwVINF8HG5/7ZD/u5YgqxMpQYGKhjVSdT9TMH5AEFT6FvBvS+F0rhu@lists.infradead.org
X-Gm-Message-State: AFq9FYJfNPi3ZWc/20VjOrvorW9OEuGJHdTCybO+GVPiSqwxvQqd5r9I
	f4CpoLAlJgra81pQx5p5Y1AA6IJJdLEz9VGmXtOzGJN79GEHanrq3KfJ
X-Gm-Gg: AYBFou1Kr0H88SqTEYP8m/1Sv6PDsJDyWKk9tmAzccc6cVExUGucXwUoEEXQ8uOL1Nk
	3dX38cQSz/DzkszqEqcynIZVgQDSZSn62eI7ix1zNI/mOIjSYOsl3t5wARgo+ONEyJjenNlPv7T
	852xWYuJGY52hcf6race6bWTDT+az1+r5hYWRG+LEUNaFZPJlBifKAn+rEHU9n5gR0UzktQucqy
	Ix5M/m8O93v9UWk76P4xVlzAhTnQHL5fHb0g6/ntA6drf8eHh5sBPLffNYWCudx52Qughd3BfMI
	DLbb7T8q8jZTAf2LV2PbgAlySbhsc7cQp+bwFzT0ZJd/R3sPz3CtDM/giUddkFD3/GVg3LJcTuz
	ZZWYQeABwPltpn1L+9LCcIYRsifAjNm1VJLVLxc5IZtGGf4MZuZOPXRxT/zhldXnKxk2pbq/2rL
	cqN7SerFtgGEBZcpoQ3hIetuhFX0oE5QBXDbbL/Zls9ujJ8UH3R7uv5daEUcc+apb6+zoimok5W
	e84DrEFloAbHBwL9tWhAyQqegmH9Rkj7C2L65XbC/fbJHaiYQfl+hRHKg2wUwH2Qi5aEjCpd+ms
	IGnx1ZS3XJq9AC8TP7qx6dtXAdopbfVo1ti1YtrC2ivI3z/lhy+ZVBWSr6uTkBzyWF2/oo1wLIV
	lNyURF9gpYA==
X-Received: by 2002:a05:651c:a331:b0:3a6:622a:2cad with SMTP id 38308e7fff4ca-3ac6fd0c2efmr24122901fa.10.1793105407711;
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 5/9] iio: adc: meson_saradc: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:50 +0200
Message-ID: <20261027124954.110697-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055010_446563_138F084E 
X-CRM114-Status: GOOD (  10.66  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

meson_sar_adc_lock() returns 0 with priv->lock held, and
meson_sar_adc_unlock() releases it. Annotate both so context analysis
follows the lock into the callers. Only indio_dev is in scope in the
annotation, so the lock is reached through iio_priv().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/adc/meson_saradc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2b003fd5afeb..3c1bc2274129 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -578,6 +578,7 @@ static void meson_sar_adc_stop_sample_engine(struct iio_dev *indio_dev)
 }
 
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
+	__cond_acquires(0, &((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int val, ret;
@@ -608,6 +609,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 }
 
 static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
+	__releases(&((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
-- 
2.43.0


