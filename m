Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E4D12679
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6N8ENlMp0JtUvDjwpbGXfIGBmY/pHGb1XQuUiLpAW3Q=; b=Kt2C3r4gI00HU9sVjd4YFIBhJ8
	8kY9VsLZw0cy35kQXY5n6TEEp9FlY/tyouINBm6P8tYP0FJjHEXDEAa6GESIq1wdCPsJTTdm4kU5V
	+zrLFwnXxj5vmnEKKKyl638oXSQe+W+L6xSqxyc9BZvhMeZFPMrkAl+VYeEC0MZ372um9rxAWr8+g
	Ss6poIHzEx3tfqRw3rU6k/XCMuh8dsUiv4Bh9YU87yKtJcPFlZtG2OF46TJLhvKDwEm310iQt495S
	D0W5hrSa5pdAwAJE/s43uUlPREZeHfzeMWI7dEofRKJeZw+Sr6++fpU0NSbspqYpgOEcZBSm4430z
	8w4DqjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYdE-00000005tNX-2i9q;
	Tue, 02 Dec 2025 22:14:00 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYdB-00000005tNC-3ych
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:13:59 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so7696591fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764713635; x=1765318435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N8ENlMp0JtUvDjwpbGXfIGBmY/pHGb1XQuUiLpAW3Q=;
        b=P41/PeycGlmphHFpIkI2W2b63+FOduFLeMnckeIVzeJx3lV7ivrqm9V8MomuEoRYGn
         kslcaaHMknraz+S8yAqsHQ+USSXp+oKDk+O+jgk7ewrhpxBKEt7cQGTQMqXsxA7LHQ0r
         +TRnjMiNeDtLmZKX4PS8J9Rax9pJt7HMGA/oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713635; x=1765318435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6N8ENlMp0JtUvDjwpbGXfIGBmY/pHGb1XQuUiLpAW3Q=;
        b=crxY2YfGMBof/UycdJqqYALB7+YsgOMyWjnmCoVbigLcG4O2IT1qvfn0R1qUqcn6rr
         vyl4B1DMQ59L/N1kyApHsW1Eln82zf6c97FaPrGJdmavfeYU8DCzihDPcMrUxvK719P8
         XuDdUPjsA2q+dIsktAldPVTgKFdVogdpS1dBWp9Q/ZV8RcwS5/R5Qvm0a/jD0FreKcaR
         VMbkRoTIYP47q6xD6gbq6zTDo19hOW68SElp80PWMD0iQ7oIoKhbkqClqPb0YWgjcX+e
         mVq6sQYc5Mbx7uBSikdc/PiBxhsDRGuVjf/FFNHGWDZ6tS+TVOJlwxiGcjh3JwrDV2ec
         u6wg==
X-Forwarded-Encrypted: i=1; AJvYcCXipDgvaBU5dbvIxR/Z0dL42zPmw8F8FRlNWRAlIhEQVaIpBAuk2r0OnCQ/JDJNFo/buqb985uNthXUk2Pi5T/9@lists.infradead.org
X-Gm-Message-State: AOJu0YxjVaXRgrWTlImGxruU/IZpPD+18kPkAT/gTCuP5+oqfDdOmq8M
	5lgc+iMT+MlNufdq8IVgfpF1ucq1NbyMTNkyz5ZNiGF6I2+6QvV0HWlmb3GubmqaKjPoeoCrDBh
	T9buJhWw3
X-Gm-Gg: ASbGnctwVfySIfeJ31UPca9Pwz+OlggpDzrvVAuEgDMuGkwQXGpOfdc89GrWCzJa8W0
	8VHi/siJpVGybtC6HjkeEM8pd3ET0MDSNMRGjqlNSW3uoKybjkqwAUvOmROnjJyROAvpwOTcepk
	y8+jz+BWOCgTvrQIns3xWINJfFzewOXM9VikwoviFykIWNUkzHEP5DrgdVrQsIXrfnGPX7IsAAi
	ogflYsM1i5fxmtvbhBYYHoUMsHHW7SaKlhgruPQ29Zl0EbgA+yCXffTB4SF8OlHpFv7nj3UMCyH
	nLXlQCrquF9fBY4DRLQuaRzmS3WOE+AnDsqeQszeWnYix0DpdIm+3/3TJ1fRXqpd3TtO0WWsLeM
	3l4DCYetlrZUQJUccekWlgc/W5LTp/xLBwaJLmvy+94+48DWuvWaJhejvlSzqtJtsYrOLpXAZij
	Bt2yn/rmLzkrPTUQiO0GteVGmEtu96MbXobGW0EjVgNQEO4XKq3A==
