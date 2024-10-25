Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D5FD149F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp1HPOnz6KaDGaKZ01AnsiVak0lO4QvTbnFD63srZug=; b=HoiV2DgQL/p2wuf3H+k9+QX5oh
	77eirScc6zrBi5uM4iCD4BIWIchvz7PDq/Y5nCHkInn10iT9CsiZFW9K8lRUWyKlsuGhQasTpahdW
	SLxpo5QL208r/MKbavZXd4B/oidn5032aqtIO0qqVyO8uW1L2y8lqdOZ0Fx65SQ5x/2G1P1JH6MVE
	jazr6tYsrUmNpg3CQzc16EGbDpR2mb+M661OSfuuVND6RqieId51gkCkAgFBAZ2TuyNMN1o4lAgnG
	TDACmSjXlC5MEMVKLVhyoB0uQpP0zKD4fE5puuV/nUYPSN0UuTIAs2b3StPhJ+IkLF9qeBYkQsY0z
	GzDZmFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Tpa-00000005XUS-3PDL;
	Fri, 25 Oct 2024 23:34:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4TnG-00000005XD1-23ui;
	Fri, 25 Oct 2024 23:32:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7206304f93aso296689b3a.0;
        Fri, 25 Oct 2024 16:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729899153; x=1730503953; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp1HPOnz6KaDGaKZ01AnsiVak0lO4QvTbnFD63srZug=;
        b=Pg68h6mGirwTaTM2vwMG+4jkr+IZyc+oaRTpiKXEg6ALdsw1+VmHE/qY3vLo4sI0bP
         J3CljFTTYq9l3clygPwHgC2D5AFra8oCxAz2FVLoEB76uua0Buyw2A2Y7ttEPN8dXIX3
         DhDpVETwVXkZLXrBYa6Qjk1q5ESdTp1B4TD3CQK/DRho8fLEA97d0bPClJdr/pyLYzTC
         sxYgEywTjVs4ehz5f0A+xU7bjswgydoqWxunyw7c8qGw+qxZFT6q3Tq+NlQyT21nPB+s
         0SdHI2Audq1AUt/xQRicqPEsqL7NC/C1+ra+kTLGfyiWSdMDq2WB15yyK/klAla2AC9N
         SdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729899153; x=1730503953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp1HPOnz6KaDGaKZ01AnsiVak0lO4QvTbnFD63srZug=;
        b=JSI7KbgBqqRYnO4dp2EtKrLDY3U1+SXkk6ad7sOB02qzDSUlWqxsztm/QR5DyyPly/
         sjMNoy1kErhWMx3QyG/nMS4zsZECcUfK8CEuP2PvdPb9GvwFiFVzR9ooQZINsVVZkAOm
         2QD42eYd9Sz9/W9pSTw9sWEeuUU0pPd22b/sjqZreRCbu61nZcY6Nq6LaLuHDbTm35jH
         ztkDhmv/73JFrCirz5KGKf1WEHYWwSZxrf/oqcYfj3fJyRqrt3R4yAxgJe16Ak7hDeNz
         Uptp9hnIDd9kPNn/gAnuXEvEgqdmdSFbgIq8m5gCbl8m7AQJI5Gbl8yL9/swPCEh2roD
         jzgA==
X-Forwarded-Encrypted: i=1; AJvYcCWZdK8n2Xy7QChX4wLoO69IG8/ErfoseayqCJ4aMmusz8ImYEgg3++NSIkMccUxhc9F+ZH2V81D1sSylYI=@lists.infradead.org, AJvYcCXq4uGPSpzNjHoI77G0js/gVhopMs6RSaAtMAPQBfK2xfop+hl19/XqeCEgvcHlJ1/EBVtzMk98BomSqSU9BcPf@lists.infradead.org
X-Gm-Message-State: AOJu0YwNL8gGihBPfPFgGy3iJZwd7HR6ux2QurWkR2+bymKyonipL9L8
	byhXnXiM5LNFtXHvxgNjuIE+m5Fgfbc+wcQk0Rb4qmoWl8u9GX1D
X-Google-Smtp-Source: AGHT+IFEMrLhc1Bg4iRCP4q4hozIJt6Sp7huOuGxcV+yJK49RmRzhj24Vshw5AfU6IcH7rJlxKNWYA==
X-Received: by 2002:a05:6a00:b54:b0:71d:fb29:9f07 with SMTP id d2e1a72fcca58-72062fc7c5dmr1589435b3a.15.1729899153356;
        Fri, 25 Oct 2024 16:32:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931e2csm1641781b3a.63.2024.10.25.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 16:32:33 -0700 (PDT)
Date: Sat, 26 Oct 2024 07:32:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, 
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
Subject: Re: [PATCH v2 3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP
 compatible string
Message-ID: <lsy4wjdce3bhnqgpnu6ysby6ghlzro2ghp6z3jzmwu6vuisr5m@dbljy7b3dhgs>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-4-inochiama@gmail.com>
 <2b691bea-3b2a-469b-bf5f-5e80b9b9b9a8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b691bea-3b2a-469b-bf5f-5e80b9b9b9a8@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_163234_551745_EC2E7A84 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Oct 25, 2024 at 04:44:55PM +0200, Alexander Lobakin wrote:
> From: Inochi Amaoto <inochiama@gmail.com>
> Date: Fri, 25 Oct 2024 09:09:59 +0800
> 
> > Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> > to define some platform data in the glue layer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index ad868e8d195d..3c4e78b10dd6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -555,7 +555,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
> >  	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> >  	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> > -	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
> > +	    of_device_is_compatible(np, "snps,dwmac-5.20") ||
> > +	    of_device_is_compatible(np, "snps,dwmac-5.30a")) {
> 
> Please convert this to a const char * const [] table with all these
> strings + one of_device_compatible_match().
> 

I will, this make the check more clear, thanks.

Regards,
Inochi

