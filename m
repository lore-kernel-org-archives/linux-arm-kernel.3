Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C20D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2aNNddcuFIhJPUpkq+i8i2OZABHzv6Jpaadi1Svrd4=; b=lvYI5nm22+lK/VZEBUEHfx0g4j
	9TY53myRSU+jcmxjDgiPoC8h5PzW5HIk1j+4JtuNvqpaSx+oIsuM4nHyPhgjK9/rat4Crbe2Gg2uY
	XEUnUpVNAElYW5LyQTDUbRb4dMIJcA+TpQr5KGSeHtHV3ZLxOOQYNBhCcfLOr/pJ/gtRKHdtcgOUU
	H7HSD1o0H+6RFd6kCf0E08JyWgXPiwzEg/wQ+lebigS9d5k6crDPmLTRicUQup8a4uc1H5/sUivUZ
	jrkGT1/kOhEqeRJk2cI79RAhSdIueZZfTyH2kY9/ewMDyIE4CJ2/WIBjlIoHJxLoEOL2tSfV/D21a
	eTIPYKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7vQ-00000004NBO-29ES;
	Mon, 01 Dec 2025 17:43:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7vN-00000004NAh-3MgF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 17:42:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7373fba6d1so711467766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764610974; x=1765215774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2aNNddcuFIhJPUpkq+i8i2OZABHzv6Jpaadi1Svrd4=;
        b=KLePfWXhcRd8h/RR2zsAFylQkO8GTgTssRNnT66cbmZ386dMkGcdRSFN9w7e3uF+pF
         yuoHC66M6E1bg9f0bvhYLiRCoAE/IFVPzQvQTHmiWhbZhbCB9a4QhOC2hhig7/9w/P7X
         8bEZJpVdgegIUdEKfT9Mnmb3bfOSAF/uk2FK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610974; x=1765215774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2aNNddcuFIhJPUpkq+i8i2OZABHzv6Jpaadi1Svrd4=;
        b=U5vILYYT0hJPu1JKXHPExZaHC0WJaFdBJMnOwNsYBeNeqLn61KM284/qYADi7tPmvY
         eqtqThAKLzq6pu8/cYOsCdVOccsJITc8yKQtL4Y4Uz7fDoYd5bk0qrsZFNeyBqQnMrV4
         J8GSmKHaQTU4ykcS5dUKm0RNX9cT3rt94eKU6wGbskL69/YkXZGflZqZtsxsYgfVR23Q
         Xw8vYX8J8SFmZHI/B1hdSKcY6MYZowNInqJbjL+piCDw/meCvdkSD2goStYWV3URRtCO
         szJKO39JySVSi7u1cxDGQmFRMHBJOUBa6n6ij2pU6q67wPWbYId/jBGGi1KpJk7uqnp0
         hK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFuzh+jOXXY2h1FJJW/YMJzyxSakbxrR2s+3C3y1IcOhzQ/0C3oWVez+lyn844IRoQ7vQLcTNvYGx/IUXt8ATB@lists.infradead.org
X-Gm-Message-State: AOJu0YxP74ztM7yvrK5rqAM9l2vZnA39KOnKthlcx6kUE+bjsJY5gmls
	mdsoLR1lRwtrpepGsbObWa0YEPg+tuh0ukzQmQO0foiUeemeS8zZda62MAN2v24hzTIb3AmUHl2
	NhNcRog==
X-Gm-Gg: ASbGncu9pmBaMADX9cNpk1z8k+MuM8Z46EdIqFfLlrNsnAtN7c/OaxJO6vf32UWja0z
	M/L+99xzzgi230DKPh561MoD9Nqwf2b8rQv38aiqEilegzbTvQ3H1HDz2bChTGBVovCR+3xd80D
	lyY27gI5MyFDUFPszS9i0dnVY0B8kAfXgTrATbwZ6BrZe2/d0hRacq6G93rzShGUmrFet/WlLHF
	tzSngxdL1ze+XqiAJ8v700MPyRtHQBggJJv012PYA0LAkB/oS8X3gyglEFanKFlR9IWIrmKes03
	h4ZKJX9Zwz1aYtUx7OoUuhH8mNBkenp3FdAiD2VmDvXopfQUEgd5/AQNOo1W5FXwCOF0wb/QITC
	RffPnfbmL0TvZtprwatD7NfG0BVuddtgFk3j/K4PtGGunjdfb+qCT1yceOab7bk+o1bCxknSaP1
	ThIfvg52PeGBAuasXNBOvSOTIkZmXcf+ZEUxtM/FS/hWeqoG0yeg==
