Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CC9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 01:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8PZoTFdcE9zyvzVpjQCoxqrcqxVo1RB0SBT1ExD8z0=; b=DneQjiYWmKawUYqD71J8IbnYFC
	Nf1KDcuxR++PZFGJ+yIKIBT6FJMlF/5XG0T+aaoEqK7FDH3UkVQzWExC07iuYP+2cLrs5hR1Ke6Ge
	9dHpn1h8mXDQYQwcIslMQ+KCG4ZKgnl1InD8bi4rDju4QQ5gMP1bqXAqCv4/MM7Rh1Qq5pKmoGXl2
	pp0OfDiwU4gT80dI0V5hkuB9dyi129GGlS3FTuV+as+FJWg91LsT8UOGTHhW+dMnmqqs3mH5XVNfI
	T6Jy3OADMAv456SjBaTYi+5QwtVGE/lIIbhVBfCYXiqZwTuA9QuL4V2Tz2y6fuuz0sfxJ4Fog3pFT
	dT61bYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv4Lk-00000008mFi-1O8R;
	Sun, 07 Sep 2025 01:37:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv4Iy-00000008lTl-323Y;
	Sun, 07 Sep 2025 01:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C9C144E81;
	Sun,  7 Sep 2025 01:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72691C4CEF9;
	Sun,  7 Sep 2025 01:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757208895;
	bh=YvrMVck9GuxvJbknpdd53Wuad3w7da3ygVsD0daNaFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txGJve11Mwh7eufsDkQ6YhkkhUh94pIrBGtVPdAnzbntW7hbiIXW4e8lPUKfm/P4t
	 Ml4xYGAuWZVSAUUylGknI1s46OjUfeZOuamp7JzzDncBM34j/kLEJiwrDI7LwNbQeJ
	 1XBKGX0Omk9dGHrd+i92FDg/DqysEHCnGK+Qy4sqQ2wkJLLeQMmMQQOksYilVqKn2J
	 9OCNaJvKGaFYlJh9QuLngXCZ4zI6Jmif1VNlqsSnzAB2CemiVXVfZ2aqOPR0AJ3mhI
	 0EBxBw0U6QTOUxWywc1vfid0FLjiZ7+sHg5KwWTO36jVcUjKmrMaDQoBnSsDZixuX9
	 sXaXf2Pipopug==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-30cce534a91so1419059fac.0;
        Sat, 06 Sep 2025 18:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgKeM6mCPi+CFuEMkbGnwuzTHI2x241q2LivdZF7CxKjwiPMag9WtGwuMO4EQJDtmcdQzwzChABLhsAXuHa+8=@lists.infradead.org, AJvYcCXHDWOZ0+655G5SQ875PgPSTciIMz1i7LQIvXXOKRlyjjvN+hPfa93/nTPxWF5Z65vOwgr3qeSJLsrxWRdB2pah@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6rPaZ9X/tV0oJj5im37KLnpBhUFJq0PeJ+quORi/DDb/y1V7l
	Zc/VOZaeuWYET1Bc5lHm1IHjrJtZA590kWZKqfT6hE99XbTioxHoQkuaBd201mPcam3W2PU9S2l
	QdlWbQPIM5GFXqxwmnw5ENMY5QWFYADU=
X-Google-Smtp-Source: AGHT+IGVjcrk3nT2danIlz7M5YYs7s1I1c3e4MPWm1eVrv+/cRM7jUsuwRVAQ3f8OvC5Mf7Lx0jfXbVvOb81naROdro=
X-Received: by 2002:a05:6808:3095:b0:439:af0a:dc9e with SMTP id
 5614622812f47-43b29bed1e4mr1448155b6e.12.1757208894866; Sat, 06 Sep 2025
 18:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250903121452.387023-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250903121452.387023-1-liaoyuanhong@vivo.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 7 Sep 2025 10:34:16 +0900
X-Gmail-Original-Message-ID: <CAGTfZH2ch56uca-x7TLTYu3Q0q-j+1nCsSOjUV0R7XQ3XLQ7CA@mail.gmail.com>
X-Gm-Features: Ac12FXycPiT7p52rG1BVVS6XsIIvHEkvuEPHCNNS6J9fihNz-L7KMPQrOiCUex0
Message-ID: <CAGTfZH2ch56uca-x7TLTYu3Q0q-j+1nCsSOjUV0R7XQ3XLQ7CA@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: mtk-cci: avoid redundant conditions
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:DEVICE FREQUENCY (DEVFREQ)" <linux-pm@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_183456_800565_CA6126E5 
X-CRM114-Status: GOOD (  16.04  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Applied it.

Thanks.

On Wed, Sep 3, 2025 at 9:15=E2=80=AFPM Liao Yuanhong <liaoyuanhong@vivo.com=
> wrote:
>
> While 'if (i <=3D 0) ... else if (i > 0) ...' is technically equivalent t=
o
> 'if (i <=3D 0) ... else ...', the latter is vastly easier to read because
> it avoids writing out a condition that is unnecessary. Let's drop such
> unnecessary conditions.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/devfreq/mtk-cci-devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-=
devfreq.c
> index 22fe9e631f8a..693c59c8037a 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -86,7 +86,7 @@ static int mtk_ccifreq_set_voltage(struct mtk_ccifreq_d=
rv *drv, int new_voltage)
>                                                       soc_data->sram_max_=
volt);
>                                 return ret;
>                         }
> -               } else if (pre_voltage > new_voltage) {
> +               } else {
>                         voltage =3D max(new_voltage,
>                                       pre_vsram - soc_data->max_volt_shif=
t);
>                         ret =3D regulator_set_voltage(drv->proc_reg, volt=
age,
> --
> 2.34.1
>
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

