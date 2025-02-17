Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA085C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=; b=PjyDmXcKNKlQsG/J7GyUR9NLWs
	ahoWu5ASB7/TGwoSVQJe0O204o65ELcorjnorbV7vHIJK0CKLDI3t+s2XOfwEX50FuwClgVInNx8E
	wriMTcD9iPCzfm5PxziRCcihmKl1YQFHEsk3W7cZuYBRzb9NRPDQMt0fzGPOpX8avFIZD3zKuImLm
	+y9acOgq393+U7v7Zf6GRbHXpmzyXAJqwZWlq5kMvjXituYxTQmeJfu7XzWnNU1ScM7xmYoT5q4+I
	MU6yFxNzLvWrAPTjC9UTED9x3xRZCweB0ya5iPBr75BJ3aWzrPtIYNuCUp7oKf/pysqetK2HfYl5V
	IfcIqWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpRc-00000002vdV-3w4w;
	Mon, 17 Feb 2025 00:57:08 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpQB-00000002vUS-1FUU;
	Mon, 17 Feb 2025 00:55:40 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c0a1c4780bso11823785a.3;
        Sun, 16 Feb 2025 16:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739753738; x=1740358538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=;
        b=caXNxnukbzCWcuQddFiEFg3uuGFlOin/PjPS+nN6JST45iNQKRQ2uqIweXjsfwmyaj
         2uABnzaqxi9bn5mpMG9Z9y4Xw4sJyZ8ZW4uW6QzEFz9NML3cZeeLjQDh5C6ZT6wCU5xp
         e3E/wv80iJy7C1vYlFQCOpkTM1rdMXfzr3hFBlMlqo7PU5CqQhvPx7mZ9zmJ1KzHRLUl
         7QBplDokUpMsEcDKcIS+T8YWjFgLITO2JM5Yt1GHc0vICQCSuYGXtVBihc8OIrjAkZP9
         +tOc7Yvp9JGMC6VxQK/w9+sTJJi6paX1VojiUhQR05B9X/j6oB0bELJvcLRfgw28IwHR
         WAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739753738; x=1740358538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=;
        b=iUR9RIsMGqZqXGUtPq8Nav4jGa74tTKdlA71k6t1/MzZacOlEmfv1vZ8jdmzHSYDjo
         UW/FJWpWiN5Y3Sw86tWrXZeWbmq1BBL1bB2ZDBpitiJtR8VVGV1VbORaPWC6peavAFHv
         TgmLe0D2/Q0s3GP7kFcYKvuxRpqO+A5U54FncL+QluuUBxUCmXCtg3tr5nZDaQCr0o5a
         fE2zDMHLQbloPlTO0ZxvyEZ5L8FZwMVdHWh4bMtGhaf+X5WuzpnbsCIAMsQFxYIPx4O/
         PJX35UlgsuB6qED0g/uzEjIyI3RlxQ8dzsdRx65Q41dZWrPGaiA39nMdBnV912Z6yBog
         bz5w==
X-Forwarded-Encrypted: i=1; AJvYcCUHvXaelll63gpk+v8aLfJKtRPsJdiiIVxKUBn0M6SMauIo9+DxFgQ+TJZ18M9ygTEyxGG8G9heAhGKS/fWQnIL@lists.infradead.org, AJvYcCWsrmiKcZZck6awOve3fyHy70is8m+yKR9TGA/lTYK4jd38C5AZElWFSX/qPA0YHNDmT++KEOLmY2ny2Ts=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm7kWHY1e0hFAXdok014A9jtUZhzYOGw8DiN/vgE+a/FgJWJkT
	wyHn96lFLfBFH7EanbK7SyPeoNsdlnVnzS0MZ+EHWwYoCoEYyCqw
X-Gm-Gg: ASbGnctUBuNoOQ2FVpqcRcwCbCtygnoBMOVamDGSYbS8elrr7yl2kAUO6iT3TsjLmJg
	Wa7DRjs1j0dVuFs3H957g0Fpi2EDiC/afby0NpjMgw3tq9eCY5ACzMo7WHNUJcWQQwxz9Lg5YvV
	B49laJtMgIsY6wUm7hoo7p6ScTG+CaiUBBKS1iKD54C3YhV6SWn4jjC5UCIWnybNQsL1YD49KHm
	+LribpssulhuKIL5hhqUEDkb/dmIG47pkveTzvOO93JtU3hjMACDF4QWIymlkTZ1HM=
X-Google-Smtp-Source: AGHT+IHgsgnwFBgfmCk8QhqZ6tipeWPXEoq+VknthPTSmFHcxqBFyFKlKkuCSkeq1Ol3omy/oe0Xgg==
X-Received: by 2002:a05:620a:8904:b0:7c0:7e88:79c2 with SMTP id af79cd13be357-7c08a9c8a13mr1123805585a.22.1739753737957;
        Sun, 16 Feb 2025 16:55:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09a302b3bsm85445485a.35.2025.02.16.16.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 16:55:37 -0800 (PST)
Date: Mon, 17 Feb 2025 08:55:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 2/3] net: stmmac: platform: Add
 snps,dwmac-5.30a IP compatible string
Message-ID: <o4wyk6rrctm3f36s6gzg3stxyplziwtpdorbfcch434ns5iwso@7f6jikrnxumi>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-3-inochiama@gmail.com>
 <9dcab9aa-6d1e-4804-82ff-fb8dfa434df7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dcab9aa-6d1e-4804-82ff-fb8dfa434df7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_165539_340340_2C85F13C 
X-CRM114-Status: GOOD (  13.14  )
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

On Sun, Feb 16, 2025 at 05:59:31PM +0100, Andrew Lunn wrote:
> On Sun, Feb 16, 2025 at 08:39:50PM +0800, Inochi Amaoto wrote:
> > Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> > to define some platform data in the glue layer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> 
> Ideally, this would be two patches, one adding the
> stmmac_gmac4_compats[] with the existing compatibles, and then a patch
> adding snps,dwmac-5.30a. Logically, these are different, so two
> patches.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

I will separate them and apply the tag, thanks for reviewing.

Regards,
Inochi

