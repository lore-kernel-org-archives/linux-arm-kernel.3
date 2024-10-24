Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316BFD0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+fsHdO3eEGRLBsyxvQ4eLN0TAO1AeUct9QR19BrA5o=; b=eiTlNTUcuTQdEtG9Hwx4Ag2kma
	BcsdjIP/r65MBJw08zYp8sJNsKlip8689oNUFgI4hsEt9JdRrjL+LA83jG8LS+XPXd72ASljgpXF8
	yl8tRqhE5KRIJTFkVpksa5Qq6WaP0Sqs9Ea0n2/ClxZUjjw1U9tE0N7OClQskGPF2E0hHJfhkKT0e
	Q9lIclYDm8TpJt8uvBVfJgctk1QaRZpbRjY+GG6NbnnergJ1LM6xKA7hU7Dfv3H8bCVU/ClPiqFbv
	//V6nylXZyjVGFM9UrO/A/PQzY6dFrGiLrMX5bo/gNo12lPfIqJdwzQDKH0Yq1L5sC4FKdCFhc77p
	neXxTLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3q78-0000000GlfT-2xkO;
	Thu, 24 Oct 2024 05:10:26 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3q5X-0000000GlUL-1m9C;
	Thu, 24 Oct 2024 05:08:48 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-83aae6aba1aso20364839f.2;
        Wed, 23 Oct 2024 22:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729746526; x=1730351326; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+fsHdO3eEGRLBsyxvQ4eLN0TAO1AeUct9QR19BrA5o=;
        b=YroKnSaWeE2jdbnRY6Fa1pT8AnCSheWel76A77e23+3LGtBj3kqpmPBO48BINYCeCC
         ehdJ6XaylFn7CABHDULApTU44/h13inTwcv7DuHIeljLAfJSHOjBub/2eV4aVwnKVnOF
         Bo90jr1QJvjZKoasXAF8JguztGYblxr4QDcspF/lLeSx7+ihAAr+ReVKahsfynAdGZgF
         WlHtj08nQqYFiOkAnSbIFVuSU0M/0x7LCPVXSBaAlvhjBYX9QqQQ0Rxbb9xuQHRUp4wt
         1EfphltZIqpI0KZiFni59st6UbTqcrkVn0Rd3RaGOn3vzmSOlOQ3GcnitoiGUbYXfDEZ
         9KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729746526; x=1730351326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+fsHdO3eEGRLBsyxvQ4eLN0TAO1AeUct9QR19BrA5o=;
        b=IovxbvqwF7F9Rbx3lUKAi6glO4+QXek8T+eWx/hV4/5Itph7d1Njvcuvr0VVqWFZhb
         FONy9RJddgLhjSiXrdhta/nWHiIiskz6nmum03s3wgkCa6XB/ewCso/2D1tOOFze7MS2
         ZUNpXc33kHenuvVHXI+tpq/FU91HbgY6k/36GeHZCMAxEpYPE8BkQoihy+/qCTWhTTq0
         lDEIA3GBWbWLxfWULhw0nOfgr1rrj1e0n57jpOrq0ZbQHlU4n/cxflG7PSOipylf0EFl
         8CNbwMqCyQFzhxkCtZnN+ln6RLdAws+sOQQAAMo3+fA9rOV5wp9o+gHI3qDd1Dz7ACVW
         E+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUHjuhlZpYNGPVzCwcChI60mbingo5jGpgu4Wio1G4lJ25h1XbC1H2YdITgPMButuN9byi/XYM/tZvSS/rVJid4@lists.infradead.org, AJvYcCW2Ske96EtBnelPHVEQNUXFR77PCAk9GjbnZqdjvsVvvRj2X/7PDyhbhHR1lSv+LdF8/MrwislKNssG7mQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgyB1T3qSGVo1e7QMt5+Hn0Q1AYTyeDv7cKEZISjhZ25Vw61T6
	zxY83ovF2kfw1v+hY5fxnRyQnOytmqJ2zT8dDT9ZkLAzBdJYS6NN
X-Google-Smtp-Source: AGHT+IG5X1vksF/tv0wq/h048to95RzgD7AYZAZKnCMoZdlNaKEv7NrmBxQKxyy/6w+cY2qtmyTkfA==
X-Received: by 2002:a05:6602:15c6:b0:83a:a305:d9f3 with SMTP id ca18e2360f4ac-83af61f1857mr646877539f.12.1729746526016;
        Wed, 23 Oct 2024 22:08:46 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabc118fsm7788874a12.70.2024.10.23.22.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 22:08:45 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:08:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Message-ID: <o46c732wznqvz2p4gkqtjjratxwrgntw4mqballph7fjitvmhw@lylkpsqdp2ar>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <CAJM55Z8SnjQFui0J2hOD34HmBsGqZfxn8e_KAWhXxiqswqv6Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z8SnjQFui0J2hOD34HmBsGqZfxn8e_KAWhXxiqswqv6Ww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_220847_489008_956C1091 
X-CRM114-Status: GOOD (  19.27  )
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

On Wed, Oct 23, 2024 at 07:41:28PM -0400, Emil Renner Berthing wrote:
> Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > with some extra clock.
> >
> > Add necessary compatible string for this device.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> >  2 files changed, 146 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 3c4007cb65f8..69f6bb36970b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -99,6 +99,7 @@ properties:
> >          - snps,dwmac-5.30a
> >          - snps,dwxgmac
> >          - snps,dwxgmac-2.10
> > +        - sophgo,sg2044-dwmac
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> >
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > new file mode 100644
> > index 000000000000..93c41550b0b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 DWMAC glue layer
> 
> I think you forgot to change this when you copied the binding.
> 
> /Emil
> 

Thanks, I will fix it.

Regards,
Inochi