X-Google-Smtp-Source: AGHT+IGnyFt2hZjzYOYco2VIMaMTjCVRJPM9W7+ZcwqJGzBKwxci8hfNFO2Wa1ptgpE+jTNTDST0Fw==
X-Received: by 2002:a17:907:7213:b0:b73:2ce9:fa76 with SMTP id a640c23a62f3a-b7671a469a1mr4437175266b.33.1764610973597;
        Mon, 01 Dec 2025 09:42:53 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm1269122866b.29.2025.12.01.09.42.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:42:51 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so46217515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 09:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVq1ctZasfLZBCxregqladUdPL9J8CJtVFzrYzRaEt5jrILtxZYGuyL6ICS2Y2cKR/Jmrq+ceMUAKFTqWTUhJOf@lists.infradead.org
X-Received: by 2002:a05:600c:3b01:b0:477:54cd:200a with SMTP id
 5b1f17b1804b1-477c110325dmr353054665e9.6.1764610971488; Mon, 01 Dec 2025
 09:42:51 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 09:42:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com>
X-Gm-Features: AWmQ_bklYYUuZ7Bfo2iuNXaW3ByDaQVvqRqdXPt8364JwFM4FAtgG6_fIKG39f4
Message-ID: <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_094257_898829_C3B4F9BD 
X-CRM114-Status: GOOD (  30.70  )
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

On Tue, Nov 18, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> This is a continuation of the discussion that started in reply to my
> patch adding basic device trees for Pixel 10 phones [1].
>
>
> Problem statement:
> ------------------
>
> We would like an officially accepted scheme that lets us more
> efficiently ship compiled device trees for a handful of related
> products by breaking the device trees up into a common "base" device
> tree and then applying "overlay" device trees atop the base to make a
> full and complete device tree.
>
> To make it more concrete, we'd like to build a "base" device tree that
> describes a SoC and then have the overlays be enough to make a full
> description of a board. In theory, one could also imagine wanting to
> expand this to 3 or more levels (perhaps SoC, baseboard, derived
> boards), though this is not planned at this time.
>
> The primary reason for wanting to break device trees like this is
> efficiency of the shipped binary device trees. A large portion of a
> final device tree just describes the SoC. We save space in the final
> compiled device trees if they don't need to contain as much duplicated
> information.
>
> A secondary reason for wanting to break device trees like this is to
> more nicely handle when a board has a socketed SoC that can be
> replaced with a finite (and small) number of different SoCs (usually
> revisions of the same SoC). Even if this secondary reason is
> considered invalid or too difficult, the primary reason still
> describes a compelling need.
>
> In order to make this proposal work, it's expected that a bootloader
> will understand the scheme and will know how to combine the overlay
> atop the base before passing a complete device tree to the main OS.

It's been roughly two weeks since I sent out this proposal. Do DT
folks have any comments? Are the goals I have stated understood? Do
people agree that these goals are reasonable? Is there any question
that there is a need to solve these problems not just for Google, but
for the community as a whole? I'm happy to reach out to people and
have them reply "yes, I have this problem too" if it would somehow
help. I don't doubt that there are still people at Qualcomm who would
like a solution even if I think Elliot isn't driving it there
anymore...

How do we make forward progress? Does anyone have any comments on
Julius's reply? At the moment, I think there are some conflicts with
what Julius would like to see (no changes to the rules for how
overlays are applied) and what Rob said previously (we need to find
some way to combine the compatible strings). Did I misunderstand? Can
we find a common ground?

Thanks!

-Doug

