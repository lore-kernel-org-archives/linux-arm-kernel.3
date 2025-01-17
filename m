Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B7C02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 07:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acBUeSMeLcUwdvAPh7XnIMxupIQjS7s3gcf5z1wzyRw=; b=ez+uwNwVGLfX2XK8iavRKhesIz
	+0AhJoeNFN5E/fufF1Pwp5FqJ+6ubDbekcy7FijX/lnIpDCgZDdP6HmeKUDMO9ui60yltyZ6CZhMJ
	9MpmZ4qEV+PL5NkimZASxIFHLmTx32TPiIwoyNew0ptSmZI5PYjyLH+xXz6ICqW/mFFrU/imMZwLi
	DHMdfQktSdAQOSTTXopIoq9KyHuwJA3+xPNnkGogQTEKvk6GxRaE1RDpTd2DJFtraHnQgNm6EineT
	hMhKddaEVXDb2J4BpArpFWGN/CMmPdzgI724hxqQDYj/OktzTHNDNINecpu1HMnAS1vhlGrN/MAne
	BDppKqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgkZ-0000000HCEo-1uLn;
	Fri, 17 Jan 2025 07:26:39 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgjH-0000000HC8G-3LRv;
	Fri, 17 Jan 2025 07:25:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so2620239a12.2;
        Thu, 16 Jan 2025 23:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737098717; x=1737703517; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acBUeSMeLcUwdvAPh7XnIMxupIQjS7s3gcf5z1wzyRw=;
        b=ODjuDfJR2bFefoG8R5v3cqFRN1mdzXlSOm9cJiz2XjVkYXix5o1PYcAfSKMz7/ejOM
         k+l8h7EAlPvAQgkidZJKBrYUM0yxGhv3txwTZQbJTDqyrpIwgJAF0GbW09d6U/EQoozu
         SfD9+97zJrBaeSFB8sIA0R3qaMtP5utS3JdJRS73/yabGlYDQVmysfDCgX8JM816Qcz0
         8tofuaYFvfkIIXps1RLfhplYFeOFycTrmRlYq/QU6FVQOaSosujQ1ncgV6fZUHsp6Eih
         +s5M4699F4hdbhwtlpvqRzTy820z6CiXUJjJqeY4tCbLbLXFpP0W8+oOMLMR4s6cWagz
         se9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737098717; x=1737703517;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acBUeSMeLcUwdvAPh7XnIMxupIQjS7s3gcf5z1wzyRw=;
        b=q+s6jlBwiHRau9O83pK49iPFZltplbe1FmJdjPiBXyh3JgK+VSZ8B5Cj6mpnfzbozR
         wP8ANFluSAz4L8TTIwmo3JFV2f9MYCi7pU1cseVCnp22/IOZWOCmDtb/U9rT2EQsB4tI
         U7Q/f83Q30POdWxai7r3cvJuKmCOut8QWkAIrWCdmeji7ZypR+zw4cIFTNCxsnHhJpfv
         bL4qDU5Lqrr0k1baLxi6GaZl5LZrkKqE87BX/cRuH/m4gZlFduUfMgNwZ18f7KVgfon3
         v83p3vmfN2yDUzIUVCY5vnVLX9AfpXY87Y2EHxRffESKdH9c/jqSplxGij6FW/jdO4BH
         wFQA==
X-Forwarded-Encrypted: i=1; AJvYcCUoIQu5bRQ6YcJUZzgRo/cY8pSz/OU688o0rhJQYWC8AjDCRew0boUnSdcx0OnhzYyP0tML0T5PgxVZ7JQ=@lists.infradead.org, AJvYcCVcXBdxVgVEWAWgyv3PsAvUAQvXiEybnPA/gK/8R5LCZQVQUzexI42crZSlD2YBvRVS0oPLgcg9kUyBsfkoVsLL@lists.infradead.org, AJvYcCW2JE8hL/QKz3YAj+SZJUGVokjEAS4UjyFJsKr1Q9ADGralxbiC6MDO7SVifHhuXg0z7Z4Ozh6cs/2x@lists.infradead.org
X-Gm-Message-State: AOJu0YyVjegepCTU2XvxEUudj49sklhpjjmL4Iv51M6IeHn9djHbF5Lf
	edIaNlGJuCVeVxziXxqtc5n4Cg+qhJtZz/Cm3usz3JrB8LRLA/7L
