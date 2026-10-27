Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43CD606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y8KCq0oc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bDRuOgGc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3wmuS3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=; b=y8KCq0ocxqUXDs
	e3m9SGnCDgiaipwbPOtQBmyofpo4QviF64Ct9klfJRkGl5tEMwKACx9XfddCuW1/qc3Lxk4hS2mOn
	rDXDiT9b+K2xgRpDUBFTjq3hrFEgQlgNIh6e2KDhilahIbcYgVLDUUOfumxW884otKTtjJFpZy53d
	tgTg9WLC7PLrx8s5614YEWyQEET6ORVlEEEeONwubQqjSc07tw+qrnwI9LW1n58I267dTWnjq1qhr
	7lZvqeMekWL+uDug6CFiZgIbpacavQbyBEB8152YWO29SC9x5JJiYGV1/Wfct57MIYEDVg9rWEL7q
	AjYNGGztntO4nLTdD8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hOO-1eqO;
	Tue, 27 Oct 2026 12:50:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcz-00000004hKZ-0jtJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=; b=bDRuOgGcXWpu6XKUhe/flKVQR8
	uYI79EHAJxSuSbnd1h9Yotkng1v79JM6+5U4Ms0x1zq0ubvRj+JPTyrtOrKPPtNxubAJoc4gmhk9N
	u73w6Zu5wgIYohKPT8LwCgVN5r87TIPh5np2uIwtCJ9AugE605XDr0XEOccqCZElbupDxREGreXWC
	uvh98nYJvnsao/lez38j7+94E9Vg/amT1Yiux5Vpf04j3Q+0sJmaOBgsv5pi5gjrAe0YKf6QYtktf
	S42V88S4j4OgcfDf8OEigYLh31tS5KAqlusYyUXUVcglsTM+cCKopeQtu/4bP8ZdJLx369lZg4Zrw
	Bar20YtQ==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcw-0000000ExtE-0WaH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:08 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3426116e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105404; x=1793710204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=P3wmuS3qvbYP5ziSmCq3iNgsnyD3gkdsfqLrNi/DnCffBq4lYIvA+p8WyX1F5X+sVb
         9CBnxet6o1LYYCOwvW6+6C4rmgFvPwqNslAaRr45XYRwkRAr9AojGNnbgFzwIOpDLX+n
         gG3UN+vmdrPUFpDxWD4StxcSSwqgVvYhD+IL+vVYT9Qn0SZBVoZIiDSokU2xB3Cn3C2f
         XZyrbhdTzRIdL3WmhK997pouZ7j/0zWYittaFx2/qyA0rfxXGEvyriR6vTDW3lc29ifW
         cM+EEvTZWXyu11VOYyWYTQG7gVsbbRstVGIZ4qZD7EoI57qk5Jos7JFmnd4PFULS8r2h
         eUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105404; x=1793710204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=MkPpIoaSLcm8IIppCgQlyVCxwY6dLIyxIx+0dFVZz+aUEFClxyMJnbT0ywgzWTftU/
         qOnCdL+kiKkfM6JBIwSbca0Un1Xe6JTWlYyROq8Fv8yjvL4SJq9/PWSttz0VA8nk3Q1A
         TGly0SwDsLchEh1AajK4SMLgp4BHYyjmg3bUxTq+K37mFLT+NxtuG9oGbbpMa2hWLagA
         mZK50d0lL8O6IdWmQnR9qxbnrSP8oYDdSNorRZY+7zZd3mgsi9gUZVDvYVd5fisUSrJa
         BWa2XrMMUHOvZLmKrsyMlfeSyO110c7XPqwbOquPrWo18g0mCajevSuI7f682OJuCUZp
         Mjuw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9MNtI1+QyjsVKWe8LXme3D24mCYBReW2jZg9OX6nfB72dtma648xGxgXa/yRd5f2ChAWG8dN8DNHjnc0wzJk@lists.infradead.org
X-Gm-Message-State: AFq9FYJP3pSQiz8aW+/h3u6fD5jUBgT8jiRVpStuFgYwPkKz6zpGaiT5
	jXM43N/aQ6tJh+mU7Z+3uM0XWh5G2quaXGD6yB5JYcOkP6GzdOBNytpi
X-Gm-Gg: AYBFou0zUFFT5sojs0PkbJ4bUjmUEdQAWKpcMq0NvFyPcrsrq93H2dVawXFlJTRo2LC
	i0gX5nWwpNqDRBCxXKezWu3mOGrIoPNHjg9+fhACRwOzqRZXOrYlpv32DD/5odK60x39N++rhc9
	N7AU0CFVytxPeVUD0kJ6H/i+ech5csAPxULnniCyZDMfjOdUF4/Bzy2lDJFGZO9jytsgB9fAro8
	sOOOBzmCVjC2BS0XHeiA5MNDYeLPfOKrsrSxeIf9yp/QDCvfl+oMkPB90Knf7WCiqxFX2w+Lq1T
	q8mCEdDSL2THJJYlISoWZbi6oIzQ8fg/Ofk+F7jdP5ytHhwbLCWmBxxjFUWLTVZ36IvPyAfhc1S
	GWfiP2ANezGJJobwSRfH06QZKCig4D9P6Wok2CCT+wypZu4Oo+JbgMCz1mOj2yvenOkb8ttIhyr
	MtDGgtS7xDZS8GfeR53pEmisF/uz9wBrknxi8errIzgcgDJ8WZ5sr4jIRyxLodHZGOWIeiZ02tE
	iMu21w+fwVuvdhP42abMwjZI6kVtijQVUUdR4ZIgoA+XBTelRsaLwK6PUSaITEJCRkUq5WeBMfJ
	+m7dPf8A3Y9EYUDY9+scjQbfw65Q1zrBXcxTTwoLDxtXPkAgL+goJb+fst4Kvy2PN1jMl6kkXBk
	vk3gvJ/wm6w==
X-Received: by 2002:a05:6512:1047:b0:5bc:d9de:d75c with SMTP id 2adb3069b0e04-5bfb71e3343mr3417911e87.47.1793105403789;
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
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
	Bart Van Assche <bvanassche@acm.org>,
	Marco Elver <elver@google.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 1/9] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Tue, 27 Oct 2026 14:49:46 +0200
Message-ID: <20261027124954.110697-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125006_302018_30823E8E 
X-CRM114-Status: GOOD (  15.53  )
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

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

Name the lock through dev, the same way the bodies find it. The analysis
then also checks that the helpers really take and drop it.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v4: name the lock through dev instead of __context_unsafe() (Bart),
    now the first patch of the series that enables the analysis (Jonathan)
v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
    https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..09013c6e44a0 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__acquires(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__releases(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
-- 
2.43.0


