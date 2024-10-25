Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E765D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFezwFo6gCZgxkhS3m0Bz40bL+vqBj5E53gWNhWxLYM=; b=2xLob4cAnVnqE9c1MTfOovBrOy
	kIjTMqU06HL9xvLsiBcGDTs4SGQze1wSdj25yoE9mZiIA052lHiqApR4mADEk59qcFM/fbKD9yfct
	FSXQZleuLKJQT2/CEJfodkD4X4VDzqXV5QrGJsgJrheS8B6nmkRXilrXeH+co6aJddi49T1ZIMhj1
	gne0JMjhMSd2G3B+0teNNDutU7y8lNQS65E0IGOe2fM2616j59LHke+5c8Obu302mdZJ8rJ/psq7T
	HR7nKYNnXvV+0zrYFwtm+cF5fpqQvUpI5EIJt2majqsPEUWH9GQ3r9PKRU2HHp1PPU3GMVnD/TX+o
	PwjqR/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t49KY-00000002DN6-0xJD;
	Fri, 25 Oct 2024 01:41:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t49Ix-00000002D3z-3nyL;
	Fri, 25 Oct 2024 01:39:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c77459558so12314085ad.0;
        Thu, 24 Oct 2024 18:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820395; x=1730425195; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tFezwFo6gCZgxkhS3m0Bz40bL+vqBj5E53gWNhWxLYM=;
        b=FWosoVzbXmaayT7oRKSVwANrL8c2UiamQQW8ljMOhABNfXeIGEJ9SdahTPI1AavbO+
         h/EKqaTce71lU64oGBSsw95QhoeroSHP9n/A9BQ0YqQvCzR/QrWgnFhAcoqUMOnOiT83
         gxSVgTChGlNjKCB42BuJouCnvDmRimugVofGESBLYsJZ8EcwFtEOQv3WzatjnH/2+1Dp
         VLsozCcvDoITVHuypbDk3StJGJA8kIbjeOVZqh79LlyrxpiD3StN+rAqJXYKfq7fnMRp
         Bj0F4I4x1p6kinsMHcdJjsz+SfXAHPLG1+qcIvBlujJ/D90MBfz3+7r/iesC7ahkU8VB
         yVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820395; x=1730425195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFezwFo6gCZgxkhS3m0Bz40bL+vqBj5E53gWNhWxLYM=;
        b=hY5a0vj+qelfHYJvCx8mtQNc+34o+86LrVWvypK1JW+qCjvc5gGZ6UoR+9OjLiUHxx
         nc//NHLdTKQ9hMvjEnQvkbSmka5deJKe7VonpCUrJvpXN0h0Oc2aPUN8prOmp4GFA9qp
         i4+gmMJ4Fd29UHS6Qh0oL0EcAmZuglwedvcRUhV84cWSaIRse5UAry81mkqm4ndWldSm
         t1KbrcQDJPCSPmW4eERm7HxLvVFkanbF4SiPdrw8xLw5u+LR90p/hEMt4Q+ADgbc3cYk
         tP55uJiT67+G+yEKH4Nz+Ydo3Oy8fJZMnlHIT3bKXx3rvAZxZLEsyAqF5PmpznQzibTc
         Nhyw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Qq9dHSl6n3oK/sE6z963dV6NXmWlzIHVk3Z6N3Rvpoqchz52wZRHeQ0+8wbseawkyjvM4rklnTyMRx8=@lists.infradead.org, AJvYcCXQ8AJJBI/stTZemv3jHUw7/3JUS2JtHOkcz5bUVqP2i6ReZT5v7+uyOsVREoSGNrLz8yspR30eOPHCTojMLEBH@lists.infradead.org
X-Gm-Message-State: AOJu0YydNM/oQP/CMt05Z5MMs3kLvXcaysKDVzI2xsVndk/FVNcFgVoO
	QzZRV5lYRJCfQm0NZnr6KNrbJMhmr7EKk8ZmCzd2GPRvCZGH5TXU
X-Google-Smtp-Source: AGHT+IEHw2vnCcYrgnHOby/RDV1VCi/V1qVIt7cOTUZOAUPWFAmc5ivhTLTks2UseKSuzasudSeCxw==
X-Received: by 2002:a17:902:ecd0:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-20fa9e99bbdmr109987285ad.41.1729820394814;
        Thu, 24 Oct 2024 18:39:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e661sm761665ad.191.2024.10.24.18.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:39:54 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:39:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
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
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <2emb7jimgg4utgecdfhc232qclp5yfiqvlw6gl53niwtgoeb7z@uvoy7kqedqst>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <7lcmhspo5xq3numdbrfc44uqppbzigwq56vmqne5ldvg2uac6z@ivu4fmwbzajm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7lcmhspo5xq3numdbrfc44uqppbzigwq56vmqne5ldvg2uac6z@ivu4fmwbzajm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_183955_968524_C6C3E99A 
X-CRM114-Status: GOOD (  13.54  )
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

On Thu, Oct 24, 2024 at 05:37:03PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Oct 21, 2024 at 06:36:17PM +0800, Inochi Amaoto wrote:
> > +static struct platform_driver sophgo_dwmac_driver = {
> > +	.probe  = sophgo_dwmac_probe,
> > +	.remove_new = stmmac_pltfr_remove,
> > +	.driver = {
> > +		.name = "sophgo-dwmac",
> > +		.pm = &stmmac_pltfr_pm_ops,
> > +		.of_match_table = sophgo_dwmac_match,
> > +	},
> > +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 
> Best regards
> Uwe


Thanks, I will fix it.

Regards,
Inochi

