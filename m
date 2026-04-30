Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80779CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 00:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=; b=teaB1PwgrYFhIgvBePzYH5zzoi
	JKqp/Vbjmu74GBzKHs50biuLLdaIhrR2eTm5Vtj8JCMmBtv5bqGPm/oJ7Iqd6JQCemq1OadRFSPj/
	wbL6wQc7a8DR+V8Qa/wcGml2BDhYTBXOET/R5ym1EgHJE6kF1XohNZ6VMlqkvgO9tReg3ODCHb8+W
	0uzp18vnp/Yu5N9MMW1sygcbZ8KGT2jFG0Fq8LCQwACoLPHDjrWdCcmDY5yCfilVKCwrKXBHifV0L
	PPfe4M72I9ePKFSFi+6rTti4c4HtycZLy8MolnK0QoueyrtZjUThnNxu3yC+0FAuJHyh5UE9YW/xO
	lDfVmHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbKF-000000069OJ-0ap1;
	Fri, 01 May 2026 00:01:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbKC-000000069NX-45yZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 00:01:46 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so259140566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593703; x=1778198503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=f02kPGfQbePf7fA8E+80Gtxr7ZctJGGHXkxgIH1HSOZYhtmZCAZ8QpqJk6hxAQsZYn
         8pM1bVPI5WPBKO/8wITaKpxL875yJk8WZReM37/mFQwy/MtnbrMV9mjBEh6DAEtaj+ei
         6pBkgvxeG+NmxAqWXWXdCcL712kuAV0A3tPX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593703; x=1778198503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=clPs0hGQuFbbSD2fQ33fWv+mTgWuoPFXTIscNW/wmzaMY3KeAHZCdcldTQKg9kCJts
         XF9znNKgUJ3oIbR69uyTNgzSQzhNvc8Gi0XulvoPdqyvjKEVvHjOMaMrqQUKq6vFiLav
         JO8noRCGJSwEUuWgZeMDP+KCEAtccw4TiA878XK7IxBM/36pZWoyHswrRI1nuOtI/kU6
         g3edVh0DmMykIpkb+REvvFpFCc87COtacLZZvNKZ/mOurUYZ2B79JaWuETM/0nUit8vr
         yWI95MY2tK7SNDq4TdpxA6BAIDevRlsn/ptaT38vlsm25PpzFcrJh3XbIK6wPD/UUWE9
         gRAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r3U2zxlOhEGsEn5aryRYnHAhYFVEWFIdQ+jUTq+M3I5NqUERPki5tK3imrlG+k6jY0MTchCEwIp9pyUnqM3fX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ueBvy6lOr8jT6i3kDgzAvHg93wiAEzHmw7OFUcKUNGQ/vgmS
	3RUhJ/onR7fEvpTJaQ597pz/PngfEuYeqcRo75gA4pzGRhU29LzFLsv7+tnPwi9tP/wRo7oSPPs
	EojNlvz8h
X-Gm-Gg: AeBDieuZOSXYBDufoJHKH9/d6KlXOOjHQbCwxpsPE+5w97gTrYiPlsJ5xO+SKQ/S7NC
	uEJ3AMzZyB5l0xdi7hGvP78jaBGc+cG/jhni96Dcf3+7YCKqFNy3SW4m/02oEsz1aaIp8ghKKiF
	nycYI9/04BmbGaPRSRIgxYuiT2CLjXN/vZXuidcapZOUOIO+ixVcKq7EIrPjqwPpo4Wop9K7r5W
	1JgiFJ2FRdnjFtLLo4QzgEXnXLpjb4VSMdlbMXx/7OoBmbxfqNqfdbfhlhsenqtfSmOvrvbjOS2
	brYt+gsTN0Z696PfMs8h5tkSGKfUmoEr23Drqu5Q5okDQF/IzOz10T+VnLC36z1xNsyroQg8hdU
	aLegpPp8rm4ULjB65b6i2LHpC3w2gH/SI6l8T/Se8TSeiW7AAGpIcVexA2rTolPgnHW5UXz6ZkJ
	2J1h6J4YTkQT5KGFtDUVnkHG0YxPLWOQJ8XQisKasoSENHODMmXbvGuHsYn3v8R53FCYlhSswv
X-Received: by 2002:a17:906:fd88:b0:bab:b98e:76e2 with SMTP id a640c23a62f3a-bbac4aca07emr358115766b.1.1777593700743;
        Thu, 30 Apr 2026 17:01:40 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d97e486sm49741566b.49.2026.04.30.17.01.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:01:40 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso640626a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 17:01:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QzgYbW6mMJBgO36O/J48lkOwUf8jEI7Rmvngwzo/s6Cg31BBgRljsg47qv9rSuvDaZRoObFgIN2MLnj7l6o6Y@lists.infradead.org
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a83d73324mr83882365e9.8.1777593300707; Thu, 30 Apr 2026
 16:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-7-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-7-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
X-Gm-Features: AVHnY4Jn8yjvVDQMrk9sfxS2s1IXmKHM3MKByZAYOfzP-smNW0WjILYj0XY4G5A
Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_170145_023424_B4B22C25 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

