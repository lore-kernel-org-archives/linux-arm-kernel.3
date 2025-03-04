Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AB1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKWAtQRLCp0qz4UwlvN+WFU+keHMUnNOhmFv6iaIYQU=; b=N5rze8H5oW4QxhGfqfh5Szmqy+
	R0Eu9bZjBmocTMmzT+PXLFpB2F3cMwK6kSWTH3GJE3ybGEkadFn/GdnPSzzQHY6e2vs6Bs23PpPWf
	4OBpnOYSFG7YxAsq3+VPqfk1mW+YGQ6t+1DPgMvlyij9hIeTgFrE8J8uXel3hDjh+m1FmtbBDk0/9
	yhp6e1/pDiZfbgGIZAP0/VNjaRD7XKtkhXCGYJEfZqA1hxTPyJmbFHXKD03yrAIAsYFo8Kxq4bp1Y
	xhuoYzbp5pZGYQFI60bSTbZ8cEgT6pKS3WBEddW4yf7VCc58x74mU8BBVsDkKGBGoJMQ2ppqI81Pv
	DEWXrAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXUP-00000005w0j-3xGQ;
	Tue, 04 Mar 2025 18:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVoQ-00000005ZZd-0Is5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cKWAtQRLCp0qz4UwlvN+WFU+keHMUnNOhmFv6iaIYQU=; b=hBPMLGn1tKPzX59GJ+09reXRUl
	BBX4hLTH12SAyKhmbXopYxAvo6Lr3gvHzAk+HR0/xMMrVWmSU6uDRqBIRoH4RNgQ6dB/PAd27KSed
	v+D8s4UVuMtMmYx281du7LXYqQZvNMF055VXpFm2HuMEZmcS/BMz391zFX02hDmkmBQEHQvPAbg1A
	lYgMahRKcf0CVBsoRf67Wo2mnMlVZjGgjUgwl4ZEgRKt0M5UP9FoE9n6m7NX6C8pWI6rtjzjd1Yxj
	JOSg7BtyxJwfBBfnAAI+8bcgJpecLiky7iFGgbyyuEVD6QDC5n+RgkhGMVtXY06jJ8Sn5BPl1GLK7
	LenWUMgA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVoM-000000007Hq-2dJ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:12:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so9520201a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741108324; x=1741713124; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cKWAtQRLCp0qz4UwlvN+WFU+keHMUnNOhmFv6iaIYQU=;
        b=D7zPqV7hklY9vYy8H4ryH5hqt0r4oNNrRHu8Q6C3kL66Q2cf4XpZoNPOs0nCwGZhBE
         OlfiWglRgsDe9DrZvbnEGWOoGXqNPmzoF+5d1+qCrZybNn85vxK/RY7GwWV/vMvDvD/j
         8DKcI6JzpXiARw0R+SXoLGK9RfH4Jq01i+GVVjg4xeRtmdfgRA+SKPWE/CZHSJ7txLC9
         B41Ssf+80a10VNN796OY72hcsCRzPy3krBin1Sad5YzVwdPgcdzhEZJz66AaoRhk6gVw
         KBa7rJKafPt9ROWlNs+03MzkbVJLJBk/UG04SioJYUpwRZQhH/vZVtPd5M/9udF93hG1
         1xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741108324; x=1741713124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKWAtQRLCp0qz4UwlvN+WFU+keHMUnNOhmFv6iaIYQU=;
        b=r8ZbBgD5peA1SpbV54RxhurF1FGI7ZIGoaQEQ9FeZwHcsV2EjRxC+iiB2t4TUUcyHv
         xeJwrrhI4fOgynjAIcg/n7g/kvRDDvsBQAElhzgPgepLrmbBiMwV2dylC/tzZIj1hEGD
         Lp0gLi0Nh+DgltARE+eYR/bO2bp1PX4S0IhYTTXN7g1JnfWtSL4kcm8gGkcLdT4SV0Pw
         a+wi0pbRflfgMZr6DsmVfZgOOA7PJuv7UQinA/GGjxMaLOUdaelgy5CuB/clzJQ4fxj2
         uoIz+Lp0yPWraT0kYUTTEW1+/d5Z8V2vtXYuVfl9k0qqXvO8TDt/julLkSjOS+hu9XyE
         t6gA==
X-Forwarded-Encrypted: i=1; AJvYcCVdB61XB/R1bRZbpaAfWGQIZHtcEqTy10yuuS5rIwVNJZWWvl9ZmzkqWv7v6eG4wra49+GSFyTm/y14MHf8GfxM@lists.infradead.org
X-Gm-Message-State: AOJu0YzWn3ew7gyzP35XW4ViG7vDtpD7Cc/ovRkKniBIspMKKKHW6MD8
	maXq626x0Yt5ND39UrmgstcD0VQQho2vQiYuTfLHZhku2QF5IKE2FbjbmYjAzw==
