Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540C2D1358A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 23:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63amZP33iYpS8AXXhtgX4nWJKEpmd3UTb0cRGCmUwK0=; b=XoQ8ZDWlG/xgFPVHbA+k+7m8lQ
	jjj4y0oRE8dzfilvaBpUh6dlsvMPUbMuGZ9LtLKa04jArgmuAU/XWJMBAnb2SBzjbYEjxV35wS/dg
	EnoffUz0+3Fkk7z/qbGYpp4Of/p/vIKM2RY+E6VQvaam7uhfyEldnhL29yOQc79ciIktAEpp/WHKb
	FLYO5zoDUct4zLRdLzslTW4UHZ3TzqPAX2WKxTzYxkOrRNghaPK+YvzG+GkOQZUfBbMDjyOd2M9bj
	8kBjdhGYWEj/x9yuiWlykQXRcIElbr8qnsDut/60g/iLhforlkLF/fVWU+u6ShFTri1jp9qnu7Xiv
	KNBHFOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5CmI-000000094qf-08lg;
	Sun, 27 Oct 2024 23:34:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ckh-000000094fb-19sU;
	Sun, 27 Oct 2024 23:32:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c803787abso28297535ad.0;
        Sun, 27 Oct 2024 16:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730071974; x=1730676774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63amZP33iYpS8AXXhtgX4nWJKEpmd3UTb0cRGCmUwK0=;
        b=MWgM1WA7kDQ/Rht4y3bsgWgv0HVLxtkU7Kfup3uAUgO89FLtrV8nonF+RTyzHL748b
         NVLLFA/f+7Kr5C6pbL7wbonnmK3cajequWdNidYS4L90cE8quaLoEHcVavYPACgrSu8U
         PORSVJykdFCk5SpjTT7Y0KX3d8Qd/Jrdf0rcx/WPK6CxRDRdGn0W3y97qs+fqVchQWwF
         UlfFzoyUoy0JQajn8eUAWiqcpBGTVBfiIjlcJ2sLqYV2IP+0cZxguwbvTT/oJEJMD1I1
         S9N1vBEEpywIvbqahZCRJ+hKBTpyU8hmKvBI5FuR/16tR4gEeMH94mAJnD2KRNawkXBl
         JnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730071974; x=1730676774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63amZP33iYpS8AXXhtgX4nWJKEpmd3UTb0cRGCmUwK0=;
        b=sG0PV86+azm6vYZHO8bc2gKDOIPH8RLm56fLFY8jXciqRW6U7x8rxXzg5oJPOwVv5Z
         rdlFP5PCSyqfn9EJ0AmNxQMgSu7aKhcoNHjjiNwlMXPNTKnal9F5y15APJUnJsZ7/k81
         1DxHnKyorkDLLeMguucz+sNLisjqDKeuGnxWSjYqs7uykgKzxgFOCYPjeMvongX2OIDB
         tJHEf78xHO9TtbzTyKCIRCYXA369X3i3JTvbFK6LOyPrLMt6J5Xj+wz4mrUQUgBXUh/f
         EeL8HzosaMskIz/06n+QIa+ecybYwwrrkQ06mmdUQUQyKbRWs5nyqVpICdqtVx/T4Tbh
         UnUw==
X-Forwarded-Encrypted: i=1; AJvYcCWXSPjst5SdHZj/5KDFy4eOOtJQyXR5zTbrPyK69Qlzgq94ARDy2su06AYDYmfw4SVyJmzg36AbNjSd4kA=@lists.infradead.org, AJvYcCXIDvGReQ0/m2ZU0inCAuq3mxetds6Pl1Udn714k8vXaXFt+riaRVu/oNj+0HG14lioNTHl/55sZpPV69r5Jxji@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8EIiixopl7qKCW7CESx0eaftdBclxTJkskTsrpzWOfmLSuWf
	DXVtiNc1dA+t+oD/Blu30WQXhRoojQdckL0H0uFxDGxFGiQ50zFW
X-Google-Smtp-Source: AGHT+IGH/FrrfW96edZYOU/1eyhLzJAIrm6AzqPxdvn8RuUgJVuG2hN9MhbFU5coSZ1MSxKcT0X90A==
X-Received: by 2002:a17:902:db0f:b0:20c:c482:1d72 with SMTP id d9443c01a7336-210c5a46f96mr94859525ad.20.1730071973692;
        Sun, 27 Oct 2024 16:32:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc044cb1sm39854595ad.249.2024.10.27.16.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 16:32:53 -0700 (PDT)
Date: Mon, 28 Oct 2024 07:32:28 +0800
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
Message-ID: <mwlbdxw7yh5cqqi5mnbhelf4ihqihup4zkzppkxm7ggsb5itbb@mcbyevoat76d>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
 <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_163255_341004_64F568CC 
X-CRM114-Status: GOOD (  15.22  )
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

On Sun, Oct 27, 2024 at 09:38:00PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> 
> This should be squashed with a corrected previous patch 

Good, I will.

> (why do you need to select snps,dwmac-5.30a?), 

The is because the driver use the fallback versioned compatible 
string to set up some common arguments. (This is what the patch
3 does). It is also better to have a accurate fallback compatible
if we already know what it is.

Regards,
Inochi

