Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B388C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=; b=bR8bF2EgSXyFgw/9jh5d5TGs64
	jly5gz2G+UlenbcQE1uWydyALsWfo37SzrvNhvFpohIdKk3rPNXMe16GmUFfng5k0U8ZhpueT894N
	a2vpzxk3m6YCWiOjmT/qhofoPuOemcvRz0mYXFbRS7ijS8nfwsK8jgSmmCBZP1yewmxrYEPPRXBc5
	onxN9feHnhvyRA0Muj3eUmrjgkkfeYtfARTBcuaFwlMzdiiUb/w+jpzKdTUZaoP3aKtF0u72NhMMQ
	2BY32OmZTtevGJlzI+4ZM7tCMMip778HxAxWyXbRvPPI1G+VSxUTCihON5Gswg+/rZlgExYcsza9G
	wTHKW50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMpW-0000000CqNn-3b0a;
	Fri, 07 Mar 2025 01:48:50 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMNh-0000000CmlV-1cSx;
	Fri, 07 Mar 2025 01:20:06 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c3b44dabe0so153313485a.1;
        Thu, 06 Mar 2025 17:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310404; x=1741915204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=;
        b=Z4kgRSfUpbvrRI1j1wRiMPlVXFvRl4o4DF8LP3UJYU1YPJocDYJe1XiGi12HC0qyRT
         3WxNyIr0EKLRLqbk5L2gCCSObUmDwLV3a/TYjrSaUnpW/MMIV4VYkdyw2BEi+Qqjgphr
         xrdnw6hRLodmw+FjHsb8uvZE442i+bGWsXDunAQNS+8OwxHyCusKEAMtenR5FLzcGehp
         JrTBtyTl2PYEWQpfALpO+SJl0QCLqji3PTcQUn/EivWKZ3NuwHMo+Ou+xNRP+z3leuiZ
         XKSOLQzxP7Qugbq8J+1TP4xgqyl1X6hghLkLC7Gm69oN9AsVHEScimViumzaMBJhGhbi
         9ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310404; x=1741915204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=;
        b=HzTUSS+fbP5WxKb1hSGpGIoeO5aM5Kq6AjM9CdCuy4CqBmnq0T3Ds8FFOAwPDJE7Aa
         0t8HmObTh7sks/64pyxBxPeygP/fBguE8MldQq7FqOCVQz+hkg09kPkbAM2PR7lG9p9N
         Gpup8IrRizVxVHBFkVzl50fBUDj7Z3hs0Ld1ofIs80aaUPl1hkYs9c6Hj4aRb+lPNQvE
         eSqwLZ50ewwTqu/LUsgCsXRCsjo4d6neqtl3QTo/AnWFXhm32gw1VCXG462ZSSoG9W73
         VkybgNDjbydhcpIdv0fDf9uVzjI4W5KJesl1jG+RKvsOd+nF0SjKfk5MJda81Nf13IRn
         8QjA==
X-Forwarded-Encrypted: i=1; AJvYcCU2NrnB6YT2HtU6eiYHkIPRruYOlZQSHWKkg2v5BGr/I+pEFZEljL3IPr3W7X5aMTejOcab+nb4oeiwW5GUT9wc@lists.infradead.org, AJvYcCUu3NYRS5Cqy9ID/5LSiH2wltO8IpRV68nzDeS0CVrhd2TnKIDF7WOeUY9StDKw0+NkknZ/WumiP6yhjNY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAPJHHlM9KTunJGDD4kr5NWwXPP4xxJf72tfQXG15J8+/mzCSy
	UQkl/+lD/nYyZojsc9omhNLKhkgS9Ol85rmRJZfNFF2+oLaPlU9c
X-Gm-Gg: ASbGnct/ISKG2fOYlwMMas8TyoyB0GH6UcCzzc7uZiiJHttmmtvtwKtk5eDKThl1jZO
	/dI9cQm6fpspOGBwAZvVTUopYciQh+CtYSb88GofYI2b7XH6c19m6QceWP8FGwcNdNkPkYdAzjM
	qbO41Pe7vSmK/4qMJB1zzpz5nAqclPl7f0Innu9KF2DS3ybGtrQfwMfE6c5fBB3c21xh1N45DQd
	Vt1ba7ngw4hbuVti/IGav+HpLF+5o1aEgc93udrw3oE1764AFV0jOhDB61oP/6p4twcLWTsPCXd
	8LJM/RPIFopdv8H+fh/u
X-Google-Smtp-Source: AGHT+IGUO6/phCwAva8wDxFUHQEGREx4oP4CpMn1qmy+ZBLZmOEMjsqOLMniC66oleMf4LpqVxo2lw==
X-Received: by 2002:a05:620a:838c:b0:7c0:a0ba:2029 with SMTP id af79cd13be357-7c4e6178ce4mr254618085a.40.1741310404496;
        Thu, 06 Mar 2025 17:20:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e551181dsm164602585a.110.2025.03.06.17.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:20:04 -0800 (PST)
Date: Fri, 7 Mar 2025 09:20:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Romain Gantois <romain.gantois@bootlin.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet support for
 SG2044
Message-ID: <w7p3jnevmwumcblrkbpot7wpvajgf6enwpl4db5rbme4322hej@mxm54kytlguy>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250306165931.7ffefe3a@kernel.org>
 <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_172005_438304_CE4ADCFB 
X-CRM114-Status: GOOD (  13.30  )
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

On Fri, Mar 07, 2025 at 09:12:33AM +0800, Inochi Amaoto wrote:
> On Thu, Mar 06, 2025 at 04:59:31PM -0800, Jakub Kicinski wrote:
> > On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> > > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > > custom clock. Add glue layer for it.
> > 
> > Looks like we have a conflict on the binding, could you rebase
> > against latest net-next/main and repost?
> > -- 
> > pw-bot: cr
> 
> Yeah, I see a auto merge when cherry-pick here. I will send a
> new version for it.
> 

Here is the new version:
https://lore.kernel.org/netdev/20250307011623.440792-1-inochiama@gmail.com/

Regards,
Inochi

