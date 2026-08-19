Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 23:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=; b=Ll4h4MDMVZUUBczs39VLbfU9Hr
	MhWwxMdVlwS6WPndv/nvOyT2Sg11tn9U9gXi93S0+pixOvuFitAHGq91CO8yFdSkfGiTi/R4BhOGY
	+b2XP+Z1MKJ9c0v+KV32Icec1260tDgqf/bCU/cDFmkFetXT1bOgCOKOYJLYOSV0OqjrTns/gIQ0t
	C+2ajiNtjOLZsOwDCKhOer65ZpyDmnxUe9xssLGc4yeWpK7QjRqrLSOS7TELL0huPlg6LLjIaRcPQ
	37jccM9tThLgJxRK+G8h/0fbboTs53SHjPrykRZfJ9a4Tg/UFyAeZHx7g8d0ZHWHnC3bjdWwfT5wu
	YVAHCZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpzI-0000000Ag2k-3K8l;
	Wed, 19 Aug 2026 23:46:28 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwpzF-0000000Ag27-2qJO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 23:46:26 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-66c7e3a2332so1379585d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787183183; x=1787787983; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
        b=ntaBtGyD3HytKR2aKAD4j8AiHX/4hhjGj2bbAUeuJUWKAMd8A5rbJbV41b6XLRfTZL
         NWCkAuL8Up9uvp24/Yfcygb8dJIE1gCXFLoyYzjRmBkxTWnUrzGlkGsuo6R1M/qiIclB
         emqtcRej2nnbGhqyxwWuPCpvi2qJGZJ9HvKDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787183183; x=1787787983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
        b=a5ShXYu+3U4nVc6uWvHNieyOh4OtqIu0HjP+z+6WgqIaR2fuHneDAxYoSWqJ2H6HzJ
         9OijdRkzCyT+vroXvBosVwCnY4AFCb+3g+qpLGoPMXYeqr/qYG+PMSCPr+uLHIdGojub
         jM83zx3U+wCGTiKRCXwWD1X+bP82wm+205zU4l9k74M8nPuLtaEI0/QUbLcVoK5CnTek
         R/PxR4VQgSwM0n+aSc/oZpb0wmMk/qlIr5W7NYu0Li3JMxxsV0b/cnRxKcp1XjCQtPw/
         brDZvs3Y2hyYgaN7SsgZ7cc059p7xQ5qKsdPUTc7gsaelQzxavTWKjPV+Shp5kDU0tFr
         RSFA==
X-Forwarded-Encrypted: i=1; AHgh+RrM6WQ4i1dpwKFgv3v8wj5hjnDpy9R7xNVPeGCeXqjI6QQDkxtW6kwc6EutejLN8tK/94iaJobHfeeRbHd4ULIY@lists.infradead.org
X-Gm-Message-State: AFuF++kj8EJ8cKaACYak+crKUY8ez8uLLGYxh8wKVKSo7KgPXlQvCKMm
	WD+KPenPH6nsutDwjWWHzmOzcR7y9SDhRkro+5fDD00sxuIVwx+gxo4Q8u6m40jfLjPPGddcR5Q
	dWxo=
X-Gm-Gg: AR+sD11Wy2vPf1lwhb8Yku8BzPy8MUZw/ukuxEfF+ZK8NW6H4mnYaDINHenJhbaBvcz
	bXDT0os62fAR92pqgRXsyccZm1p2gEQZ13D8oPLXb+36t1MsrUuknL64VJuZ8IdgXHykxivVQTB
	SlxGpaObIYJze3cFjmOLtjjf4TQkx2DTpF1a5qEHmEXbLyHBh7pYY7pwJx41510r2o2pdZFX+LE
	RFL9G89KMyZqxZnHHTpKbKXvPl6CwH3+DlXacpl72PaQv6UUr6pi48kz9B849fxFNZ1L1rdqr5A
	atOAHGC3MObVeOe1T5ZO2Uq/ENbqvAx94h3Pz0frOHIjfp98Baq+RZuWG1dIP3cLCquT8CrJiTK
	kaWdlIVlS4fQonQWoTDYFAVvti+SigiMn9RyNitj4YIWLDrA1bUu1guXmzmzncYGnZTZQQ8ypXb
	NTH+rnrOP0MiyGJV6b02o3DUCuGgz2kuHJyQTgb4fdwxdjJ6Y5J5jWGeJ1JnagYrvKYDHRYXiuw
	VY2xMXF6zCAPi8PFRAWdWEXjop0Pas=
