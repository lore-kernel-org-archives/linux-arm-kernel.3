Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6EEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpoi690aUnKUgZbv3KZKnYeAytIZyP2VWb9kHfjEXMw=; b=uxNWNH6VhN+L4bLpCWMKMtcGjx
	FEHVIAKb3OhuNrJEWYJNKVhm2EOw8WW7f72jT+7VwL5SVVjhSxtpbf4UsTIvirAMsQC4NHBCjTFaN
	okzGDEuWT4PecyYjC+Pmz6THRs+IfKvdk02jTCmQIbVjguXmrbk05kyYih7fd6W8nKrjR73pGlFeW
	LmpuOilDIP2nxXl3JPsACJdGFH/UNEX9a2Y4bf3Al64Ti2Yd/wf1VNr8tq6PKvCFBKIgA07jHb6Qb
	6o5Ps0obFnSneHlGYn7DDkGqJpR8PqTw3IYAX/ExIh/uLWbkTPAEVa8jbRNqomw69kt7YyCcRA8za
	WVSbh+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTly-000000056gJ-1Ca0;
	Tue, 04 Mar 2025 15:01:30 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTfF-0000000553L-2pPd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:54:34 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52378c0c2b1so1254737e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100070; x=1741704870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpoi690aUnKUgZbv3KZKnYeAytIZyP2VWb9kHfjEXMw=;
        b=nMy+TEpgdwAeLa5W574bRnmkasi5QuSbGs480zy/kjwRLwgySm1YV/umKtYpnvmBE/
         QIZZoKxD8RQm7mIPheO6Kl0F/S/MJYR+dqJ9f38qhxwV40iqJQLvbcvk3pc5gSP9Cti6
         jJzuSGjrKowLKd/JUaD7KHXsTOhDHN6WCHGzqdv0wWcXj3Dv2OUxzbzH0tQtKoyx8Drz
         /Mj6QvVzn3/9mNypdpEgmp7+urHfPOqT/uI3HxP0XJnMuhTHvEPYIlTWYQ9WJtun6gV9
         fFmilARyHS6CRGxOmugLTaPk2M9Y58O8eIXSa9y3u8MDm7lt63kza61SXEjPlTh4XaBi
         Jomg==
X-Forwarded-Encrypted: i=1; AJvYcCUd/bTLwd8ryPgF0xY+B3pPszH3YdKz/9mBgoUQP8Wf/VXVVFDNmeBg8QBDfwkAPkfg7hWe9nShiI1dMW/FZxL1@lists.infradead.org
X-Gm-Message-State: AOJu0YwlF8AUxfDZGg4xiTHo0nSLMCsIvlpU4n0sNz/AKbrQBZk2WJeK
	nXqKQOXiqVBVAXdsDzvMSVjG4xA/0V4F5aXK+nZYhqE+jP+1Q6BF42uY5wSN
X-Gm-Gg: ASbGncvygC08nzqjEnrzOxsD9QAeAkn8VvfkMMYcVWDYsPdZ0Sx7yZDrmnKuv+AZYsV
	Nv1y5LcakzMeAm25PJuIdk7Bqd+rnjgFtCkuUFO/NTqsJpGUY0GUnNQvPoysxvIpZZaqbZIvsO0
	g66OFcs4ypq+oni/EIdlp8tNuqAyb+AwoXvBVLlRQ29+ouB6PPqcvVmAFsB2n35Imq5wDvilTfW
	52w5i2y1UXEOf+xlTw8b4Tk8On1k1JWfSHJNBkf21LdvEe/prTbWaXpnQ2c/t4mIKe4wGKjkzgu
	849ldshojbmgfJiPh+eApat1stQEnCwEdk/zJN8Bm6eUo0G/ejRcxVJu/qwM1oEy3AQxoyY5Q8o
	DFgcO/Ko=
X-Google-Smtp-Source: AGHT+IF5QdRyfHY4m2wfLVBMgDKbqNvw+cL7yBntu2ZwcvCzqmvSDQMyu/pYmPWSZTAyagwcEmTDPw==
X-Received: by 2002:a05:6122:2788:b0:520:60c2:3f1 with SMTP id 71dfb90a1353d-5235a921377mr9938738e0c.0.1741100069836;
        Tue, 04 Mar 2025 06:54:29 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523a16657b8sm522531e0c.13.2025.03.04.06.54.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 06:54:29 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86b2b14303fso2345215241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:54:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk0FWy2sMqeNdis4v24lPvyW+If7AFrmxjeCxFnlkiBimp61KUq/wP75sVi5gHIT6GY8U9VU2kP5dPc6bB/Y8A@lists.infradead.org
