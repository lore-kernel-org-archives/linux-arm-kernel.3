Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9A606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=igG1RObW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+tpsMCi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=; b=igG1RObWPPA1SB
	Z6thWNGC3lDyrm8c3GMXsHO9ZLiEPT8RTzI8HjE9hb/s02pHdOKAMOKQjHn2d2o9NnIviSTclDVIq
	QfB7mdeJSK9yCGqWjEGzMNQ97NoNqaPzh4OYgNZ56WLz1vLraNwJpW9s2jcJwXHwO7P05RLjhGT7I
	4MT9ucQ5X5/CpBIHPU/WMJrAyMMyLDkAdtc7c5dfhrlVmluDU0gZOuZ0UGHPgTc1HYLNtlYWE9yLm
	eTbArQ8gtM5srCEJH83EVSTsf05sPWOt8YoVNnf4ve9jgTChShGm/VMfmO9Ssb5CPVVuAaHgyoqE+
	ZyrBSSSWTpCVTeWYveqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkPi-00000005Q3z-3UQ5;
	Tue, 27 Oct 2026 16:52:42 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkPg-00000005Q3A-0vt0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:52:41 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67a6cc9acbeso46054d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119958; x=1793724758; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=z+tpsMCidc9SrkA/YGiMRgfJWjcqesmvmUCjwLJU3OjIM+MTEby421UqOUXzIB3f1b
         CQP0ys20Y96Ly/D3Rnqlud4XJgaTr+wrYfuLNLGm63B1tRvBEWZ0rDcWy+nIJFQ/4T5R
         B1itN+vPTZmPXaM+0PaDhKgmZxIqeyW8vmbJ7r1B+GPWjEs72HvpbIqYXjyVUX6RMuVq
         JKhVeNwFT9jpX3fUpLEJHH5OzBMizgtaMewvkE6vnuy6zg6WL33Prmthdn9UOgpX4Jvw
         mcEVVtjIHELwlgYB3ETD/xeNOOsw6rVafS3CQxXOaexKL+aYB5zO2/GdNCFEttnvSPw+
         zZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119958; x=1793724758;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=2QHBUqfmsphVkVqbI4oI5JiftmPND3MHS/oPj+pBY49UcUcAPRbphrqdElO9Ivi8Gg
         rtM4oE2aTQu76qZ5AVTtleWncFeOsLhf/cfpiT3UGYGueShKIrxSUansUj3AcU4ws1Aj
         gi17XBjvo34Ok24ecYi3VkGzRYSie5rbU/BOwqJAyo7QErbW6nJnLxtLezjM8trgiN2x
         Lbm7FOdG7PpQSJte6gnttdHa1Dy4Dl+D3PfdlRZzHn9id2Delk5txI7WF3UphTP2HQ5u
         wsAWuLvMr7JTnjK+OeFksjAOL+lRDP3RhnbPodN33wLzg9NVGXmkDwiUVKij1jQ8D2wP
         ya8w==
X-Forwarded-Encrypted: i=1; AKwUvBwDzp8anjhrKF+21UGh3xOTJQb6KprZZ5GJsJB77jLm5r7TkCDLWFRDjlkrNCF0vZWGFaq3sLvFiDsaiekTpzF6@lists.infradead.org
X-Gm-Message-State: AFq9FYLBaLqbgjdAdXc8WHKv+5rhS4izeHAk9ssDJQYE+7np2Zmooh7a
	7oUShme46k9g8EOWLuJ3s5syZPHd2+TJEk+iDHAgKQNbJfAOve+uZp75
X-Gm-Gg: AYBFou33vhQSoYPDPDwsEMMkzPRw4bHZ9QliJ3Jxu5UDymtauryaODdsVZy1V2mkDUG
	heC5ShGfrgJYt1hiRy2p83pyv25PbI4V8unx1HQO+wce0fWiZ5wSFkcLBObOR56HRqQCbZQ+N2J
	qwZaFeT/q8314AHcDAg9iMcDutc+KYbCDXC0jf+ZtasjQpWws3w+7Xes4Z8yBrJWjWS2Q/jb508
	WYglAK5mbxyWAbJoyIPsdUDqA6w1D79izE+cCCv9Qi/f3d6cPoAXYxqg1vtLlogl0C+9N5XWeWR
	/WDOXzk47/PHMTRKnvoM8wCagnCMwVWRx+nqbh5xDbj53/LRZ3REXPJ1sMMziJaiLzvPlfNOoUU
	Yd0YP4DHHxJ5KrsrO307v0QVtoKAjCIHYpzhv2TrIMW+wvKLXWeY5nx0gpLtxDOB7JAawsKg6JV
	YJd/97JR09FfAPxO5ab2MoBbuthX6m3OiJKR+1kReHos/RyJX40HNlMjWJ/fv329E0zRnAxv7yK
	ojNP4m5gtoHAORwJDxopIyjsZuYtjnp9p2w7zNqatiAJvGXsPSaUdo0gzkbmdfj4hqY2OO5J1QZ
	gF9uJNhGO71v28AqCwje1JiYFvjcY2Nb9p0IVf4Q24lIvtowi6u2Rpj4wJmiruNMfH624jLu4wf
	Hll4BjiMtEdzM
X-Received: by 2002:a53:e7d0:0:b0:677:c8af:d149 with SMTP id 956f58d0204a3-67a7bd1804fmr61705d50.74.1793119958354;
        Tue, 27 Oct 2026 09:52:38 -0700 (PDT)
Received: from localhost (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a080d4csm425545d50.4.2026.10.27.09.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:52:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 11:52:34 -0500
Message-Id: <DMFRZ3B3A6CH.P7SKUZSQR23T@gmail.com>
Subject: Re: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event
 enable helpers
Cc: <chrome-platform@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Marco Elver"
 <elver@google.com>, "Bart Van Assche" <bvanassche@acm.org>
To: "Rupesh Majhi" <zoone.rupert@gmail.com>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Andy Shevchenko" <andy@kernel.org>, "Benson
 Leung" <bleung@chromium.org>, "David Lechner" <dlechner@baylibre.com>,
 "Guenter Roeck" <groeck@chromium.org>, "Jagath Jog J"
 <jagathjog1996@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jinseob Kim" <kimjinseob88@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Remi Buisson"
 <remi.buisson@tdk.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-9-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-9-zoone.rupert@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_095240_270922_A2CF513C 
X-CRM114-Status: GOOD (  13.20  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Oct 27, 2026 at 7:49 AM EST, Rupesh Majhi wrote:
> veml6031x00_event_enable() and veml6031x00_event_disable() call
> veml6031x00_set_interrupt(), which needs irq_lock held. Their only
> caller holds it, so mark both __must_hold(&data->irq_lock).
>
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
>
>  drivers/iio/light/veml6031x00.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index f6308498e422..476ac3717f8e 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
> @@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_d=
ev *iio,
>  }
>
>  static int veml6031x00_event_enable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;
> @@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x0=
0_data *data)
>  }
>
>  static int veml6031x00_event_disable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;

Thanks!

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

