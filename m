Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5E4C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=; b=SEr9OfqgodSK4lQjItsDFbhuNy
	rI8yFEYOdrj82P67aoYAFkTURoLNIcNgwEhg53YPt43+ewRZkicTgmnlVQyogCpfjAC/bvjk27aMf
	+A/pagMBMdi9T22Vig2NyxNhXexsd1SHnVAX7tedO82Sq+p9ZFVZCkS2qML32oWDWUSbQsRFkDX3q
	HzDFiFxYMvm7bFteMmdl9fLHBdF6z9mtg/50RPtmnMwhL73hGhKPGS94T9n+Nf/Bhn/5YnM7ldKru
	SP4QmERmWwEm4DJxeRDRnYkx9nlchfdQQO/2PMidJW+VVFg5epKPfsAfxWkdITskTqSIDcXOEBaf6
	co/P0waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNk-00000007aLX-2cME;
	Thu, 24 Jul 2025 13:53:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetkx-00000007IDC-2F1y;
	Thu, 24 Jul 2025 11:05:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso170676766b.0;
        Thu, 24 Jul 2025 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355097; x=1753959897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=;
        b=nsd3l7x3U/x2j0uB+KhKfc8l4Qh25XrNYi+v/b8AfbNyiPoRA/9dCa6FHMjVL1LOm1
         HoqgP2MrbO6RL8P8fxJaSZQxAbgGg3uEwJryHLH9/+OENVielZUQOF32IythSSDgUaWV
         Mh19R3ELsMHf6yZpPv5g96RJR3NuCDjsb2JXkvxUSPyS+mHaHkNMjbjVmuhBKZA5o/lx
         uHx3BlP/99kDk5lfOlRsvT5TOG7MYpdMmy0LzGyO7us+piudsatPWvJaj1b929ebBuUC
         74FgAi+hSlHa8+BAFFbDQXOxwGpeoUONrYW2o95ZiKNDBDFMmLe+esgFC5RfkcSvSOfM
         puqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355097; x=1753959897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIUwmPHAS5I/CUOP00py81w0hjNzvTvkcVdQbKas/DA=;
        b=VXlTuGMAG+LMVdkJUNJQMAFPuF9asOftWcciRRizBkMjpjhQAVOiHb3F5+pyXpgXhL
         1JuSv5XmDrTgYGQcWPpHj9A5zzpHJrXI7swTLgoiVp/vYJVNhaSrPxnz6z/eTfW2tzX+
         fFK4ZuJMZur1JVNRQo8O40Sw2p8D3rygvrkivJwW3Kt2+BQzEutEtBtrQNVly9LymO8Z
         WquXTCz/hT1nuQl4C7+hQA0xOeoMofpB9rq8HYZKDnXAhqzGa/KGXQk3bRA8BPfD0jzf
         rvIPhsZLflFdAYkfXKbOUylWs57rXAfWUUJWkcqMlammkA2uI5qxd5Lr/uCd9F8ZvYY9
         EQtg==
X-Forwarded-Encrypted: i=1; AJvYcCX2hY/VoIAeB+vwdYrzik+SuwZtczIhDgUe4dFPUkdXmy+s9PuMX4UCoLQMNg18imH1cPIJUw6MwOiRaEgf4OOx@lists.infradead.org, AJvYcCXZimUvBBvPXdhMnDlDDi/NLhpBHiSfMImB1/JeLsqSCPuaBR3ZBRTwFxOP+sy46FhWeoYlPJYu7jg6lj6ZnoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbSyVa5LEWdeqmpUYrt00HYm/LAKEDRC5Oi+LFfLF5+kkIN7+q
	fOpKQ5ecdedjCWO4wvChM53vUwhwc6nEICDBZXRL5HtbS5FpjEIo6arrblr5P6K+vpOrYLpOYrY
	NxRfpX3BYL6B3o+KChJ6HlOevR46Tz50=
X-Gm-Gg: ASbGncvoydw2rxdCUoW0cW44A+TdLhSypg0r8ExEFXIvuJoIJp9tsFQIuftCpDISpaP
	Y9OzPICtvKcUZPI7uox1HUbaUr+5giyB7z0hrkIBitt0Tz/ZEa/V55+v8haI298Wawm1jVpzlQR
	w2zZBDXLOqTvaqwFmct2eOdl+UK0TL4ObZH9oNwKPA/XguXh8nQgDj0OynSFPrKS+jsH+A0UQuA
	m4YQJ9Uug==
X-Google-Smtp-Source: AGHT+IHPG9CppWQlW2WG11oa6jW9jIvsCOFaEPh9C4R84HymaGR9H07ZVvtMJ1em3UaqkyymENVRG1C3VhJB+3+pi38=
X-Received: by 2002:a17:906:478a:b0:ae0:7e95:fb with SMTP id
 a640c23a62f3a-af4c1e2633dmr202631066b.5.1753355097066; Thu, 24 Jul 2025
 04:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:04:20 +0200
X-Gm-Features: Ac12FXwYO9py2pad9YYkUaWtcE51AjTlJa3erYsopqu9ohpn5SMp_S7iBIXDS4k
Message-ID: <CAHp75VdoZr0YCm3Pc7F5jOV8Q-H9K+gje2fi71nonHoXq2YPdQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_040459_573319_C07BFBBF 
X-CRM114-Status: GOOD (  10.73  )
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

On Thu, Jul 24, 2025 at 11:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a function similar to strdup_const() but for copying blocks of
> memory that are likely to be placed in .rodata.

Makes sense, one nit-pick below.

...

>  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __re=
alloc_size(2);
>  #define kmemdup(...)   alloc_hooks(kmemdup_noprof(__VA_ARGS__))
>
> +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)=
;

Can we locate this in the similar order to the C-file? I would put it
before kmemdup_array().

>  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_=
size(2);
>  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
>  extern void *kmemdup_array(const void *src, size_t count, size_t element=
_size, gfp_t gfp)

(below left for the context)
> +
>  /**
>   * kmemdup_array - duplicate a given array.

--=20
With Best Regards,
Andy Shevchenko