X-Received: by 2002:a05:6102:3ecc:b0:4bb:5d61:127e with SMTP id
 ada2fe7eead31-4c044d4ab20mr10413122137.25.1741100068657; Tue, 04 Mar 2025
 06:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20250221131548.59616-1-shradha.t@samsung.com> <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com> <Z8XrYxP_pZr6tFU8@debian> <20250303194647.GC1552306@rocinante>
In-Reply-To: <20250303194647.GC1552306@rocinante>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Mar 2025 15:54:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWuCJAd-mCpCoseThureCKnnep4T-Z0h1_WJ1BOf2ZeDg@mail.gmail.com>
X-Gm-Features: AQ5f1JoqtMy8hoZL8-viYrcUOUZmi4FtvLdHdpQ6zdyS-NBLZrj7ILd0QVxTKVI
Message-ID: <CAMuHMdWuCJAd-mCpCoseThureCKnnep4T-Z0h1_WJ1BOf2ZeDg@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, Jonathan.Cameron@huawei.com, 
	a.manzanares@samsung.com, pankaj.dubey@samsung.com, cassel@kernel.org, 
	18255117159@163.com, xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com, 
	will@kernel.org, mark.rutland@arm.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.or>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_065433_733382_BBB94BE1 
X-CRM114-Status: GOOD (  23.58  )
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

Hi Krzysztof,