X-Gm-Gg: ASbGnctbHXfuLG1j+ujwC6LK6trsr8YUQfkWtJW7JbQ2zWJXBimCirty5pHzcn8MdqG
	TWT1dvHYyNGQu24FbXYnr2q4zvuRoxyPkmI93FyJygR0r67WKHGqF/56Mp6u0eQtLApJaAfQ4e9
	uz2+AkskT1lCLLbiFP0+TagXvlhVKgvL3BGyJUztQHsbDi0hgtsVMHBDS6vBCEFhqXI7qwfjGCB
	xP3TkMwP6gy1wF5YPKcU/uyJ+/I6S5ou2FXfPLgPbZRU+j5wbOQKNsGfR37n8HISAsgt51Seb/R
	2MiIbaDo6Y7mASOxIpQ=
X-Google-Smtp-Source: AGHT+IGePGJHVWxw4XwLV4zxZAGfulFMMCFa6UxYk4nNAptBEBklprrxVwXwqCG4Gi/JEQo6iRnv6g==
X-Received: by 2002:a05:6402:2745:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5db7db07846mr3557485a12.23.1737098717190;
        Thu, 16 Jan 2025 23:25:17 -0800 (PST)
Received: from smtpclient.apple (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce1a49sm124381366b.46.2025.01.16.23.25.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2025 23:25:16 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 03/12] pinctrl: sunxi: add driver for Allwinner V853.
From: =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
In-Reply-To: <CACRpkdYVTedEon0X-izvaDTGF6yRhD2s=Z6NEM=zBf4vD-T0Pg@mail.gmail.com>
Date: Fri, 17 Jan 2025 08:25:04 +0100
Cc: Andre Przywara <andre.przywara@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <686A634E-147F-4D73-A909-29FC0C20472C@gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-4-szemzo.andras@gmail.com>
 <20250114141954.2785879a@donnerap.manchester.arm.com>
 <CACRpkda0nx3SQtdjmXdCEbVJSWM10TM=p-6JbDjbiYcOSF5PxQ@mail.gmail.com>
 <20250115152635.1b89e7f4@donnerap.manchester.arm.com>
 <CACRpkdYVTedEon0X-izvaDTGF6yRhD2s=Z6NEM=zBf4vD-T0Pg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_232519_837685_29591624 
X-CRM114-Status: GOOD (  49.90  )
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

I=E2=80=99ve actually already converted the pinctrl driver to the new dt =
based pinmux, as Andre
suggested. It=E2=80=99s simple, get rid of those huge pinmux tables, and =
easy to understand to
add the mux settings to the dtsi.


