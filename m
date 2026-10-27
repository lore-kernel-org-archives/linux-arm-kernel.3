Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ba/UTb5i;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rm/uv9CZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=; b=ba/UTb5iy7Zt5C
	P1ohS8k+Tu5wqv9JrJ/fZgQ5bTjA5s3Tvaf/nDXnpUQBOkoQse9LAF2HPvehrWwP7Yx3zZdnMAI/j
	FIATciLsl2f2XsCF5XH+kJuYrHFQuvfouCzoqemzqoBc02hWYOkcVNIwOWHGAH72wD3And+ahoWVL
	ivgGmRgWhgHiZiDvSA5O+FoqZ7MySvpCWsZnUzBuBlpMavzmk/cOyRhsfLIRdlofM3iZMjw17StqP
	hx9YuueI723bXuN7eLJTLi+eQ75+3FSR1nhss0BzhNkmjHMpjSe8hTudWOHW1F/9mGIUS9f4KrcLH
	Tuha6xKHph5U9SVLwwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hOd-2620;
	Tue, 27 Oct 2026 12:50:12 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcy-00000004hJf-0IU9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:09 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso1614012e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105406; x=1793710206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=rm/uv9CZsjT7EI76BZH+CnDb8z11Uz8mXegW7oPL+FRi10LNRbAtVHCvXXCXZ+cJU9
         wlJZTH2LIQjws6T6Slc1viBL8vTyAaG6fLozFH56GPg5C8y/VvIenhEg/reOZyoQwmqz
         6eM7+S3PcOMW2sOXBziMl64gehT8wteRNRO2YGGNS7c40Qc39yHqEgRnvDbU1zghOJQ7
         OTpqTUl98wEP8UOsAR0DxTzbKL4lo+1vzEgoBYBdkAa+BXrtGYUUHXH2mck9SrgK/t77
         NYgCT2WQCLZ8nvT/bY31o4hoOYa6Hm978y7BcZOc5bVD5wQsnTtl2tF1rVOmWC7pl7se
         oTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105406; x=1793710206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=WbeU1gLZTiaolqaEBI/0oFDTei5dce4yhgFuaec0WxpAMFE/Si68kavNf9t/1cuysU
         uu9TXlrh4X6WSXi906EsXIL8guGPaqLqRKa0kbD8e6kGUbX63klMnMJN9gDaQ+R2Ji3U
         PoduKvmRXDPu3pBpyD0t811bGCfie64/dgJmAE0E3YX87BcFTrT9zvdW1r2AzS7vUVF5
         WdKx1o4WJmfCOAHa/OaCQFYmYyHYkhAAdD4QXrX71Wpn5dZRjK9np41VwKdj2BIQGZYo
         NWkBPqHMEs1pTKbN1tK8qAvat6SawpIiro08Bro5i5YhOtJwNjpPfquv/MfsQ+tP66su
         1fYw==
X-Forwarded-Encrypted: i=1; AKwUvBxouoyOE8KZq0yls9/KNmRPtHYNTrFX8jkfZCjbdZIKG3av7f5oDRHKjJ6AsUV5qsHonNdFc3ZV7aMtNQonLlvj@lists.infradead.org
X-Gm-Message-State: AFq9FYIz3QgGDPsntgdjSM0LTlS7/dUOUUWtVA9dsuJiTTd3bEGD46H+
	FAsSITn80dipPNVNNzkmo5zaKd29SSLKKo4iimTIbl1Yky+wCV2VtKwu
X-Gm-Gg: AYBFou0/eiLzNn2z1Phv6mU6i3TWpjGHUicjfddwMA7eY8TsAMk2ua6X6Bs3+vlSSPV
	ZceROvLDRgvrJPDdl9mE2PPPQeFtmgCsuVU1FlgWlxSTwfiqFdJSdbhCII2Zvd7cqjd+l5d9Pjr
	sGfJaD49hoau0T8B2/CDGwwF9kkzmLffOS0QrGEH+Hpn/EzUY/jd9otHUCZ3qT0jJvynlwLhSdJ
	Uf7PHQoxTXzOdvtqHytF6NGFrpRERLo6saUSyQs4zsFKzz7f+SfdytYWnB9vncZuo+xgFons6V1
	XqttdDQz6Llbdg/1GOM4WKxHp/vZ+yqyGmnx6BHRAQsprA3Tit/i91AVtOCG/P+nLYmgZa8+EQr
	KAkRvWwx4l2HRyYHSkgNfNhUKuPPF2IP0UupGneQbyxDMIz4TWjoJDvPpNYR93rzK15oVhGCS5i
	caVUBSioXAVkAPqzka/ULbmHg0LXlg2m6Nz9x8kKK+bojsrbLS7IluVj4znFwoP83KJ8IsgHwl/
	afglNK297YJgb7q3dSB/eGA1RTSJ/ou9NgNa5IJQtaqwJeJEk2QIDqu6DTXEr0+QFqHhGk8twPw
	mZfhUrjOzW7cU7bJiRXUoKkkH2DFtluxTKNf2NhXwkKKPhcgSA4cl+x1cy58VN8/
X-Received: by 2002:ac2:4c47:0:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bfb71c6b52mr3628166e87.29.1793105405831;
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
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
Subject: [PATCH v4 3/9] iio: core: mark the mode lock helpers __context_unsafe
Date: Tue, 27 Oct 2026 14:49:48 +0200
Message-ID: <20261027124954.110697-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055008_127596_EAF2AF26 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__iio_dev_mode_lock() and __iio_dev_mode_unlock() are declared to take
and release indio_dev, a token for the mode lock, because the mutex
itself is private to the core. Their bodies take and release the mutex
instead, which context analysis reports once it is on for the core.
Mark both definitions __context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/industrialio-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..e9a5d1d905c1 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__context_unsafe(/* returns with mlock held */)
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__context_unsafe(/* releases mlock */)
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
-- 
2.43.0


