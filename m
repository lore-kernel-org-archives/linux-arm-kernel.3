Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8661CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=; b=U+hpctDnpY73UrMogPNRuZZ50b
	fUvD9zaM4FuF1BfimIZ6DEHbGVPUeeFnHxbDK6zMALU7jfaiqtEyNavpnnCXUzWv4kW1H80ul5l6M
	K5odeq9tQqDwzpxcPqFw6S9YnITL7GxxWIvsSyWBDrx8441pMG2oc0MnjdlekUYVuwNMv8E/NwKVZ
	CKNC4y7sN1bijljj2NCqsnpnZVhW32Mlh+hZsLMAcRtWxHD2BYOQojPqzRvzpdbBh5AwX4k2+ukY2
	j6DFThhoq0XDpkjBKuWPQxB5dplGH5El5FbKbVXwaTOzD+tIDzT6QjrDnx/Ne1yUQ864Lvz7J36oJ
	sZ9Td/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSIZ-0000000Dq6d-1ckl;
	Fri, 21 Aug 2026 16:40:55 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSIW-0000000Dq6H-1nkE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:40:53 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so598539241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787330451; x=1787935251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=dfUvllpOPynZtFPP6TR7aT2w/gHNKzNgYvqtTbVsiJSVodSlGUzejJ0s6SZjkQMRuF
         8zpKfrlXEdzecFzk4C56PCHOgvrqSqp2acl74JMDgT+YfHGtOsp7Z2ZLq5rf+tIKfpRA
         L6gnAOWOHNA4efIADEZEfhMobhdIY1OEqjbUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787330451; x=1787935251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=CHtpiRmkv5y858FT+0M3P0LT61nMpbukC9JDulqMRAiLgZk8X0DPFiJk0meV9AHM9n
         LtQgzIjQAo0UoBDdwyBJmQ9/wIRM6/1Ctm74LEI+/jGMMeDF3+ZIhnOuPDPP0XjZoUjc
         faOcC1q4C/gEqE5UcdClkFuR6CU5mEAclkHfGwiP/BSn4PStG/GM9mRNLyb4tBpSJurk
         5k7PGf+x9PNsPLTOT5vSqw3YQ+9dZaGMRldwWKoK5xlbDhrqweV5VqJ39WkNMxKhNRfA
         KcwoEPCHPXD3KY7Or/IdeR2ZFHLqQdzq8TeUErGmJ/az4+1wi5ptaPrqLZEn/3/z8DhK
         sLcw==
X-Forwarded-Encrypted: i=1; AHgh+RqsJIq/uhaJU6GuP8lXGoJXxvn/b1Oo51+krY5DHDh1xnmk3bdgFjnp2awv3LOEGfS8JXDUNsJCVvOrCIJpTbca@lists.infradead.org
X-Gm-Message-State: AFuF++k3nagmgwKQ6597Bgnn5wCUuXQTj/r7MeLL5wwEB1RfRUUiNv+p
	89lqPbf71EPk45Wvgb8DY0Z69QcKlUZDPUUq8UDvX83iQ6B/Aiz8l/3hj607jHlf6wkysXeZkra
	bA64=
X-Gm-Gg: AR+sD12Rmr1w12X0DwDRqtDhCYXfpeGcqw30It3L2x+HQA4PbDyoPUXAW1rdPtw0mXl
	VW7g1aIimj16acXaBmUucSPWBGlDVGtc1YSWSOWFys6NchLDnTEEJbvBfrZ3mPSeZFS8vJDgoeg
	RmGh5NJ5b3PbIeZaocy6t2CyJCET/JQlre427kb5cRNd81/aV+eqPV2JydOlfAFc7lSLGaLexb9
	Pi6soWMefoPse/CL7NwyBnjmQ0r07HaQvgQUgbEEYR7OrF7NH+KCBxAkh2mKr8wkItFf6mskGyZ
	61nsct/4rXXS4bBhrX8xByBYqISQUEKDyOCWvsRM4XJ1/qgiOWqT9yHx19SoVuWW5+qLCnPNdIG
	7lIDlo9ngpIdphYQ79z7KHjtVDhSrgilT9fgeDIYh4kJ0SxrUiIB5ZBbjY7IfBYGm1cPLsJdO0A
	80HJ67dmpERATjFb23JvysCQvYs1Olsxf8fPhJIK5zC5k/YXOO2WAsgY0O9Ekppv9dhl0eUHts+
	tV5gSvLJDY7cya3nRdn76JDpobkkyE=
