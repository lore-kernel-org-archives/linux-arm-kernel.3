Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756DBD33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=; b=w4pl7nY2Ytry3HV7ykCJGh3EAx
	pfT5bHKEJLKHMNkrvlM0JPHJjBJQODHzJfRcwwW1bjEe+co2CJT1xbY/LyTrBeA5/KeOxNrXkuUVe
	f6Ek7LSoWtGT7D4Hm/SR83rusOEwHzdIxn6u1sK9gCQpujrzTGJzvnCjfL1Re3/6E2tnZLCS5UKZx
	JGxxUe8X3tPeAdUy/f4FwgBoxBBvTukx5Qev9ind8KZ1XoXfDw366P8YaR94ZdHYPjZp/lMOFg/nr
	lMgelArEkJ00lK2jFtQzR7K5zA2GZMI68qQ+JokkLbwdJYXlMbLlEzQbOPN1rQTl6jXJHPmomTuwa
	pbCFMtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SIf-0000000BQhK-1R8y;
	Mon, 28 Oct 2024 16:09:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rtf-0000000BLk7-0CWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:43:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539fe76e802so5309081e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730130188; x=1730734988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=;
        b=bcOtZBxTbZy2O1gQgmAScwIm6psmhUfYXQBe/ZpZ+f0hmhvzXuzaRf7QD5swc8HN7G
         gnFr8R9DcqA013d0sF+O1MMndLga1TL5D+MgR5qB7LKnJLtYXG9VpI3V7j7ZBcYOlegC
         bxgKPHboqC2HhaGp/6exyNHyaZEQtmzqhFzGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130188; x=1730734988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=;
        b=PelxwcNcOr5nZo/tlgutIf6srIcI2++gLXtwkJRKK/JXpAznDQO7urqfOS5svydy1E
         k75GgvlOD9dSWdoY7kYdW9p/3GSmnEQ9SeesOdiqb/5y+Tu0XlWWikvW0XOYGOE/8tJW
         Jr+SBnIzeCJ6z8tBpNeUYN0hMv9f7ldDeA7YJ6FOfJvWaEIexslTSqTjR7QYdcZ7G8Zy
         bqPynNE5HCiUqSEeveEW09wfmyh8r0VUpN7m9GvcQ+vztsGe6DND7BzRISGDUNxhXch9
         32hIA/jbbgnRt6JUIDgnIn2Fc6y+KNlRqNsbXcSirwQA2pU5V/JX87gC8ji8kGx/npSA
         cL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWgZVJYJP4mvW7tNRN0xFtK17djBy6Flb8I/o+GRMsM5gy2i+Ic/idG2RulNERwO+prFpkIXwUPY+TQc1uvauFr@lists.infradead.org
X-Gm-Message-State: AOJu0YxJOUHeWo7DovkypVV75DrHOJhYYwbKMvrz0LE+ig4PpDJx4Ia/
	wl65wtZ3+y8XiS9jfXeanooYlUFiIINaDkFZ/ZkMRAR5Kug0hqwKAlIHi29ZIoBJu7GblnjnjxJ
	qZQ==
X-Google-Smtp-Source: AGHT+IFHo9IKxcAjlvNhGEkkhwAuNj4qmjl6J68KLIFHdR41wM1E2R9BYKKW1r51NlXFL/RHuPPFYQ==
X-Received: by 2002:a05:6512:1293:b0:539:d870:9a51 with SMTP id 2adb3069b0e04-53b34a18fe2mr4102944e87.48.1730130188096;
        Mon, 28 Oct 2024 08:43:08 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a51esm1100617e87.17.2024.10.28.08.43.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 08:43:07 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb3110b964so35189361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 08:43:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9wtZ0QKIkNZ07JVXx+JBGT95ibXExIcjxmwnt8Cm1dkeptQ8GF+7w3RlmYiKFstASbr3zhyvk8YwyCIscv67n@lists.infradead.org
X-Received: by 2002:a2e:bc0d:0:b0:2fa:d9db:7bac with SMTP id
 38308e7fff4ca-2fcbdf6250cmr34338691fa.3.1730130185979; Mon, 28 Oct 2024
 08:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
 <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com> <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
In-Reply-To: <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 08:42:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbTMLr8ybCvKwm4aau+UkwCewuj2mqFX_+9hdCALLBRA@mail.gmail.com>
Message-ID: <CAD=FV=VbTMLr8ybCvKwm4aau+UkwCewuj2mqFX_+9hdCALLBRA@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_084311_127052_71C654FE 
X-CRM114-Status: GOOD (  21.67  )
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

On Mon, Oct 28, 2024 at 2:14=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > @@ -35,6 +37,7 @@ touchscreen@40 {
> > >                 hid-descr-addr =3D <0x0001>;
> > >                 interrupt-parent =3D <&pio>;
> > >                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> > > +               status =3D "fail-needs-probe";
> >
> > It's a little weird that there's no pinctrl definition for the
> > touchscreens but there is one for the trackpad, but that predates your
> > patch and is unlikely to be a big deal.
>
> To be honest I'm in favor of getting rid of pinctrl settings that
> do nothing more than mux in a GPIO, as mentioned in my talk at ELCE.
> Such settings are already implied by the interrupts or gpios properties.
> The fact that the OS doesn't enforce exclusiveness between the
> subsystems is not something the DT should deal with.

One could also argue that the fact that the Linux kernel happens to
auto-mux pins to GPIO is not something that the device tree should
assume. Personally I have never liked the "auto-mux" behavior of Linux
and I've found that it can get in the way when you need to do more
advanced pinmuxing, like when a driver needs to sometimes use a pin in
"special function" mode and sometimes in GPIO mode. The auto-muxing
happens behind the back of the driver which then needs to account for
this fact and work around it. Just sayin. :-P

