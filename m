Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54F5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCEuo11ZBMvPKplSQXGviQNPwjkOhxFZqewnhvYiFAE=; b=0X0FA4vSP/qHJY7DWZnrYRUU9t
	zpolXvByhOJfK5ouClY162FABRkyz8mc0uuwcsvhdIT/W1mV1gMc8xCthiQeWPl7cKfTqZFmoHXWe
	UJjvuDxKp7QhzL2pIXfBAfv3LxszkvHxy3m4r6mGoV1X30ZYeBNLsnr5I0/h3CKMmHXKSyBBG6Eql
	hGaLK8mpnUGzO+rai/XwKB6pFzJIkAUalxdedBWmyQ9/fYsv/Gxf41wGWKCSzlaLkHkUlvZsRutQy
	2Q8hegBZEmwa1l7K+celkfdQC9VrgHIFfsKz9VG4xcT/OzhXfyaRQITSpRAxCWqZ0ELzRsrLVQYNn
	pmMpP3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Oo-00000001dVe-15uj;
	Wed, 29 Oct 2025 14:43:42 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Ol-00000001dUr-3EuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:43:40 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-890521c116fso719152685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761749018; x=1762353818; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCEuo11ZBMvPKplSQXGviQNPwjkOhxFZqewnhvYiFAE=;
        b=iixH89LNaa0fIF/4vOL5Sso676iLU32My1D50JVo0+MSEkXsD8M+/xw2U5YuLjw3xB
         Ez0GPpzxzJTTMrYPvkSdXylNipLfsZMBYDUqoOl76A7Iu1I4/StXKmYLJ2y3qyFYs3rx
         oU6x6SWzwwMabQZADCvRKIHrTsj2FUbph7Yat2WwVt+jUl9hzuXgeb91kvQQurP9s8Ze
         ax3abOSvAvjLOmMhoGsKkPemCBF0CZM92GkyU4hk9IZy+h5VBFs+YrCaY3FCZ2r5sr81
         vWfLD7VmscJOofZF0wbR7EBboq0pgr9KDEJfqPu1QzVBRkXJ7/q0POdX4Q/cH8hQfRNz
         uPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749018; x=1762353818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCEuo11ZBMvPKplSQXGviQNPwjkOhxFZqewnhvYiFAE=;
        b=two/IZCRejtA3uQs1Bba6FxQKXipupdLTLrGO3UoMLyw84kzMbDK9pBXyksOAH26nz
         1UsCA2jyzAM0lSEq38jL6LWro+oDdxomUiYBLbOH3thysLKuCjfzmb4fiQZc5gXY2AWP
         qXbT4fnhmGU5iV0uJzJ8moZfztuC5OJqxtr7VOcICTorms63aIeMnjnas4Yl2TPLUJv+
         o5XTllXqedFhL5ZqptkS9QY15o991NxgD9OmNCfiN0pOp5/XpvGRqt71GCM5EuUOMpiJ
         U2lAONeHOsjwUqErxscKfzWMZbCDrCYGvT1Vy29/xC0OQGH9D9LRLNFP8N0oaWLv7zjN
         vPeA==
X-Forwarded-Encrypted: i=1; AJvYcCUU6jlltP3wCSZHyUe7mKkSHWGWNZhivlMLrZMMn8/WmhcOsguT4kXc1yUQdPWxJAihR4Gr3XCZbpaPnSP8I81n@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeo38zUQftnbGnWESmzGEqIuzzf4DUN7fZDungfdxwLccOutoW
	dd8ij7vsIJH/6Ma59+0aFDC1T4qsKhTFdJITq4n3uruIHN/Po8HUuMaP
X-Gm-Gg: ASbGncvL7cNO/5nI8o6/hN1RRjIzWn+NaI+JT7pzd1m8JQUhCHrhiMPzwQkfuwx+rUW
	eA2ZmZi5fFogtrORY3KEKp8kHaxT2KWjlYD3V+VWO7ZHE/mVtPtISpsIj6bU6/2HWU01ywXzexy
	TP0vc0A6txIMV77w7g2pJLV507PImGLlFea2AX2khh+MtAaH5MYDltik92gv2uvF1dkpKWunnnW
	A5Av0VYxHWFYWS0A4+TebyxJQgeJwTk7yUOJSw1L6CATJYJb0ajvUrFNhnVnG8Ah7x2MAFoPuLA
	A6+0kA9a1pWwQiowgTuIcV/935WCDjjAZhRMDzYJu/LOKT9PfZwJgE6vWuyKZU2FCt7CWlPcYET
	/3B+dGotkAL07vwcZKvDfctIwQ15KGIW1ZOzzaaIFORaML73sEVTvC3aa0sqfJK+zRgKWXIS4
X-Google-Smtp-Source: AGHT+IHRIj9y57LgRm08PCQ5ag8nDTxAHjyPqcFEyJpmfMgUHtOJ1iinv/hiv9ZRE6XSrJXIT+Ycrw==
X-Received: by 2002:a05:620a:710c:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8a8e58b5164mr388519285a.78.1761749017372;
        Wed, 29 Oct 2025 07:43:37 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8a8179460fasm337345285a.57.2025.10.29.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:43:36 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:43:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
Message-ID: <aQIoF_TPNq13Hc3O@yury>
References: <cover.1761588465.git.geert+renesas@glider.be>
 <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
 <aQIlB8KLhVuSqQvt@yury>
 <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_074339_823245_907FB7BF 
X-CRM114-Status: GOOD (  23.06  )
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

On Wed, Oct 29, 2025 at 03:33:49PM +0100, Geert Uytterhoeven wrote:
> Hi Yury,
> 
> On Wed, 29 Oct 2025 at 15:30, Yury Norov <yury.norov@gmail.com> wrote:
> > On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> > > On Mon, Oct 27, 2025 at 7:43 PM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Prepare for the advent of globally available common field_get() and
> > > > field_prep() macros by undefining the symbols before defining local
> > > > variants.  This prevents redefinition warnings from the C preprocessor
> > > > when introducing the common macros later.
> > > >
> > > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Do you want me to just merge this patch to the pinctrl tree or do
> > > you have other plans?
> >
> > There's a couple nits from Andy, and also a clang W=1 warning to
> > address. So I think, v6 is needed.
> 
> Indeed....
> 
> > But overlall, the series is OK, and I'd like to take it in bitmaps
> > branch as it's more related to bits rather than a particular
> > subsystem.
> 
> OK, fine for me (if I can still get an immutable branch ;-)
> 
> Note that as of today there are two more to fix in next:
> commit d21b4338159ff7d7 ("mtd: rawnand: sunxi: introduce ecc_mode_mask
> in sunxi_nfc_caps") in next-20251029
> commit 6fc2619af1eb6f59 ("mtd: rawnand: sunxi: rework pattern found
> registers") in next-20251029

Oh, OK. Didn't actually want to undercut you. :) So, at your
discretion. Just let me know what you'd prefer.

Thanks,
Yury

