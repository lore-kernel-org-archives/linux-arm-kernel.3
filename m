Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C44606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PcUHQavV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMg/f8po
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/337IpE5KTxyqcxql/1j4KDMdfOcExSPgOP5KC4FMmQ=; b=PcUHQavVTaPI2X0MFqFl6hkUsV
	ysjPaeHl+YCwnx0S821Ma2PdhPe30oDaxxfqxxAsiTpH3VsHLcmb5bz6ueRJT2u/GySlgLNL9VxMq
	GwM7hPI0V0Xu9maafbWu9khO87SzG4qZuvN89i5NEsGgBxRTc3KJOvzWTKy/zVC4OqZ8/h2t/5t2/
	iruu3TGobO9v6RopMyXYjbFNgOzk0lf55luNyXeOVokWr2XgfJQkSxNPC+MXJ8n+WYzexj8YIZ799
	be6lFeQhQRZWOjcuwFXBl61Eb6sF0ZV4KvIRq7LlnMYs7cZhdr6mJcjrQeDIkOfliYwd9I60lO11C
	YcYrEf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM06p-00000006gDm-2gYi;
	Wed, 28 Oct 2026 09:38:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM06o-00000006gDd-1dhg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:38:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EF846053A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CFF1F031E9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180293;
	bh=/337IpE5KTxyqcxql/1j4KDMdfOcExSPgOP5KC4FMmQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KMg/f8poVuF+OYYPg2we+k9iKYhNdzzwEXevZXPuMFYAaiLTlZFRzurPDpsiRIA6r
	 qLN1YK2LwoyVaOu7Cdy3S9Htjl0OIBaayZEpGzl8lI4++ZLgj534gb/BgWiIY6iVXG
	 FWGk00+epgjbssmL3PjakXWdSicxCzL+H/TvG+M+6uKZX+AXfuuvdY/9UUxMosk8SQ
	 /fiBgKRohC+iL4XCrhjFTGJ+WoVq5m8oCDJrRcGg68uNTQwsIxovttjBgkYu60BdWo
	 gM+kcfRCO6oKdEmiS8CTEZcPamFqUl041qLLO2EgPF0ajyw3VjptY3FUJHg252a49a
	 jAENpJ3EsZzTg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso5393551fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvUKt4krRyGRBHRX5lZ9CO4Td8tSbQBs8PAYp6JYSj/NLxK1i1+4rlsKYsrSthXqmovcEKQ7sz+FzvTHk7SZHK@lists.infradead.org
X-Gm-Message-State: AFq9FYKsAXzuXJ15W3wlGw/FqA7KijYVqmVBZHi8yay0HvmnDUbRmdj8
	39sYncCH9mWq3S+Tigi+0M7tiZQcwPlhkzap1CZNxnj1TpDB9/sGpZCcv9NahDQtdiwbCD72I5e
	uNC3g0WgHNE+J+sqRFARUDjKknNCaqziDkgdHnkX7vg==
X-Received: by 2002:a05:651c:3605:b0:3a8:bd3d:549a with SMTP id
 38308e7fff4ca-3ac9cf08a40mr4333801fa.7.1793180291927; Wed, 28 Oct 2026
 02:38:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:38:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:38:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 02:38:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdtxtssfPrwXVGxLe1tyyfUxdOKcNmczn=gzESRNE5+oQ@mail.gmail.com>
X-Gm-Features: AclHuK8XdDJnZKMQhT5pgCqqGCu9vzYOmcLsT73Wl1aen1LlgEEs17VBcSWb8bE
Message-ID: <CAMRc=MdtxtssfPrwXVGxLe1tyyfUxdOKcNmczn=gzESRNE5+oQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 06:03:13 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the PMIC DVS GPIO configuration from a legacy lookup table to
> software properties. We use the new 'dcdc_swnodes' field in 'struct
> wm831x_pdata' to pass the software node to the regulator driver.
> We keep the DVS configuration parameters (control source, startup
> state) in the platform data.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

