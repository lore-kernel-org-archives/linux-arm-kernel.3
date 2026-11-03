Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB816071BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bz6Mp+Ef;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQ2uN+nf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=; b=bz6Mp+EfStGEdh
	aINuufzzdB1Y8roWskr96v+cqqFFS/7nrc54GcI1l1D2s/TmJ70G8Lsoi3rBaXC0IcgXJWOn+2T7V
	gfKwwcSvsy3PbrbCvwHUqS/NjlCxltZQRCUe2q6+Y4D55JjduiLin90v++HN74xOnLg7uSofvr0ra
	ZcuwyM17I+8oDV0DCVo56cSnzHPuYvtU8LbkNrCxLzo5g+s8/AjMVgVbuLWqNOkOQuLIILMABai+g
	s/uGPm7kW6ewDRdSXf0U3BG5EZCmatfakFn9Je/0NKU2Q/E3P2N0uD1ksNBeTO+JCwtwsLYAwXVDe
	5TxsVyNVvU+AwC/3ayUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF75-00000002fuf-0RwE;
	Tue, 03 Nov 2026 14:03:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF72-00000002ftm-43sU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:03:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2587030f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714623; cv=none;
        d=google.com; s=arc-20260327;
        b=pUsFOTGuQ9RgCT4Oo8KV3gCcfSSgBDjaubEwhD/YefaQmpjdVyG6/KxOXV3N4gEraX
         jYB+45lWkE43rZUxXgYBDCa4cBRMMoMOFG2XoPciHvfWa1reYykjrPfukXmHG4KYgw/a
         MzXntfbRlDjekxhtf5x9klFfI+L4VsNu9SsVXGuizEyfk/pzK58C+voaPnmbwXjLSnRP
         1xZnreqfqrogrWjMRIPpoqj/gjGZYZKosjsAZzNkncXfS/nRF2OZbWVqIs39OCDu/BXT
         4SzAibVyS9FVJY81R9pqMnnSaj0DV7jxFe6elsX6O4ntXrBUoy5lDtlJRHpn6sS7j/DH
         AqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        fh=Mg0pXRiCoempP6jWsb5Vc+nBXsKPzoaQMZXa2N6qUYo=;
        b=qa8nOqTQez5YxxrzqvftUwhioqJyJE3jUnJzQS7bUdc1lQzpuwl0wdzfmuJMx7ve3M
         XdXClWD4/7U4T4a0WOarI7tGO3xz7lKdg/vBuX3m0rBTHtApgi7za5t2+VEToPLNs6VA
         l63O5qncLkd+orwOa8PzF8x3aXezQ+vGFt9WsEgGYJvQtBs3/ZTFr65BmXflXheMEbVQ
         pnKtTbSTA9ctzZjz+kqJ8gygRDZ6hx0C9gULAG5kMBV2lNsq1rd3a/WW/6pZEwISKOD+
         xi/SGFbs6YVCYYYIE8BGFeXwAbvcMoE5S6dfMGWHIb427YnC6su14M4TuaZi6FD0h+g6
         ezCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714623; x=1794319423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=XQ2uN+nfPuksmNwCb64b8miBR84sQfmVGoHVZhT8Oj3fQbtxFUUyyNfB72ixkFo9qT
         QYVOgKjul8ngvjAS4idKRhYu2jEqsv1hgyL69YAO6gG2mFs54LPGa5O6Q6lxlDyGyWya
         uPowJPgAYWTn4cn9kRS5sKlTB489glH0zLCUTQUAWFdAuoed7D1/ShZWO6cBCoPMUv1z
         6nLKKINVky3jZo0QmZnHHVc6VWS5O9F86y3jyJhtn+7ZP6frhhSo3LrQWQrRE3zFoVAo
         NhaRUwlrtRqkPkdg6N3khyWYDnitBJ/DdBFcJwldXLfUvQi+Q76qjuHTZmu6nzIWHjO+
         muWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714623; x=1794319423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=WXt/AdOawCp7DA9E2JljFd61kLNmEURo/gZ9ZnklMp9IesIrX77NV6RccGMatG0VDW
         OlOMvq3xaXqFiesb6EvhJAA5yXYDLtSF95X9jpE22AzwpJ0bKk7RQ9m+Id6/jy+B/PIY
         AOA7IcdnL0qm4M/56W5nTqHDEhaWl1hKRDyyn9gpy6CjKBG1R3TqpekYjBk2noREfe4C
         TOYkmR3cEmEv2hZMcxLjtZHGQb0397e4kXimwApcnnFhy460+suZ80NgAhoQUPPvggQI
         GUoWcMECKQbYnt8VfcrPMt0D7SQtOcCCAMzMVqnAG3caAG8FPRMBsobmCPZbE+fTRxyH
         bCEw==
X-Forwarded-Encrypted: i=1; AKwUvBwLC5k/+nUziNLVn+qusNtiZNGhpJ+M+ID53UkUwXmttSE1zmwzUnFaD9GFcxEUyO62g9MHpW4lWr0NWeo0XZez@lists.infradead.org
X-Gm-Message-State: APuU4Z/q9jh6Xn6/USI2W1t6YvBoqQL0DCPANV71ZNQTFnDCY7l8E9+7
	oCNEz0A+wNpnFkuTzHc0e5tu10EMOtn/pe+Y7xyev1y2prb3EU+C6uO05QesTTODIWRlHgmGhcT
	xeHiTUhjbjQaef/Ox9lA+LiJRIZSWPvc=
