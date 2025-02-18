Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD85C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzjPJByPMPi1+tDKNkZmLEEa2KEFBG7ARwPPLuUbuME=; b=GhNv3OPu8z8L4goVde1w6zVRSX
	y5SvAXGObCWcPz/Od2f+ycU4Rg29MWiaqe8U+eskrUNjmcuR2BJ1zRlkhobzXH41aWWB4b4SecHld
	PHtHaEJ+0IzzSmZTweDmnJ42QghSaLYHZtFjptS8XG6EpA78PZcPbLiHozTPTgMvEycADe6UcnOyb
	BSIK7En/oaLAtvTdtHak3RE24uHI/amuVgy9+U8wWrvmFOvD7IH96OoOkq+uh9GiZ7inPXdFaqAl4
	/dPktAXJyOllhOP2KRUXUF3MS3H8zAYhcRIbCdA35F4HWT6PHBcHoFdrr+ivsTnI8434oy71KUzEJ
	vc/L7O6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSGG-00000009Kne-0jOE;
	Tue, 18 Feb 2025 18:24:00 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSEm-00000009KLG-0twH;
	Tue, 18 Feb 2025 18:22:29 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-471f2e1bea9so18908371cf.2;
        Tue, 18 Feb 2025 10:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739902946; x=1740507746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzjPJByPMPi1+tDKNkZmLEEa2KEFBG7ARwPPLuUbuME=;
        b=ankq1JCSO/ukGPlipaNgSLHUxXDiTXNf1FgxzQvDRIAZdjSqxeo9NZ6/dXHgOvvHk0
         osNSoOqkBafrok985hLiwR1GJ862QWUCkJqX3CsM5h/HdpcX7QSHauRMlve1pPXz/xi8
         4kQF0KFxncj7MjOoqWvAilS47N6JrxhD/yeTavng4Jkh0oQhRd79L3seoPR3hEs8OyDH
         ENM0hngmIXCh89pSvX8QgpdwruneI5tOWV/O8vkozVVdA7P2cNcKdnsb5V4vWPdjP7za
         H4/YkGe1qo18y6Bj1ejUTpoUK3f+gnF2fTQP+hMRjyUARM4yDjfURXaEsrvISOQ4QWzl
         Udtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739902946; x=1740507746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzjPJByPMPi1+tDKNkZmLEEa2KEFBG7ARwPPLuUbuME=;
        b=rfno2SsJPX7hUm1neKE7AikZnxSfOMbnWdfS4xOxBTwx8qHiuP7njlsCcHbh0qh0Ru
         z9SDrxyVggKXlfc4nPgHxcuzYC/krL68uavTHrwlx8toCXVOGZJ8LhSLxFKO6u8d3xLp
         3xtDImGURmRjqPe+c8zJ85Caa2oojVxJ2GbMKcSbUYvIuqx0GpofWsITKGiaxemwWN4P
         5uRqQVkG4c+IkNCWPRGGZQ3z2HQPgbO78IkQ1BKQbhdw7b+p2rJlI6gfQtl+I1GMgeyP
         gY8rptevsEVenAC8gPmNT/65OX2wvLqa3sCHIKLWy3R0owDs1il7dDtUPNogSdr/bFY1
         EtsA==
X-Forwarded-Encrypted: i=1; AJvYcCUXLhccXP1m3EwoiHw5jRmR4HjzUQDcSgBET1FnSiZS65MtY2vBoJlwHoJwR9/5KVGwOvOqPejtjZ+KvZFIB3I=@lists.infradead.org, AJvYcCV+3Gea8jnSq9cC9eAFIWSfZwdz36EMuMCdQRylldHno8dDA1rAeIzqwiRC6cVYkdiHPk5i1uu2raaaFV9+kM10@lists.infradead.org
X-Gm-Message-State: AOJu0YxsteVnJXjqPjZOqPnYA1p+C5ZhnUw+RACfGoudJ5EZZsqiE8VI
	r0OJbUEqA0ePrYNbcKr4DU7DKAH0NVK2nw05D2QQ4dMpYIGHFweTZOPkRqltnengox6ejsS+Q1s
	AqabpDshDr36voPxub/CCifZTGEk=
