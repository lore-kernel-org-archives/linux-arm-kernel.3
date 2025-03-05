Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45633C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlUZuaZqa3JLI6rAH+eSKbr5zwilBRdu2UhafBOdrdc=; b=3EIY1PPKrlEZY+LNCFVEAC9tlc
	tMUd9vxGUoYcvSBD8i7VZtM4Gscw/Yoq1fBtmvN3A5gOnT9dtxy84xQwGkiEpqooqZVRynjfMbTCN
	Jv1IAAmEq3ZAJRhWY4AbY4O4yWFG8IjW3dMHtgbxtAECVRdlUr9Q18z2kyXDWTfkBAlDSZ9Zk8oJ1
	gKCNyHILWPnbfmaduqObx7NPdZ5JeEl0KgMdP8d2baQzOezfDHNuGfWfLByS7UwsPqzkf29pqTABB
	NNhAfwHvlbvvyczJ1bgHCAeonm4zO7GZVQTriYDdAli7uogReac4S8tfev9tMkOBiOPbUelDqqOvF
	suIaC/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptVl-00000008w5D-1nFg;
	Wed, 05 Mar 2025 18:30:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptUA-00000008vxr-2a9l
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IlUZuaZqa3JLI6rAH+eSKbr5zwilBRdu2UhafBOdrdc=; b=WphpbtPNVvouizQFgNsAt5SuBQ
	pvTH8GlDS3q/IOdvR4yLkMtI6wGb6h1hslDXaqY1XEsHy6BP/eM8goyvGxBbv/goU+b4MH2uTBZ6R
	AphMjVAs6BWXnt+fE281Hp6NrUXe4JsyQdnUbEd1xEQCHcm/AM8YPfS501BDnYqghbucZ+xdTGR8D
	TZc22zOLAYxrBRcfT1TtKUabmG38M+/yhCnzokYTWNmGkBxUgl1SZOHPAXlbd6QbzYzOyjpX1Q+ZX
	hqfpJj+gNbPPerPPZ7VF9PXF0TpMOErjaR4LkhpnmAYnmBxw4zs1HXllOz7ymP+qu2FPw1ZMrkzDi
	ddt9yd6A==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptU7-000000060WZ-1Cj9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:28:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22409077c06so3915635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741199323; x=1741804123; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlUZuaZqa3JLI6rAH+eSKbr5zwilBRdu2UhafBOdrdc=;
        b=IIlVyh4YjBMzmrcTPyaXgIL3xf4dlq1quPpA+Y1ygr3b+YcmLV1Yvvx1qCydN26W96
         OxWN47U3iV9PA27qXaUL97c8epiAX8m4fHt5v1hi8i9RPQnUCyRbXra4QJ3RtoFA4ggp
         i7Vrlv3hi29IxpoK2DgCbnKe7GWX0kGCU7JYQe7fgRsxB9ajpVUAQEYhA6kRbXaOZTuw
         BG+E2doEDbPQFTrFMsD8/07c7RJvxJAqXsa0kFleFQ/az40xaE3ow8EMmKhLl7HsAFpm
         64BgmnjtwgH/RhV4mmyN1ty49Vuehu0mMMPvBlhdbzSwhlhehryz8waAoMrifTGKTAE9
         TauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199323; x=1741804123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlUZuaZqa3JLI6rAH+eSKbr5zwilBRdu2UhafBOdrdc=;
        b=iremMczR8/5zCrQxY0SdGXKApxObIqpJvHEIhCjwW1x9qG6F4SB2Pg+iUNdVAG3AwA
         VzJutVjWl18vIuKfqfo6nx+EyD4PXanGg+RAEecw9VWrm335Z4PfrYlcTXERiyeoHlte
         SzMts7HAH+rWzz57eMi7c9EiZWyzAoxB4xhO+O2HI8pOu2haHJm5hsRkULgHq7bRpnTn
         /EPpTatCMl8Cvpso2oDwFE4rle9u6knHGxhn5xcnGeIOI+KTy8J3O42vaGwlikxPprD9
         K2qyAZwZJD9qqQyWVdDaetjzEzh9dO+B4BSgx768oZA6FcmBY+fgTbJkEx/UMfxZ5pSa
         STVA==
X-Forwarded-Encrypted: i=1; AJvYcCVV4GK6YwFXiHDyEL7tzGes1aApHbCbUb86sriu/4dGFgl+rjIja8aNMuH3yK64bAQGLhMT8V4dpy31IE8mOIfX@lists.infradead.org
X-Gm-Message-State: AOJu0YwUQKxK51y2RXFbdnk3g9ESY8DtmhnpVW1JC9Igp1cncGyfiZWH
	4IFSF5ArA2fYA3cFb/qcDn9HWbND25owyldk7sy9caPO4SFO9JkIpF04DZSK1g==