This patch is now commit 1ff54f4cbaed9ec6 ("PCI: dwc: Add debugfs
based Silicon Debug support for DWC") in pci/next (next-20250304).

On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczy=C5=84ski <kw@linux.com> wrote=
:
> [...]
> > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > +{
> > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > +   struct device *dev =3D pci->dev;
> > > +   struct debugfs_info *debugfs;
> > > +   struct dentry *dir;
> > > +   int ret;
> > > +
> > > +   /* Create main directory for each platform driver */
> > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(de=
v));
> > > +   dir =3D debugfs_create_dir(dirname, NULL);
> > > +   debugfs =3D devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > +   if (!debugfs)
> > > +           return -ENOMEM;
> > > +
> > > +   debugfs->debug_dir =3D dir;
> > > +   pci->debugfs =3D debugfs;
> > > +   ret =3D dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > +   if (ret)
> > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> >
> > What will happen if ret !=3D 0? still return 0?

And that is exactly what happens on Gray Hawk Single with R-Car
V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
dwc_pcie_rasdes_debugfs_init() to return -ENODEV.

> Given that callers of dwc_pcie_debugfs_init() check for errors,

Debugfs issues should never be propagated upstream!

> this probably should correctly bubble up any failure coming from
> dwc_pcie_rasdes_debugfs_init().
>
> I made updates to the code directly on the current branch, have a look:

So while applying, you changed this like:

            ret =3D dwc_pcie_rasdes_debugfs_init(pci, dir);
    -       if (ret)
    -               dev_dbg(dev, "RASDES debugfs init failed\n");
    +       if (ret) {
    +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
    +               return ret;
    +       }

            return 0;

Hence this is now a fatal error, causing the probe to fail.
Unfortunately something fails during cleanup:

    pcie-rcar-gen4 e65d0000.pcie: failed to initialize RAS DES debugfs
    ------------[ cut here ]------------
    WARNING: CPU: 3 PID: 36 at kernel/irq/irqdomain.c:393
irq_domain_remove+0xa8/0xb0
    CPU: 3 UID: 0 PID: 36 Comm: kworker/u16:1 Not tainted
6.14.0-rc1-arm64-renesas-00134-g12c8c1363538 #2884
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    Workqueue: async async_run_entry_fn
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
    pc : irq_domain_remove+0xa8/0xb0
    lr : irq_domain_remove+0x2c/0xb0
    sp : ffff8000819b3b10
    x29: ffff8000819b3b10 x28: 0000000000000000 x27: 0000000000000000
    x26: ffff00044011d800 x25: ffff80008053294c x24: ffff000441740400
    x23: ffff0004413a30f0 x22: ffff0004413a3130 x21: ffff0004413a3130
    x20: ffff8000815c0ec8 x19: ffff0004415f8240 x18: 00000000ffffffff
    x17: 6775626564205345 x16: 0000000000000020 x15: ffff8000819b37b0
    x14: 0000000000000004 x13: ffff8000813e9dd8 x12: 0000000000000000
    x11: ffff0004404b6448 x10: ffff800080e85400 x9 : 1fffe00088334301
    x8 : 0000000000000001 x7 : ffff0004419a1800 x6 : ffff0004419a1808
    x5 : ffff000441349030 x4 : fffffffffffffdc1 x3 : 0000000000000000
    x2 : ffff0004403e0000 x1 : 0000000000000000 x0 : ffff00044134f630
    Call trace:
     irq_domain_remove+0xa8/0xb0 (P)
     dw_pcie_host_init+0x394/0x710
     rcar_gen4_pcie_probe+0x104/0x2f8
     platform_probe+0x64/0xbc
     really_probe+0xb8/0x294
     __driver_probe_device+0x74/0x124
     driver_probe_device+0x3c/0x158
     __device_attach_driver+0xd4/0x154
     bus_for_each_drv+0x84/0xe0
     __device_attach_async_helper+0xac/0xd0
     async_run_entry_fn+0x30/0xd8
     process_one_work+0x144/0x280
     worker_thread+0x2c4/0x3cc
     kthread+0x128/0x1e0
     ret_from_fork+0x10/0x20
    ---[ end trace 0000000000000000 ]---

Worse, the PCI bus is still registered, so running "lspci" causes an Oops:

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000004
    Mem abort info:
      ESR =3D 0x0000000096000004
      EC =3D 0x25: DABT (current EL), IL =3D 32 bits
      SET =3D 0, FnV =3D 0
      EA =3D 0, S1PTW =3D 0
      FSC =3D 0x04: level 0 translation fault
    Data abort info:
      ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
      CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
      GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000483b53000
    [0000000000000004] pgd=3D0000000000000000, p4d=3D0000000000000000
    Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
    CPU: 3 UID: 0 PID: 707 Comm: lspci Tainted: G        W
6.14.0-rc1-arm64-renesas-00134-g12c8c1363538 #2884
    Tainted: [W]=3DWARN
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
    pc : pci_generic_config_read+0x34/0xac
    lr : pci_generic_config_read+0x20/0xac
    sp : ffff8000825cbbf0
    x29: ffff8000825cbbf0 x28: ffff0004491c4b84 x27: 0000000000000004
    x26: 000000000000000f x25: ffff0004491c4b80 x24: 0000000000000040
    x23: 0000000000000040 x22: ffff8000825cbc64 x21: ffff8000816fb4f8
    x20: ffff8000825cbc14 x19: 0000000000000004 x18: 0000000000000000
    x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
    x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
    x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
    x8 : 0000000000000000 x7 : ffff000442c653c0 x6 : ffff8000805163d0
    x5 : ffff8000804f3334 x4 : ffff8000825cbc14 x3 : ffff800080531990
    x2 : 0000000000000004 x1 : 0000000000000000 x0 : 0000000000000004
    Call trace:
     pci_generic_config_read+0x34/0xac (P)
     pci_user_read_config_dword+0x78/0x118
     pci_read_config+0xe4/0x29c
     sysfs_kf_bin_read+0x8c/0x9c
     kernfs_fop_read_iter+0x9c/0x19c
     vfs_read+0x24c/0x330
     __arm64_sys_pread64+0xac/0xc8
     invoke_syscall+0x44/0x100
     el0_svc_common.constprop.0+0x3c/0xd4
     do_el0_svc+0x18/0x20
     el0_svc+0x24/0xa8
     el0t_64_sync_handler+0x104/0x130
     el0t_64_sync+0x154/0x158
    Code: 7100067f 540002a0 71000a7f 54000160 (b9400000)
    ---[ end trace 0000000000000000 ]---
    note: lspci[707] exited with irqs disabled
    note: lspci[707] exited with preempt_count 1

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