X-Google-Smtp-Source: AGHT+IE0iarK5PNzPjSxKRoAmVjnsEGyXnar5Or47tkRINhxHoP1n3sJECdw8/B1SIOljkJk/5vgvg==
X-Received: by 2002:a05:651c:2051:b0:37a:4c29:3aaa with SMTP id 38308e7fff4ca-37e63743ea7mr707031fa.12.1764713634612;
        Tue, 02 Dec 2025 14:13:54 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2410e060sm40564161fa.44.2025.12.02.14.13.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:13:54 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5942bac322dso1065999e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:13:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1VmsN0+GNaQXy79Sl7gqQ40KqOHaeSoWBNSCLJLS4dWLfi+caPwB500wJBeCYhATmD7dJ2VzlGloughnWkR4d@lists.infradead.org
X-Received: by 2002:a05:6000:4383:b0:42b:2eb3:c909 with SMTP id
 ffacd0b85a97d-42cc1ac98a9mr45463866f8f.20.1764713260943; Tue, 02 Dec 2025
 14:07:40 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAFLszTiVT9rHwympUJSehxaDR7ks9Bs2FVjYEuN6=j1e_-289Q@mail.gmail.com>
In-Reply-To: <CAFLszTiVT9rHwympUJSehxaDR7ks9Bs2FVjYEuN6=j1e_-289Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:07:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vrit=N6L30dA3X6uV95e5E1bVoLph55_=ihqSTBy52FQ@mail.gmail.com>
X-Gm-Features: AWmQ_blcEODuHNOTfASjHIB_XmBuUPaulzfzl56_GN_PjmcKkVckIKFg3FzvIbw
Message-ID: <CAD=FV=Vrit=N6L30dA3X6uV95e5E1bVoLph55_=ihqSTBy52FQ@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Simon Glass <sjg@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_141358_047656_60F3614F 
X-CRM114-Status: GOOD (  29.00  )
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

Hi Simon!

On Tue, Dec 2, 2025 at 12:07=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. Allow the top-level compatible string of an "incomplete" device
> > tree to be documented so it can be validated on its own by tools. It's
> > understood that this SoC is not a board by itself and we'd never boot
> > a full OS with this device tree without adding an overlay that changes
> > the top-level compatible. Add a top-level property to the device tree
> > (perhaps "incomplete-compatible;") to indicate that the tree is not
> > complete without an overlay.
>
> or be more description, e.g.: compatible-scope =3D "soc"  - or just scope=
 =3D "soc"
>
> In other words, I don't think we should be frightened to define some
> levels (soc, som, carrier, exxpansion, chassis?)

Sure, I'd be OK with this if this is what DT folks want. I don't have
any strong opinions here. NOTE: something like this would only make
sense if we're going to introduce new variants on how we apply
overlays (like merging compatible strings).


> > 2. If it turns out to be needed (hopefully it's not), allow some type
> > of syntax in yaml files that allows a property to be marked as
> > "required" in a "complete" device tree but not in an "incomplete"
> > device tree. Alternatively, we could discourage marking properties as
> > "required" if they're expected to be filled in by a board.
>
> Another option would be to validate the soc DT with a chosen board,
> just as a workaround. It would probably be good enough.

Sure, though I think Rob and Krzysztof are pretty interested in being
able to validate the SoC DTB by itself. I'd like to at least set that
as a goal. If we find some reason why we _truly_ can't achieve that
then we can talk about relaxing it, but I'd like to start with the
more aggressive goal.


> We don't need to worry about old bootloaders since they presumably are
> not installed on new hardware. Assuming Linux adopts this proposal, I
> am sure people will implement it in bootloaders when they need to.

Right. IMO if we have to make changes to the way overlays are applied
and we can do it in a simple and backward compatible way, it should be
OK. Only new bootloaders would be able to take advantage of it, but
presumably we'll have to modify bootloaders a little anyway when we
standardize on ways to pick the right overlays to apply...