X-Gm-Gg: AYBFou26qjcdV62UO7wAvGk+k9sUHrInUYCQ41q7fAsEtykvbGd5NM5mlfZbynWJElF
	1d4mSan2dR+W35Q2Q7BQxhNUSIH8rkm/NiksKLIbEhjARgR9e09umF7QrnNtVLcFlZMmprhRy/g
	SQVDC6ZNAjhX1vqu4IWc2Fl7+RkZlbLbsZ7ZEuQWuQK2+qavyzyqiJiPdmtQtbcOq99RHp4fqaf
	wswsYtwDE0Ux4UPdwuburFYe6npVB41W0O2upWD7HOKrzHGgkS8qjrObZfzZEHHjXo3NEEd+D2E
	EMhiplRGI8Jwi2P1tUqhZuFCzVMyEtA/OkJG4ESeLMIzP1ZSmdpbe9sSwLkKHlkIcFlSr4eplmS
	MWgSFGMhIZhQHgHkHikWhrz9wk/Y752zIvitBgm52R2DB8ynEixGzJMzkQg8CQQ1kM5F42RSRix
	ionPeEE05Xl0UJg6dXTmm6Q8K+BdKkXzDsKiAO5dmCybOYe4rLEsx5O9c6
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id
 5b1f17b1804b1-4ac1765d977mr282488195e9.21.1793714622717; Tue, 03 Nov 2026
 06:03:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK9lTBNUFEhnmVUe-0bw9b56qg4kVZy5zFZ6xKayAE9tcP58fndIr_XiG0M
Message-ID: <CA+V-a8t0bf_8hc1vd7c+OXBQfgBjp6EJjDALm8+myVYRNzy-Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] iio: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Stepan Ionichev <sozdayvek@gmail.com>, 
	Felix Gu <ustc.gu@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Shuvam Pandey <shuvampandey1@gmail.com>, Piyush Patle <piyushpatle228@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore <cheick.traore-ext@st.com>, 
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, 
	Kees Cook <kees+treewide@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/T2H / RZ/N2H A/D DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_060345_047308_EE32A434 
X-CRM114-Status: GOOD (  16.41  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 8:55=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c                 | 3 +--
>  drivers/iio/adc/nxp-sar-adc.c                      | 3 +--
>  drivers/iio/adc/rzt2h_adc.c                        | 3 +--
For the T2H changes,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  drivers/iio/adc/stm32-adc.c                        | 3 +--
>  drivers/iio/adc/stm32-dfsdm-adc.c                  | 3 +--
>  drivers/iio/adc/ti_am335x_adc.c                    | 3 +--
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 3 +--
>  7 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 78081cbfde5e8..d479c9bc9b3e8 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -1240,8 +1240,7 @@ static int at91_adc_dma_start(struct iio_dev *indio=
_dev)
>                 return -EBUSY;
>         }
>
> -       desc->callback =3D at91_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, at91_dma_buffer_done, NULL, ind=
io_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/nxp-sar-adc.c b/drivers/iio/adc/nxp-sar-adc.=
c
> index 2f716a2f97b80..82d8d921b0293 100644
> --- a/drivers/iio/adc/nxp-sar-adc.c
> +++ b/drivers/iio/adc/nxp-sar-adc.c
> @@ -696,8 +696,7 @@ static int nxp_sar_adc_start_cyclic_dma(struct iio_de=
v *indio_dev)
>         if (!desc)
>                 return -EINVAL;
>
> -       desc->callback =3D nxp_sar_adc_dma_cb;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, nxp_sar_adc_dma_cb, NULL, indio=
_dev);
>         info->cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(info->cookie);
>         if (ret) {
> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 8ba7b0fde8a19..3e52b7d660dd3 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
> @@ -394,8 +394,7 @@ static int rzt2h_adc_start_dma(struct iio_dev *indio_=
dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D rzt2h_adc_dma_callback;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, rzt2h_adc_dma_callback, NULL, i=
ndio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b5..fa2a781e37777 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1901,8 +1901,7 @@ static int stm32_adc_dma_start(struct iio_dev *indi=
o_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_adc_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_adc_dma_buffer_done, NULL=
, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-df=
sdm-adc.c
> index 674767da3ac37..f0239f5f30afe 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1006,8 +1006,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev=
 *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_dfsdm_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_dfsdm_dma_buffer_done, NU=
LL, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_=
adc.c
> index e53c839e87ef3..230f1c990317a 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -259,8 +259,7 @@ static int tiadc_start_dma(struct iio_dev *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D tiadc_dma_rx_complete;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, tiadc_dma_rx_complete, NULL, in=
dio_dev);
>
>         dma->cookie =3D dmaengine_submit(desc);
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers=
/iio/buffer/industrialio-buffer-dmaengine.c
> index b9f8b5b3aa6b6..7ecb9d875b8e8 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -160,8 +160,7 @@ static int iio_dmaengine_buffer_submit_block(struct i=
io_dma_buffer_queue *queue,
>                 return -ENOMEM;
>
>         if (!block->cyclic) {
> -               desc->callback_result =3D iio_dmaengine_buffer_block_done=
;
> -               desc->callback_param =3D block;
> +               dmaengine_desc_set_callback(desc, NULL, iio_dmaengine_buf=
fer_block_done, block);
>         }
>
>         cookie =3D dmaengine_submit(desc);
> --
> 2.43.0
>
>

