Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB12606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHmYRKpo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SZHYdeg7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=; b=NHmYRKpoZCnaZv
	c1OYNN4JStACVTN7jM2NW5Q0SiyR+YcuoluFzpRCAD6kLgaAIxErh01JR1ELmOPoUuQ0D3eGYQQSu
	d+UO3wYy0FwN3ZGpyX7ddPSiL3bqApIaXtCeOKd1nhZPR2FyYodmUzlfoGV1RzddzcxHwDwfNbE5f
	7xQIzEXwLgKc1UeiM6SI6oAcK0fD9X4OL2wrzH+B4fnaGIAxmQZRW/Pe0bPN45Gxam3pcBraqc8dc
	kqb5pxA6HgGiu5FmllsTgcgxeRf+BkTA5zGlMWy9xJa12gQ5ka49LrNSVjBIJxORm6DJ+W6dHSnDl
	5CcGilXzIkfQ+g0bguog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpEg-0000000DqhE-2m2G;
	Thu, 22 Oct 2026 09:37:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpEe-0000000DqgD-0WbY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:37:21 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so779448b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792661839; cv=none;
        d=google.com; s=arc-20260327;
        b=Dcad//IiRlHp6oY+uc2mCCl6iapifkosk9W815LqVAbnMmMwRAmjrRsPO0hK317wuG
         OL/+rJOmvkcF1OsQXreAkdmWGVDr49ldYeF4i8QyRnG12gDwv5GQE9DKvlgwKumrTMqs
         HoU0gGruglbfLSS5IKWaIoSNz/2Q9hhIo7mUBO/Rj8VgJe5P1P8sK0fGgtNbhVW3aHqr
         DKmloWYwEW/yx9Wz15fgKDf8WVooK7ak09d8DkcUV2BzVKbxjCX8BZIcstOIxAf175nR
         MtUNcv7amsZy6PAdlkMYI6s5lb7xxaBaLKNl2OwmbQ/0SkxoaPBJVXFOZea4+QTEQvk1
         4qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        fh=KrUKe1q9TT0bpbxiB0YKluOgGfmSWxMIW/9Wmt3xCo0=;
        b=lc+9z4XPZyOj8ukh6Ip9zz0GhbXZN59GLb+EhXRao9SZFEonlewckwtG4/G2uJMb4u
         FK9LqTgqlcVmpA3smC79aNz5vvM0ro+1GDXcPYxtRsrfU/iQKXy9RqiPfYRPk4Bc8Qdg
         YK02nk41fvXmqqegPmvQEEtzvYorl1PstqgKKYyXv9I2HC4oFBddnnK+Hy0Zzm4T3K/6
         0yROh9hacEwzzSLJs/K9ztAcrcEsz+6Tq4Kqx85nKUPzKgFUBovjfXqDpzhlVTmS1OPV
         H1axjUN/P6od40SfQ/BrUubL4seyuRroF3IWP9sj93T3L3dwyA2xcnePfvkTJO1W0zM8
         W9EA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661839; x=1793266639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=SZHYdeg7HzCMOKWye3Y2kCAYzQ4mPB9m7XubhyCjI9Cxj/bjWMm6AWhVPDvV3dwOD8
         t5ao97lQAxRD61shfr2dX4328hwESCvoCVfvw+X8paii27vAleZUePUetCseT8VAqrak
         UP46DTsKTkB5xT/hemkxg+LLtxu7QmnFxAyB9+XjEnnuielWvCym9Te+xq+v08IvlXfO
         t18P7SkgNcNJ7ZYaAJGaeRxcRAaWPLo3pfq8Q0FN+EPXpkXwzRYpmysLIo43HtDj+4MR
         kUzscKmSpSFBWyLn15xBOhg54qVgbRudU21RJtoISdns8Sp+K7ZuWrEJCtVS7U1Zq16Q
         uBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661839; x=1793266639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=wZwVT6QeFAt8fH3dJ4BrrIu2ZTx257JrdL1KTxmF/pYiFe6tEMVrfTFp3GaAwrdm/p
         oM7Hu3UpvdFmhRG2OrHV0OUJ26jnwPjwg0VnEzukDSVJRDCaahULfXyN2a0BSSwQFxD0
         GsRIdhvMOg8VpSl2lIdmB5QD9cmvsAR4+OCXTArQxtBeYuNBrolUv6Y7kwGxOkijjgdN
         C6lfILj/9qdjGd//IEOmLg6IgY2njB3guOQ0+evmOQmzjJpYl5cQnWrnlGkXCsBcR0Cq
         Jyn9ZhpljDEDvda4isdlqUTtw7aScS6O5FUtUe0t2TuHigTq+y/eciyti+/Gt9QPtA/t
         1zNg==
