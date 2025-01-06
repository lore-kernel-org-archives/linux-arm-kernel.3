Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADABE77199
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItfAlhegRqUnAayH03vNTd/Xo24KQrqpjT4xjTRai64=; b=mYClpHJTqP8/rlKWAYnaviprus
	w6CBQTereU2Hp7TgA0QXlX8fdFSbG75rIFrxs5LOAHLr1Y4sAWIpOzCrGCe0TL8pCqJ/jKGOEVAUU
	vs61gC4UfxL46VUghCCs2ADvFumxinUjF/SzAzFC5H8JFnLPO3sApCsK6zZnscks2Y3MUcvI8m2FM
	sXGP/3QvXzZVDKYQOO0Sj2EwUeJZ0ecZgviY2thTCefek2M1rlP+rCK+BloLOKhpL4ED1VJwEsLsN
	wOV9a723xO+UgZz9Xidu4RQwsSCGVQ+oqwYTujd6ie9bsD3P7dPS3awF1dwJ7scXYJ5ERNY+pEX37
	W2WUu5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoSP-00000001ecM-1WKd;
	Mon, 06 Jan 2025 14:51:53 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnPu-00000001Rqg-1gte;
	Mon, 06 Jan 2025 13:45:15 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso62344515e9.0;
        Mon, 06 Jan 2025 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736171112; x=1736775912; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItfAlhegRqUnAayH03vNTd/Xo24KQrqpjT4xjTRai64=;
        b=IF7QCQRtoIS1DCg5ifXPAXcEpQy9eC4iVOVR/SvepKSE4vTUai+QcK77aLoo33868U
         AriuVDQ5X5zbX5F8u7xJYWVB4ud6CuAdok0O8Q5v0Xncu1TLnzGWJTt9EcQBJ2hgmOO0
         MduUF0Gw2TClyqKGX453Q9stAHueGKAHUtyj4a8+67rEnmyZFpv/3rh0Btc2mLEEICI4
         Fls3PytRuGRNE+fmvxKsGcVvyjXuVK7YztuPpI/LnmDBm7iLpeHXWkgvoHEQ/TrHH3QP
         5U46n9KDdOZkU+Z5c7DXm2xiCfuXz6E1MnP5DztaewP3ivC7OXJkswhsHKyyk6XBsAbo
         aYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171112; x=1736775912;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItfAlhegRqUnAayH03vNTd/Xo24KQrqpjT4xjTRai64=;
        b=s0i3V4Wk6VLEcPDr/aVCKRtDMzmhLz+YsPJauuCu8VCPCnbc0TWA2GEBs/TOyAT7tG
         A7KQLtQ6e54E8R3+ixqn51HyXt5DG0H76SM+R74pYfNUa7p09r9aawy1fHMbke7TLypN
         pxMKqVhr4Hykpfa8pDlc9MzDnUTEwOvwxze7LdOLT+WKLM0JLTGd46mzfuCsUM4nx5kt
         Q2POwzjQh9PTxahGysIfshl1lZBeqV36v1FCjrbiAv+q8LJqsB4xQfWw3/k++8qmcXjH
         SVE7OBDgRz/WnqceNdvlbDYEAzjTlMBJFUuDwf+5BAYhWQmAI+ZDICsfYN571/Q9EXVq
         RFlg==
X-Forwarded-Encrypted: i=1; AJvYcCURhnUubYcs5Cf9LIFi5Woab4CZt4KYj5EsAtmJMYDMlUWjOCs5hjJWz3CDZ4UwSiFs1MLwxL1OxL+LlnxGe2KJrA==@lists.infradead.org, AJvYcCXV1udzgH663o1WcrRZA9qwl+QAOSwwpuUSUS0QuprgMLfiKXkJsukN2hONnK/g1iJNE+OBcjDXdomb0oQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YzZWMQB54EtpGPAoiefAiBKXn1L4jyxV9UlWka6Dzh69KADoH8m
	Hh7hZWyOq4dbcahyyOIQgfAz/VfZ9DFAbP/M9D9Etr0DKSPZSXYW
