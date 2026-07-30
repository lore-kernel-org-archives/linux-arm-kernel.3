Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F549C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=; b=V/OagZv/7BAesFcUarrznXZS1A
	8po1UdD3sN6yCdg6P5EFXHE5cseT7XaTBa5SR3tPO9P7MVRoye6uKjGgN7CWw/AzbKf7rox3EtY4l
	GWXPpv3M8ck3U6DyhTQwuktypJKbIuIKsde+rBBuOc9F52QCX4Do5+mR2xHPaZYQJHpihKLwMPPmA
	Tp6weF38m3Ikr26R7olfZnjDYDUxyiDBU3reJJgWZdIrjNrUu5PK9fFVu/s6C8j90d4pmzSqLUVV1
	JwiFsNbrA++hxPt9B9aXFIzwSlvZU9Yrt+DqRVD7aecmA1xHXAG4wHu4b00dxX2ckuFwApfnWbrPc
	7+eeutVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaKc-0000000BVwI-0kBG;
	Thu, 30 Jul 2026 23:38:30 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaKZ-0000000BVvt-1s6w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:38:28 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6689f36ae56so450774d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454706; x=1786059506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=A9xrEHWAClFpK6LAkj61G70WFxTDauEH6W/VNyRRf1pDMqI2afg8nypFSqiqmugVYi
         mH7TgOBMM3y02Zu0Z6qkbkgFZNE1tlOAj7TUatnaA88gHZTel1YPDj7ZmMjYsuemG2wP
         /fWcPWhAhBhkbZFTlZRJY9X1vIqqguzTXLJb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454706; x=1786059506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=p9E5G3NqOI6Un42W2+P6HeNIYGX65ThTPOA3Us6GTEEV4Lb5fIIwxKtp4fZ2K02qsJ
         UdzfT+FG3RBQxkL95qewkYAfmuaVLHyGXqnJgagcDd8fAKGJYhRIBcHouLghfr9zOXRU
         TLM//7eaC+3SMlD13dazNA9KASjWPgEIIqnhP7XMZatPmht+MzHLSUxmxDHTiV2B6aGI
         pw246Rdru1F0m6IFeBKSLXtdk6bJhT8OqeU+4nbaHoAmS6ZNXgBPJrY8UmdVyZDZnM78
         YQWzCkaqMhzGkDem2ECMj6uzTE5vX/tbvWhuQY1oSd5avf2MJRsqSa9XJRukgSZEI5Nm
         XMNg==
X-Forwarded-Encrypted: i=1; AHgh+RqHGuZ5ItkjbKaNx/WTDZGUYOXGg0yTlrODBwHQbf7itM4elFHJzxx3hoX+kTAjcM2nqTDka5EXwP0jzs84jKrD@lists.infradead.org
X-Gm-Message-State: AOJu0YzwbzOOHjR9X7bAqi7278X5LYU5/NJoD8sYDrHoNB8+LG7Trn/E
	ZsSSkotTN3A1/uAQ/kZhSqcb38+kjAcr4pkJjTNf44m9ZRZJFX14t33mk6yvZ4Lu3OF+njBo23q
	OnZU=
X-Gm-Gg: AR+sD13Bg3opcF5WGDlP+R1CQ6krUrYbck6M+LXg6HoWPl/R3f3zZxXlD2VjOfwtj45
	brU8JdDGICEP44nsypH+Bv2hHx26dBPvA8NeB4IbiVEWIOQUz4JcLuQzpVxd5VfRFMLf4zuTygC
	shKYXB1Y0XLxd7ezjs4wPIFas65Y5Zd8MLW5egKty16MCOXZMX22JjUW/PkMvsQtwEarys1l59G
	mjl9qFaHScO+OFrssRxWRJGDQKKUk7p/beW7HSaSl3njxcIR0VcKzO6FuEIWA1mwWm/xEC+EB8V
	q0pYqYrPZXZmfMbi6J51NhkM7crqCfuKVYd+x4cJtzWTPdLtSCxwsgK4ux9VGNBGZUdQZuDwkfC
	+Q5FC8h4+k/SRI/LKQYdqYGgW1d9cXyiR598KQwfAPHYSt6a8rub1minbfMkoayDp9nDzsPImcN
	7jza0ExgeF0wWlvExfi83eiOGMXPzBb7Z8M/7YYx8Iyo7QQUTLxaxmow0qB3eohFDZFgAWYkVDg
	XaizcftXKy4k2DvT1DvVIctccE=
