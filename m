Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF1C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=; b=q+2xGR3+lYkZIM6JSNgapGmebk
	8sDO1nXV/K3QETx9RDr60ppmpREtOlH42iI/wYLhMvaaJ6WOJaEIF0LjfW10e80y05J4Wdvj5hK0s
	KAWx6joKvoUM/Eww9lqPYok2suKP/nllc65WUC6vBLsZB29R2y/BjmUI6FJk5l8FKb2zPOsrdNYD0
	IUEumEP/j2EmWkzAqld4ijoDVmOZu54lANibvpEfUVSZ6uWqzehkRpOyWpPt/SbNve80BRNyVeZLG
	9AXE6CIyoOGNOBDcKRHmL+kvv+XqRbavxVuZCHZ69s1RttVKVL++avnL6STEKwxmxKYjoJHHC5nC+
	HjW98lIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeDt-0000000FTEj-3Vmm;
	Wed, 07 May 2025 12:50:05 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCe9h-0000000FSDJ-1ISu;
	Wed, 07 May 2025 12:45:46 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c59e7039eeso975780285a.2;
        Wed, 07 May 2025 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746621944; x=1747226744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=;
        b=U4LYo9xeihPmiBBGqqZoGNaTk1BJs8Tz+rkrJpcowHZUONuemH+lO3XyGXvmfluae4
         G2+EJ6M9iz77fYMFIzd1NUcLDqi7lGvI5Lvb9BphZ7TfeXrhYSm3whKdlj4rioSmta4s
         S444Jo1XfukLXfmSQHaBKkCOuKTxPMOqj+HhjHwNg4dlZlLZhGmSQ3EeiCMIKtkGuKSX
         iSgMzdHFycXs20o/wU8I4iUqL7NCz01LrKTXG+lUyijyhzNa1Ffn1/qBYXOVDZlEDVwX
         zA625S66vcZkUA+ZKOpoPiuDeRAySRYcVFvH6IBq1TK/qd4KODh3FEf/qQygXGiObs61
         V8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621944; x=1747226744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=;
        b=dOzzr8Zu7QbrCVH/X1/XeQD6i6AS5iz1v23pnD1m3wnA0S8QiBGKkd2SJHcPVA0TWZ
         GiIfjvkCyB8P610g6bmGQn9YqrsTDnx4tURgF6tYhCNHob4+KNyKJWSLDFh3+3YgSX4J
         144qV1tXpScKRegjvyDoZwJU+1Qi+KBSVpoArurAGJfj9+dBp9eqQ7kS8tM3DbvwgvMR
         TYQZsavhGx+m87FyRP/nBmNUbMT8AV5JkY7rI6N6GpBZTPSFguNXEkpKLO0fp34VOR/W
         sIwy0I9XSKBxYsXmpCg81pD8iWsmDvp3VrsJc0uuj/9p9WrmhNHjBB54MA6qcLUwtiEd
         M5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF3FMKJ3CQu19xfJJOR7f99m9KruxCa9YniYBLtcs/XQV+ob03ay+nV2ML8TF/rPzHQ38H7M75aBWX7Z0=@lists.infradead.org, AJvYcCXfQojuDFn7Wy5oRhA7RCGAdEC17uKg+HNl+EKcNl+VeQZTIm0HOKkwf1m6M35TIvfUznba8moNTIQVutzklXI/@lists.infradead.org
X-Gm-Message-State: AOJu0YxzsoFmPJp9dn7tXfkYAjsSLpu0DCvBVILxFQtHzNs2E5Td0/i8
	Juiv1ZEpZkrpMy3gOwxVeOjMuJlkalufcd6eZDZ97A+4P7w7U8LN
X-Gm-Gg: ASbGncsk/fKV1dCdmojbHazS3DW0K1OmWNFYFseNFdKFOCEWVoNMau2xVcwiI65EXSh
	hfivOgcpS6XDXJ3yyQBwGQ0smpk55uOkJOdG/5FQYWUMOdameGxnE54RHgnuHHtbCTUY2FR5itm
	vi3yaGy8RoUHiOshy+539qj3yYRly4xklsheArwP0IV2bnd73YmMXqfg3shZuc8TP+njfXyOHKU
	s/u3L2bHTXAIJMPMPA+8fjzGfiXla+7LRB5IWcYpYch33hFUTdxSsAvcor17r3k7W4DOGeJjzoU
	cidx5TGkvHOe2G7p
X-Google-Smtp-Source: AGHT+IFe4p/E5mc6ZXdUskO144UfSWaGztqfNqrlmQcNmUMrZJzV/ph5M+fDa1Vi9KU3agPcMIiCzQ==
X-Received: by 2002:a05:620a:40c7:b0:7c7:bbc9:aba0 with SMTP id af79cd13be357-7caf73fcfb1mr554734385a.35.1746621943769;
        Wed, 07 May 2025 05:45:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7caf75b3a6esm145729385a.89.2025.05.07.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:45:43 -0700 (PDT)
Date: Wed, 7 May 2025 20:45:18 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Romain Gantois <romain.gantois@bootlin.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for
 SG2042
Message-ID: <tgqngwc7mteczfzhuyguy3jojnqhdi3ecaqhupuq5lhhhn3ve4@n2gb4w3pc7va>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
 <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
 <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_054545_350025_44E1DA05 
X-CRM114-Status: GOOD (  31.23  )
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

On Wed, May 07, 2025 at 02:37:15PM +0200, Andrew Lunn wrote:
> On Wed, May 07, 2025 at 08:01:29PM +0800, Inochi Amaoto wrote:
> > On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> > > On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > > > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > > > tx clock. Add device id for it.
> > > > > > 
> > > > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > > > does not expose this device.
> > > > > 
> > > > > Do you have a patch for this EVB board? Ideally there should be a user
> > > > > added at the same time as support for a device.
> > > > > 
> > > > > 	Andrew
> > > > 
> > > > Yes, I have one for this device. And Han Gao told me that he will send
> > > > the board patch for the evb board. So I only send the driver.
> > > > And the fragment for the evb board is likes below, I think it is kind
> > > > of trivial:
> > > > 
> > > > &gmac0 {
> > > > 	phy-handle = <&phy0>;
> > > > 	phy-mode = "rgmii-txid";
> > > 
> > > And this is why i ask, because this is broken. For more information,
> > > please see:
> > > 
> > > https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> > > 
> > > 	Andrew
> > 
> > You are right, the right phy-mode is "rgmii-id", the delay is not
> > added by the PCB. It seems to be better to ask for the vendor about
> > the hardware design before copying params for vendor dts. Anyway,
> > thanks for reviewing this.
> 
> Please do figure this out. Since you are adding a new compatible, you
> have a bit more flexibility. If the MAC driver is doing something
> wrong, you can change its behaviour based on this new compatible
> without breaking other users of the driver using other compatibles.
> 

Thanks, I will check it out. And adapt the driver if needed.

Regards,
Inochi

