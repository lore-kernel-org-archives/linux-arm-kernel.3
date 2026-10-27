Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C981606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BVpYzKVG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYKvJhmK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=; b=BVpYzKVG2MIUF+nxtgJ2FVCOsi
	2efV+aXRmPBlzGq30wHuSmeoQm5rEPtVUYpRpHe2AlHU0rZcUYRjlF+9OexbyQRA5piIkiAB7U4M0
	EdzXPOnV7PF2DgEbgYKRcNg1evKNkpMMF3kA9MDN+IQDmnP5UorBel4ezu7dIBEB+HbD5AAp9snvM
	hUgvit9NiqvAD2T34bLdbi9GAjpK1KCNwwBT+2G50Oox4pb0vGH1cs0odSuP/c744HtW/s02f3KTN
	+LodbQTIxoDZHADknzE9LiDZ6orIeuyhKaQlV/eUZffrTQ3jreuWfhS1GxHCpcQQwOaXOcQm3PquV
	3tZKrIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLinm-000000057jt-0MwF;
	Tue, 27 Oct 2026 15:09:26 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLinh-000000057iG-2TJn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:09:23 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3550c917fd3so6296279eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 08:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113760; cv=none;
        d=google.com; s=arc-20260327;
        b=pPpgDVYXwfXfbD6aq8p7SSgZ0NT/5ZwAA8eXnS9mJIrXyjhyJXrK5xNo5Pmud1c3aX
         WMjgzPbbSXEQ8UWYXS+JCS9Sq9QwdcmCEDcM5DblDl+B/6h7vvSeBtHDSaVM0MTC5DHD
         67r3rYhl46JHFGTX1szdFeVBdHIA0rmaK24FYkvb9tMY3WZguBzoh+vrJ897L9jSAonn
         LMI8IPgSXk5fs62al1SrZ8l0UVGWyzwlx/AY3HRfLTEONctIJu3sB1ahXWnhclizx3uK
         DQvpR5mVzZTdIYT8oYtQ0Ugw+nT2O/Bb2LQVGH9QbwhZWdWU4cQuAqF1qqYyCT5mnPvy
         Kedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        fh=6WPTyjYM/wMX0Y8c9ylxKdgOckturKIipgLw7JF35wM=;
        b=PZZHGt+4Jg9sPfPxqWCn2i78ply/GkR0CuANOfYqk0STJGmSgQ+JPLR30G1SnUG/ja
         zZ+rRzscPk2as1Aw/9K4pc+8RAGq+ZC3sXGvS7nQ7bdaUkFhiByHN/SMathemscaAUvC
         dygnMoKfLfHZMvfXljplSVMOEgFWA1+abH4LYmwQHDfMGHATW9DGGbM6CZFzLpzMPOSg
         e8UBCQsVoxctsj8tsMB8C19Rk2EPLGTlLWSP3QTk7fIlwpoTFEnRhQOuPR/BdgtjO03l
         fkGmYC6UM616UcFPJUIADnoNkO0EPub/EBvlfEt8MNfrmCMIMw2z/CKVzbahaDDRuMYa
         yIsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113760; x=1793718560; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=nYKvJhmK1+cdzxvUTTjCqgegflkqy6MB06Ae13qZdUb24xUa0RQfOryqlOZCKp3hud
         BhBKOCcK/S1dSyktKKKb0YihmENCJcYI/QMXEfSyOCX/tosSnVmhJ/NjUN3rIzvvH4cm
         QPwr6jBRz+sHtjIboCiea5Yx156rEGSBuBj153Vf5KZyxyYAxCsnKFLRcYtt0hmRWKkW
         eil5upYinof5tMqt3A7776XcxyoASU6nIkNSjuoId+j0OyA732LyWPV/2rlpiOpUk+8/
         FX+s8x2Gez7XyQVFwAOhmSciOxwuPANizHxqPi6hQDcwjJKtQaWbPP0FUK+SqqODnKfR
         6UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113760; x=1793718560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=u5FznAnXzpsU/4mk/q04ADbPnFZMssmeMebtbXgDFFBmIo0v1ZgfUrdd90gtQsct10
         vZ8b0/p+v03w87LniS5V+mpw2xDjOjnUivUhXMUMIgwaH0LBn2aHvwRi7g8kx+PspJKB
         HYSpYUJ8RwnIMZ6030vjMI7e5JAUypEcF+w4KBa5wb7Y/99OzEnI31v52Dr1KORwffsj
         f2tDwvb44MsuYPXxLwEPV1HdjaTraCeA3gbBobS+Vo2zk+5RhTaiFI05hZ6MKyzyYz3L
         wUzBXwBtaQmne5vXjPQ9/W1oAmzc8XEOIOQL1SFhjSwrZqZy9hQvmF5ap9Y1vZzbjz6s
         URhA==