> On 16 Jan 2025, at 10:34, Linus Walleij <linus.walleij@linaro.org> =
wrote:
>=20
> Hi Andre,
>=20
> some nice talk here, actually the following is just opinions, I will
> be likely happy with whatever approach is taken eventually.
>=20
> On Wed, Jan 15, 2025 at 4:26=E2=80=AFPM Andre Przywara =
<andre.przywara@arm.com> wrote:
>=20
>>> pio: pinctrl@1c20800 {
>>>                        compatible =3D "allwinner,sun8i-r40-pinctrl";
>>> (...)
>>>                        i2c0_pins: i2c0-pins {
>>>                                pins =3D "PB0", "PB1";
>>>                                function =3D "i2c0";
>>>                        };
>>>=20
>>> abstract, strings, nice. The driver handles the particulars.
>>=20
>> What bugs me about this it that this has quite some seemingly =
redundant
>> information (Who would have thought that the i2c0 pins use function
>> "i2c0"?), but misses out on the actual 4 bits(!) of information.
>=20
> the pins in this example are called PB0 and PB1 though. The =
designation
> on the package. And often pins actually named "i2c0_1" "i2c0_2" are
> for that primary function, but muxable to a few other functions,
> at least GPIO in most cases. So it's just some name for the pin
> really.
>=20
>>> That is like so because we are designing for users which are
>>> let's say customization engineers. If these engineers jump from
>>> project to project matching function strings to group strings will
>>> be a common way to set up pins, and easy to understand and
>>> grasp, and it makes the DTS very readable.
>>=20
>> That's an interesting view, and I see the point of it being easy to =
read,
>> but this is partly because it doesn't convey too much actual =
information,
>> does it, as it requires another lookup or two.
>> And the pinctrl group nodes are actually in the .dtsi file, which are
>> typically written once during the initial SoC enablement, and new =
board
>> .dts files normally just reference the existing pingroup nodes. So =
anyone
>> dealing with just a new board is not bothered by this.
>=20
> You have a point, and when working with a system the application
> engineer often finds bugs in the pin control driver, and has to go
> and fix the actual driver and then all the information hiding and
> simplification is moot.
>=20
> This can become an expensive lesson for the current attempts
> to push pin control into firmware where the configuration is
> mostly "dead simple" (and just using strings) - the bugs will be
> in the firmware instead, and impossible or really hard to fix.
>=20
>> Also in my experience most people have no problems in understanding =
the
>> concept of pinmuxing and that there is a selector number, also where =
to
>> find this.
>=20
> Yeah the ambition with the strings was to avoid forcing application
> engineers to know all about that. If they do, they are then
> developing the driver, not just using it.
>=20
>>> Mediatek and STM32 made a compromise by using pinmux
>>> and adding some macros to define them so it looks more
>>> pleasant:
>>>=20
>>>      i2c0_pins_a: i2c0-default {
>>>                pins-i2c0 {
>>>                        pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
>>>                                 <MT7623_PIN_76_SCL0_FUNC_SCL0>;
>>=20
>> Well, I don't really get why they don't use the (MTK_PIN_NO(75) | 1)
>> definition directly, seems to be more telling to me?
>=20
> That's what STM32 does as well and it's usable.
>=20
> But of course it drives a truck through the initial ambition that pins
> on all systems be configured the same way, with strings. So now
> there are some families of drivers all "necessarily different" which
> is not so nice for people jumping between different SoCs, but
> very compelling for people focusing on just one SoC.
>=20
> Well, unless this way of doing things becomes so prevalent that
> it's the new black.
>=20
>> So the plan for sunxi would be: <SUNXI_PINMUX(PORTC, 23, MUX_1)>, ...
>> And this would not be really "opaque", since it has a fixed known =
mapping:
>>        (port << 16) | (pin << 8) | (mux << 0))
>> I find this both technically elegant, because it combines all the
>> information into just one compact cell, but also readable by =
outsiders,
>> thanks to the macro.
>=20
> And a new standard, to add to the other standards, so that
> is my problem as maintainer. It makes sense on its own, and it
> complicates the bigger picture.
>=20
>> My main arguments against the current (string-based) approach:
>> - They require the mapping table to be in every DT user, so not only =
the
>>  Linux kernel, but also U-Boot, FreeBSD, you name it...
>=20
> That's true.
>=20
> This comes from the DT ambition to describe hardware and config,
> but not *define* hardware, i.e. to stop device tree to turn into
> Verilog or SystemC, which is what will happen if we take the
> 1:1 reflection of hardware to device tree too far.
>=20
> I don't think anyone really knows where to cut the line.
>=20
>> - The tables are getting quite large, and they pollute the single =
image
>>  Linux kernel, with tons of very specific information for a number of =
very
>>  pitiful Allwinner SoCs. At the moment the tally is at 145KB of =
code+data
>>  for the existing arm64 SoCs, with the newer SoCs ever growing (H616 =
alone
>>  is 27KB, A523 would be quite larger even, I guess 40K). The new A523
>>  specific pinctrl support adds 872 Bytes.
>=20
> This is a generic problem though, look at GPU drivers.
>=20
> The community (especially Android) seem set on fixing this by using
> modules.
>=20
>> - Most of the mappings are untested at pinctrl driver commit time, =
since we
>>  don't have the device drivers ready yet - by a margin. The new =
approach
>>  would add the pinmux values when we need them and can test them.
>=20
> I like this argument the best.
>=20
> However this also reads "upfront firmware to handle pin control is a
> dead end" yet there are people dedicatedly working on exactly that.
> (Not that its' the Allwinner developers' problem...)
>=20
>> - The comments in the table give away that something is not quite =
right:
>>                  SUNXI_FUNCTION(0x2, "i2c0")),         /* SDA */
>>  This is just a comment, so has no relevance for the code, but it's =
not
>>  meant for humans either. Yet we try to make this correct and =
maintain
>>  it. Odd.
>=20
> So i2c0 is SDA and i2c1 is SCL or something?
> It seems common, but yeah it can be confusing.
>=20
> Yours,
> Linus Walleij