X-Gm-Gg: ASbGncssmmbEFivgyWq/70pE2/v1Bfr4vhRovopBWVqrj5tSeW6h4hZypqNAYc21TOy
	gPlRW2Ob1zRsU3y7sFteK1G1bwn1zG3ypAPFYGuoQ8y5nAskwoD6vCMovuD7YeG5ed9z7rvGL4w
	==
X-Google-Smtp-Source: AGHT+IFvTzf/pQHM1jlaSiSziUnZTXPg31KgeAid7qaMz8VLGP3h7h8UvBSajmKY8qqFANiz5VWrRvfUIUlMXw+xeQ4=
X-Received: by 2002:a05:622a:14f:b0:471:fecd:103 with SMTP id
 d75a77b69052e-47208299ec9mr9120631cf.37.1739902945548; Tue, 18 Feb 2025
 10:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20250131012830.22394-1-jiashengjiangcool@gmail.com> <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
In-Reply-To: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 18 Feb 2025 13:22:14 -0500
X-Gm-Features: AWEUYZn99Dl5M0kMGSPw5mLsYJhT6mWJQUJVNXXhgTF798gaCxq6q20urJwFd14
Message-ID: <CANeGvZUhFV362NztbvicehGzTDWJP7uu45hT0ebmbgLTx_v-3w@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Add scp_put() to free the scp
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: "tiffany.lin" <tiffany.lin@mediatek.com>, 
	"andrew-ct.chen" <andrew-ct.chen@mediatek.com>, "yunfei.dong" <yunfei.dong@mediatek.com>, 
	mchehab <mchehab@kernel.org>, "matthias.bgg" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno" <angelogioacchino.delregno@collabora.com>, 
	fullwaywang <fullwaywang@outlook.com>, linux-media <linux-media@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_102228_252370_B776C86C 
X-CRM114-Status: GOOD (  24.55  )
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

Hi Sebastian,

On Fri, Feb 14, 2025 at 3:20=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Hey Jiasheng,
>
>  ---- On Fri, 31 Jan 2025 02:28:30 +0100  Jiasheng Jiang <jiashengjiangco=
ol@gmail.com> wrote ---
>  > Add scp_put() to free the scp if devm_kzalloc() fails to avoid memory
>  > leak.
>
> Your commit message sounds a bit like you copy-pasted your code into the =
commit message.
> What kind of memory is leaking here? Are we talking about SRAM memory?
> I'd reword the commit message to something like this to give a bit more c=
ontext:
>
> On Mediatek devices with a system companion processor (SCP) the mtk_scp s=
tructure has to be removed explicitly to avoid a memory leak.
> Free the structure in case the allocation of the firmware structure fails=
 during the firmware initialization.
>
> ---
>
> Additionally, the commit title says close to nothing to the reader as wel=
l.
> How about: Fix memory leak in FW initialization
>
> But as I stated above you should clarify what kind of memory we are talki=
ng about here.
>
> Also just out of interest have you ever actually experienced issues with =
this?
> It seems to me that the situation where you run out of Kernel memory shou=
ld be quite rare.

Yes, I just detected such a bug with a static analysis tool and I have
no idea how to trigger it.
I will submit a v2 to reword the commit message.

Thanks,
Jiasheng

>
> Regards,
> Sebastian
>
>  >
>  > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer defere=
nce in SCP")
>  > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>  > ---
>  >  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++=
-
>  >  1 file changed, 4 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_=
fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.=
c
>  > index ff23b225db70..1b0bc47355c0 100644
>  > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.=
c
>  > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.=
c
>  > @@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *=
priv, enum mtk_vcodec_fw_use
>  >      }
>  >
>  >      fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
>  > -    if (!fw)
>  > +    if (!fw) {
>  > +        scp_put(scp);
>  >          return ERR_PTR(-ENOMEM);
>  > +    }
>  > +
>  >      fw->type =3D SCP;
>  >      fw->ops =3D &mtk_vcodec_rproc_msg;
>  >      fw->scp =3D scp;
>  > --
>  > 2.25.1
>  >
>  >
>  >
>

