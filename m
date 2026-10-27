Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E9606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1AyWKG88;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S4FUjiA4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=; b=1AyWKG88Z7nkdK
	YKXU+Nj3DPBYo9dtuoXvkHZ2GwbEj7EhvVbbBS0wsvakzOEfNm0fMLjlmAfed/IBNIs3cc3Y4QidA
	h5DihsiRss7NjYqmifnjjmmNLEezS/xvxdCPzV3ToHRaZ/iGEQMqjTAX5bL6LY107h4pIkGBJhGoi
	p8ZX0GoznA80dm3VBdEkLyS4yu885/DlZQO7sDE/uusfMQS/Y0nMrNKx9KlpH0J6PiBQyqrYvl2G0
	nDWqZkfEJDxpT+8NeB2am6WKF+pNAECk8+kR8uGIE5nRu+Vs34g+VsCkLZ3jtjVM5+1XddyTS/FLe
	P3YJpM2A/3gdU6P1mnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdE-00000004hdl-1jU0;
	Tue, 27 Oct 2026 12:50:24 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hNf-3arG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:14 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1348475e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105411; x=1793710211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=S4FUjiA48a+pF81jK6FWVe0R5e/tQBlE5o+lPdxJweglgohUqsvlXZtkHu4PB7Y6AQ
         TF+jFrYPZmdnMG6eDT537dsXS7ycdBVd+WnsrtA5F2gzRIhFGUz8QykoUbYiL5sKM/gO
         GktA1KvFd8ltrlgkTJP26ZWBDH7CLwcU22W2cdJEPDQI7EZ0IhhzjEOO+RN9giyEoEkS
         Xwyc5Fr8KqnRA0RMwZaS0nJDlVDaJC6zwGO9bvQcEVe0P0OgoibhE5DvcQX8yj7xXHr6
         PpbOGmPzGq/Dna5lj/bchoMIWS5VaHBTLw3rzfWtZSoLzOqkF+28DPwmLRHA9/BltYtV
         FAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105411; x=1793710211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=nv6rpJSlYhmpwKgRO6b1WSmK89i5jg/fuck8UU/jIt+54i2El59TE5HuZ+HqEqcsip
         O1hf2xiWIo2gDju9Z/Ml/q2Mj2K50H/peDtAHu95mfhLb0ek3PO/Kkg5aiJ1sD4iIzzG
         BXK1wZG+SxwxH7VEheYLkgi+2jGbT3/Q39+0fBHa1LzjNx0Qojy3d/lvp4RTfy/p2UJn
         oWvkaM/3WkhiDkCsu11GEnuAjNts8axRojNjw0c7DVNVJqds/vq2OvcBgZgq5ygR8wKh
         iNj2F+q//rEyODfD66fvf/OWvgme076ypQfZXJTccb82XiqCOk5jG3iFcy0OsSFEoqzs
         3GLg==
X-Forwarded-Encrypted: i=1; AKwUvBwBoRBB/xsK1N7xTBjVgrYytO2sASYhGPWLqR+K5mrTMSTUlqrqtd9JNwtOWQeQ7EZ2nEHZlSnDEPBqao0Sx2PA@lists.infradead.org
X-Gm-Message-State: AFq9FYKRl3cTXDSZUJOSzFFNVtKljAQgdXHPQgAtj4jy0vh9/4lwyLrq
	Gvfz4yRyIoCWI+kjMtOdVoyJhk+t//6j00sQ0rf3e6L8uJt+k85TG7o0
X-Gm-Gg: AYBFou0Mvx5uFibAf+42EGWRXIMgiEr7D2+abKGnsmbUYXqs69OJPwnuxJAMKsqouUU
	LnLooC+QEaoUH4HMJrwm3KaIoa0iF15w3/VayT815rnA/6iT8jsoVGTAgZxV/nr8oFqmjwwp9wC
	5VRI/jzS8TPl4Mc15JJbHZnWvmfTyhj74FOt52W8rwJhetJiXKTaX8Bqm24BnELnA2CBqv0KkYW
	elxhWNMRkm2tgUvG3UneqKIzwZUulRAYzZzRJXDxmF0RmKmpfN4AcC+MQqTiSlJxAQAgGX6ozsP
	G3feUUu+A4mYi7OhXTKB4bBWD/BzQ/BzS0QBnxWBO0mIaD/CcjRyB3HHpV2nHL/G00Iv7AL6gCa
	HTkYAb7AtUg3skXg6XVl6mLVf7XkHg7lngZ9bizlb7WGezF3pFeBWB55OPRyIvkcMxJDuiXwrFe
	Ip4kFq5kINcpOicuk72UpMBUrDp47wknTPem2Eu5rSdpwSaxU3SuCf2an9OqnY5UnVTUSdFKkjt
	2N4ufxuf158yVR6wwRIkspTp4qJBpArVogE3ZAWZL/ikvVK2K4xbtZc06qefrDXPbrug2bODI6W
	4Ng/QjNcQWS5+Rt0VRBYb/Ecd4RWefmvFrJQhUWKqaEnvO0O9x/mJ1+rlVRYtAHr
X-Received: by 2002:a05:6512:3409:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfb96372f8mr3300311e87.48.1793105410585;
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
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
Subject: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event enable helpers
Date: Tue, 27 Oct 2026 14:49:53 +0200
Message-ID: <20261027124954.110697-9-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055012_967547_209A17A7 
X-CRM114-Status: GOOD (  10.32  )
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

veml6031x00_event_enable() and veml6031x00_event_disable() call
veml6031x00_set_interrupt(), which needs irq_lock held. Their only
caller holds it, so mark both __must_hold(&data->irq_lock).

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/veml6031x00.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f6308498e422..476ac3717f8e 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_dev *iio,
 }
 
 static int veml6031x00_event_enable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
@@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x00_data *data)
 }
 
 static int veml6031x00_event_disable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
-- 
2.43.0


