Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03928C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 01:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lQejjsw0q+CGE5uh3c+Gs+NLf8tN+h+7rm943Xmkng=; b=GEbCpOktNvD2Zh1uj8Qd4tzChr
	L5HrxArl8g0pog/ERrOMTuPhuYq9dNFDoo1Znw94YSEEXLrJ8mKNVgvOkbE4tml7SF6xDisoGZYer
	G6fsn3WkUtfSgw9f6jXqZ3mTV3FgWZV0XAejOtpl6BFPolRUpLdlfj4ERDN5tloBmXzFf9mzdQvjJ
	u7YjyyRHS1neW5/r9YuAIk+BkSvouoPlDmxnJlvOhc2fvxezw+5OeilptDXVHGoWQarF4v0wxxSJ/
	hXsuGm+at98JEfhL4y8kTn8dG0VDzb5ZHAdcReFw6JBNR8PKL895EvMi7muG9oAay/gXGk9fU8iN8
	1HefJ9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFt4-00000000TxX-0a9z;
	Sat, 14 Jun 2025 01:40:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFqt-00000000ToF-1dw8;
	Sat, 14 Jun 2025 01:38:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234d3261631so19917855ad.1;
        Fri, 13 Jun 2025 18:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749865114; x=1750469914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0lQejjsw0q+CGE5uh3c+Gs+NLf8tN+h+7rm943Xmkng=;
        b=lnFmjjzmiDde+i0AGWYIL3x2dVNjVqTelrJ3FHv7t0k8zDVfSpugcSDPhfWVLxUvTN
         Mh/NlBSfU9kfz9N9dyItdFao9X81UGZVFrRucmN7dW42Ca6P8MJA2JElg/nj1EJupUjX
         3xfhfw08B9Lwp+vnvDMohrHOg+4qe1EuwdaQRweTNB3WFMXz/JSG5VS+yS6C107Q9I0B
         xq/Lu5o7I0/m05MdY6neTcam6mRjAba7EpYhahXsu465IUHmvyx/Gzd0wygiEp6aW9/j
         Xtdv/ZZJT3XjybEPrtmN6XkZNoDJ2D1v55U6dWnnzwq+SEkySWmOYX/oCVwdT89yGBhg
         170A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749865114; x=1750469914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lQejjsw0q+CGE5uh3c+Gs+NLf8tN+h+7rm943Xmkng=;
        b=cFkiJ1sJHAQOBl1LvfVhqm4cbvv9iUYqCsHPuEhuPga7rA2zVKVed41aVNOn+YlKJ8
         6X88UqVaZhjSa3jBQFE116FQvwtJvTUNN0NVxP88kFihNKJZGV2NRjwye2WyK/m0aRVc
         aGp6/Bvtop1FzAUEHxfRjaLiN1qCVBqODOPgHMa0t/K4aio8HB8zcnb/R/FIGmr1GOMG
         Wn8dsg0vq2kbwqdc+brVWzDmrgvyUNNmL6wkWLjVrt9GzKF+ss9A3EYmQpDcBb4S3PSM
         477w3Ab45g2dvyPg7Zp2THLJmEkGkUfPxhgDXMgOtY3wx8EhF4TuUCkljlKVJeSuty8k
         k7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUmh5rQkGtQ9fWfUuIdtKDDsPHnl3EtdsitTKScvtrw0ZbGxyb0/P/Xx+W3SY8+6tTWdiMmWbCVMNfR@lists.infradead.org, AJvYcCWuKPZLxcugH8esfByhYzNQ3pj/qTstyMgRIrIhrjyOwyUk3zvGu7VTYQMvQ2o04GgZ3qyPRSs9ld+7l+tOaWuW@lists.infradead.org
X-Gm-Message-State: AOJu0YyBXcMssEKes+WjcTZQUEDUunr/y1inRwMqQxMPpcAC5tIWa/Bd
	lHcyxbkPH0LAGUQaecAP7j8Px0jaUMOWTTgb4vncrOx9i5aoX9GPBAMq
X-Gm-Gg: ASbGncvFJycLGCLg42UDNaN9i68WE6qBUvpXDkGmA5TYi+Ice9P0rxutg5aVMffYcss
	yGcIVWGB/uDFWCUyaApSfmLIuws3R574FoWv3X/gN0sACvp2CYZXHPnLgUxDXktMLl8Adz84TKV
	8drkAlS4j5SdVFU8BP0DwE4HNkfU7vSzb7V82ecRp5UArxS4SuZ9pc3c3g6LYcrnIglzBeY1fiH
	abtU8V2VgH+th6sRuHO+SWr3MtW3zY854JgMsnsZZvxpIe5dRg6tJgvzdJE2NvZuDUWqniQBrTN
	h/QKBaghuB/+cw7IAjyUZwy8TLePe2ZGsI3+53lhkFe3aa4BMg==
X-Google-Smtp-Source: AGHT+IEMPF1CG7Z4ty/9CQse/2JF9FvgerUO1LrtGFrS+i5WUaSY65B8ME0JLsiKs/vhtHxhj88YWw==
X-Received: by 2002:a17:902:f647:b0:234:e7bb:963b with SMTP id d9443c01a7336-2366b00ee33mr23760305ad.16.1749865114201;
        Fri, 13 Jun 2025 18:38:34 -0700 (PDT)
Received: from geday ([2804:7f2:800b:87ca::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1fa0sm21379435ad.86.2025.06.13.18.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 18:38:33 -0700 (PDT)
Date: Fri, 13 Jun 2025 22:38:18 -0300
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
Message-ID: <aEzSilET0wAQ7ozA@geday>
References: <992ab6278af59b8f2f82521bf4611f69a916bbe1.1749827015.git.geraldogabriel@gmail.com>
 <20250613201409.GA973486@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613201409.GA973486@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_183835_433246_751240F6 
X-CRM114-Status: GOOD (  15.40  )
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

Hi Bjorn,

unfortunately Rockchip PCIe IP does not support 16-bit accesses,
I tried and it only rendered the kernel unbootable, which made
people in my house angry since the RK3399 box is my Internet Gateway!

:-)

For thit particular case, it is OK since LABS and LBMS are precisely
the only RW1C bits in LNKSTA as far as I know. But see below.
> >  
> > -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCSR);
> > -	status &= ~PCIE_RC_CONFIG_DCSR_MPS_MASK;
> > -	status |= PCIE_RC_CONFIG_DCSR_MPS_256;
> > -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCSR);
> > +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
> > +	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > +	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
> > +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
> 
> Similar problem here; PCI_EXP_DEVCTL is only 16 bits, and writing the
> adjacent PCI_EXP_DEVSTA may clear RW1C bits you didn't want to clear.
> 

This is a bit more concerning then above. I'm out of ideas regarding
this particular issue you raised.

Geraldo Nascimento
> Bjorn