X-Gm-Gg: ASbGncsH4RZoUspzEGYtRR1I8zE86Jj9oM/czcGO40e15jojkCl3NqEh2up/CT92Kvf
	jy6babsDwJGPzoM8DVNUlrWj6dTOWouUd6JYfXZiPoZ4gDGNdZM/x+ZJNm8PLlI59ZR7qEHALpp
	Snk4TDGL8bbVkiTsWorvBS/ojZJaYNnHHHdhXI1a6fPxJD8+0KqHWpvypZjXat19C29O7oanYlX
	pJ5hXayvLh0SljGLU4OPilJEbRTudLL9mHO6VrKXt1HYlzPRofkgsJ/pnhQKQCzJGPABAWe5Xl7
	UE5tusPFfKjo2K/XHxzCTRwskagbM8+NVr7lLxGYh3aWcb06oWkLlk42
X-Google-Smtp-Source: AGHT+IF+TGwksJJjKWkdx/R8tEcgWJtus8Acn/xVNQz9+4wgbYvkHfwKDe4CHqeQdGOj/ucT3x99Xw==
X-Received: by 2002:a05:6a21:3986:b0:1f0:e84c:866f with SMTP id adf61e73a8af0-1f3494967f1mr8474146637.21.1741199323380;
        Wed, 05 Mar 2025 10:28:43 -0800 (PST)
Received: from thinkpad ([120.60.140.239])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf2444sm12428366a12.3.2025.03.05.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:28:42 -0800 (PST)
Date: Wed, 5 Mar 2025 23:58:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250305182833.cgrwbrcwzjscxmku@thinkpad>
References: <20250304171154.njoygsvfd567pb66@thinkpad>
 <20250305173826.GA303920@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305173826.GA303920@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_182847_341582_7933D97D 
X-CRM114-Status: GOOD (  25.14  )
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

On Wed, Mar 05, 2025 at 11:38:26AM -0600, Bjorn Helgaas wrote:
> On Tue, Mar 04, 2025 at 10:41:54PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Mar 05, 2025 at 12:46:38AM +0900, Krzysztof Wilczyński wrote:
> > > > On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczyński <kw@linux.com> wrote:
> > > > > [...]
> > > > > > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > > > > > +{
> > > > > > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > > > > > +   struct device *dev = pci->dev;
> > > > > > > +   struct debugfs_info *debugfs;
> > > > > > > +   struct dentry *dir;
> > > > > > > +   int ret;
> > > > > > > +
> > > > > > > +   /* Create main directory for each platform driver */
> > > > > > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > > > > > +   dir = debugfs_create_dir(dirname, NULL);
> > > > > > > +   debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > > > > > +   if (!debugfs)
> > > > > > > +           return -ENOMEM;
> > > > > > > +
> > > > > > > +   debugfs->debug_dir = dir;
> > > > > > > +   pci->debugfs = debugfs;
> > > > > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > > > > +   if (ret)
> > > > > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > > > > >
> > > > > > What will happen if ret != 0? still return 0?
> > > > 
> > > > And that is exactly what happens on Gray Hawk Single with R-Car
> > > > V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> > > > dwc_pcie_rasdes_debugfs_init() to return -ENODEV.
> > > > 
> > > > Debugfs issues should never be propagated upstream!
> > ...
> 
> > > > So while applying, you changed this like:
> > > > 
> > > >             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > >     -       if (ret)
> > > >     -               dev_dbg(dev, "RASDES debugfs init failed\n");
> > > >     +       if (ret) {
> > > >     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
> > > >     +               return ret;
> > > >     +       }
> > > > 
> > > >             return 0;
> > > > 
> > > > Hence this is now a fatal error, causing the probe to fail.
> 
> > Even though debugfs_init() failure is not supposed to fail the probe(),
> > dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
> > failure would be canolically correct IMO.
> 
> I'm not sure about this.  What's the requirement to propagate
> devm_kzalloc() failures?  I think devres will free any allocs that
> were successful regardless.
> 
> IIUC, we resolved the Gray Hawk Single issue by changing
> dwc_pcie_rasdes_debugfs_init() to return success without doing
> anything when there's no RAS DES Capability.
> 
> But dwc_pcie_debugfs_init() can still return failure, and that still
> causes dw_pcie_ep_init_registers() to fail, which breaks the "don't
> propagate debugfs issues upstream" rule:
> 
>   int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>   {
>           ...
>           ret = dwc_pcie_debugfs_init(pci);
>           if (ret)
>                   goto err_remove_edma;
> 
>           return 0;
> 
>   err_remove_edma:
>           dw_pcie_edma_remove(pci);
> 
>           return ret;
>   }
> 
> We can say that kzalloc() failure should "never" happen, and therefore
> it's OK to fail the driver probe if it happens, but that doesn't seem
> like a strong argument for breaking the "don't propagate debugfs
> issues" rule.  And someday there may be other kinds of failures from
> dwc_pcie_debugfs_init().
> 

Fine with me. I was not too sure about propagating failure either.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

