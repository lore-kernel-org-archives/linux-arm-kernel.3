Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E88D0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 23:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkwckHmFPJEkM3Wxs1jlPmTkTzgcJwcJLaHVmfmItpM=; b=M894bhBKd9YJOnP5zty/WtFUwB
	zvhsvtVFQTAdMLulgYGh1sXq1uxhFHPrdWrRRQhkPZwqT2IzEhAA+ABdfrvLwASXmm/hFh0oEoneI
	gtEcLXvuRRNOmlpvJ9/AG3cKG4FWxC5Papmq8pxTTkWl2mrs5aZERtuKLbG00iXqS933/tzN0+C55
	dgAdF4C6w0WOSb1DyoS8SGV+vbZeluR5cCU52k/pxzvBglGR3H79jJNxa75SD3ka3EBfUo12xA0jc
	GD8d9jraNSTqDu2P9uFSKoe3mVIFkXEBWpyLVW40bmaU221QduKIS/K7g7PPvIg7QIzbnaQhpJoWw
	83drTwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kMr-0000000GBSy-3Zue;
	Wed, 23 Oct 2024 23:02:17 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k0C-0000000G7Na-0XMB;
	Wed, 23 Oct 2024 22:38:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e5ae69880so218986b3a.2;
        Wed, 23 Oct 2024 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723131; x=1730327931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkwckHmFPJEkM3Wxs1jlPmTkTzgcJwcJLaHVmfmItpM=;
        b=lKgWZSCsCKFlRCn9ZmoMhbulp4SzhS+koZ6ZR3E6+P9cvkKWwViKob6lXB283SuTOz
         e8RfPO/2C/hDuP7JfB1l3/rLZuyl2MmY7vgdrT1oBYMnZ4ULDHnybq1VNmBAHBxSSoXs
         87g9RYGQVfvg6cbbXFlzwVLk3/MQrykcn504/kvjJZnKab/qy6NorOkWNqIhBpr4kSCn
         z/AK7aLOAGQdPmGSJEHbs8WsgmPkAOHnoyepxkiZZtjBJsoyizlN5vUCtLbyBnUHq2wV
         YEaTQSEwUnr84tIoKUOAuY5578YOV9pCjUWJ0VptgwCcc9JKQ4TkiXBPKMdeQkuwCgyZ
         0/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723131; x=1730327931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkwckHmFPJEkM3Wxs1jlPmTkTzgcJwcJLaHVmfmItpM=;
        b=NNXjK8b4nYce0SEuii89IuQQWtou0kKtxdyvDzM62R/KA1FlKuCyrTcJcDI6YzUhDm
         21qCEgLGVN0uv76ylU2g2YxUoRjKSKZLKPavRi8NfWCtyF/Jxr++i6Cwga0bOobqz8vu
         jQ1tK5ZXfEKHT6Et/xRXnsb3818TD3qlqU4o36bNwIifOdmCoCxK7DzLO9/ClZ9/aATr
         DLb4tsloLYOxvbRSwuEhNswzUvesafyi55mXWR/lGt7Trkfqv1XqOtAN2qq0Gw182xkE
         Yx2D8k4e9dJfL4sb7SSuh1xo8JbAkVNKSu26ITb0vsGa1+FeRGWqQ3EDrFqivFedbpiy
         0rtw==
X-Forwarded-Encrypted: i=1; AJvYcCUBUedd7XiMJmsa734moqKtooEqqCMBpImlBfdHgcVkGW9iW7ciBjjUWC9S1/7YQF5gEZQx8IYvdrrup9EwAp05@lists.infradead.org, AJvYcCXcF5ARq9ZfGQ0y44qKeU+EdA/bHiCafqtAP8si1ijPGNSwKx7JyiwvXYemTZC4St5pNjFnm3swzZLKaUE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLwsU79zgYd32DqLf7dZcgO1zfS/ZUHhyUzOjFCJ2juxz+wI/8
	vlnLnCv/kQExptGEi8Amqg/OajouIRKdFAGzoTOxRm2xwa+ifvG1
X-Google-Smtp-Source: AGHT+IGUv5GcBzM76Tis8BZFsna+Tt+yRb2ER6YRERF8hAd8oZIE6Ogk0CalUXCV034zvn8ODhWHxQ==
X-Received: by 2002:a05:6a00:806:b0:71e:693c:107c with SMTP id d2e1a72fcca58-72030a8b242mr6049959b3a.11.1729723130943;
        Wed, 23 Oct 2024 15:38:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312c8fsm7047579b3a.14.2024.10.23.15.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:38:50 -0700 (PDT)
Date: Thu, 24 Oct 2024 06:38:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
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
Subject: Re: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Message-ID: <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
 <20241023-paper-crease-befa8239f7f0@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-paper-crease-befa8239f7f0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153852_201026_CE8CABCA 
X-CRM114-Status: GOOD (  23.23  )
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

On Wed, Oct 23, 2024 at 09:49:34PM +0100, Conor Dooley wrote:
> On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > > with some extra clock.
> > > > 
> > > > Add necessary compatible string for this device.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> > > >  2 files changed, 146 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > index 3c4007cb65f8..69f6bb36970b 100644
> > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > @@ -99,6 +99,7 @@ properties:
> > > >          - snps,dwmac-5.30a
> > > >          - snps,dwxgmac
> > > >          - snps,dwxgmac-2.10
> > > > +        - sophgo,sg2044-dwmac
> > > >          - starfive,jh7100-dwmac
> > > >          - starfive,jh7110-dwmac
> > > >  
> > > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > new file mode 100644
> > > > index 000000000000..93c41550b0b6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > @@ -0,0 +1,145 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: StarFive JH7110 DWMAC glue layer
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > +
> > > > +select:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        enum:
> > > > +          - sophgo,sg2044-dwmac
> > > > +  required:
> > > > +    - compatible
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: sophgo,sg2044-dwmac
> > > > +      - const: snps,dwmac-5.30a
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: GMAC main clock
> > > > +      - description: PTP clock
> > > > +      - description: TX clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: stmmaceth
> > > > +      - const: ptp_ref
> > > > +      - const: tx
> > > > +
> > > > +  sophgo,syscon:
> > > 
> > > How many dwmac instances does the sg2044 have?
> > > 
> > 
> > Only one, there is another 100G dwxgmac instance, but it does not
> > use this syscon.
> 
> That dwxgmac is a different device, with a different compatible etc?

Yes, it needs a different compatiable, and maybe a new binding is needed
since the 100G and 1G IP are different.

Regards,
Inochi

