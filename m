Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9FF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=snVkvnhQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8YVDOSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=; b=snVkvnhQIO5NHp
	hyOTpgm0ByWuRbPoyFwa2/9tiHbrmsqvr3ZSkjvZe3pQePq5Jl47mFt//ReHQGTzdy85QQ6SPY6yj
	kV0Q54OXeUg+cEfFix2UusChaMF6rvfI6vdbrTvoL/L003OrtMSx4rOhuDSMGOUgbRjB/4+Z4mK45
	Ok0F08YW5IfIOVPFgsnPLERWD8UnYIK9J2GWPygzB9SQkQz9TcBsouG9jKDO/WmBPybvo6ltXJnP5
	7X95qbi3997Y3tJE1v5/ri1fq7KucMIb84lTZYneS6evQItZu4dZLD/UqFBs8UeGBKJJY1UWX8VJA
	LtVFlzyDM20PVT4zFRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnap-00000007dBg-2qdg;
	Thu, 05 Nov 2026 02:52:47 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnam-00000007dAz-3ASI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:52:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a60f90a924so607431b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 18:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793847163; cv=none;
        d=google.com; s=arc-20260327;
        b=HlL0WOXI8Dq/pJPVlH2LV+jnhp/9SlZleipxjPQCPj4GS9FZEPLChf6Ts11r+UOpa8
         zSsDLMrk03f8hMPl2ggj2kmq749+iy2y+ekvGYQ4sFuvgOvhGmj5U9s2nmiRfrmMFA+v
         XyA4p336Hq3JJnWqal/I9ox9LiKl2vlNNuJ7JGLbLUvd727qnMJ8muHyZBa6BpNw3Eaj
         fQSqc6cG04UDdJ6YtSC290X7GgfuLQYqHbH+aaQYjUShv+ZFsf1Dw3PxfPAaINtkG5w+
         ZX9stZ2031a9vne8LmMsb4JjHU3W6AFaIQzOsutfXVLdGu3oehfbdhhR6Q4WOOgat9Na
         A4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        fh=Il11xB7PTNjay+MmU8sr2Zpu8IXX8WxumhQfOjHS0/k=;
        b=ov2l9Luu/NsTip6NE2fNj5MiNi9gNdPuA3C6tr7WnxqsVlIJSZPQTsaq6xJdu3hfAA
         WzWEp6GIpklBUEOKqxCtDkQSAkfg+I8f95BLFbKJX/b0S8ME4HwIC6TJQKgsjWYDMScF
         5UvbGK288cq2nGy6ImlYoZ83pcfBu0I8ZKfBHNFO/bjv/lXcNlvLod6ljbJj9NbyCIdn
         uO+E2bcpyaZDu8Eew0AqnrjubeGL3H9qBAvbScxdG69XwRaK43vc6XUDy8Ol+EFCdcl0
         kh0EZ0tQD7N5voick0ILn+C+SUayJb3yWacjygpVhudL2eP20krFpyC4GmbQcIbbO22l
         XNPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793847163; x=1794451963; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=D8YVDOSp4pebiM6RHBwKEB/D2aAcxZARDG+HxIzvkeRXAjkqjt4zu++c8jd2GfnZyb
         3SO6FwFFaXQpCOIAPqEoCfGiKWiuc2Rc+eVBgUr8qojJA0BBQrFLDcjGH+2bA7jYCA7R
         Isl97TO1U9fS/9+KrEwAcKaJuoj1Xo+p9s7S6NmAJ84plOI6CI8IbllovTWYGCty/SU7
         k5/fyPEi0fyIiDoIGC5J7RDT1vqNqIMyJjbr/i8LBluIzcJL+QQmyvZgKfpUYMNFyo+3
         996vfiBBmqYCtsDhYJF/UCX1RXtoypVOTPjEPySJ9uKkU9RTpAVv1HlC29z++oxwJD61
         2A5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847163; x=1794451963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=rXrCDUhWstm0L8+wtzKxowXMqYC9WgZhcOlhFKVW3hMhK6EQYeq5EtbufjSiJHHf29
         FlVsEwBL2b/KjMqrc1pPmg/CsiLhQkQ2rumtRcpswnFwZTmCQJ5wnPTX1qqPtJ359u9N
         v0nSONaBpcTgD3ZHb/q8ecM8gXhxcUygWgH4kfAnnTX+TE+yRQcg+nDAfHJPhWGsjjLy
         /NolYYnZy2uLl+nWgD7FbvdpjiMlPR4bW2t5YMfe/T1yVIQI5C/lAJIe9QYJUhYaBJ7/
         DMDCW/bnz0CmcUlm+GTWw8BdNoI8ZLdtdk2TNMVwCP9yvl9t01qmNSoTroomnXmDjC2e
         G9Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxRPiDedWWRq02zjsR2i7FWqRmDTcbwm82HA1g3GVjXFtO1C0np9OnMD6DVRMYkwMzAiuFNZ/sAYBTmg6r5nMfu@lists.infradead.org
