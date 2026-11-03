Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZJN3n+4T;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grg2mGok
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=; b=ZJN3n+4T/a9fZV
	MxvUDuwWox8SeYioQ/ftypA0VKp76hoWOi6LKDIIIqIqGoF2yGXuHNRPx8Fid7h4WU6bJyHBDfL/j
	Tlt9IxqaPHEn+nblT+X34JscdlfRCBARKYUUJVshewqGY8BJnBgBaTHd/px3Qx+Mbgqq3LCecuoeG
	6oZu3QmctQ3Q80/qXKjQStOMvxFMnj7VN0Mb/92j7RcWYEPQa8Jb8j8LNCWaaBjhDu2OX8RbpTRb5
	9G/iQgY+s+Ug6c8AxD7y8U9/4EKGHYP4IS6ZJX0vEogIFFLST485i33m41TVCGINieDqEUk5wY4B+
	KmJHQUd3IATvah3D4xAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Qd-000000014rY-0XN1;
	Tue, 03 Nov 2026 04:47:23 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Qa-000000014p9-3HCh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:47:22 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-369f33df08eso7312230eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681240; x=1794286040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
        b=grg2mGokxkweRZHI83VYzg4YdY0g4E0PKNZk8dAUUnETvZxUr/QM+j5dWGEX93XGr+
         WrhOhG6jR8wj9btRndhKmSrNjE5nQEIzIpDlL9JABef4Ewm16ItPd85JC2+fXkcYe3xP
         e+pUrJTApNxFIEyjuCTUsCjI5T0xFWUCmLylcUd2BOCxRYkiEmMPFELS55fKKErJnIMb
         9jqi1Z2VorLlVmbdD9rU3WJ2dwb5lcmpLzp4rqJU8bsf2RuGLfaXdMp675g/4XaOx80J
         OAmYMzyQbU0uqDeRxJMgWjd3Ce8qrsvflzZECVY5m96qXBwiZZFDlDW360VRmWa77+jF
         XF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681240; x=1794286040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
        b=nmEoxuvUpQYAQM1EW4s5s11WKcAdpF9MunBuzLMDstafE1uG50FhMkC+dAWt/ty8fF
         LoY6MjYbCNwb8XKS0CIc6tvjmF8kStGtJCY6vEnrUXNl9MuWPi05/LntwlQXpN98sXvy
         /Cb8bPd3+44ZSGqf4zURBYgw0vdJZ7nD3wK2qxMva2aFqdVnRXxmTWs1n5Ii7htfNHaE
         Y1tTQvRAdF7L6oUUqywY9AoqDdwciS0Wu8Hr5we9tnUkEtJfUEE2jqejDPfyccKy+I0d
         2aO76OBM3YepMJMch9nDf/0Dd1U/EmCqLT6Vka2aGUzRMKi0EHt0M6jBmFUu/3KtuuFe
         0Mjw==
X-Forwarded-Encrypted: i=1; AKwUvByKwddUUzCVONHvSRLh4eVUyvXIcNNNsQf1KUCPT8xVVKl9YoquFME2viMXtyzNI5fMc7v6+harht8kR+l0x4qo@lists.infradead.org
X-Gm-Message-State: APuU4Z+wTeXKEyQGZJ2L0CSIe3LIGW3ABHGs1a/wrwWkCBAW9wc2B0r3
	hfRA0/AStDapTjHG4sww5JPIQIziPUCcHrNZaoD8pCeS7ZcIov8KUyfc
X-Gm-Gg: AYBFou3CGYvIcLyTqDlbAeQQ2nNAzuTTYCHJrIbBiLURUZJ9hAahRZYx0CS6kCNLXK8
	46cef4v4cH+uDtv4Dj+aJRpNVLBx5C55zO8Di1aeuaO6tOQfUd6MR4kiwb9jw2ha25MA+TLRMih
	/0gtL6RBoZvO7zO/JJ0oCufjzaaj6sDWviO/3RPrFTP4sP5FsXkC+Ppi+s0U38qECqOzKKcLPQe
	PWDD8Uq9ef/xUj6mY6jex5z4mXqwznxydU+FBASdCIXtnjBMPt7CmOw1PXykfk0hXN7n90rKuj/
	eE+hhnLeQHxR82m1JgycEgaz7LE4fNXgXzuwltKkD6BnT4B+cmANCFvSlGMJ1EDNaPEu81TcrjK
	oq78OlEkWK3/mFPTfYHpBvGPoPImIT53TGch2ksubRO9X4M2FlPIIu4HsHhkkHH6nI7alL1DRSL
	uyS8g9/cTVzHAGBc++WC3CQMQzcpE0eqcgZluIAMlL5CZU3X/pWmIHOAAdx7nop/+g23ILn8o5v
	8tbsO44Axtd99haOvLHMj8/RHRRti6FOQWewPsO/Fi9Dg1Qa+5LDPkMjGF+9piP9a2ceqEPLQqL
	UU1Y26klMBN/G3pJidkea2lm75m5yhNDpZSzfZ0Mi170aQtv8YoXlOPFSIxii5qi2FUGGZlVAIk
	BejD56AdaKrJRcE7Ih+Tzmh4dYi5K1ytJXaLXOQ==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr19587443eec.29.1793681239614;
        Mon, 02 Nov 2026 20:47:19 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:18 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: apple_z2 - set default resolution before parsing properties
Date: Mon,  2 Nov 2026 20:47:07 -0800
Message-ID: <20261103044708.2461481-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204720_848302_F92E6277 
X-CRM114-Status: GOOD (  12.81  )
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

apple_z2_probe() currently sets the default 100 units/mm resolution on
ABS_MT_POSITION_X and ABS_MT_POSITION_Y after calling
touchscreen_parse_properties(). This unconditionally overwrites any axis
resolution calculated by touchscreen_parse_properties() from
touchscreen-x-mm and touchscreen-y-mm device properties.

Set the default resolution before calling touchscreen_parse_properties()
so the default resolution remains in place when physical dimensions are
omitted, while allowing touchscreen-x-mm and touchscreen-y-mm to
override it when present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/apple_z2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 271ababf0ad5..e7863f8f1d5a 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -397,9 +397,9 @@ static int apple_z2_probe(struct spi_device *spi)
 	/* Allocate the axes before setting from DT */
 	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
-	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
 	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
 	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
+	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
 	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
-- 
2.56.0.385.gac671c819a-goog


