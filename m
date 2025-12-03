Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAC1D15DB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux8aZbZPgW4tpB1Y7z88VhDcAOYzDYj/EAgU+NDKuyE=; b=FTqQo9Tj2GKjMP4iGd9KExAiI5
	xJH4A1Bhh1QXHvewgWaxjryK6e6JJ/Mk6vYoF3wD21PZHjRmNXEPa2ouZeGwy1xMVS8RZXEqyuQrW
	YfArnPzbpojhmkO+g6sJq6gKE/LRbPmNcGXx8s8qqZ/Sfe/ooHH4QAyON+/ZxjLpBG6JGbDxX+V3V
	/2t+NPkrknmZij500JX5NzuSOxt6cH8bW/peMZx02UcevyWMFFnctXYwuKMLUkbFIJeFx4a/8bKnv
	fuHuXsQyHdX4jRIbvr+XTCyU6fVMrEru8qj20kjSTUr/rThINIy7SpVRpiVBPakZmmHKU5wCNcsw1
	C4lQehAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvYR-00000007DkQ-3S3u;
	Wed, 03 Dec 2025 22:42:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvYO-00000007Dju-3zAs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 22:42:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b713c7096f9so44190666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 14:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764801750; x=1765406550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux8aZbZPgW4tpB1Y7z88VhDcAOYzDYj/EAgU+NDKuyE=;
        b=i5wQbHyYo99v4B8V8hiq81IC2rBNzqx7s11Ut0LrAvxrFjuFrrI2N5CCujwklptiyr
         rt0LDaZe668DTBIuoNDTzvEm6GCYMkhzoNwevjU9GPX2MD/f853qCOGPewGnTGqZqCLE
         sPo4s0A/JfrhBzEAVv28sp0VRN7MQ3adG3ZMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764801750; x=1765406550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ux8aZbZPgW4tpB1Y7z88VhDcAOYzDYj/EAgU+NDKuyE=;
        b=UHBC1HJ5/vbZDDbAXTiIPm2xmiFClfzJXh9PXRJPoHUqLjc4qO4jXzqHFJgTU3CfCs
         9XZx/OQWxKFO4DoPnThwLhg3WjOvvnQ94DY1tR+y+ShaVT0aU2+jmDoiIkb9jAqZeVZT
         nIm2ZjojxR6jiHHvegIO13NXapzyF4O3+UC93V5hPnEItKHNvhVA6MP53WnrjZapXQ4X
         kl1aS9XevL3T2IyWzOx+e+5UOciz1rRMTUtF7XZpZxxmVjxiPEn9mTjQRq1dH/q0UPwG
         wBQ1FcoLri2acQVuOxCaKVymAKhHF6HEc4w+EE1E702JQNLrOj12e73Vxszz/KtCeKTO
         fD/w==
X-Forwarded-Encrypted: i=1; AJvYcCUCuZz3UMABz/wLLzrzbNYR0IBJrwWkAYOy9NjOtutlUW0EFpc7P2cpNGXIy+F7lMlv1rx5OFclB9xLBC8sctrN@lists.infradead.org
X-Gm-Message-State: AOJu0YyUqupyvUQh2vmcQQZO7+/IiU0Q3sx9gdw3xzo3vNuYz26CcVXK
	govT4h/4B8yCuDQMTpXiGI04OF9DoPaF7hqyLtlVDQYYBlYJE1lsoWFj4G9zTjjWFLrOAEKu5V1
	mcKaOqqkj
X-Gm-Gg: ASbGncs4B0pxlW2eDGH9S4SyE84cM0l4nr+fHtnJr63OwXMNzNmOfH/5cXueX+MXgzv
	Vht0b5fbEA4RDVVct3Pfa/0VN7jzm+DtPxB3qPtwCXFbharsvcWBUvZ2RPgUSIOL6RN674puGtN
	bcouDQ1Gyv8jRhQosYf04sjmB8/OmZsJqPYDVCY7RpBcOezZMOQtdBQBGxyt4TkH5zBTqZG0VYd
	uZI+j+bG0CElkPUTC8lFazphzZEbOIdQyCClsV3mDRq0oSBLFahqCLHyUP+Phc5F5smVhn8gms5
	koIVIBreHLeyUh0b6DqJ7lNSoQboNYMZQdmPItuiAQFx3wUhtRsbGoy2O0lUYtcw8bo7pBftOAO
	JMWMcEF55Hc5FoRkt77vQ6XmbwhfBWySWrSGwFdqU3qS7ZYYRu/oTFkPjC8RMnx6tmBDgwunsES
	WTVUgfsGE=
