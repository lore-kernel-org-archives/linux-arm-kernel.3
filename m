Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A76606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwSgBuX5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUPf5e6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=; b=HwSgBuX5JCU80l
	ZeNiwd3RuVYJG0nddGQfG3xuQVwf2kHCQPvM2l3nddf3gLpx4bWE7E4Mc1GEOC+p58d+hNTriccdJ
	wbeqK0rMQPsUoZpeOzV0QXyPizdzkNGhBKhZvkUs/cC+PHfJUXoqkSG/clRw0tvqVtAt9wNcOrcnt
	1fPyoV5hdxKu5xy6h4hS9j3onxalt/dYMkZ8Xm0DkCoBwi/aS5VUcg9ltDxq0/+46z53n6jvoy0wh
	0+y2t8JK09ylA4eZ0rzyrcfDnwDueNWRp873iCflU8rChl5PDCrKAU7rPTDgThAC5OBIvQseM1Qyg
	TWF76v8NgsA4S/j5GPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTGu-0000000E73g-2abQ;
	Sun, 01 Nov 2026 10:58:44 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTGr-0000000E727-0h5Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 10:58:42 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so20645631fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530719; x=1794135519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=BUPf5e6YY9Z92eedD1jQs3gR8fNSza/Gy4uwKf62Xp8P6kx7nCp1RzB4h1UM8LicI3
         pTGAKV5etUIYMK9Zi1Ccph72Cckr0VNwSLLRFRRyi+I3LPrjTASuioIovgJ+TQ5/ZNxj
         umXWkrqWZrI1pIsxY/qi6zCc07h4s0COmC2DJ+LV7qtSuN0wUCz93xdJ8Ks4gdsje3oM
         LFeBgTmqMflZYL4ELPITZ9CU2VWRTX4KEI9VbWv7+Ir9PnSpPUl8MDF2VMqLbq0ThRIA
         C8X6ImbvX9tTQTsg3lKgfDDgrGvSLdcL53W16hZFDUEaxx9nIQoj+vd+Z5sDW4QhziWc
         nMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530719; x=1794135519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=prwTKHdAbwwtlBGhm9LDTWQbst2ah46R6I7Hhf/MriPrJOhI3lST8zsSAAJRkEwDig
         73TQdSwatzKVfDOa1a0xFKlav3V/IB45whh/g3bYWDIw3OJYzPtZowZSitOucS4J5ugx
         ZgZKxk+f2u3WA3LreyKFPVCQj9971QYrkOF6adbpuDhBb1JKI4bZDVOXrh887SXyo8wU
         2pT/ESmKhGYb8FgqHZsv3Vr/ndbcsuepyG2/5aY/YgbZrK6R5BE9njL2g8RXee2ERFwz
         chkTCbhOYCXg3HIjj/B2pdtRjreGTc2lt6exPH2ZH9K18uv98qk1YKtjWHd0Nv1lNjry
         yzag==
X-Forwarded-Encrypted: i=1; AKwUvBy06LU5Xhfu4fvqa6u4A9gisG/xWhA0PgifhbznKYvJWCGW6u2tVO58RH2GhwMVqNL0DzpEiM9GBNvEaSg7WzOe@lists.infradead.org
X-Gm-Message-State: AFq9FYK9xSs1UPqFCM/lwj9O0STl+PjfUPQ6VkOkQTdNBBxlJlRbqXyt
	BKibZcLF3I8XsGEmRkQkT58I1Ds7gu+NeppvIY1PpYQib5GAaplrk6Lj
X-Gm-Gg: AYBFou3MITfu1qsLOitP1fod8EL6/wdGDeo56hleg6W7gk4rG+4UGN/7e029jNngwTh
	WSdmB0sSyjFEckKcuCV+srBSHGzLwIIe3CKUB2RXlIrspbbzH/HPID6GIEhf5BUBHMDw0yDjASp
	7+diiQ4ZTLihxyZSj73caKh+RLn/3xuFRvfZsQMdIj01gbhI5Kzud7PSIDJPXHFbkftaTXxrXlW
	HQzPEodWrum9ggmqPhzv6dl5FarnMCRp/cvgkHKfS6Uytx4fGrNLKI+kIKYEH4A6dr9M1sw20eN
	XS2ajyoK7N0FdxL+fAVQusbrFMxpu8oaDtU7dkbNhDxMQOs9CSrcG2ostQSpY5yMhlrymcnKh7z
	9Tx97fiylJL9n0k0zpCy3TxERWdssgqRq4f2uQJV2cuJP+755+ytdpmaVic8JySy28ZvcGsTCDw
	6wEszSU52z2MaLMWNCbRN1DHBDzcJdFWTWnW0juoWavqhRmEjf25ttKokCnI0McNoSIxQbmn+Gc
	wQYT75EXf02WkIpd6DkANMC1xGCZOtad5VnBddWzz0aMDHvcv8irQ7AUEap4S5T2MoFRyrXhrJM
	Zt3yT81fsvPqbbt02OdtDS76Ht6KVbA2n9XpOHsWdUIetI1Ui88OodZwrUXLrzjgy81H1Pr64Bz
	nreplKu22cp4858W8Bk0Vm5zwmuWIlHMH2IJpYA==
X-Received: by 2002:a05:651c:1474:b0:3ac:330c:518c with SMTP id 38308e7fff4ca-3acb7a827f8mr15638971fa.19.1793530718404;
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Received: from yantra.. (nekmmqtbv463r5fvgny-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5462:a993:5223:791e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf1b726sm16613131fa.32.2026.11.01.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Sun,  1 Nov 2026 12:58:32 +0200
Message-ID: <20261101105832.55605-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101033018.05897c08@jic23-hlaptop>
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261101033018.05897c08@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_025841_215917_BD147603 
X-CRM114-Status: UNSURE (   8.18  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 03:30:18 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Please take a look and check I didn't mess it up.

Diff is fine. Built drivers/iio with clang 23 allmodconfig: no
warnings, and a dropped unlock is still caught.

Subject line got lost though. It should be "iio: enable context
analysis for all drivers".

CONTEXT_ANALYSIS_dps310.o := y in pressure/Makefile can go now too.
I can send a follow-up.

Jinseob Kim's Tested-by didn't make it in:
https://lore.kernel.org/linux-iio/CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com/

Rupesh