X-Received: by 2002:a05:690e:4010:b0:668:1414:e9bd with SMTP id 956f58d0204a3-6692f4d68c4mr3424184d50.38.1785454705904;
        Thu, 30 Jul 2026 16:38:25 -0700 (PDT)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com. [74.125.224.47])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c95ca34sm2277405d50.17.2026.07.30.16.38.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:38:24 -0700 (PDT)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66843304cbaso443953d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpko/EBI0ryB7/1IZ8ryE0seduGjWy7LPAgaZoF5/fIpphie9xBDXiZSt0a0Vdi+p3slo3o8da87VjR6weluU1x@lists.infradead.org
X-Received: by 2002:a05:6102:14aa:b0:739:97bf:9189 with SMTP id
 ada2fe7eead31-7574f93a65fmr1607449137.19.1785454369736; Thu, 30 Jul 2026
 16:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org> <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
In-Reply-To: <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:32:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
X-Gm-Features: AUfX_mwnyu4WjATq-AQcVkDVhFUfk_uPBliwju6dkYwZZ_ZMH3FiPhsyMK3Tdpo
Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
X-CRM114-CacheID: sfid-20260730_163827_520796_C2AF246F 
X-CRM114-Status: GOOD (  36.04  )
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

On Fri, Jul 24, 2026 at 12:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > +                     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>;
> > +     };
> > +
> > +     /*
> > +      * The Pixel bootloader considers it a fatal error if it doesn't =
find
> > +      * a `ufs0` alias so it can add calibration data to the node. Unt=
il
>
> Fake node is ok, but alias won't fly because aliases are not allowed for
> ufs. Well, would work 10 years ago, but this is a device from ~2025 (so
> SoC maybe a bit earlier), thus Google already knew that they MUST talk
> with upstream open source maintainers before they ship such ABI.
>
> They did not talk, so you reap what you sow.
>
> There is no more excuse for a vendor to ignore open source and push
> whatever-ABI-they-wish into their product, if they ever want to upstream
> that product.
>
> I know it is not your fault, obviously. And I know that not much you can
> do, so that is not rant towards you nor towards Doug.
>
> You will have to keep this part of patch out of tree or fix the Pixel
> bootloader.

FWIW, it actually _is_ a rant towards me, since I added the "ufs0" alias. :=
-P

When I was originally bringing up Pixel 10 with upstream, the
bootloader had a hardcoded path to the UFS node. It looked for it at
"/ufs@3c400000". That certainly wasn't going to work. Downstream
_still_ hasn't transitioned to having a "soc@0" node to put all the
MMIO peripherals under, so the equivalent upstream path would be
"/soc@0/ufs@3c400000"

Now, I certainly could have made the bootloader search both paths, but
that seemed bad to me because:

1. As I understand it, DT paths aren't ABI. While it feels unlikely
upstream would change "/soc@0/ufs@3c400000" to something else, I
believe upstream would feel free to and not consider it a "breaking"
change. This makes it feel unwise to hardcode the path in the
bootloader. In the past, upstream has renamed nodes to clean them up
and it wasn't considered a violation of the sanctity of the
device-tree ABI.

2. If #1 is untrue and we consider DT paths as ABI, it's still a bit
awkward. We have one bootloader base that supports multiple SoCs. The
unit address differs across SoCs, even though the IP block is nearly
the same (bootloader still adds the same type of calibration data to
the node). The code I started with had a bunch of #if statements for
the paths in various SoC variants, and that went away with the alias.
I suppose the bootloader needs to know the UFS base address anyway so
I could have probably constructed the node name based on other
#defines, but it still was a bit awkward.

3. I certainly could have searched the whole device tree for the UFS
node by "compatible" string, but the Pixel 10 (and future) UFS
controllers aren't upstream yet. We wouldn't be able to land the Pixel
10 device tree without the UFS bindings landed yet and I think we're a
bit far away from getting the Pixel 10 UFS bindings landed...

With all that, the "aliases" seemed like a pretty clean way for the
bootloader to find the UFS node. It also matched my understanding of
an appropriate use of an "alias".

Any suggestions for how to resolve this? Do we go back to hardcoding a
path in the bootloader and cross our fingers that upstream never
cleans up anything that changes the path to the UFS node? Would it
really be terrible to allow a "ufs0" alias for this case?

As a side note, I did "talk" to upstream shortly after adding the
"ufs0" node by sending the Pixel 10 patches upstream, but I guess we
were so focused on the overlay topic that nobody thought to comment on
the "ufs0" node? At the time, I'm fairly certain my resulting device
tree files passed schema validation at the time, too...


-Doug

