Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=unXL73yH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pdBcTLf1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CL9RTVFn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=; b=unXL73yHDMnlF6
	Y/HGJtO9PM4ImHNWm0WmQpE4ATac4J2wJa8wfmkQfM/UNkVKF/33TEsedMSw6V21xGX5nV+4ae1q7
	wQEGybA3R4ZWqBeC6Pr3+/0uBKytEbdJB1YXA1OKvbX16KWyAMNjAwxP/QOqQ1uscdQ4BVjzlryAL
	zXGjqI0APF+NninbqnnQ/auYRI85VeOhe3J4RQsnN2RTvzQUuA02E5QbZecx7lrR+9EscLvmqU4kl
	f7+KkceJm7SxSlhN8AS9yxkrg3xPUL/ndU1J5jwxEFGkQCaY1QyC44vidTIQMOM2dxjqj3s/e6GB/
	gzvrDeh75WoI4tGYA5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdD-00000004hae-0uPg;
	Tue, 27 Oct 2026 12:50:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hO3-2WhY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=; b=pdBcTLf10W5NWqnadITfhDSq2M
	p5QPDFpfwKyu8YRFWo8DSUzx7mBJ14Cee+c14zpBL5rlfigyf4BJmngrrDW6v1AIUb+EDvl/lA5nE
	UnJo1S0FsbkshLEM96NmsX76lOQcwxbGoxaHF+RSdwKJJuTaitev4M3x7QJreaVOOEA7i4nSRJhEG
	1U+EdX0k58HZmDo+D0vzWo9FVXrwC+UVrKyVXXFYvjQhyX5TuVP/S1bdO4JwBO1Qmqzr33W+rfVeR
	yHgYgdu9PXpwD/bKdfCBTl7Mwjc6g4LhKEsJ3OaNZLdF7bPqEzD82lBnxTaJG8e5TTc+iNoGJ2+pY
	OCNKbljg==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcy-0000000ExuT-3fXu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso2629189e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105407; x=1793710207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=CL9RTVFnj5ZcJyvSSVjEB/P4t/gNeS46zqVmq4jsxi8Xw06C0LLYHTpKEhOdrudDPz
         wPiGDLlHKENaYUkkEOPj++FpTBXMXow5zyxoz38rt6TlcU2HVAtp+Y0DrqH+j4/tdyW1
         cPKSljDNPOcpFQcveJkp1w1NJSloqLar0EehxK5MHTM53EQ+PiZ7e/+k2yxgZlSl+XFz
         BsPAkrz1HImdTsQHFxBXRMnlgOkeRNuT51O+rfmNt+oLCbXTQ0Bk5sCquT7FH37NzNc3
         owS6Pqdj+jOHS8ahbKl3qTbDXYgqHYg4bpIWPa6YINgPzHqtZYj8VazKlXahMPk0oPN+
         RduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105407; x=1793710207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=2uUPcBwrbAYKEayynkbPP4KW6dpmzdvdrzkusPWAuwdU0Ry+XFStHRh+tyr9SGhuVI
         NuBE/nsoWvfHeMfgfB2CB5+fLVh6Lo93t7GwR2bvJiBCj805loo1mWqKMHZUaFESqB/w
         3xBT6+wCQeu2Ejl44c3mIiYf+js64i81nfp89efHsyoklJC8glf07i9XDD6h/nzxb/8C
         YdWag2W4c2xohgkXRSnXAQkPq3BmbaF9maTZdlo7hkkgQ+mzVBOU2IlNuz1Qcor6GH0b
         uwf8i90bNHfBA2hhyfssxf24NawQFrnUMRDsxkmgW7U3BBhH1zDoOQSj5IbSYS4zkmkz
         FHCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhvVuYlQn8bIsyYrNZtSjnZd8U6mY+P9SkPViqBWIFhGAoRVK3l/OaZd3tK8phmCwyJK0kWvySkei6jWcCMOao@lists.infradead.org
X-Gm-Message-State: AFq9FYJOZDoiWB152VE0BCz1FCdOSF7dpKr7s6dMc1FdQQCO+boqZrRG
	ernuolM9eyiWvSgd7udxkJcJMEOCI43qh4w+HXUNSSEfIdtxTiGDZXRl
X-Gm-Gg: AYBFou01iCBVdVOAKNVWQ3wlgVulDDQqAHu0UdsfbLTeEfAw2WLFinNH/ADTDemUx5x
	b8ao01sIYRH6H3y+w0ylKYyYaMUrpNfrh2mOjlseoiSxEoGWfb2Eewji3xiCWFAdq22u2ymLStE
	fTv2pf5UpY0pK5eT9Ke+ddcNa3UplK0CHIHZ3KPW94EPKQop2bjdCfZG3t2wc0nsVME+uLOUq5p
	IUoGzBq7m5f7nx65hoICbYPhfnbi5OY9SEqXvmjVusmW5Gt0pYEE24EUrMNNKCtmaYOyd/n4VQb
	SPcgMB3KPtE/oeIDSOnkvWlORaEr6WP2K1Oe7ABgEjLf0V2v1FllGQiz18mTwjJJ0VViPBFDQ0x
	p6RbI7lNVAHPKPOIZFgjNcdyP/Jspi1fKZAjEV7iUP1K8nnP1lanGZTQJvpVbCGfzui8c3NXYWz
	eKG7eAeIl5GbjjxPU3/TPWJwfFGoq1ZQUzyRVI2MtMf5gX7bUxSoyw7JOaOc8D2+Dk39mG7O7op
	RNY2F+wIG1rASgMd21KHjI+EzPYfXmvVQdhKnjMo95oJ1+p57QpyWNnTqJFg2wb8hnDKe270S3p
	NwqTPVtT3EfId//Y1nGXMV3kd4+D6okdwKoVH4HkdPmyeV0fH9MPqOo+FwLFHOIVHQ==
X-Received: by 2002:a05:6512:3409:b0:5be:50f5:f789 with SMTP id 2adb3069b0e04-5bfb71c4555mr3678914e87.45.1793105406758;
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
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
Subject: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:49 +0200
Message-ID: <20261027124954.110697-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125009_030726_1A3FE03B 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -0.2 (/)
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

kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
and kx022a_turn_on_unlock() releases it. Annotate both so context
analysis follows the lock into the callers.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/accel/kionix-kx022a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
index add89512af79..a132af87fb5e 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -484,6 +484,7 @@ static int __kx022a_turn_on_off(struct kx022a_data *data, bool on)
 }
 
 static int kx022a_turn_off_lock(struct kx022a_data *data)
+	__cond_acquires(0, &data->mutex)
 {
 	int ret;
 
@@ -496,6 +497,7 @@ static int kx022a_turn_off_lock(struct kx022a_data *data)
 }
 
 static int kx022a_turn_on_unlock(struct kx022a_data *data)
+	__releases(&data->mutex)
 {
 	int ret;
 
-- 
2.43.0


