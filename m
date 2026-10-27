Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB852606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lxajMeHZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pmJVkPvG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=; b=lxajMeHZx4sQNh
	DGGHFy9qlOVmQQYjUzrY1S9mr2g22onC1XZxkZTUyTb8rSwE0W+/kx8d7f5ReooR2HQk1tpzHGEVl
	U9Q75chDQyPr4Qaq7bUqiWZOFjg2dIQR/7hNgUDL3odiycZb89YsoXXX0Caxis8KtBqBf2ulNS94w
	ULCo4dQgjWgqtLlOLYNUeQT3NtYI8l0lTNJ0VTyf++/rWCRQyyt83GPx/wbUfMa3wmbqZhsuzNwY7
	zo1CdDpeGV7qsAOuh3fEGd6Vs2WqHjW5gFjjxO1vQW/ACpJfCg765g+3nWtYoc61CTn7MdRMsxwc4
	wKJWurNm0063VBNEeSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdC-00000004hYf-0Yc7;
	Tue, 27 Oct 2026 12:50:22 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd1-00000004hME-1IMf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:12 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso1237658e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105409; x=1793710209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=pmJVkPvGS3nLZScrjvog6mousuDpMDTIv1uvc72hDRpx6GiSPxInwd+GvdkWKWKGqk
         wqRSgRn+QR8npyKadHLCqMunwxkpqq6ZQcghhXpQw2t0Cj3gqm6DcxNtOOUorYBVZTR2
         5pEMBhyVSEEuq22Dm14VZ2h+kElCkDKlUvggIUhzjswdjwVhtHkRuI2hcYy1kkbqfEd2
         0PvHKpYjX0iaPl5DvUX1RSuf2XvtTAxdE2ZjhEG74+8x9Vvp+zXhJVZvRiU9rB4ao6UY
         Gb/F/ESn7RqLh+LiIagJFOh7kXgdawY5fic8/p5R0z7Sp1UprsOljuI6MhVeEg9OAfn3
         UEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105409; x=1793710209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=e6Ftj4nzziv0WMhXNyGox0QyAdEYRGUgDB4eTJdANfPJpomlZV5XgMQ/MTfO22GiEu
         KciLA0s7d0LOQm5xea3M34M1Z87UIJ6Cg9gcBtwUR6QyKJHSAWyARheZOestZHB+iPkW
         5eNe+iUMcP2CCw81S3lFz86ho6fcpVyzrpC4wKh3g2Y/ksB6PagbIboKaYwrMeBvssgw
         QWhUQx8yUcir4XVNsCLeYMVkffUNP5/j/XRgXrNJICIkYwejyF+RxrAmVSMcLcZs0eq3
         5qABYaSo/0+fvjvYCRlX5fIkdGHDRbUJEFK9uSPn7PfgCJkTMpCyNrOz7H0KZaKBcYuo
         Oo6Q==
X-Forwarded-Encrypted: i=1; AKwUvBybMthD82ZjJ71+0ardGO1R2zmibaagzb/lGeJIWwoKmfazGOpPyqLiZD8Lbu+bGJ8H8pJmhuDIBrxW0/tlamV0@lists.infradead.org
X-Gm-Message-State: AFq9FYL+JEd6bX63xqv40qH6EGwplUoyAvtA2w12jEP+FpssfbcTm+8D
	8bCO5GLHOW1Z7W3fY1LXwybff2JIjIWy63tYQoyP/Z07oYp+8KqJNgLh
X-Gm-Gg: AYBFou3tkcSgMTo0qoBCl3GM076Ivc9PaesYA3reTY++DKfgjtVwpHP/RSZ2yTT30bP
	2FltUEShFfcAbnCeLd9jDQcwMb5GPJaPvoYXvA3/uFkuU6mdpd2gUghkASDbbmF8qBk4oztiH5e
	2dx97u/wi1E+izc93M7IolPaRvUtAUMSyPuj5BnQUacEEEDCxJA/sRG3/UvaY9OhB/Zhzv25r3j
	Q6j1V5L/rn4PAAEPXeo7qLU57Bi72dwCyogrKZs0G4lUnXCjtTP9iSynGFyTls7MkUsgs+AEW/3
	3dLUXDncKL7o4So2HjsUnqik569wTEwHxoIB0CVK2sgjXdR6mWsPDizY/yA+dHLC3dTD7RZ6k9p
	qbfZgBY2fhNN9Log6oFHlW/ZGvd0H97LnHCBJuWHTrC7/aVYAGSgzZWp9iJeA/mV1v6tt5VuKnX
	N0NmGgaLT03bZTqgdGvZARoUnRKxK+W/6rnUAYVoFNKV+RMbKPhOhnb3UX1W8gX+SjqCGs7l+6I
	j5zvzBvSfL92DRYZ4J7n8EcaWyoa7muV4wBguTAUXP9sI2J3kpbE3GdFXLtOZ+OMhFkuCKh7fhW
	6ZN4SgImX/whz+L+fy1g/Y0B6SS+Mk0YG8TEXdpFeP7f9ce34C19BWEQRESwvEwoBVvz88KWEdL
	0IZg6BsEivg==
X-Received: by 2002:a05:6512:3981:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5bfc618c82bmr832927e87.45.1793105408719;
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
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
Subject: [PATCH v4 6/9] iio: buffer-dma: annotate the queue lock helpers
Date: Tue, 27 Oct 2026 14:49:51 +0200
Message-ID: <20261027124954.110697-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055011_365827_ABBEFBEA 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

iio_dma_buffer_lock_queue() and iio_dma_buffer_unlock_queue() take and
release the queue lock for the core. Annotate them with that lock so
context analysis checks them.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 1daac23087a7..b42b70e9b06d 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -763,6 +763,7 @@ struct device *iio_dma_buffer_get_dma_dev(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_get_dma_dev, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+	__acquires(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
@@ -771,6 +772,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+	__releases(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
-- 
2.43.0


