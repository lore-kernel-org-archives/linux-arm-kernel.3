Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwN4Vlj9V/Si30XGhhYcfcrSEwd+tR4XQQLqO9MnNd0=; b=m5YOXlwsz4Btkt01TXfgg23gYg
	lJI8WK/YjXCVSL4+Ui6f+TwCsvEOpMmzBzu4HRgeYu99xywQDh/fvlF1JR40kCSDTV1TeedpdGO92
	cqq2zxmj5ohWJ2u/JQSSxJtMgeJ1QgFQr9Qeakw2GRZIEEPw3gTLZpy56uPUFVr2DSmkmjppylHSo
	epj4RTI6TfvUSQfBTx+312AojV+2sn5RAHNLlv8Oo7txt+arFjU0L+YC1OiD/Sl5zsFIYemPm1KoQ
	9G7+dLboeNG/UeZeD9IoY7C9u0vO+jpRKAlogPszy4niCT+DywWWxYN9J5vxYn2JBrNgLjZrHLlAf
	RoBqKJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB1Q-0000000HZUT-2pRp;
	Fri, 13 Jun 2025 20:29:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAzG-0000000HZFp-0elz;
	Fri, 13 Jun 2025 20:26:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2360ff7ac1bso19430705ad.3;
        Fri, 13 Jun 2025 13:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749846413; x=1750451213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GwN4Vlj9V/Si30XGhhYcfcrSEwd+tR4XQQLqO9MnNd0=;
        b=PEEHtEUoQSDHHCKT0WqjLTOFtNjs+VvbsER/ebLBQzpNK/17vgZub4v2K1HD2RcdUC
         yW6/ve9fzht5b9jSPU8mLTobnTpW6Tq4E/PHFRtZS6B3TCLLAzgwgm9htw1xJ2ndoo6d
         qPgnmyTc762VL9RJZRkeJpbAFWnBrHydhRhmjC58x3j9Wwd/QoDVnjLMiFwGXzzm30Nu
         wkixLJYXAbGv6O5LYchK6gXTLWwiyWqzNpXYl2w8bOO/OxRtQ5D6Kp3iZoQ0zzs0PGJH
         6jRTjZBJBrKfmCykcABIH7lx01187oGPR1/AM7pcn4moprsMl2dZxf8ZH69w0ByIvYkX
         0G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846413; x=1750451213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwN4Vlj9V/Si30XGhhYcfcrSEwd+tR4XQQLqO9MnNd0=;
        b=ZwzeWStFHid3DSQ6rUZ24HyHw4peuHXJ0p4im9C1/jbjYl5O9fU7YNEb3dEjGm7cEC
         0JfRPhpzWd+PdaXRBpLmTAMPZ04F8M61AoIk5anW0ec/CaMAoMPrZ0tXo5ZcFrHgdrg7
         Wu8jlyG3jVezjnIouhj+1B4g213T04ttDxS2cHeYSyEOCmlq85YePqHmcCQHhe1S7Clr
         ENM7cr9RTtCcpLlW4uVdIYGhRvt8wZ4nqTzErmbq5+BXmrarH/HsFJ19r8NDie+qndTS
         uf4F9CUVv+91P4NZT1ZL6P+gpt8W1iZPFJB75ThbeBD5btLPYpJXUgsHp+kCah0aYqmL
         7PSw==
X-Forwarded-Encrypted: i=1; AJvYcCUwrnfak7T7JnHd37CsNbk9WicAPrdW4Df4Mf/YbmJKFBeXf9+IV/42KFxh+lb4bad3qarYy7Ycpjoy796zuonR@lists.infradead.org, AJvYcCXgVVyndVUHbN9UHDQJKZjYDR8WbGcJyKv3xD2LPdYxB8DcBDQayKyqVoOvEZxAn27adGc+NTjgEa7r@lists.infradead.org
X-Gm-Message-State: AOJu0YxIkyi2guUgYTuhnEfh3i1zH7caXe4UWFjdyrET3CakMjWdJzu6
	7TbR7ne8qAUfk/t57pQo+cJNYes4TFOf+AwtCRUwAh/BCpcMu8/7HYZGLTK4BApF
X-Gm-Gg: ASbGncstktLepa5EOb20R4ytIBfwo4HI8XRgJDvVpf1atzQcjwFYCJ0+ZmUeeE+aciy
	8mA9IUq0YqHTxs+9x/Rgcu+sGH2+ebDJ56YsUQZnFagFTFJH4tmgqe91ZmY9PZHwlmLvynKkRSS
	0anUgy/TXlWzERFM82/5a5phw2/H6eLm5BgEoLyEFtUO4bWz1WkGGCezO/a9qhj7FF+NlGWK3eZ
	zmbvEYPP+JGboQe/J0c6DljrRsboXV8nJW5QaTk8ZTi48UG3hE18i6df16xJsPtvDBMrVQgO/PT
	O6+NJhiQMWGoAY9wkTkHReCKndNWmJ6el99FKH/hPKAY5KAyNw==
X-Google-Smtp-Source: AGHT+IFMYwG+tAQaxnOsOinKwBE/kqO0tD/aAkh1rN9LDtPDMa0ftPIDcZwR/F9qih5cAjFZot/vjg==
X-Received: by 2002:a17:902:c941:b0:231:ea68:4e2a with SMTP id d9443c01a7336-2366b12f867mr13009585ad.34.1749846413249;
        Fri, 13 Jun 2025 13:26:53 -0700 (PDT)
Received: from geday ([2804:7f2:800b:84a2::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d0b12sm18838725ad.253.2025.06.13.13.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:26:52 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:26:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 1/5] PCI: rockchip: Use standard PCIe
 defines
Message-ID: <aEyJhoiPP0Ugm1t6@geday>
References: <992ab6278af59b8f2f82521bf4611f69a916bbe1.1749827015.git.geraldogabriel@gmail.com>
 <20250613201409.GA973486@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613201409.GA973486@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_132654_192323_5BA670E5 
X-CRM114-Status: GOOD (  13.81  )
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

On Fri, Jun 13, 2025 at 03:14:09PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 13, 2025 at 12:05:31PM -0300, Geraldo Nascimento wrote:
> > -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> > +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
> >  	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
> 
> It looks funny to write PCI_EXP_LNKCTL with bits from PCI_EXP_LNKSTA.
> I guess this is because rockchip_pcie_write() does 32-bit writes, but
> PCI_EXP_LNKCTL and PCI_EXP_LNKSTA are adjacent 16-bit registers.
> 
> If the hardware supports it, adding rockchip_pcie_readw() and
> rockchip_pcie_writew() for 16-bit accesses would make this read
> better.
> 
> Hopefully the hardware *does* support this (it's required per spec at
> least for config accesses, which would be a different path in the
> hardware).  Doing the 32-bit write of PCI_EXP_LNKCTL above is
> problematic because writes PCI_EXP_LNKSTA as well, and PCI_EXP_LNKSTA
> includes some RW1C bits that may be unintentionally cleared.

Hi Bjorn and thank you for the review,

while your rationale is correct per PCIe spec, per RK3399 TRM
those registers are indeed 32 bits in the Rockchip-IP PCIe, so
I'm forced to work with that, but without fear that other
registers get messed-up. (See for example Section 17.6.6.1.30
of RK3399 TRM, Part 2)

Regards,
Geraldo Nascimento

