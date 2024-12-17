Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AA3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 00:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrUU1sA/PquF8Kcvm4irBd461MDD9nPT0JTqTCo4L28=; b=TeBW+7h+UQehfUaqCOf9OLbeL4
	Bzd73w9pTTn2cpOqwC6w1UhPAWC7+E04ZEYDey8Idwb6Tc/4vEhak6Q9TWb4N/Tfbp8HH0R/kpevo
	68PjH1Iu16jpdk9ACArH7owL0vSFfo4Kf7SwWfBe5sT9uwq2KoB+jwJZIHFoXoGsbPW+9C/qEyKRj
	FS2dYDR70TWFMULHBLdIxIydcsT+PQPw1+KFn87Qe1nl+wjrpvIsbz2BHfhRSTn0xKgxf4+bl7vQT
	s7Mb1/nTtoVPa5HJ7BBlTSjHzQyeWBeTBlludqNZbMGmCJzi2R9M8cv56I6MAgeuxpubKVlXCM9l5
	nlcYUZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLrO-0000000BocS-3CR6;
	Tue, 17 Dec 2024 00:54:50 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLki-0000000BmsR-0Gez;
	Tue, 17 Dec 2024 00:47:57 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-46772a0f8fbso42388541cf.3;
        Mon, 16 Dec 2024 16:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734396475; x=1735001275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrUU1sA/PquF8Kcvm4irBd461MDD9nPT0JTqTCo4L28=;
        b=FvFPDrJItlen3EYR4g7pwf2Y8VnvAu/EIq7GZwCQFD5wOc9mssy89s1yZEfY1Wr72a
         6iwJvAbbVh0I777xS5pHoHTJxWzR9GRuOHqJjC1EUmXlVEcgjaAi2sKrD7HskTNZD/GI
         B11364MpVYIoYq3EmWU7zW66Zzi1x8Am7x2E5TGbBF/dcp/ojHsI+lMkrAvzGiBH1y0a
         MyNl0cXNf0eyfzPu9nD5fROJuXlnOYc76AnicPofhp22xaG8UPi3wrWIdrXgrhzUHVZB
         lPmOh9Cv2THRdAPbiw8sAdg0qgvxMeh9h9u+A9zFDax2PKp5HwQLqFyXhdVLNJXHegIh
         z4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396475; x=1735001275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrUU1sA/PquF8Kcvm4irBd461MDD9nPT0JTqTCo4L28=;
        b=soP38p3LjPo8A7vv6FhqpADHd32HqjLSRjetUs4o12LM5aK4qhVfGJUxZ6xUC1bPqr
         wS3+CpQw5oCQWos3ma1kOh+IFqEJhtxxHTueu7vXhxNCqL8id+3KcMRTDVbiXiBhsuNZ
         C50BGL72L4noCV7OLfxzwoF/rVwJ+L7iT4tFQcll1tal3N+AAb8oZrPeqlTNV/iji1uT
         eD2nxvOtMvllGeyzA3dimdnohYw69OYZEewF/Pxo1cYpIg5RYOCHzSZcIvU3G+ns0C8n
         4p4UFCN2RDwA21tQWVzLC0RJXL9dj6/3C9xzZVeQUQYYeZbofPylR9O9M2Xs2LwYoTXT
         iJbg==
X-Forwarded-Encrypted: i=1; AJvYcCVf/ltlCF023hyYLW6I0Sb53enJVlZ/PZ9ARc6nmpJf8zjSp02F1o0zZx82PdpDnU5ExyLvQ51du3EWJx4=@lists.infradead.org, AJvYcCVjVrfPqUEbGRaKpRjoRtkxgw8tZ349wePMacTG6Vmn6Xe+NIpwRZ0KeMB33p5EdrhvXOzS8YRgfjOcSCmhwIFE@lists.infradead.org
X-Gm-Message-State: AOJu0YwTz7r/1EpRdW4oAZHseom3S0kmFPZgTrTr88ncVyX2x81Dswad
	C5Zqxd3TliZi9Odfs5QBdJ/txeZTgUKGmtf2eq/IET70cT/uiUh4
X-Gm-Gg: ASbGncu72gzF6y/AX/lTMxQZTgV1ccynRFNoaMJ4ytPlr79yZT1w0mdJHda1aVMs5HR
	uUo2gotdNEvKUVg//bbcr2b0rupt2Ty7eRY+rav56uY7/Xowp+QK6mcKZodKPCN7T/qity+aahB
	sK7O0PqPoMxlxw36/C8PaqivwbE1JrS6FrP3adD8ycd7fyPSozq2GpdV9spxU1Z3g9vtlJ442de
	FZeX4ZwOuz2nrvmVuZSrWYi6XTnGcBg
X-Google-Smtp-Source: AGHT+IHkNqEBTJEhiLtyWa2CGVz+1od1KR/2tzYm9ObLc/fC9+AGP2+40XW+DImZ8NXvMV8LHBW42w==
X-Received: by 2002:a05:6214:19c3:b0:6d4:36ff:4356 with SMTP id 6a1803df08f44-6dc8ca74ec1mr289693926d6.19.1734396474867;
        Mon, 16 Dec 2024 16:47:54 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd38078fsm32822106d6.119.2024.12.16.16.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:47:54 -0800 (PST)
Date: Tue, 17 Dec 2024 08:47:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC net-next 0/3] riscv: sophgo: Add ethernet support for
 SG2044
Message-ID: <puld3vngm4rti74aecpeoro3tatifgasrq6sxg4huufuptmjtk@njfskna3k7ds>
References: <20241101014327.513732-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101014327.513732-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164756_121599_E66FEFE0 
X-CRM114-Status: GOOD (  11.85  )
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

On Fri, Nov 01, 2024 at 09:43:24AM +0800, Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Since v2, these patch depends on that following patch that provides
> helper function to compute rgmii clock, and this patch are marked as RFC:
> https://lore.kernel.org/netdev/20241028-upstream_s32cc_gmac-v4-4-03618f10e3e2@oss.nxp.com/
> 

Hi,

I have seen the dependency has been merged, is it possible to 
resend a normal version of this patch?

https://lore.kernel.org/netdev/173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org/

Regards,
Inochi

