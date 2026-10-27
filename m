Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRwHxa1Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zuo8+DtT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=chNblgFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=; b=oRwHxa1QBzzKxf
	omTl7MCABEmwLvk63fO3HJTs9fqJSELuuUSg3GjWIJzf1vK5Fq4DembDBuBV5cpsax/uxybCDMM/x
	Y9JUUyogJ1+BbrZs3g7f5FwZSpt53tObHwXSPP7DmA7s3vmj2pvTPcehTKFr4h9QaodN5Yg6YoeyO
	wF+gRA/T+ySqWywURP39/2ES+pbM4ozkPTWfnXDLDZ5oS6+VCPDQk2CbBUOgBmeQeDAbYrv88T4pj
	QjZmNtVycP49EPlECtOjgiBGCnyd2gk5tdGcxJ4eMEZnbKsy9jV/Gd92AehVSYnUXjb2nsRsSCumF
	tPTIrfUeq72/exxerz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdE-00000004hes-3Cc8;
	Tue, 27 Oct 2026 12:50:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd4-00000004hRM-1Vsn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=; b=Zuo8+DtT/G7chb+EYqJBSiu5yg
	urAwmyJ7zSLisMfr5Yf1T26SOxwjYehj13y7VKl5kymD7idwt28lmiuvqEo1RfWeQzbq+XRMu7tfZ
	zibOJgsJF0e35t1GteThRwwidy5Lv5Eq/Ci6Inoq3VVN6JFbjWJabW1kHPgNP/eNDR5YeKDtO3tC5
	IjMuHQaPYll6Ttga26USvqDaOo/5UZLjhxE13aa5/N1MzpmI5UGV7Tgcoe3k+dAEwO0dY7s49pNW4
	ngP7fizvjot7SVKst0qyAQgZOdukycv/WqJU8HACafh8yVvrFwOBRVizhi8QuoY3w+cH0UG0UjVjC
	uutJV+aA==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd1-0000000ExvT-3VEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:13 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5be4d648aacso3747866e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105410; x=1793710210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=chNblgFRC93SjKAmarA6LT8wcZS7/KRNFLPDCenMj5Eq5YLGPnlzw+NIj+9NPJ27DZ
         SqRtdD9bqARlR7+mr0qLkrtAUCZAn8rNuXsEGF9n295PrwtO5GYfiq1L+hjck8I/EijI
         0mVg+n9MIbG2+6l3kZB4nmB9Akk1PiQzXiIF0S2WlDLQnZpKTS9xWxKP1eEwHKPwkPeN
         sTbmJL0paeI55MkSrrkkEWK/oAdr1Gn1uX6dPHCQtk3smK52l1wP7/hL3DAndkVrGmts
         /kRt0HJACmvtZeabVeG/tsCPR1AunKVD/Aq3EkkFqfBg9YMvrL5EOK4QX+wDG8j6xuRN
         g1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105410; x=1793710210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=eMxelAs1oHH3cRL6B4UDXBgWWSONlEbuHZgDKLC752iUQUBwrJ4cyf9pPcssi442nN
         77kyQc8x5LYvNkLmmpxjCkiFWSrCMlbrfeOpIGeqyGJfFRpQWr6+wdrNKuV3XKUq8trc
         GmVVz8lUU3sGVdu/8YVHue/oDKNUXOcOzIrAgFhpzlh44YzizAhLzdtYHsAYpVZSceF6
         CEzpfaIcivCBSV3D5QrCXlYg7ZhxlC9t4/3sVfnfADGRT6tOUt1AZHKlM11R0fX1hCXN
         7Jhmikm5pS42Ga24zDsel2J+CrWnQkxcMMK/z7YVlqQ2X2QlZRtAeJwmG2L46wE3B98y
         RSHg==
X-Forwarded-Encrypted: i=1; AKwUvByn9/AvYOMLGK5aYi2skn/TLeK6f8IQWQOuhxa6LevhQBI1u20agt8rR6BFC+u+zwYhaDShOaBjLENxpjdfHGX8@lists.infradead.org
X-Gm-Message-State: AFq9FYKZYIVRwsySU2qGFl2uqU/7juNqMQr05pGMU49OMPWZoJxPJh5A
	B3aKiodc/4vFHpvsdf3oBH3RQOJFBgme1G0Qh2CUHlaSo0gl/Uh3k6p2
X-Gm-Gg: AYBFou2WAtUi5lUXlC8HfrikD4nxGYkzVCQDj0ysArdGRHjKhxeHKku0nQXOaUhgcW8
	iko7qzAa5508/G5Slmh2ebgyhQ+uqkgNodtMaXpmF7T33aVTEHT4qYIbgCACgnKrd3eK+T9gXLV
	uDukNGea3lHtVAQkH3IryNpojWp6nMlhND1R1rjJlDeLf0F8GvURfOdhrsqnJM4Zz7xQFbsSCUs
	FyoTC/vjRY16MHB/cXSkjZYj6NCl1Aa5k7OjbF40L48n+GIAwzwwWZAB9uprgG1t/9ZUOpTJfWc
	WXbWiDCHl6RtvdysYu08XgvCSQjvCp6PCcHUOwC7WXLq2F0QcSfQxzuQ7LBJhti9Kx7RNZiv7/l
	+jOixmEKyO+Dq3yPWH2lbqpNTZ4ucj2NGV2PTh1QMUA+NBi0CjJ8DO/GOxnZph8egt3sURaFRqM
	phO9gVpwgiVbnvRyW33bltyAMQMdmG7Lsvs9XAjA+1BHFUoee+Yh39MewZeG8pwuVc8B4syX8yB
	AkTd0r19m90q/Vl6/vhuYWDJcvvhRIImHA05UZLldesXB1bJ+/RKlmE6os04V0HkzHniuY/bHQU
	RTGO97BIJzo/4YYYX3tJ2yHJRmcLcHAJK6/5bVpuVJ5T/pJHfb/EqODWGUiyIMPUvQ==
X-Received: by 2002:a05:6512:10ca:b0:5bf:c27b:8e52 with SMTP id 2adb3069b0e04-5bfc27b8f26mr1690144e87.65.1793105409656;
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
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
Subject: [PATCH v4 7/9] iio: light: opt3001: mark the interrupt handler __context_unsafe
Date: Tue, 27 Oct 2026 14:49:52 +0200
Message-ID: <20261027124954.110697-8-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125011_909499_45B52EBE 
X-CRM114-Status: GOOD (  12.37  )
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

opt3001_irq() takes opt->lock only when ok_to_ignore_lock is false, and
releases it under the same test. Context analysis does not follow a
lock taken and released on a condition, so mark the handler
__context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/opt3001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index a948353014ac..cfd4a0ba9bd7 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -817,6 +817,7 @@ static int opt3001_configure(struct opt3001 *opt)
 }
 
 static irqreturn_t opt3001_irq(int irq, void *_iio)
+	__context_unsafe(/* lock only taken when !ok_to_ignore_lock */)
 {
 	struct iio_dev *iio = _iio;
 	struct opt3001 *opt = iio_priv(iio);
-- 
2.43.0


