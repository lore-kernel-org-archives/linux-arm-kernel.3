Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACEE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 03:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rkoVZBon;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYdKK29f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AR/cFk2X1quGruBxo9ZZs//35Ek6zU5kc3K2jTMdIpw=; b=rkoVZBonO/zKfh
	a5X5/cCv5Mh+cVQIxgutAHuVsJNLumuoiXqhHEoIiPCdqBxdp+MoLBXObnmhTtIGs7QqxBB/Ejf63
	4UxvIR2qIuwtYm8/Jwh6f6j5FTxbHknZgW/sDIECepitoRFlSb/Y/pCpg7lvck7gJVu/iplMpzvin
	MzYYXwPofjA7rq7tYNckTDnilhH6DkwopbFtWonlkhNsrhqBA/dwKzg7mYorzYfVmuMzHYNdItRrZ
	q3QNGhqPk9NsTR7TLkjf2Evc4DS30W+Riqm8sETTTQ7SYNTiO+9pHioztv1VE2Njm6BSfCduS14Ty
	egrlIXl25z7zkzXIeQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMH9-0000000Dq7R-16Eo;
	Sun, 01 Nov 2026 03:30:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMH7-0000000Dq7E-0R1w;
	Sun, 01 Nov 2026 03:30:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7E7741E89;
	Sun,  1 Nov 2026 03:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61361F000C1;
	Sun,  1 Nov 2026 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793503827;
	bh=AR/cFk2X1quGruBxo9ZZs//35Ek6zU5kc3K2jTMdIpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BYdKK29fZBd5auKssRy65Wgdz7C4lJYjNJOnxLaJdYgymgiWz9fnEvZ6kUYxQWF8I
	 rNTDRUknq5HzkVcoONNefwuQVmrSdYk2Onu/6HTPJvzgNWiKnVuNXrRWbazAT9Sn95
	 TmUwad7fch1k7M3M39JizGxl87VfJP7f5/HiwaiCWQfQ1fveRDBoBA/c22hfahTTzS
	 k1oPXpH1u+zD2W5udxuV6V+U2yFrPGxZ7Pip4RnAri5Vh5aqZZ0IbSwfOVMYcK+lON
	 fbHk+IvXu63oNGOYgk0k2v1yVqX34Pj85zrg4ddzJNBCcxF2NLAKOS2/q6MdwvTDqn
	 lpzjGBmao8oMg==
Date: Sun, 1 Nov 2026 03:30:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko
 <andy@kernel.org>, Benson Leung <bleung@chromium.org>, David Lechner
 <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, Jagath Jog J
 <jagathjog1996@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jinseob Kim <kimjinseob88@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Remi Buisson
 <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, Bart Van
 Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Message-ID: <20261101033018.05897c08@jic23-hlaptop>
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 14:49:45 +0200
Rupesh Majhi <zoone.rupert@gmail.com> wrote:

> Jonathan asked for the qcom-spmi-adc5-gen3 fix to become the first
> patch of a series that enables context analysis across IIO [1]. This
> is that series.

Nice work.  I'm very happy to see this.  I had a play the other day
with the patches reordered so I could see the reports getting
fixed as I went patch by patch.

Applied with the last patch modified to what Marco Elver suggested.
I added a note to say that I'd modified that from the posted patch.
(pasted below)

Please take a look and check I didn't mess it up.
I kept your sign off as fundamental change was yours even if the
actual diff ends up completely different!

Now on the testing branch of iio.git which I'll rebase on rc1 in
the next few days and push out for linux-next to pick up towards
the end of the week.

Thanks,

Jonathan


=46rom 137ca6e5de3bd4e1056877d0b82214e82143efa7 Mon Sep 17 00:00:00 2001
From: Rupesh Majhi <zoone.rupert@gmail.com>
Date: Sun, 1 Nov 2026 03:24:24 +0000
Subject: [PATCH] All of drivers/iio now builds without context analysis
 warnings, so enable it for drivers/iio.

Modified from posted patch following suggestion from Marco Elver
to limit the necessary change to the top level Makefile.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/Makefile b/drivers/iio/Makefile
index 4e1d930108de..a238c015a70f 100644
--- a/drivers/iio/Makefile
+++ b/drivers/iio/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the industrial I/O core.
 #
+subdir-ccflags-y +=3D $(CFLAGS_CONTEXT_ANALYSIS)
=20
 obj-$(CONFIG_IIO) +=3D industrialio.o
 industrialio-y :=3D industrialio-core.o industrialio-event.o inkern.o
--=20
2.56.0


