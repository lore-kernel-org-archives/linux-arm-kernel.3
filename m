Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8BEC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=; b=RojA/a+NARMuHFUefQuuEcI/eF
	QDfxO6NJTCr8EmCVKYbc4XDGSanKnNBMUKX7PFL85tXZCDRHXZkSkHFT2B7HlRkFJrA4kR4ZUDvje
	5PmpK3PWQVkqN054/BsdSMF2nFaaTldY45qNa7xJ4g5d/qygAFVjk1u/+Ox3n3uPU0KiWKalUX3y2
	7FTCRwHo1KdWdGTCOBGCJMD/rNUk2jPh9/3TzWO4rAOidR5/elq1m8qsoIzaoU+VRHHU/wW4J/gCt
	uldmQxHNvMaEwl+Lbi3lVoA4/F9ILnxeVce5ltugWHeQzTiXaQEgBKrAKJxUAua+t/vgxmbVXKQ2X
	/diOsDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2nc-0000000HJ2z-1AOr;
	Mon, 28 Sep 2026 04:17:08 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2nY-0000000HJ2c-45Cu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 04:17:06 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ee1f38so10817005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 21:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790569024; x=1791173824; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=;
        b=D8mXgtAcxAX58NZe7ns8PIkSA5o75LL+dTu7W/6PX8O9ZbNaCFk4SlsWgS7bxq8/fG
         22Y0McYzsdbnzH4tFxjK9Q4VPOjRDqlm0ric94NRaE1iq6wTyLkwoPqbYN0Rg5YHmCPZ
         Hc9tmWCw11Kz1Uc5OVx8GmgS5t9J3cOL3GsqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569024; x=1791173824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=;
        b=2RcR2+UVfUHTzDPWpZ8pCKM5K/TTlcz9VutZeo6y1FkrWiAYS1mdUbrnjL2i+2KOfi
         LxCVcIkeBOnMqpcINvL5Qywf1gv7jkmH8cfHE4azhJ/9ksndRhptBNQdJ2nDUqFLpZQR
         dRJtvS3AW+GQcVrJC7E5JRoF/eD7M3W5pKc0MWZzww3ccXmOHjdheKp5Ahvkb4esVPPW
         rt61PLcUa079iUpExHDiphAbYFBqIVQlp1g5yDL1BOh6bU4gtWVQgs6OGWPQxGIFpNsj
         dILmH4RGgdtu3CsdSyxMUQM7NCPt3lB8dOb4QM9pdbcleBijfpUhWo08RTxNuz3HTX1W
         gECA==
X-Forwarded-Encrypted: i=1; AKwUvBxHeAxeSdr0CSxVzs8XNVOb+l5dmYnl7wwztmOqPcqvnSUF0U/GeoAV7wrbXaAvp8JjuT1Q5+XpbRnz1uFWctUx@lists.infradead.org
X-Gm-Message-State: AFq9FYLahSG3Vx2e8F/OK7gNX6MfHzePkAYGJ0IhpBs5FDCuTBwZM3GW
	l7apBoP69lDePfvA++kV+mXBu03EB6IvBC7X7p/+MdH3W+7f+3FRFexfhn+hLAzXPg==
X-Gm-Gg: AYBFou3vgfDRrW1uD5LcAUlhB6jMyb6Jlr1S9pMC99jaJ3WgI/vTW04J9KdAmUb4lAh
	yoO1im39nFI9FGqQV2MeNYpfzIVFazZOclczhKdFlp0o2NL3Xit79nFg6slJyQaSJm/jlQz+h6q
	1GXdZ91NcYf91DABWWPQtQgkEmNPk8UP3XRaFIUbh2j9DtWSz1/w+lCVmLcdIqHeo7fNO+ru0aU
	o/1VrOGt/f2Hvkzxa2eb0bK9xRpNhzZpbBKjmjtS3/sO8Q0i9BlW6OiNqRdZZB8z2jndJm8Ia/k
	V9cl4Bv3bE1NKkqRjEJH1nPeNJOiwbCQgJZJBSJjrt5CqsiHuNqMOL6nsjkGyZ0xH/KxtQBpmRF
	IHqB7VP16NAgqjXppqWtYXJD8krTj//oVQDy6xAfv5e/A6prRIAXwlkqFWsuGjiMAcVAeIs56yr
	FLOeml0qtMSued02+bN6997Mr+yMQjzBwEX5+i+Ce4bmhWtDcSDsQr2XTiD3q5LaYoIFz5IecFn
	1zr6QlogLm7Aa6rMJcLcJwqh6XMtoJJINI2X9s=
X-Received: by 2002:a17:902:d98d:b0:2dd:c100:7cc3 with SMTP id d9443c01a7336-2df7dd72aa3mr103163935ad.63.1790569024011;
        Sun, 27 Sep 2026 21:17:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e23ecsm35034075ad.18.2026.09.27.21.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:17:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:16:54 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 7/9] lib/lz4: switch the decompressor to the vendored
 sources
Message-ID: <arnpj53cgDErAQEz@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113504eucas1p25e50de59c02681fc1385220be8acd184@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_211705_044966_5FD400A2 
X-CRM114-Status: GOOD (  11.38  )
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

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> -static FORCE_INLINE int LZ4_decompress_generic(
[..]
> -			/* Necessarily EOF when !partialDecoding.
> -			 * When partialDecoding, it is EOF if we've either
> -			 * filled the output buffer or
> -			 * can't proceed with reading an offset for following match.
> -			 */
> -			if (!partialDecoding || (cpy == oend) || (ip >= (iend - 2)))
> -				break;

Worth noting, these lines are downstream commit eafc0a02391b
(lz4: fix LZ4_decompress_safe_partial read out of bound).

Is this intended or are we "loosing" some of the downstream fixes?