X-Forwarded-Encrypted: i=1; AKwUvBwrJTxVi1ahcwGGJP/Nt8PxaeBTPy685kq0l4yo8CxsMgv8lrULLoZk8CTUzEbvFb++hxUnc62BgusGpWyaDnvn@lists.infradead.org
X-Gm-Message-State: AFq9FYLI0IJlo+877vh4n73vtNm2ezvFdUkPCCFNeZrMFVksjdvomVJs
	8szulZEYan2/o3jFaOt6oubKoj9CM+czsZKpO7EjTix9v4UHBLnuM8dxkJw0s65q5Pdq0rd9yk5
	fMpZoEBdmsY5uUEUKs5nlVIfdYLefOkA=
X-Gm-Gg: AYBFou01IGHWWeD3/euApw4DHAgq9j5vXS8KLWOgfNBaGH+7T+jy1AKrKTwxzFoRoP1
	99tgHhff/BckqyLqeywkpxNp6zY0uoyIkrecFnEpVgKXbQb9q5KUkzRdOcWz/BfkfJcg6VjV+d7
	iddVki57qrb1dNhak36M7KwwFG5B/vrA6NLztWBd0cHzZdpTvb7FJoEYOaqZofTK2RC9FvbgHCZ
	93zInANIhk8hMOy7VnNTdUmuYB4ArTd7xSwIu4L6MK+/sYQdZbx59T3fxd2C4P9D7PKBxQl/t2q
	D3JEUYwodUXh6Kzq89Z1iwj84Tp5RqXPHLiCsHNAMlze1wPENxc5caNxeMU1gqPYPGd2wnqWoFS
	GaqhaXMrSTAm7rBXyUV9r6NMSJOjg8zemiJl76eHU0hLyQDjlFr7OXUFoPqQ5++uysd5ASV+kOp
	d0YOXRzkeQ1wpnQcCim9zXwZNpZOwQEf/A1MRzwepHgHGbfvoGH5w5+Q==
X-Received: by 2002:a05:7300:e024:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a158f021emr2604437eec.6.1793113760079; Tue, 27 Oct 2026
 08:09:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261027124954.110697-10-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-10-zoone.rupert@gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 28 Oct 2026 00:09:08 +0900
X-Gm-Features: AclHuK8H6vSFxFswuEXecNS4oxgF2wzBLnY17J5ZgNNydJKg-55kp3rBfAwA1Kg
Message-ID: <CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>, 
	Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_080921_628347_491682F1 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I independently build-tested the full v4 series (1/9 through 9/9) on
top of jic23/iio.git testing at 7d80b4b383bc, using Clang 24.0.0git
with context analysis enabled and W=1.

Results:

  - x86_64 OSF: 5/5 translation units built, 0 warnings/errors.

  - ARM64 OSF: 5/5 translation units built, 0 warnings/errors.

  - x86_64 allmodconfig-based IIO: 723/723 selected translation units
built, 0 warnings/errors.

As a control, enabling context analysis with 9/9 alone reproduced 256
warnings and 2 errors. Applying the complete series eliminated these
diagnostics, including an OSF warning resolved by the conditional mode
claim annotation in 2/9.

Testing covered compilation and static context analysis only. Final
module linking, module loading and runtime/hardware testing were not
performed.

Tested-by: Jinseob Kim kimjinseob88@gmail.com