X-Gm-Gg: ASbGnctm1LnleO9N/xrNKgWpGQnaerPt3wuYr0CgJKI1551YMKmYptxkx1ITsec59m2
	G3gaT6rN87K2GzxCsQWGNe78CVqVegDEFElAEgtBy9+TwPd1yFtiIUT0GIGlR/HGtYqOnWsZEPg
	77aP+7SO1ZcR0C9TKQD66vv+IA70UAaJQFuiRyFuKQ6irH3iWAwWvZ0P9erOkl6DeNR/3W4SLjA
	duEBtHZQaTGyYvOvHXoqz/lDfeNTY9B52wULb0tLvBcYM9k6CyRzif2e8ZHiQ7kpbX8fipQ6JUv
	FGQ=
X-Google-Smtp-Source: AGHT+IFpYq7jObg5i1HWdwSt3YUPjDcKdkOSTUzwLSeVbBRKvKflO+nH3UXeFLKIJPIauB4ckmahgA==
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-43668b783d0mr462344865e9.29.1736171111550;
        Mon, 06 Jan 2025 05:45:11 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474c2sm47324663f8f.55.2025.01.06.05.45.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:45:11 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX SoC
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCBxaVet9HxW98uCSDnv1XVXV6r4V9Z3BRmZJypTcxDZ0Q@mail.gmail.com>
Date: Mon, 6 Jan 2025 17:44:56 +0400
Cc: Jonathan Cameron <jic23@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 gnstark@salutedevices.com,
 lars@metafoo.de,
 robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5CEDC847-2653-42F3-A85E-A06D6E5DB135@gmail.com>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
 <20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
 <20250104135912.390ec87c@jic23-huawei>
 <CAFBinCBxaVet9HxW98uCSDnv1XVXV6r4V9Z3BRmZJypTcxDZ0Q@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_054514_438506_E9DE6726 
X-CRM114-Status: GOOD (  25.01  )
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

> On 5 Jan 2025, at 7:49=E2=80=AFpm, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Jonathan,
>=20
> On Sat, Jan 4, 2025 at 2:59=E2=80=AFPM Jonathan Cameron =
<jic23@kernel.org> wrote:
>>=20
>> On Tue, 31 Dec 2024 20:42:07 +0100
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>=20
>>> The SARADC IP on the GXLX SoC itself is identical to the one found =
on
>>> GXL SoCs. However, GXLX SoCs require poking the first three bits in =
the
>>> MESON_SAR_ADC_REG12 register to get the three MPLL clocks (used as =
clock
>>> generators for the audio frequencies) to work.
>>>=20
>>> The reason why there are MPLL clock bits in the ADC register space =
is
>>> entirely unknown and it seems that nobody is able to comment on =
this.
>>> So clearly mark this as a workaround and add a warning so users are
>>> notified that this workaround can change (once we know what these =
bits
>>> actually do).
>>=20
>> So IIUC this is to make some non ADC component work.
> That's correct
>=20
>> How are you handling dependencies?  The ADC driver might not be =
loaded or
>> is there some reason it definitely is at the point where the audio =
driver
>> loads?
> Unfortunately there are no dependencies at the moment.
> To me it's not even 100% clear if those bits are a dependency for the
> audio IP or if they are instead linked with the clock controller (more
> background info: some of the MPLL clocks are - at least in theory, in
> practice we don't use that - are also used as input for the Mali GPU
> and video subsystem. The only practical usage that I'm aware of is the
> audio controller).

In my testing it makes no difference to the audio driver when the adc
bit poke is done. The audio driver probes and loads and you can play
media without generating any visible errors. There=E2=80=99s just no =
audible
output on GXLX until the poke - it=E2=80=99s like hitting an un-mute =
button.

For the series:

Tested-by: Christian Hewitt <christianshewitt@gmail.com>

Christian

> Christian and I have both tried with all of our contacts at Amlogic
> but did not get any answers.
> If I knew the purpose of these bits I'd model them as whatever they
> are (resets, clock gates, ...) and provide proper dt-bindings.
>=20
>=20
> Best regards,
> Martin



