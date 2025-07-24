Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD6EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=; b=FKK/oJO8/9Q46grVKAOhhO4RP2
	9NsN9ubAy1SJOFwm0QdX1DOQ3xolAyL3s2TDe3sgB5j1iyCul/zCcAhmhc7GMo62LVqIkgskuQLhg
	D9ZA7FO9zEN38RT+bp7IsYdLaB6MFv043YvOJUxyTV6qYSfSnLeH0BnPQ7qaumM4eyszTNSFB2mkO
	V0mO528G7OqOHhS+TqMC0AKLbVK6oLPxEazu2H1paz6LTVSFgk4/767ZCheIU/0liqhKYDK1/y9wp
	CXXKpRQaTV3K4bKSCsrnkttSvcGV4Z2+dwiaUwmMAcOONXs0/lr/8KpznFQp6HCfIq5kJMzBeMjQv
	ZBRaBWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNx-00000007alW-3Qxo;
	Thu, 24 Jul 2025 13:53:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uett9-00000007JHa-27e1;
	Thu, 24 Jul 2025 11:13:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae0df6f5758so129707966b.0;
        Thu, 24 Jul 2025 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355606; x=1753960406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=;
        b=PEyRRZx/ET/OYWAnZba729vAmy7sck/PBmKzerSrKiHs0rga5OjAsMNWt/B62/d3Ik
         /ifzur0McWOxvLrLTGgb27TX0HY/0MUoN1QLqnC2Fam9hxayHciHwkn2mhvnbzg/Uz+r
         O35pdmjazdemrwlVI7QD+tg7zOYPrAb6iZL+uTmx6tGKTpr3tbefD8eioJyaNrD6+2S8
         wickx1yWtyPKpq/CmKocfPJdvWHiWgaREU57DgXmiOevKjbTOCNmQjM5LBiVyP6hv21Q
         1CKvsljgPfr6JGq1LqI3Axbu5ddymhbCs9Kn9i6wDr59l+NECXsWL70eRv9mFB0e5Lu9
         Ibwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355606; x=1753960406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=;
        b=V907QRUWgaUYF4Iux8/DfFxwn8+pWZSV/0ZEmU2dkQZN4qKFZ7A7cbCQ74nHttq2a5
         T54oXUeEaTo1H9rSGvODb3//dc4ELUzsH4i2PTa/QJcfAaocI5IMr78Nc+wmqTt7lQOE
         j+Mc+eWDLwu5BeRczUYp6fKzCLrVHJBm6LS5liaxHmqtC+1KQcdVR6D27UjhFF9u+Tpn
         t/Ryd1Yn/2M/5isK5LggBreFeUUqAx/WwhDVqbwn9kSjSpIKm6gelPWQpQ08csl4wGMR
         QqzWgT0C3kylZDzes9de6fXTLem8LideKNv3wCOS5XadzIgVIzVcyno7bzjg+oDAY40e
         0Z7w==
X-Forwarded-Encrypted: i=1; AJvYcCV5KJ37wdBsKAJcVnq3gy8Mo+G2j/mW9kvbrVV3867+72MyZDwVwvihzF2IFbWC3dUNLBqYILOVVWjpFRhKCl8=@lists.infradead.org, AJvYcCWtccL9bGNdu1NwQRbHAnmMXfydqlEviy2eamSlvPH8z1fEhqVq5uibemXjOoGLgW0unOkY9wgX35wO2g0dqvW8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw614QcnIFAgn0/Swva0A3bC0IR/OQ56j383OfF4xRxMpygrAPI
	YTFS6k8Ut7wxeIFTWXFZ3Awj+mvMrUUsCBoCzyJsKVDzFlq2Kiw97wVcivQoGJUxsW6jyEDzIC8
	hYDgMq0xJhdf8lOptDopMhFqiwvpRVsA=
X-Gm-Gg: ASbGncsQJ4WRO0v3nnqwQzD0k2J2e9AdnlVzX254sxJGvqB9MjhBVzIAosDSL1CoU7v
	tbbZfdbUlIJv8VauybVpWJwbemzYAZOT/vU0i+bJproCE+yYAMQu1OcZGWXOqHja7grVev5q9EQ
	Rb+WO7yHB4Cd7TlVoUC4CrDqK57KW/lRMzWFvc7bp74r2kl6NLs6E117KnsTIo8LZEngkBDOuSg
	q255/3444w3L07gwwVO
X-Google-Smtp-Source: AGHT+IELZnhRssUojeUfzx03q7k6D/HSNcNEJ5i+elToR/sTLOJXIaiozbv7LfFc6lY38aKQkwYpn9FdGW+sEeYsiSw=
X-Received: by 2002:a17:906:f581:b0:ade:2e4b:50d1 with SMTP id
 a640c23a62f3a-af2f895ad43mr692412466b.29.1753355605638; Thu, 24 Jul 2025
 04:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org> <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
In-Reply-To: <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:12:49 +0200
X-Gm-Features: Ac12FXx4uwXTilr-eVY-szF3msWYq6-eRwPAeJOQDJhF69DCjZUNeC203FQ8yl0
Message-ID: <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
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
X-CRM114-CacheID: sfid-20250724_041327_541738_1CB0F8AF 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, Jul 24, 2025 at 1:10=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:

...

> >  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __=
realloc_size(2);
> >  #define kmemdup(...) alloc_hooks(kmemdup_noprof(__VA_ARGS__))
> >
> > +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gf=
p);
>
> Please drop extern, it's unnecessary.

It's all over the header. This should be done as a precursor patch and
I know that usually people push back on doing that. I gave up on this.
Kernel is going to rot sooner or later... :-(

> >  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __reallo=
c_size(2);
> >  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
> >  extern void *kmemdup_array(const void *src, size_t count, size_t eleme=
nt_size, gfp_t gfp)


--=20
With Best Regards,
Andy Shevchenko