X-Gm-Message-State: APuU4Z+mzEN3vz1vMaEv0umFHrwJ67HjVF8zukOMfBEvkyZRwkasivRr
	5IdMJ+Yy1kxPj0yMiWDs/h11Tz/BmBRsUyBJUZV+5ON8p2HABZfga2+38PQpOyTL7LwpOUvx0Mi
	XUMz007uLzGozXmEAEx5OzEhMFHAC5yA=
X-Gm-Gg: AYBFou0S+G0qXPUCqURFAlx03lgw8pnfnExMQ59KGrOfDccsoE2sNHeTe5yeJHUVgHz
	fsQMtTC1HvdX+ctUTSD80k2ALB6Y9AQpbCa1Et5L49dCKofVmrZQJmeyv0Refkj+GUL3W4CB+gk
	tyg/eyWDrwdKmOcO/yEjSN38C38KwO2Cl3GDFHbz/7Vld0cjcLVz2A3i5n3qb0OVIICaph1A6u1
	cKO82lBr5L4/V09R7eJEtlUocveEbMcYZ0Fz0wpyZMkWrrK3X2WtWUg6dV+e3Z9GI8enDxataul
	zrTl6V9EZzZgFyaC62vyk+gwpeBPKBb5AtEObxQbSC8V7J7SSdOmsYyL72begGzZOq5I0ciGgI7
	+TCBdUJFsZt6Op3e6p32tOJxGG79vGNfYOO02
X-Received: by 2002:a05:6a00:2d96:b0:8a0:5f63:5521 with SMTP id
 d2e1a72fcca58-8a9ba703d12mr13438966b3a.8.1793847163495; Wed, 04 Nov 2026
 18:52:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 10:52:14 +0800
X-Gm-Features: AclHuK8gtw_SYmYC4rZ2ec9F7qmZC5mmmsY7xqdrym-SeKMj27M0HT9x7LVxGTo
Message-ID: <CAA+D8AM5Nr9vDzohQaz-XN=_F9dBfXoBJJv_3FS3jDeGQ_6G4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_185244_797532_31EAED65 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Nov 4, 2026 at 7:35=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/imx-audmux.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index f8335a04595a..d46f43ab66cf 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver =3D =
{
>                 .of_match_table =3D imx_audmux_dt_ids,
>         }
>  };
> -
> -static int __init imx_audmux_init(void)
> -{
> -       return platform_driver_register(&imx_audmux_driver);
> -}
> -subsys_initcall(imx_audmux_init);
> -
> -static void __exit imx_audmux_exit(void)
> -{
> -       platform_driver_unregister(&imx_audmux_driver);
> -}
> -module_exit(imx_audmux_exit);
> +subsys_platform_driver(imx_audmux_driver);
>
>  MODULE_DESCRIPTION("Freescale i.MX AUDMUX driver");
>  MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
> --
> 2.51.0
>

