Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2639D25039
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncCD7QdAbWZuTJ4VUM/GB5ZidYXAtNWFxqM/DILNihw=; b=cmq2EkFTYS26/c6VL+fMzxUsE5
	/vRNPu3QhCfQj+dFZvhw0Y2VU7ZJCrpPXMIqiy5puLHL2Dof3lg+e8MJqVhCicTzwsDCa0ilww6EC
	aDQzuOFsmxXJHyQkxTXMU0qbv//lA5rABIXQb8NZZg/CQrjdXkFqJNokqrqfr5a5ymFweCQ4eUCxO
	fQgA1wgNe3I9Zywlx0uKeUTYHtgD3JS9Jjgz5CwUJ/kwiE2ueU0mWdJjNghtxcJ9VAP7gTbGWam6I
	sn8Q9bL9CC2tEjP3se5iRHWzBww5bR2uXurNdReoM9+FEs8o7/jW3Sbbi6t5a4/fCIooWvn5Uxjfr
	ohSBQvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKR-00000004sLv-1muu;
	Mon, 12 Jan 2026 07:27:07 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKP-00000004sKz-1sLP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:27:06 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-382f087e6c9so29141251fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202823; x=1768807623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncCD7QdAbWZuTJ4VUM/GB5ZidYXAtNWFxqM/DILNihw=;
        b=k/f4oxlWTEQm8vDRt4JWBHua7+pNaRcfCPJHCovP0/oydcZ3RbqJAAmvIuCGbVLqKN
         sb3bxP9USTu/ktDwMvEd0uoAoLslD5xMR9VkzBf1OXY4GKkwnD3JEgy6iWriNkALNzFN
         AWH56JUieHlaxIiplvN2HnDlBLn6z3scAIq2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202823; x=1768807623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncCD7QdAbWZuTJ4VUM/GB5ZidYXAtNWFxqM/DILNihw=;
        b=ev3j40YBEGClc8Tsx1R4G00qEMXR5KCuMRVAds8adYDvyEHJt9LJpwKDCK5898S+/R
         ZplhUDAcZnm7hiR4kwgkwvyeP4SdRpZfmAQz5xgsoFdvp9qxdN1N/cTtWzpnJNZWcen/
         gH4QrXJvg1wL+ukYjwUAjEcC3EaWZaPromXZB/xdNINEoSWa24PoKksYaVjOOWY1leoL
         Kpm92s0pPORUv/WgnPc9TVqwSOLbYdTeJRr6O6BunuAh/msTgP1tJ+8mZDNniwFNS8x/
         ba53iS52gqxYf9LSrMQURlsD+2hpcFXjMlW782e7RbFQebOZ/9DnEhgUXVo3ON6YuC3C
         qoQA==
X-Forwarded-Encrypted: i=1; AJvYcCX08ZK9QA4XwRmEoaBS76b0wnzdEJUlX+SCsjeT0oRSiJJtb8SWgrUvYYv5yqOpEU9XHv6tU7cVywMdopmmdsxx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9GB2DT0V+HTbhwwsn3cNyV5lH9R4y99ALULBgm86Wg7SNK7+E
	54pZc7ez0TjbaDbnmmmPDCSTLoqCk+ie4CfeZ0w/8nJ9kDK+clmCYN98Rv6mRh7UdtmJpaFTmAq
	uxKZJVA/UhBgHxghEC4CK+c/AABZKNmRgtG+kn+Nu
X-Gm-Gg: AY/fxX5HYBqwnEbWqXFcVZdJ45yx3WBB7Eh8ra+E0xftm/AE4yj+o34Mwf+SSBPzFMX
	aIw7g4mAAPHvixu5++aG1UG7ejDN38987tRBQ/f3DSJtaP3kigZzIa6kQ+Vaq804U3E51Wjaceb
	9UdJaUWEhlrkjGaBP3kArR4JV5EGGcjwCvSS5WL392HzEd7YWqyFAhMLEEdvooppkiQxWdUpKun
	oGvgu0leZz+b7ztfFTSKbUpVcd81TbcDVu/t4YdhfTiqzmX+vYeGVic0x1kuLT+8X/P7S51Ior+
	aM8d5AfQJXYoIM9vDj92bCR8
X-Google-Smtp-Source: AGHT+IEtdTzShXz4wPeF5M02jtiMqXCbiAjaUDFF6b38x8rVY+o1KK8e4krh8D/G4oVEUwnaUdpjoMM+H1TVs+8ZT5U=
X-Received: by 2002:a05:651c:18c6:b0:383:16e7:9c3 with SMTP id
 38308e7fff4ca-38316e70cc8mr33492741fa.3.1768202823275; Sun, 11 Jan 2026
 23:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:26:52 +0800
X-Gm-Features: AZwV_QhjiYvS3V8-WWKF8DW2GE2PKz9EYPOgwGThAo9U-y6HyA7IDDJVCRyVGDI
Message-ID: <CAGXv+5HmYUcwmXU2DyCEtYgsaJtVaLQQatzU9sUfiPNA0dQczQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix
 typo in pinmux node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232705_491478_6D39413D 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Rename "piins-bt-wakeup" to "pins-bt-wakeup" to fix a dtbs_check
> warning happening due to this typo.
>
> Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

