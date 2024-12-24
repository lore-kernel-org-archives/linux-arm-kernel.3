Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4749CE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d22KTIl3OplnLRpPFcAzrWIcYBNdTH4ggDHSk/lL2yk=; b=r0F13P9iY9zzzmRMrTr2d2GjYE
	+ZOOQnj69ty/6HxH5N9jRirU+QekWnE5pjmNTXTnq6/KrI/WPhR7w3CGzZZ3Mhp99BFaQhn8gzALM
	43mQ51nlHWGlo2ck3nKnNmdugFc+mXXexLI6WrsBpMTGqrivI81VnnY6Q/86vfRfvmLGDjeXqMkrs
	2Ujy6KvxucGVsNw/npiqQezjut5Uq2neIMahTBeo67RM1qyUyZQ4ecvlTfUZicadQamky/MWaQN0M
	oK6QafdGL1Fyd6usR28wM+5/eNmluLyUPRydyJTiuBs/vQctScjERiIJHehCteCa637Bosy2t/5r3
	xTAdsr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ63H-0000000C9jd-24od;
	Tue, 24 Dec 2024 14:38:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ624-0000000C9ev-3DSj;
	Tue, 24 Dec 2024 14:37:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21634338cfdso74704055ad.2;
        Tue, 24 Dec 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735051031; x=1735655831; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d22KTIl3OplnLRpPFcAzrWIcYBNdTH4ggDHSk/lL2yk=;
        b=ibbTgw/LsPDFXeubqz9R6XIyoytjHxtxiz4Wh7creJQwWdTVWLITPG5fecsr81mlmm
         1BZc5HfFBtYVVeXI63F5EbNB77v5KOoWAwlqEDckfFlfO38o7fouzWVH1YkXnz0WnJyP
         mO659B4b89aKloWb5agcmLxtzB4nyQkcb5m/0F9lj1pLDXUf8qxB64lZqp58OZ2iL+Gk
         b4/BN32ROGuLvYxAVnUqAiBzWCm2jRo2p9IwrIgvYgziNC+I2DMqPkIzqQHEm/URHkoK
         XmLBNIQbkHi3OqZ5S0lsHU9C9XFiv8CWo6CDDYrtNgoJlSqoVPDJ8p9vtQmmlEWssMap
         sV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735051031; x=1735655831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d22KTIl3OplnLRpPFcAzrWIcYBNdTH4ggDHSk/lL2yk=;
        b=ZPTTCx1r8deYTsnyO/rv1QqV4VGguxoCpiVxfDBfq10lCTFsqAkF/NdaHSG6DvEZG+
         LT/j7D11ZXgElLov5tEpUoAUzSHLXHetkkEWtAPvMtk/yN9KVWYh4mGmMlTgVhkh2cyS
         qJcXkjrIQiwZnASly326ma/qyJlYS6ubJzMdP88VS+Kp1LxiQSo2rx7Ko8On6CyCgb5u
         9PLMUWAc33lDVTnUTc8MxCP/DtmpBwH+LOptFaUZxLA8TyvmK809c+Cqz09euP9+B1W0
         2HpiJD0PpBeiH9lU1A31/cRB3rIgcSAYFM2b0OjT2gmAjLVTWUMbRGx2OEE5jgXqpJxA
         lhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtbpRcHgXRCCqU/qWB7rqnu6R5PYQeNf//qvy9uLh2jvdZXnNOqcznPnqk4utyQ508rZKeS60+pAb1C0e6@lists.infradead.org
X-Gm-Message-State: AOJu0YxAYZr0xSLC5TAgEsje6avwGMdUNuvKdnCWJwm2xwdMjLmzNNLD
	5X49LaaZ8jUQ9FpBkh/MeV1DbyEtKCAbwogG48wY3wzPAi+FdIhxduDhcCyuzfZqHfxbrAHlOJ1
	hXwops6V1S8QXplp4FCeWMy5RNNU=
X-Gm-Gg: ASbGncvQlXCHMikbg/DMnJ8BcBt2Mnj1qtIjQlMcqbljhgu8BP5WVmQv1BaqBCpiYIx
	5jiErq8AMi4mo5u0o47uCJwQmQvCOFRq0TeKzFSZLkSv43rihZzVw
X-Google-Smtp-Source: AGHT+IE/mJTksJ5MUxt+Px4xwExymbX2lQdDPYewgw+owvA5v/YqFnqOXEhm6l3ZZ4oKIThu+ozZapG9TdbkkT3nwAg=
X-Received: by 2002:a17:902:fc44:b0:215:a964:e680 with SMTP id
 d9443c01a7336-219e6ebcf72mr256770385ad.25.1735051031637; Tue, 24 Dec 2024
 06:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
 <20240323231309.415425-3-martin.blumenstingl@googlemail.com> <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
In-Reply-To: <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2024 15:37:00 +0100
Message-ID: <CAFBinCBxsv92t_B_T3vBDJJ1K5BwUbV=as6sy-KyQYz+2jur2g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] iio: adc: meson: consistently use bool/enum in
 struct meson_sar_adc_param
To: George Stark <gnstark@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	neil.armstrong@linaro.org, lars@metafoo.de, jic23@kernel.org, 
	linux-amlogic@lists.infradead.org, 
	"kernel@salutedevices.com" <kernel@salutedevices.com>, Xingyu Chen <xingyu.chen@amlogic.com>, 
	Zelong Dong <zelong.dong@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063712_815547_483E2433 
X-CRM114-Status: GOOD (  15.77  )
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

Hi George,

On Tue, Mar 26, 2024 at 1:41=E2=80=AFAM George Stark <gnstark@salutedevices=
.com> wrote:
[...]
> >   enum meson_sar_adc_avg_mode {
> >       NO_AVERAGING =3D 0x0,
> >       MEAN_AVERAGING =3D 0x1,
> > @@ -321,13 +326,13 @@ struct meson_sar_adc_param {
> >       u8                                      temperature_trimming_bits=
;
> >       unsigned int                            temperature_multiplier;
> >       unsigned int                            temperature_divider;
> > -     u8                                      disable_ring_counter;
> > +     bool                                    disable_ring_counter;
> >       bool                                    has_reg11;
> >       bool                                    has_vref_select;
> > -     u8                                      vref_select;
> > -     u8                                      cmv_select;
> > -     u8                                      adc_eoc;
>
>
> The reason to choose u8 type over bool was that those are not actually
> bool values but direct values of hw register bits. We have little
> information about real meaning of these bits so it won't help much to
> add bool layer and keep real values in the init code instead of param
> section (adc_eoc, cmv_select).
> bool disable_ring_counter will look deceptive too because it doesn't
> say whether disable ring_counter or not (we always disable it) but
> how to disable it (write 0 or 1)
Do you have any contact at Amlogic that can help explain the purpose
of these bits?
I tried reaching out to my contact off-list but did not get any answers.

I also have more questions about the SARADC IP block on the GXLX SoC.
We (Christian and I) have a patch prepared to fix audio (or rather the
MPLL clocks) on the GXLX SoC (see [0]). Unfortunately there seems to
be nobody that's answering me with enough info so we can upstream that
patch.

So if you have any contact or insights into datasheets - please check
and see if you can provide information so we can improve the naming of
these bits and hopefully get GXLX SoC support fixed.

Also +Cc Xingyu Chen and Zelong Dong - I found your names in
downstream patches to the SARADC driver [1].


Thank you and best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20240604055431.3313961-2-christia=
nshewitt@gmail.com/
[1] https://github.com/khadas/linux/commit/13321d23231a7a4d08f4fefebcef11b3=
79475a37

