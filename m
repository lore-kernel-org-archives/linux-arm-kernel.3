Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F7ED74957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ3S2WcB+zGxiJngz5Z329XPyYJE8uVordKNgTGUhwk=; b=sdx/1Sp2cs+fnJVSwUNEyQ/Bg5
	9NZCVHYUQWnF3p0FzUYzMPZPDq9XwHB7UBWpC73mKAL6w6cF5z6NaXNOfobBrJL95zrJSm5h5EAjv
	PPmtk4myP7FkRorw4tZWeFYs+T6AjqcX3nFaQpYpn3rvHsKELBEzDG/CxNLS2VyUmHC00+6UCzUgv
	S3eMuIKY25ybbR6e39rd28u8SoIc3quiKzUVUvBYQWjAWMV17Y/e+19veicwgMmce2hYwA73l2wSI
	+8YN9Yezd77wiPpXGGsBRkNk9MPtPYV5/QYihjkbkOq8M4mgK9Qq+vXKlKW2GW8YK3EbbLzxJodeo
	c1V7bgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xmH-0000000GSN5-3BCS;
	Wed, 30 Oct 2024 01:45:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5woL-0000000GM8F-0xHP;
	Wed, 30 Oct 2024 00:43:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cf3e36a76so61184765ad.0;
        Tue, 29 Oct 2024 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730249023; x=1730853823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ3S2WcB+zGxiJngz5Z329XPyYJE8uVordKNgTGUhwk=;
        b=UXMr4X7GmTol40TJLdmMnD9ne/JGZgbH5aXIeblZlkmag0hfgZK09iiv8fX9OesPjg
         3cBWvVP5spoYX/V+jBWlv+6YD6jh0hJNoJQdYwtIS5e+wADCj44RRHLjz5FwzIeMD7HG
         pFqOP3on4x8Jj395F2jCF+/fyzaFMxq6OzSf8jMzTcG2cd96SeTA/CBZzJcsoCVTb7PR
         pT/1cNaUGNmD0RU/gV1pJEDX5q6q+IDZ77o+mfgZDBoY+UE4PR6Y7kNxHKqhYnzCtnNI
         F0H/uHS9rmjOVqQw5dn10gHt0l8cxvgAbkhwbcj9q05taoxRxx4xlBZXxAl2KQ1YAL0W
         yIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730249023; x=1730853823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ3S2WcB+zGxiJngz5Z329XPyYJE8uVordKNgTGUhwk=;
        b=eM7JO9rMj4GiX7Zhre1Cj95CDzy3oYIZrchNol6AbwvSy9r7d5CMcxxEeFCFsX4S1m
         p9WlmhRC6qdirmj75pXAvHZCc0zlSYwqrjG/bMJ4HAkgw9kDMLfwWLRuhachW4FO5kDF
         awDcNfC6GdmZ5nLYcYuwr5rfUBErJGA4ivDIUOetGsTEvf2JecGnLNGy1w/WWvt+aiN/
         fr5hCPM0LxpAneHRuDzH8a8OoDC5Z7MyLtapXgcf4O/HQRnnx1AzhDnaa852HeKF8Lco
         Zk9eVkQPJR4LhkW4600t7dVDRSv2WL1u8c/dBYQacnDEu3gR8jHNTAAgJJ8Ku8pLwoWN
         lohQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj4Fw5uszoTdDzCkfiWAwgKUYpXXd9y9QV6ITwEqLJHONTZ00l3AyehGRQs4enokyBgxuOuBzW48hYu3I=@lists.infradead.org, AJvYcCVhkpNfxK/oWdT5KRSpZCrBjOD7kvcyckoiM6/Iykahs2wI4oCgt8/Zlv2em9hpJ/z55B4jmdtsvFvpImppZhNs@lists.infradead.org
X-Gm-Message-State: AOJu0YyRUdtFn+7L3OTIlV26cR1DCtkEqFBDdIr1PCsPpwilg2Mh8+KH
	y35Ha1H0Dzpe1ZapMwxtynE+hpS7t529aV3SIOfWU+vw7yBLBSEq
X-Google-Smtp-Source: AGHT+IHHRyGyDkKcNwaxMn/2+7uQYnlMNqSGQQ6CzP4zXPjfAAfmUzV8DyN0d/uv99tZavi9Wq36BA==
X-Received: by 2002:a17:902:d2d2:b0:20b:6d71:4140 with SMTP id d9443c01a7336-210c6c7354cmr156629705ad.44.1730249023405;
        Tue, 29 Oct 2024 17:43:43 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02eee6sm72101525ad.219.2024.10.29.17.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 17:43:43 -0700 (PDT)
Date: Wed, 30 Oct 2024 08:43:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: net: Add support for Sophgo SG2044
 dwmac
Message-ID: <kg4fvjertilaekjwuwxiojy25qsrwrmc3pxnpu35awg7klmlmw@3aar5yqe3olc>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
 <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
 <mwlbdxw7yh5cqqi5mnbhelf4ihqihup4zkzppkxm7ggsb5itbb@mcbyevoat76d>
 <8eeb1f7c-3198-45ac-be9a-c3d4e5174f1f@kernel.org>
 <gcur4pgotkwp6nd557ftkvlzh5xv3shxvvl3ofictlie2hlxua@f4zxljrgzvke>
 <e134b98f-5a57-4a37-b46b-8b4017f050a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e134b98f-5a57-4a37-b46b-8b4017f050a6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_174345_310782_0DE4E1A0 
X-CRM114-Status: GOOD (  30.39  )
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

On Tue, Oct 29, 2024 at 02:27:20PM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2024 08:16, Inochi Amaoto wrote:
> > On Mon, Oct 28, 2024 at 08:06:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 28/10/2024 00:32, Inochi Amaoto wrote:
> >>> On Sun, Oct 27, 2024 at 09:38:00PM +0100, Krzysztof Kozlowski wrote:
> >>>> On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> >>>>> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> >>>>> with some extra clock.
> >>>>>
> >>>>> Add necessary compatible string for this device.
> >>>>>
> >>>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>>>> ---
> >>>>
> >>>> This should be squashed with a corrected previous patch 
> >>>
> >>> Good, I will.
> >>>
> >>>> (why do you need to select snps,dwmac-5.30a?), 
> >>>
> >>> The is because the driver use the fallback versioned compatible 
> >>> string to set up some common arguments. (This is what the patch
> >>
> >> Nope. Driver never relies on schema doing select. That's just incorrect.
> >>
> > 
> > Yeah, I make a mistake on understanding you. For me, I just followed
> > what others do. But there is a comment before this select.
> > 
> > """
> > Select every compatible, including the deprecated ones. This way, we
> > will be able to report a warning when we have that compatible, since
> > we will validate the node thanks to the select, but won't report it
> > as a valid value in the compatible property description
> > """
> > 
> > By reading this, I think there may be some historical reason? Maybe
> > someone can explain this.
> 
> I think this is left-over from older times before all specific
> compatibles were added here and in their bindings. This binding has been
> waiting for some cleanup for a while now, so this is fine.
> 
> I still think the patches should be merged, though.
> 
> Best regards,
> Krzysztof
> 

Thanks, I will squash this patch in the next version

Regards,
Inochi