X-Google-Smtp-Source: AGHT+IH9cWfMFbvSpymCtWau078OaZ2Nrj+/bjzVvYiU5MKQpUR1b7Me00gLS4Vb/shnv0yKkOPuaw==
X-Received: by 2002:a17:906:1914:b0:b79:ecb0:db9f with SMTP id a640c23a62f3a-b79ecb0ddd0mr66286066b.55.1764801749575;
        Wed, 03 Dec 2025 14:42:29 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d26sm1893086966b.3.2025.12.03.14.42.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 14:42:29 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so348624a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 14:42:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFfB+m1QlgTXs76xaj/MgHE+931oqiE3Zg2yzzN9fHUu0XoFP9EOxDqhZblKQoFYg8x/xOAHezC9VzlTEfgqID@lists.infradead.org
X-Received: by 2002:a05:6000:1a8f:b0:42b:3e0a:649e with SMTP id
 ffacd0b85a97d-42f73172837mr4272908f8f.13.1764801447104; Wed, 03 Dec 2025
 14:37:27 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk> <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
In-Reply-To: <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Dec 2025 14:37:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wfu4ddQdTeupN+Md5Tv+5P1Up+Zo5U2AjGpqayTuqFhw@mail.gmail.com>
X-Gm-Features: AWmQ_bnIblbkwj1cLEC5h0WcUWlJmSIhOZHgYB3U9v0vApinUDHFAU4YsyhmX8k
Message-ID: <CAD=FV=Wfu4ddQdTeupN+Md5Tv+5P1Up+Zo5U2AjGpqayTuqFhw@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Rob Herring <robh@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_144233_047943_96D681A4 
X-CRM114-Status: GOOD (  47.13  )
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

On Tue, Dec 2, 2025 at 3:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> > as a set of examples. I don't see a clear way to generate these from
> > a fragmented scheme. There's a similar problem with the board-level
> > compatible:
> >
> >         compatible =3D "solidrun,cubox-i/dl", "fsl,imx6dl";
> >         compatible =3D "solidrun,hummingboard2/dl", "fsl,imx6dl";
> >         compatible =3D "solidrun,hummingboard/dl", "fsl,imx6dl";
> >         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
> >
> > These don't include the SoM information.
>
> So we're back to needing to merge compatible even though Doug was
> willing to drop it. Or to put it another way, there's usecases for the
> base to be different SoC revisions and variants. So I don't think we
> should give up on solving that.

I'm willing to take a crack at it. Before doing so, though, I think we
need to agree upon a definition of what the top-level "compatible" is
supposed to be. Otherwise, what exactly is our goal in trying to merge
"compatible" strings? We should have a goal of updating the official
documentation with whatever we decide.


I guess first, we should see what the spec says. The Devicetree
Specification v0.4 says this about the top-level compatible (which, it
should be noted, is documented _separtely_ from section 2.3.1 since
all of section 2.3 is only about device nodes):

> Specifies a list of platform architectures with which this platform is co=
mpatible. This property can be used by operating systems in selecting platf=
orm specific code. The recommended form of the property value is: "manufact=
urer,model" For example: compatible =3D "fsl,mpc8572ds"

That's not very detailed, but I guess we can start out looking at what
it _doesn't_ say.

a) The spec doesn't say anything about the top-level compatible
uniquely identifying a specific hardware configuration. Nothing there
says "look at one of the strings in the list and you can tell exactly
what product you have in front of you".

b) The spec doesn't specifically mention that one should include any
strings for a SoC / SoM / reference board. Indeed, the example given
shows an example "compatible" with just one string: "fsl,mpc8572ds".
Searching the interwebs, I find that this example "compatible"
probably refers to a Freescale "MPC8572 Development System", which is
a dev board with a "MPC8572" chip. Notably, the example "compatible"
didn't include the "MPC8572" chip.

c) The spec doesn't seem to include a firm definition of what they
mean by the word "platform". In my mind, one could interpret the SoC
as a "platform". One could also interpret a SoM or a reference board
as a "platform". It's not necessarily clear. Since AI is the answer to
all things these days, I asked Gemini. I asked what "platform" meant
in the context of the DT spec and it (confidently) told me that "the
platform is the physical machine." ...but when I asked if one could
also consider the SoC the "platform", it told me that was "an
excellent clarifying question" and went on to say the SoC "is often
referred to as the base platform or the SoC-level platform." :-P


How does that help us? I guess I'd summarize that, from reading the
spec and more loosely interpreting the word "platform":

a) The compatible string doesn't _need_ to include strings
representing the SoC, SoM, or baseboard, but it can.

