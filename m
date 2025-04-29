Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=; b=znqaz1LkAxKsvWFVRXLnPmEwzp
	9/qKtbuLsOncPbc5s7P5zbiMctHj85OGLw2M8xWR/qLu8xtybZbdOpSBRbP+onny1HalUsiQPR4wu
	6/vBlHSOhBQWq430HfdyYUpQFeugYnTM4DKfO4ZTKAsbZ2t8F0Kw0/tprPTPVx7ccPfdRdqMkk4k4
	px1fSS4ryeyKW7KvMaY9O+VDBOFKLE9KguyE30F9VaChbMqGCUaAASYwlg2/vDGQDHwfLhwhu+98g
	rnqVme2ptgegD2Cd0Bok1FpY1KgtrYLMKB7mzP+DttDMaebmxTU+PWeLILuQDR8PUpfBPW7NA8A7Y
	eG7SRQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gRP-00000008xcx-02pu;
	Tue, 29 Apr 2025 08:35:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gNP-00000008x3s-3BiY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 08:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=; b=AdwKCL0WpGTM//9LYEOd2QC4iJ
	mX6E6u0HvG8euB89uxzFfq73ftcsIcbKmKAqGwXI13vZDqDONfbs1bWF/n4kmLZ8uS6o53gQiCeoU
	MmVfC8Wk8EUWoGjnwFXZ5b+uULTi9GdIuBreSUxFlc6lE/atzp4TMNCz/Dk3tS4QDAP7lvPMrUeY2
	m2lFZvnDzfMRQsT95le9I33Ae3Hq3IeVq+TES689Ut+VRrn4cJhPW1BiO+OWjn8OYQfiJPSBxlVqJ
	eDRaWvlF0n8Zj8DnYO5CDl+0E1CSSspJds4LGPMECaHH/4yglB/SXGY6WnA1l0VWpH/bY2oBay5ac
	6YKgk9xA==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9gNM-0000000DE7C-35t5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:31:38 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso54872111fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915493; x=1746520293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=raYSaIjzUgsgQXrtIhMuH/RON/jCA8gvN6+WHFOegzSu0rQizJN8X4I6OFDmi14Anl
         SGz6CYBBNMrl4OOvzplLZ+CI9QwlaACUJtjxmRVDQi2Z7jg3trEyVc2Fk17vzqMz9aoW
         qfW5y0HhQCmN8/Q9pHAoYuPH3bu8d681i+H/Mp1cTrg+mKcupSO3VKCagxETaf0JmSDP
         RF5wdtb6j4wB2RIEafH/yNGDML3PmZea8wkR/UX+GBPN4xA0l3FWVOBYALJUpQZZ+b6l
         9Fk36Nugb6sSdwpPcwTX+xs09yMbuCl0hTNoNocHxC8fnMPE42ZIQFmZpAIA8d7+yHi9
         nsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915493; x=1746520293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=LGzbk3pp/FZ74hGRsFuKJPMLkrqkGBcnT/eNIVIOiiOTYTLxIi3S/HQXwEY4722H+c
         kU547b/bhpGlWHjXJjHuVDFx6V2j/f+n6PvmbwoVvJB1syELG0LO5b3QkG0TZwXYQj3i
         z7mB6dECLIz4VJWNV3u+/texOCBDK+v4adY99gaOqqcNUrRvmE5XtmHI/nAI7Z+5DGXe
         MdJULbhpmSTVYlmmSxDOFmBAo+egTQHiX3sCbq5eTepcow+sE7PXUxFu3O+RTnGh5vhz
         79n8yTchOuwNVf/YVP+8WvMmqZFumCDz/cxhS2T5zyWZq84tzEbVnlPMIgoNk6VlPBVt
         ElTg==
X-Forwarded-Encrypted: i=1; AJvYcCVGCqlFzl5QAL+S//oV5ytA2bzQU1JSJ/+3rZckwOB7wRWm3zEtFRyqmPLrl9BLiGpYIWlpaKhkp4fqRmzHUch2@lists.infradead.org
X-Gm-Message-State: AOJu0YzmqrNzxCy0qaHxgbS8rPTheSJTM+dR23eg2rV7DvXcuwsFghSz
	s6Nn+5mpiFXFJvpEnI8W3IyfSsxfTz7ZJFy8AHKCI/bmneGH5pTo6hw9yeicnuZXW3YJ8MJlNyn
	qdlYRGJNF0CNVH8exYcIQQq+YGfXqFErM7pk/eQ==
X-Gm-Gg: ASbGncvD4MlgGZYISq1GOZi/qvK1vAXNclR/lHBnYgk6/Dv9deEeTx4bxOU5gxTQzw+
	3tyqkEtenIRa12SJy1R3G2v3WipO/VwxJ356I8A45olTHaesocELABTtTSWxP0+dPR0zmSgogvN
	Ej7AhO9yKPINkIxcvASvGMqw==
X-Google-Smtp-Source: AGHT+IEQGZYoiDX6agThY6MEttiXW/phwPHOzvMp4EUn15NcMCCtvMBuCxgvpSJ2KIlE88xdOI9ul/LqAjmdMjo0Oj0=
X-Received: by 2002:a05:651c:b08:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-31d36ad1ac0mr6506481fa.39.1745915493462; Tue, 29 Apr 2025
 01:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:31:22 +0200
X-Gm-Features: ATxdqUEwnjlawzkertE2U747LwGdYLhBGRSu2FbSCTDtMI-ddocvoVo9dn0tQa0
Message-ID: <CACRpkdYbf4zSrkzrGLn9+Sn0Wh5LvZxW3omCdMP4w1VdFf-iZg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_093136_941633_84443112 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the another round of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