X-Received: by 2002:a05:6102:3e85:b0:778:7:4699 with SMTP id ada2fe7eead31-77a61628725mr3120506137.8.1787330451047;
        Fri, 21 Aug 2026 09:40:51 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777db599311sm9493245137.5.2026.08.21.09.40.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so793702e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqkl1b1OH4whMTvaFRrKPczSmDdmjBjaXtDAb4Z17qYa2Cei3BWcIkRGTCGU9riq9/fK5bnHynBtzRudFGfsg6h@lists.infradead.org
X-Received: by 2002:a67:c996:0:b0:77a:9991:5d08 with SMTP id
 ada2fe7eead31-77a9991cec1mr1941674137.9.1787330449569; Fri, 21 Aug 2026
 09:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org> <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org> <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
 <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
In-Reply-To: <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Aug 2026 09:40:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
X-Gm-Features: AcwNN1WVXS8N4-UYjDXHL5iUmkkapXer1429A5JjKjwhm2wT5WS30SWZHssAmw4
Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_094052_528221_B1B6488A 
X-CRM114-Status: GOOD (  42.02  )
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

On Thu, Aug 20, 2026 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>> I think I've presened my problem fairly concretely [1]. If you hate
> >>
> >> There is no description of the problem at [1], except "bootloader adds
> >> the same type of calibration data".
> >>
> >> So I repeat my questions: to every UFS node? To every node? To one UFS
> >> node (but how do you guarantee that?)?
> >
> > I'm sure it's not what you want to hear, but I guess my answer would
> > be "for these boards".
>
> No, the question is how many aliases you need. Devices might have more
> than one UFS storage, e.g. ExynosAuto.

How many UFS aliases do I need for this board? The answer is in the
patch that started this whole discussion: one UFS alias.


> And then someone might need to calibrate UFS and SPI NOR storage? And MMC=
?

Not for this board.

If you're asking about all future boards, of course they may have
other things to calibrate / tune. My point is that the contract here
is between the bootloader that will be run on these boards and the
device tree that will be run on these boards.

FWIW: the idea of a bootloader using an alias to find a node is not
something I invented. Coreboot (the upstream, open-source project)
uses "wifi" and "bluetooth" aliases to find nodes on Chromebooks. It
uses these aliases to place MAC addresses (which are stored by
manufacturing outside of DT) into the DT nodes (where bindings expect
them). Perhaps coreboot is doing it wrong, but this concept isn't new,
and I didn't invent it.


> > I'm not quite clear on the "overlay" suggestion here. You're saying
> > that we should require the base device tree to be compiled with "-@"?
> > ...and not because we necessarily have any overlays upstream, but
> > because the bootloader will generate an overlay dynamically? Compiling
> > with "-@" would mean we could give a "ufs:" label to the UFS node and
> > with "-@" that would be preserved. The bootloader could then use the
> > "ufs:" label to find the node. When compiling with "-@", the exposed
> > labels are essentially ABI. Did I get that right?
>
> I am saying that if you cannot answer my questions earlier (and you did
> not)

I'm still not quite sure which question I didn't answer, but I guess
at this point it doesn't matter.


> thus this should be treated as adding calibration to multiple
> random nodes, then essentially you are reimplementing overlays and this
> won't be accepted. Instead you should use overlays.
>
> "-@" will give you the labels in __symbols__ section, but it won't be
> treated as ABI because it is not feasible. No one would remember which
> boards have @ and which don't thus which labels are needed externally.
> Only a comment in DTS code would prevent it from being changed.
>
> Well, same for aliases honestly. There is no tool which would guard that
> ABI.

Given the above response, I'm a bit baffled how "use overlays" helps.
Each individual board will have different calibration data. It's
presumably stored in something like an EEPROM on the device. The
firmware is getting this data out of the EEPROM and putting it in the
device tree. This puts the calibration data somewhere the Linux driver
can easily find it. This means any "overlay" would need to be
dynamically constructed for each device by the firmware. In order for
this to work, there has to be _some_ guarante that the firmware can
use to find the UFS node and add the calibration data.

You are saying: "no, there isn't."

I suppose one answer here is that the UFS driver in Linux could get a
phandle to a "NVMEM" device and read it directly. ...though it might
not have permissions.

I suppose another answer here is that the UFS driver in Linux should
somehow figure out how to directly query the firmware for the info.
That seems unnecessarily convoluted, though.

...so I guess the answer is: time to hardcode the path in the
bootloader (shhh, don't tell the DT maintainers) and end this
fruitless conversation.

-Doug