b) The compatible string is primarily there for use by the operating
system to select platform (board, reference board, SoM, or SoC)
specific code.


That still doesn't really tell us when we should / shouldn't include a
SoC / SoM / baseboard in the top-level "compatible". It also doesn't
tell us if we should include even more detailed levels. ...and by
"more detailed levels", I would perhaps say that each of these could
also be considered a "platform":
* google,trogdor-lazor-rev6-sku6 - An exact model of board.
* google,trogdor-lazor-rev6 - A platform that has several SKUs.
* google,trogdor-lazor - A platform that has several revisions and SKUs.
* google,trogdor - A reference platform that has several boards.


Perhaps we should lean into the statement "This property can be used
by operating systems in selecting platform specific code" to give us
guidance? The problem is that we somehow need to not just look at
current operating systems but, if we want to strive towards the goal
of shipping binary device trees, we need to consider future operating
system code that hasn't yet been written. That sounds impossible and
makes one think you should cram as much info into the compatible
string as possible, but...

...actually, we only need to put information into the compatible
string if there's not an easy way for the operating system to get the
information elsewhere, right? If the information is found elsewhere in
the device tree or if the operating system can probe the information
itself, then there's really no _need_ to put it in the top-level
"compatible" and we'll never end up painting ourselves into a corner.
We could still put the information there just to make it convenient,
but it's not really needed. Does this make sense?

I would further argue that, in order to be useful, any given
"platform" should document its expectations and we need to be
consistent across anyone using that platform. To make it concrete, if
the Qualcomm SC7180 platform documents that "qcom,sc7180" belongs in
the top-level compatible string then all device trees including sc7180
should have that string. This _doesn't_ mean that on some future
platform (like qcom,sc9999) we couldn't make a different decision.
Maybe on "qcom,sc9999" we've decided to put SoC details as some
properties under the "soc@0" node. Now the operating system can find
the details about which SoC is present from the "soc@0" node and
therefore we don't need to represent it in the top-level compatible
string.


Assuming that all makes sense, maybe the way to document the top-level
compatible string:

--

Specifies a list of "platform architectures" with which this platform
is compatible. A "platform architecture" can be at any level, from the
specific board to the class of board to the reference platform to the
SoM to the SoC. A given "platform architecture" should always be
consistently included or not-included by all final device trees using
it. If the "qcom,sc7180" SoC platform is defined to be included, it
should be consistently included by any device trees with this SoC. The
criteria for whether to represent a "platform architecture" in the
top-level compatible string is the difficulty of the operating system
obtaining the information in some other way (including from other DT
properties or from probing). In general, the top-level "compatible"
used by operating systems in selecting platform specific code. The
recommended form of the property value is: "manufacturer,model"

Examples:

compatible =3D "fsl,mpc8572ds";
- Select code related to the Freescale MPC8572 Development System

No platform is included for the CPU since ("fsl,mpc8572") isn't
consistently listed as a platform.

compatible =3D "google,snow-rev4", "google,snow", "samsung,exynos5250",
"samsung,exynos5"
- Select code related to google,snow-rev4.
- Select code related to google,snow.
- Select code related to samsung,exynos5250.
- Select code related to samsung,exynos5.

In this example, the idea is that all exynos5 boards would have
"samsung,exynos5" so code that needed to run on "exynos5" could
consistently test for that "compatible" string. Similarly, all
exynos5250 boards would have "samsung,exynos5250" and all snow boards
would have "google,snow"

--

What do folks think?

Note that the current Chromebook stuff [1] we used on sc7180-trogdor
boards doesn't fit amazingly well into that definition, but it can
kinda squeeze in there. Essentially the sc7180-trogdor stuff is
designed around making it easy for the bootloader to find the right
device tree but doesn't provide anything terribly useful to the OS in
the top-level "compatible" string. At this point, I don't think I
would encourage others to adopt something similar.


If folks agree with the above interpretation, I think I'd end up back
to arguing _against_ the need to merge compatible strings. If we don't
need to put detailed SoC information into the top-level compatible
string then we don't need to merge. I think the most
flexible/futureproof would be to just define that for the SoC inside
Pixel 10 (and presumably all future Google Silicon) we'll put SoC
information under the "soc@0" node and thus there's no need to include
it in the top-level "compatible". That leaves us without a
"compatible" to put in the base "dtb", but maybe we can just put
compatible =3D "incomplete" or something like that?

I suspect that even for Russell's purposes the information can either
be probed by the OS or put in places other than the top-level
compatible string. We might not want to change his existing
devicetrees in case some OS is relying on the existing compatible
strings, but for work going forward it feels like it would be a
solution...


[1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html


-Doug