X-Received: by 2002:a53:e008:0:b0:666:515c:5222 with SMTP id 956f58d0204a3-66ccb659a32mr2502931d50.29.1787183183490;
        Wed, 19 Aug 2026 16:46:23 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84511abb2bbsm16757647b3.5.2026.08.19.16.46.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 16:46:23 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e6391b114so139327685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 16:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQ8au+nI7KoHX6cv+1Qlzboe7j6GBBgP9D+L7n/zAHQIxj5wtYiAhi/8fNGrb70TfQIvBloTr4nsAGzVeoQWkD@lists.infradead.org
X-Received: by 2002:a05:6102:15ab:b0:777:4e3a:8dde with SMTP id
 ada2fe7eead31-777fab9d4a7mr3615810137.11.1787182853246; Wed, 19 Aug 2026
 16:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com> <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
In-Reply-To: <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 16:40:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
X-Gm-Features: AcwNN1UHCTu0dpSrOeIjoA8l2gjjfO6Nzx_OO7IAuQCNztYoKMKLEde815SfxYY
Message-ID: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_164625_785345_402E6530 
X-CRM114-Status: GOOD (  35.36  )
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

On Wed, Aug 19, 2026 at 4:29=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Aug 19, 2026 at 7:03=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
>
> > I appreciate your suggestion of having a separate node for calibration
> > storage. This feels more awkward to me than just giving up and having
> > the bootloader hardcode all known device-tree paths that the UFS node
> > might be found at. That being said, if everyone says that this would
> > be a great solution, I could try prototyping it. The trick would now
> > be that the Linux UFS driver would need to be able to find this
> > calibration data, so the Linux UFS driver would either need to be able
> > to find it at a specific hardcoded device tree path or the Linux UFS
> > driver would need to search the device tree for a specific
> > ufs-calibration compatible string.
>
> Can't you just put the calibration data as a custom property inside
> the UFS DT node? Just a long byte array or whatever it is.
> The driver would certainly know where to find it that way.
> I don't know who or how it has to be put there during manufacturing
> or inserted by the boot loader into the node from wherever
> manufacturing stores it though. (Assuming it's some calibration
> added at manufacturing, I don't exactly know what it is...)
> If the actual storage place is in something the OS can read
> then we could probably use the nvmem to fetch it live?
>
> The calibration business and what it is and where it is stored
> evades me a bit...

The problem we're facing is _finding_ the UFS node in the bootloader.

The device tree for the board is stored / maintained outside of the
bootloader codebase. It is compiled and stored on the device. The
bootloader runs, locates the device tree and then wants to make
changes to it.

The bootloader needs to _find_ the UFS node in the device tree in
order to make changes to it.

The question is: how does the bootloader find the UFS node?

* Does it hardcode the DT path to the UFS node?

* Does it use an "alias" to find the path to the UFS node?

* Does it search the whole device tree for a certain "compatible"
string and use that to locate the node?

Hardcoding the path is the easiest thing to do here, but then the
bootloader will break if the UFS node ever changes. We also know that
this path will differ for every SoC and is currently different between
the downstream device trees and the upstream ones (because downstream
device trees don't have a "soc@0" node). I've also been told that
device tree paths are not ABI, so hardcoding paths in the bootloader
seems less ideal.

We could just hardcode the path in the bootloader. If this
conversation goes nowhere I'll just change it to do that. If paths
ever break, then I guess we'll just have to get yelled at when folks
say "Why in the world would you hardcode DT paths in the bootloader?
That's not ABI!"

-Doug

