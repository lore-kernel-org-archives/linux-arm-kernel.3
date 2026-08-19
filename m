Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE81C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=; b=NxXY0UAzPWUUHuV74aCk7vzUnT
	H1snalq3xH0d/9m3jStX5MIEroCExyOHUk+56E5GVGXSZS+6asFXYVqukjy/FZzPJE2g/A7BZrLhm
	aZ65XunaSDasCpY+9S9RU3CEZC1A1jr1HMj/8OBeFlBzIuKdF5ZCwhk77I71e3rQ+7RICvgN2GzbU
	L7ha31dNisHLob5zsTz9bogQ/yUerdzYICormBb4u03gjgUJxN4csaAH1O/cChdMFW521t56LH3Ff
	yoDiHBqrYrCDV4EpIb1ckKtvhnOXQm9hIyU/OL11bERYZCFX0Xo3+AYRJVIsEl94Iu5p3jKaFHryY
	vT6ezwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjiW-0000000AFEg-2I1Y;
	Wed, 19 Aug 2026 17:04:44 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjiU-0000000AFE3-20KK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:04:43 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so604700e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159081; x=1787763881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=iTssONmvOdi0P+lVO1z0l+66sUHJBoHYZwnEdbiJbrdPaBHc5W2WZSIhA6D2pAaoRl
         CeFqPluEQJ9ACdf82l7rTeDRS9GscTKG4CKG2qGIFtE5IQK7/ZoyxAVO6x9Xxu2lX7zR
         O3sC2nt3cR9JXtTzdMxRw+2wvPp2VQZmDfoRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159081; x=1787763881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=q1WkTcClapVGvjsJD/QZHor1pu0MkgtXve5nOgBxc/RzvDsFb59FmcvMFovtuoyV0B
         wLacL20GBj4ib3MF6TkhAe1sDnhLw6mGRKvX/EG/OvLW5BJSorbTexlwy61YZQrKtQPd
         ldnpuksa3L5HdgDLRqf99oi0DRuu6JI4OgGGhcAQnRCchk6secMjOiutxny9D9mRBhxT
         CJeZHWA685u9Qg61lHccQJdh9BgEvFoX82AR+eHEQDWWmEdyDPpSBRpxm0Mh5KomJlkJ
         hQ75Fs3++sE6Sx0FhGlAiSfTFRa3xRGuqJ+Y9AxkiHq4BJa/xAf1p0jpCx0V0EEVcDM5
         hv4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlIeFrTXDTKDZMj4i7+GvfSx8L4JbX5/KDv1WsBpzD36ss5bySjy98yyBPuVHWXQAhf+Xp6hMqMCeNJUEm+khd@lists.infradead.org
X-Gm-Message-State: AOJu0YyzzI5gUhbXlkDRiP59W7+Bzs6sf/Ko/5bPRl6vqXlSAskPIhcP
	PBuuRQx+xIAWalA2ADJdY/oi+CiN+8SqA5ZD8OfkuWNpKE4niM52DuAsToPtBNaUjGPUC4pNqlf
	sGx4=
X-Gm-Gg: AR+sD12nqXtHHT+0Ekl2nDx1fcnxMbmx1Xl8g2sivrEkEEMjupIlaVAHrWBqlPpvVwS
	eykdCL2/onHB3tPELu++Stmc8cHThEn/lc4v/OvWChWhY4ZLvsZoQ8INjCWS0ovHn5F+lLhKuHQ
	YCN1UkIuFda8JRhrqL5yHpSx2BIElN1sbCR2yNvpBKIHNYWAtDy1YzUSBTNAojwwxoPYD0NtDty
	wtwPjXqK1Ac2JNgqRbGYe61uXDKBGZ6K0qsoNISI6aJ4vB9MPePjkONdg6eLR/SAkNGI7bgIlQQ
	Exnb7UHANWeaM6De/uOCbHmJdrUmOJnfwRWXHVfvRBbVUpPMINfZTTyhHHZzqXwBG1xvqXLEQxD
	VcEBOr55+gtXwMgdgVRJ8rJenf4JfXSq7SNsZtF04D1n7fgB2tvHthQNpEae96G92dAfdNGD6e2
	YZp1GuRKgesVgKsAkfOXjJZNHQqKiiS5Omh0d6IYlXg7KeWutAl8WDFpS8JDTuNP/3kbpHtYtYW
	uZjUqYctgTfHblt/EFDCfbCQBY=
