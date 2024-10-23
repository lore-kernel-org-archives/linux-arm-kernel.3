Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1C2D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDwSkxF7WJ4kfN02Vjn7/1ATHMtONFtEuwuiRviy10s=; b=nYNTdHblUQjE6bsQmBF53EkZGL
	luWEhdNi74qdupxqE4NSEu1Ndl9vi0jHveK5QbVL1UwsNyxgmbDp7pbHCL5M3EDCLolfVsTF6tAeB
	1RsxuBGe9siyRwDxOzV1ErdxZXakqSdY8ufapSS5+3nCeG6+WMXZyQRvpTwAOwegt9+SJBtKEfkaD
	ZFjV3r2vfKeeC07/PV2IuKXCvYReeVQ8hJ8M/kzvht9j51C9bV3QKTn/RMPt8FjUcdwrGtCgYShzG
	I7g0glYqNxXRDPlMf1W6WwqFfvtZh7IW4UdEASTr/I2qp+KQplANXp9TNfv8vGezG6jIVkcy4b54U
	byXodClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jzR-0000000G79G-3AUG;
	Wed, 23 Oct 2024 22:38:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jxs-0000000G6p6-3gnu;
	Wed, 23 Oct 2024 22:36:30 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so276147a91.1;
        Wed, 23 Oct 2024 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729722987; x=1730327787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDwSkxF7WJ4kfN02Vjn7/1ATHMtONFtEuwuiRviy10s=;
        b=IRZUkgIG/MfhJd0qba8D8kWCQtgpmDH+8/RQPGPOgaB+JTv97Y3Kd7lIqbqYF379+m
         3WsDGUuWwOZp97CbyI5m/Q0V80n+GCRgeOq4TQH2Svyp7oGGSkMXmi7CLVtdQpELLm2Q
         32OUt7jeEWwcWFo2MThf84+v10CkyHDCeodrGSF+d3bh/3DDX9Dr5BIlfTGXfAv6Bc6Y
         XIopb0KNHqdCwoRO5iVdv3tEBWWY8hBgte69QG+PE2n5J034bEs2Nsood506aSesDm0Y
         JoK8wYkGV3HgSlPVEc/SHznr5XykZ/KAZR56Dl3URAGi2ZB5Ie7dg2RIXSLKhgI4YZTb
         mhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729722987; x=1730327787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDwSkxF7WJ4kfN02Vjn7/1ATHMtONFtEuwuiRviy10s=;
        b=PmUFga+eUjxQq3vLYNbAUIljSLaH6W21flRcjO1qN0d+iXtTn0INBOIWnEP63t6fwe
         nIm3hTGOubWditA0mjl5p5ha99Ozv1DZRx0FM908/ajVAt4ApqYZFSUqTsTyfskcS9O0
         KBOLGcjC4+xT0yh25hJ1axdAxfmmzbBGGYcBHs8JuKrnLrUpq/CJj8mxz0MfYd/bJGNi
         rgmpr2345qfWUhrNjDZO2Lg3Lep/gnwWe988LRwI/fQR8xDcJH+IWi66qK5uWLXbDkKf
         ORz6mSjckaJIr//FBruDi7R7hnz6fE+2xUXKS/bTFSXHKt6cZcrF0wSyg+594lrB0Hop
         IaUg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ16lRZfwFbJt0i71JPlOTjRKtRPO669eM9AQEXKAOHgvJn2HeWpRXMAzwChPlRycf27Yy7F9BChuktQU=@lists.infradead.org, AJvYcCWtwIhgF4qGJ20ltBQYk51dnY1zAXIxMXNOoMjMMdc+zVzN5UaItOWR87pp7a6WHgsciKh8cKx4PoJVuI2tQ3Xt@lists.infradead.org
X-Gm-Message-State: AOJu0YywaBSKn9cJ7rHAuCnmOYoS0PLCZ6AM7feG+6Qq2dX1L3Gw59QQ
	DaZB+WWLuKQyAZHrOQxH6CBKHtxiPo3RG4tC6kOwaVsbxEXoLVhb
X-Google-Smtp-Source: AGHT+IHZHuIwRxG7OAHNulcO6fIJfRQUcZc5T2JQxQu8pU9oJ4gNvzh822T/LibfUXWlnPRbU4LzEg==
X-Received: by 2002:a17:90a:9f8c:b0:2db:89f0:99a3 with SMTP id 98e67ed59e1d1-2e76b6d7175mr4285461a91.26.1729722987343;
        Wed, 23 Oct 2024 15:36:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76ddc9e6dsm2033227a91.0.2024.10.23.15.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:36:26 -0700 (PDT)
Date: Thu, 24 Oct 2024 06:36:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <uzlmckuziavq5qeybvfm7htycprzogvkfdqj2pxrjmdkuovfut@5euc5nou7aly>
References: <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
 <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
 <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
 <amg64lxjjetkzo5bpi7icmsfgmt5e7jmu2z2h3duqy2jcloj7s@nma2hjk4so5b>
 <79f9b971-8b3f-4f31-ab42-42a31d505607@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79f9b971-8b3f-4f31-ab42-42a31d505607@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153628_944063_2D34400E 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, Oct 23, 2024 at 02:42:16PM +0200, Andrew Lunn wrote:
> > Yes, this is what I have done at the beginning. At first I only
> > set up the phy setting and not set the config in the syscon. 
> > But I got a weird thing: the phy lookback test is timeout. 
> > Although the datasheet told it just adds a internal delay for 
> > the phy, I suspect sophgo does something more to set this delay.
> 
> You need to understand what is going on here. Just because it works
> does not mean it is correct.
> 

It seems like there is a missing info in the SG2044 doc: setting the
syscon internal delay bit is not enabling the internal mac delay, but
disable it. Now everything seems like normal: the mac adds no delay,
and the phy adds its delay. 

The sophgo have already confirmed this is a firmware issue that does 
not set up the mac delay correctly and will fix this in the firmware,
so the kernal can always have not mac delay. Since this will be fixed
in the firmware and this interface is not exposed to the kernel, I will
remove the code setting the syscon bit.

Thanks for your effort on this.

Regards,
Inochi