X-Forwarded-Encrypted: i=1; AKwUvBwrq5KxarAQcS72BLvRZ7wK8ewec4cRt1GiGqJfR71cY8WDirG2uMEcUglQpIJlhq66XQoSJ7aLpVw6c/7PHPuR@lists.infradead.org
X-Gm-Message-State: AFq9FYIVOQ8KtDIARw5zMOarXrtgGGnbNYYFsuxS/OHvkYqAHyx5RHIF
	Gtj2J93NHHoT7kdmWQz5DjU+qv2MyJcNh48XACDb6Nmac25IDzdjlGXnEo/iTq40Dhe34IrthNk
	g+4gEEvDSQpizQIFznd6ly1a4gqVXEA0=
X-Gm-Gg: AYBFou3flvX1fnW4rAyDVMbo62FsQ0bM1WpvgpC2sRNqxye1bq2r3sWCoWpoPpWWf1+
	wM1NGijExcZYRNPz/yuXFVP9cf6Sz6R5WRaumV7BHB1wEo0FgBUUdjxAb1UFsqfVjP4J2Tqavoz
	B01GjRaNUayd7IXXvfXzEUwLGKUQ8WyvNM9kWEJABditCf75PRsoN6B20EAaPrBgsAzmYL6ykSO
	DfQ6KBAjeY3xpc0NTYr8jLNbJiftMbGLbcbDd1KKJ+xG7TYrZXwgL61qtV9tMJ7tKnUZhXGMUO+
	raTA4YuQNb5z02PXwcdIZV8pG/nsyzS4qnGOQ/t4xM9hjOel2CNOtCv5BdkV2Q4HGyIruzlCYUf
	2gaTu/3BjoFI7i7dp/3Ur5WiiHG/8E1dhTMUt+w==
X-Received: by 2002:a05:6a20:c6cd:b0:3e1:3178:8d63 with SMTP id
 adf61e73a8af0-3e287e025e1mr3241635637.44.1792661838857; Thu, 22 Oct 2026
 02:37:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Oct 2026 17:36:58 +0800
X-Gm-Features: AclHuK8v2lajakrSJ87vVRxpdMWjcEs90TbK_GuOR8gXyo3LH7ug2o5_RGKU8uI
Message-ID: <CAA+D8AMOW3oUoX7xJpuD=T4QJn0iDPfZqQuT1=1otZ1Dqh6otQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_023720_175727_EC29AC80 
X-CRM114-Status: GOOD (  25.49  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 2:58=E2=80=AFPM Chancel Liu <chancel.liu@oss.nxp.co=
m> wrote:
>
> From: Chancel Liu <chancel.liu@nxp.com>
>
> imx_rpmsg_terminate_all() queues the TERMINATE message to the workqueue
> and returns, while the DAI hw_free() synchronously gates the audio
> clock. The two can then run concurrently, and this concurrent access to
> the shared audio clock path can cause a stop failure or even hang the
> system.
>
> Flush the workqueue in a new component hw_free(), which runs before the
> DAI hw_free(), so TERMINATE is fully handled before the clock is gated.
> CLOSE stays the last message.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.=
c
> index 85b7c929a28a..6a0174d6c78d 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,6 +178,16 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_co=
mponent *component,
>         return 0;
>  }
>
> +static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
> +                                struct snd_pcm_substream *substream)
> +{
> +       struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
> +
> +       flush_workqueue(info->rpmsg_wq);
> +
> +       return 0;
> +}
> +
>  static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component =
*component,
>                                                struct snd_pcm_substream *=
substream)
>  {
> @@ -285,9 +295,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_compone=
nt *component,
>         struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
>         struct rpmsg_msg *msg;
>
> -       /* Flush work in workqueue to make TX_CLOSE is the last message *=
/
> -       flush_workqueue(info->rpmsg_wq);
> -
>         if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>                 msg =3D &info->msg[TX_CLOSE];
>                 msg->s_msg.header.cmd =3D TX_CLOSE;
> @@ -624,6 +631,7 @@ static const struct snd_soc_component_driver imx_rpms=
g_soc_component =3D {
>         .open           =3D imx_rpmsg_pcm_open,
>         .close          =3D imx_rpmsg_pcm_close,
>         .hw_params      =3D imx_rpmsg_pcm_hw_params,
> +       .hw_free        =3D imx_rpmsg_pcm_hw_free,
>         .trigger        =3D imx_rpmsg_pcm_trigger,
>         .pointer        =3D imx_rpmsg_pcm_pointer,
>         .ack            =3D imx_rpmsg_pcm_ack,
>
> ---
> base-commit: 8d00cfd77ffa64477129969eec8249c8cdadc9c2
> change-id: 20261019-b4-imx-pcm-rpmsg-concurrent-1522959ba768
>
> Best regards,
> --
> Chancel Liu <chancel.liu@nxp.com>
>