X-Received: by 2002:a05:6122:547:b0:5bf:6bf4:b215 with SMTP id 71dfb90a1353d-5c5e3b8940amr2137206e0c.2.1787159081057;
        Wed, 19 Aug 2026 10:04:41 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e2837fa0sm2691523e0c.17.2026.08.19.10.04.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:04:36 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97c1ff4696bso337921241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:04:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkcxG1RnNMC8wk7+vWUMmDWrmkSVmW3Jbqw18v2quZahg2hAhVys7HovTvp6J/VOd+EwXOphqTGHiut7g5XwSE@lists.infradead.org
X-Received: by 2002:a05:6102:191a:b0:778:5579:c662 with SMTP id
 ada2fe7eead31-7785579c755mr1067469137.9.1787159074606; Wed, 19 Aug 2026
 10:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
In-Reply-To: <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
X-Gm-Features: AcwNN1VC5Sr-hmHls4qje9y_sLrQ3mcRyp6W877ec39iaS3jdP4hd--uL8qQ3VU
Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260819_100442_539194_25913A62 
X-CRM114-Status: GOOD (  36.01  )
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

On Wed, Aug 19, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> A lot of rules are implied by other rules and this one, how Linus stated
> in other thread, might be implied by no-Linuxisms as you want ordering
> or stable naming of Linux /dev entries.
>
> I understand your reason is actually different than above, but your code
> does not suggest that.
>
> Anyway, if you wanted to have aliases as ABI, it would have to be
> documented. You cannot send post-factum DTS and say "we already use it".
> Every ABI must be documented before usage.

I'm happy to document. Can you please point to how / where I would
document this? As far as I can tell, no aliases are documented today,
so this would be the first. If you could give me a hint of where you'd
expect it, that would probably be better than me guessing.


> And this is what my comment was about: "they MUST talk
> with upstream open source maintainers before they ship such ABI."
>
> And no, sending such DTS in your v1 is not documenting ABI. Does not coun=
t.

Sure, sending a DTS isn't documenting, but it _is_ talking. Discussion
in responses to patches is where we figure things out. For that to
work, reviewers need to point out problems and then we need to have a
continued discussion until we can figure out a solution. When that
discussion just stops, it's incredibly hard to make progress.


> > thus implicitly provides an "instance ID"?  Would it be OK if I
> > changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
> > or just "ufs"? We're not using the alias to get an instance ID, but
> > when I added the alias I followed the pattern of all the other aliases
> > and put an number at the end.
> >
> > I'm happy to attempt to fix our bootloader using whatever scheme
> > upstream suggests. I'm trying to "talk to upstream" as requested, but
> > for it to work I need upstream to talk back. :-)
>
> Make your case - what is the purpose of it? Boot device? Then you have
> "chosen" node for stuff between firmware and OS. There is even a
> property called "bootsource". If this is not boot device, but some
> calibration data for ONE given instance of IP, regardless whether you
> boot from it or not, then I find such case as border-base and not worth
> implementing, because basically one can come one month later with "I
> need 1000 aliases because my bootloader is patching up every device
> node".

I think I've presened my problem fairly concretely [1]. If you hate
aliases as a solution, I'd love for you to tell me which solution you
prefer so the firmware can add calibration data to the DT. To quickly
summarize options:

a) Hardcode the DT path to the UFS node in the bootloader.

b) Use some variant of aliases to find the UFS node.

c) Firmware finds the UFS node by searching the whole device-tree for
the right "compatible" string.

d) A separate "UFS calibration" node stored somewhere in the DT
(where?), as proposed by Linus W.

e) Something else?


[1] https://lore.kernel.org/all/CAD=3DFV=3DU0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr3=
8p+YwRnC_G6w@mail.gmail.com/