X-Gm-Gg: ASbGncs64ocDc46h4bQr2r0i/v6uRV83QLS/OEP9NdBPF57o/6G/5VAXikPyUXiDEhf
	PA79wKLbugUz+fTGzSV+8MBr0QX3WSDNtMgtMyxJA2il3fkn87KGCIfbmJBIrpwAH6oS/Rhn2BV
	uaRURPuHlqQ4rGd5YUeQGMDbIILCYn217xWdK5yYH41u6mB52U0dXQFNRQTMTR+psePJN/w5YC0
	wd5qlhlpp0ZTjtG0zmku6WUHLkv20I2gU7qpauyN4XZYI/MdAIWmiEPcOLqGMAwUSP1WnLQO45E
	SdwvB3Z3Y+vT04oErYNZiq1WY8Dvk46kr2yV4anF49aOqyyK7Cq9Ux8=
X-Google-Smtp-Source: AGHT+IHAxbyCgHNleOV6pyn/ykxc9Lgl0VZqS9TI0AHJNMb4FhegCiAgjJqpVwILV7hlEejAmOZObw==
X-Received: by 2002:a17:90b:1c09:b0:2f2:3efd:96da with SMTP id 98e67ed59e1d1-2ff497a01bbmr70685a91.24.1741108323433;
        Tue, 04 Mar 2025 09:12:03 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6753137sm11340607a91.6.2025.03.04.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:12:02 -0800 (PST)
Date: Tue, 4 Mar 2025 22:41:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Fan Ni <nifan.cxl@gmail.com>,
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250304171154.njoygsvfd567pb66@thinkpad>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
 <CAMuHMdWens9ZZrjNH1Bd2AN3PJEP1KSUGdiJcBCt0uPGH_GiiA@mail.gmail.com>
 <20250304154638.GB2310180@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304154638.GB2310180@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_171206_862285_A361D264 
X-CRM114-Status: GOOD (  26.29  )
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

On Wed, Mar 05, 2025 at 12:46:38AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > This patch is now commit 1ff54f4cbaed9ec6 ("PCI: dwc: Add debugfs
> > based Silicon Debug support for DWC") in pci/next (next-20250304).
> > 
> > On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczyński <kw@linux.com> wrote:
> > > [...]
> > > > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > > > +{
> > > > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > > > +   struct device *dev = pci->dev;
> > > > > +   struct debugfs_info *debugfs;
> > > > > +   struct dentry *dir;
> > > > > +   int ret;
> > > > > +
> > > > > +   /* Create main directory for each platform driver */
> > > > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > > > +   dir = debugfs_create_dir(dirname, NULL);
> > > > > +   debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > > > +   if (!debugfs)
> > > > > +           return -ENOMEM;
> > > > > +
> > > > > +   debugfs->debug_dir = dir;
> > > > > +   pci->debugfs = debugfs;
> > > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > > +   if (ret)
> > > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > > >
> > > > What will happen if ret != 0? still return 0?
> > 
> > And that is exactly what happens on Gray Hawk Single with R-Car
> > V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> > dwc_pcie_rasdes_debugfs_init() to return -ENODEV.
> 
> Thank you for testing and for catching this issue.  Much appreciated.
> 
> > > Given that callers of dwc_pcie_debugfs_init() check for errors,
> > 
> > Debugfs issues should never be propagated upstream!
> 
> Makes complete sense.  Sorry for breaking things here!
> 
> > > this probably should correctly bubble up any failure coming from
> > > dwc_pcie_rasdes_debugfs_init().
> > >
> > > I made updates to the code directly on the current branch, have a look:
> > 
> > So while applying, you changed this like:
> > 
> >             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> >     -       if (ret)
> >     -               dev_dbg(dev, "RASDES debugfs init failed\n");
> >     +       if (ret) {
> >     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
> >     +               return ret;
> >     +       }
> > 
> >             return 0;
> > 
> > Hence this is now a fatal error, causing the probe to fail.
> 
> I removed the changed, and also move the log level to be a warning, per:
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=c6759a967e69aba16aef0d92f43e527b112e98a5
> 
> Would this be acceptable here?
> 
> Mani, would this be acceptable to you, too?  Given that you posted the
> following recently:
> 
>   https://lore.kernel.org/linux-pci/20250303200055.GA1881771@rocinante/T/#mab9cbd5834390d259afea056eee9a73d8c3b435f
> 
> That said, perhaps moving the log level to a debug would be better served here.
> 

Even though debugfs_init() failure is not supposed to fail the probe(),
dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
failure would be canolically correct IMO.

So I would still opt to have my version + your previous one.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

