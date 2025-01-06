Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8852EE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=; b=yvmx75dhGwTV8z6VSQoGmc7Sly
	EQqO9aqIeCmSUkaVFlvVn3aYJfZxLYooiBWkxq1aMsGnbNTBt0hxFlM2f6PzVyVFcqCuTL0UpRjQa
	gjBR0eiw0c3cTB9QpxxAlVaI09HsNkxSFjLkLmUcs1l31n2dsdcKX+whIV/W91suN7QD1xgitu2SX
	YQlBQj6ZI76Nw8OeffyzFePrQN+u2DP3mWLil1CbM0GDrRQCUtLNxCAG+dinG0B94lv69q3G2J1wy
	dZX03/1AvbXMKgyfHBRFrXXtw/+jE+iUW2iQ4Xtft2n2O5eYWg4coKTBTYuAHc19jXsgV8MGNdqp5
	lDrtvnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnMD-00000001RA4-04C6;
	Mon, 06 Jan 2025 13:41:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnJY-00000001Qah-0gRI;
	Mon, 06 Jan 2025 13:38:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21661be2c2dso187535235ad.1;
        Mon, 06 Jan 2025 05:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736170719; x=1736775519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
        b=Di0xMQZqnfOFv8uh4+iz/29h4Dyhz+sFHKZizGzyWwIJu4CNaRfFzhTKVtfLdTsQx9
         GgXMN0mEVCJv0rVfu4o5k59uKBZ89rfgbxL8NhOyZnRD/xi/y9DATxqb/osZCXQRIOJf
         eJzncSZwE5StpmDKlzCpDRiv9LbXYjt+ZWt7pe7ZLxMHqI+kbmFTvUnE0kWnvbO5m65u
         3N/uaSZ/xh0JtH128+Xv//I+lU2/dxo8UFAZkSt08ZSNe7SJpeBfDrb2JioenRcuffcy
         LZ7Nx1y1Du8uVaIkGcicMXVu9Szq03OXOjnGF7kWj7llpeMDwZdlVJMzWI2jqXNP4A+v
         l8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170719; x=1736775519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
        b=Fwn16TyDJy5lpn9D9i5Akju9BTe2RFW+uHsW1OHn1rfkcQAqNqfKWnDE3U/JeWfpMY
         4Bv2ByNCHFyfVLKeK4mfei9N94J398Z+R6DaMW6yvO49+CkN0WHjAlFg7FyUugjcNNwK
         5YqM8p8fVsFmRmbVyMvPFJ001TdyXBM7Km4K5ZY+LwCcW7gDpNBcstGFDLc+V8Nprr+F
         lf8GWY/Nx1lBfVqIxkaWlpW8NCbij063JkkEusKJBThAfuNU8x0EWQpFzXN/qbMv0/9/
         HrBSCY1sd9yNYqQDK3bd1shYEjWvwKGQRVWU6fb/BJE4YPjEPcndzn2hMX9ckZPNLQak
         xm7g==
X-Forwarded-Encrypted: i=1; AJvYcCWZpP+cW6gwu2RMgLAvM8GDKtEkKR6kYjQt1eQ0kFx+Boo1gnX87iiOCfbIjsVqTqmX+QAClU3VLFko9g+UVxir@lists.infradead.org
X-Gm-Message-State: AOJu0Ywms2A17JK4HwsOymkfSsR+hci91R4Mo46TXLN9xxBIH78JyYKz
	tDdkx8kfUKNS9ewMoBm4d1S+0B66yAnipe0MYqdkIhYEEWr/MDrkwllNXxqXP8OtOh/lJaDnBP5
	yJ1i1UuFsbbal4zjssZNTY3Ztlgch/bCn
X-Gm-Gg: ASbGncs7Waxslr4TgHxKycW+4EY7r9BH064g/CDDlJMwkDGplgDggFb1V4Dicvo5jgw
	v91UK+PIQ4wSC9SlkpoSITpl7eKfKWgACJPofKPeypGWLRi2ewotn
X-Google-Smtp-Source: AGHT+IHCpyL2RoYltN/Son8caT8kY8aAmajpToxCZK8DLZGGKoPJGKURhGVgsvMDpcmla3l7r6gwPZ0/44HMzZ5UWKg=
X-Received: by 2002:a17:903:98e:b0:215:9bc2:42ec with SMTP id
 d9443c01a7336-219e6f24eecmr837678925ad.47.1736170719510; Mon, 06 Jan 2025
 05:38:39 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com> <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
 <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 14:38:28 +0100
Message-ID: <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_053840_198031_35BB40E3 
X-CRM114-Status: GOOD (  27.74  )
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

Hi Jerome,

On Mon, Jan 6, 2025 at 2:24=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Mon 06 Jan 2025 at 13:49, Martin Blumenstingl <martin.blumenstingl@goo=
glemail.com> wrote:
>
> > Hi Jerome,
> >
> > On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylibre=
.com> wrote:
> > [...]
> >> > I have further verified that the gx-card parsing does find the HDMi
> >> > controller and links it correctly.
> >> > To me it's odd that only the .prepare() callback is not called, all
> >> > others (as mentioned above: .hw_params, .startup, ...) are working
> >> > fine.
> >>
> >> I think the problem you are seeing comes from the quirk of
> >> codec-to-codec links. The hdmi codec link is such a link on Amlogic
> >> because further digital routing is required after the backend.
> >>
> >> Those type of links are not used much beside some
> >> CPU offloading on Samsung and Amlogic, as far as I know.
> >> It is possible, even likely, that things are still missing there.
> >>
> >> So those C2C links are operated by the DAPM events, not the regualar
> >> ASoC code. You can start here:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/sound/soc/soc-dapm.c#n3995
> > Thank you - that is indeed the root cause!
> >
> >> You'll see that .prepare() is not called, same as .trigger()
> >> That should propably be fixed :/
> > Since I'm still very much clueless about all of this I just came up
> > with an experimental patch. Any feedback on it is welcome (I can send
> > it as RFC patch - but prepare for me needing support).
>
> It is probably a good idea to send it to get more feedback, yes.
Sure, I'll do that later and keep you Cc'ed.

> > With the attached patch I now see hdmi-codec's .prepare callback being =
called:
>
> Looks like a good start :)
>
> Couples of nitpicks:
>
> You might want to check the stream validity in
> the function you've introduced, like in soc_dai_trigger()
snd_soc_dai_hw_params() doesn't check it either but snd_soc_dai_startup() d=
oes.

> It may also be nice to update snd_soc_pcm_dai_prepare() with the
> introduced function.
Ah, this one is also checking for substream validity. That explains
your previous suggestion :-)


Best regards,
Martin

