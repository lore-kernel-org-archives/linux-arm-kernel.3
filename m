Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604A4C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 00:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EA4rjGRcsfT36C5hz4iP7GIuQrzL3ujh+keys5adGQ=; b=onBjlfJ4DtiXu+ej4EieQxl8fP
	elcBcsCOZgaLkAEXmYSpId9Z24TcCpsYlVI4Gl93SaJXYrC4dCfomwBba0zvMlN7d00/e10u7G+rD
	xaR9oAwllKsZ7gc3BGOpm1y5Dx764qKghQ4NFbGsL7K111q5a2Sy4+eoVa4vKXHe4Qjzu1T0Z35AV
	IwEWHLjWEP1wC16+svFCwWmhHJM90eYlG7s8A5NZR3N3SxGesZ/20djVQzWVI7VPtZpjAXK5ACo6J
	PUgk5nXXKKAvtg5caSb7V5mzUI1nG6MQbPdXWcohrayhQnxs3oO0P0NNxqHlImbaIq7S+6fzr6znd
	kHxqrFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzks9-00000004y4F-2X5O;
	Fri, 28 Aug 2026 00:55:09 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzks6-00000004y3e-2CVr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 00:55:07 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2d58efc7356so3648905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787878505; x=1788483305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EA4rjGRcsfT36C5hz4iP7GIuQrzL3ujh+keys5adGQ=;
        b=BoedaEIUY2GsQnljmHBmK/ifOp5IPhr6YfgE8ZwdC2qTD99XRpmZ3iQ80B40k++eEN
         e6sQqaDTwaL3kY7SMCTHp/Sv1v9e+M8vKrK76bWAiQ/nPTroEyDgLl5TgKA5RLgCPeCt
         4a99szP7Gpy46iMtR3quLPyyi6fkeUo9RK9lVDQnW3p0zB5bJgphOU6xkFLSpXKic5q/
         qrfhMviUHLT+VH3eMRHCrGWZtSmmL+HKJf23+/4hbaX0YXfCCyzMiaPw6kiZ3gP8vug1
         FgnnH3PuW9R98KponaT8wjhcqAcfA/f7FlYVlozUFd8cb/MhSbnzoF9N+aRiUN+Ul0GP
         7DrA==
X-Forwarded-Encrypted: i=1; AHgh+RpKOeNfm+jzzkL3ZZdRHNSr7mHnWMCwgXyELoVPSpqXiBJ1tNDv4Nuz1ckmU5kuNOxc+i4/cJtE4eKhmCIA3WIh@lists.infradead.org
X-Gm-Message-State: AFuF++nTw+K5AXVdbkNcyO6ViIFeC8YfRB89tZ9uEbwXbF5B3a44W5Ed
	DQpsSXW99NG8ozofwItpJ0087caY4tPwO+Q6nYiswJJdqUxH7bA3IP3G3chXyJkUu13ijI5Phxp
	dys5McY0/F7+TIdNQBTK5xQdX3yHnoK5BrVu1G1BiiRn+kKGLqC1KCEXdr+eq6QYf1GwTbGLZq0
	f7IZ3ooD1rbi8yvnTgcot/mRszRbUmOJpdj85laM+XskhzVpNIRQvrt1Reb39E/und+lRxq6g04
	qrRmClLLa6p8g6Y5kLM6SMOkb1ftwS4o2o=
X-Gm-Gg: AR+sD13eTkZL76a/VODI2fJvcc1fGsQamD68McC4NbPGaO62b/ota/GHS7++LgqsmI8
	aaK+GQ5ZZ5fBEvA8vLh9Vyih2E/zLuG3ASOmJHHO7TIZRY7/Ja+ha2c6+1jEtvmbMwyvMtDtRaa
	0PHynydfNkLYykOE6np51gNVeL6c4CnyQC9wjAH4txaqwBLwBh/oIAJgKQucnXe6bkgq/Pz53ii
	on2BIeqdhAjNFLG+UTwUOyfaqMoUxQ3v7v32wlTwrz/lbZZ7YC4RlzYPTUgwPbshbBwqEfzu7dI
	ZBu2WFZV4DwJ+egzEIldiy85VKg0BIwj4D4GnGcqnNGa2dif1fcW9rilAAcT1B8QMErkpLdsH0V
	TI2eYfjMteOJDPZGRjenNeur+KrQj58pcj95hAXSnWGTCIs0fg5n0iL6zSl8KHmK+Blz0ObB3iy
	c/Q5g572THN8E/OzV7rwNHx5I0fN92XY2wvLQ98Q==
X-Received: by 2002:a17:903:458b:b0:2d6:f3f0:3e7a with SMTP id d9443c01a7336-2d74dc2ade3mr43045775ad.3.1787878504666;
        Thu, 27 Aug 2026 17:55:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d7598dc8casm22865ad.33.2026.08.27.17.55.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 17:55:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2531b5afe6so153569466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787878502; x=1788483302; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EA4rjGRcsfT36C5hz4iP7GIuQrzL3ujh+keys5adGQ=;
        b=Jb7os7O9g57go26mfO0V19Oh+Ar6739J2E6a0kyo3mDU9qvV0Aw99wuFGDuJWLX/Ze
         +8RkDNYJuPVXZzHlrM3NtCfuMowvSQpT8XNK393HPV9c5GLYu8ht3vKKn4yNdoTf7+jZ
         hZr9DMHVFcE4NmB4vCcIN3RRiUBxnQhfF9G20=
X-Forwarded-Encrypted: i=1; AHgh+RoTBFHqzGPRKoK5JzflJ2fb3uS/froio98aIAR0kyCJzWkn3MK927XuxY/jLQGSZFnPOaCJQvgF2rwfKzAX0m+a@lists.infradead.org
X-Received: by 2002:a17:907:1c94:b0:c08:580e:899a with SMTP id a640c23a62f3a-c2553d1daf7mr168028766b.10.1787878502411;
        Thu, 27 Aug 2026 17:55:02 -0700 (PDT)
X-Received: by 2002:a17:907:1c94:b0:c08:580e:899a with SMTP id
 a640c23a62f3a-c2553d1daf7mr168027266b.10.1787878501945; Thu, 27 Aug 2026
 17:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-2-danesh.petigara@broadcom.com> <067b7e2e-f2b2-4462-96f1-3a1e35bd25e8@kernel.org>
 <682b68a0-03b7-4ec9-9d17-698fe134b57a@broadcom.com> <e21a7302-44db-4e20-805b-5c1de1f59c56@kernel.org>
In-Reply-To: <e21a7302-44db-4e20-805b-5c1de1f59c56@kernel.org>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 27 Aug 2026 17:54:50 -0700
X-Gm-Features: AcwNN1XmLO_Rvc2p8Ux2izW5uUHsteD0CqZs8Iz7q39NcNd-WXmBavD0M7y7m7Y
Message-ID: <CAGt4E5u9MLNku3ROaCD-HJALkLgL=RmOg1zuF1QmcsE_ss=YwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to
 DCPU offset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Danesh Petigara <danesh.petigara@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_175506_609265_AC15CD33 
X-CRM114-Status: GOOD (  39.67  )
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

On Thu, 27 Aug 2026 at 14:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/08/2026 19:37, Florian Fainelli wrote:
> > On 8/26/26 23:48, Krzysztof Kozlowski wrote:
> >> On 26/08/2026 22:14, Danesh Petigara wrote:
> >>> From: Justin Chen <justin.chen@broadcom.com>
> >>>
> >>> On API v1/v2 boards, the DCPU coprocessor can steer kernel readl_relaxed()
> >>> and writel_relaxed() to any address within 256 MB of the ioremapped DPFE
> >>> dmem or regs base. The DCPU firmware provides a 28-bit offset which the
> >>> driver adds to the ioremap base without any bounds checking in
> >>> get_msg_ptr().
> >>>
> >>> This allows a compromised DCPU firmware to trick the host kernel into
> >>> reading or writing arbitrary memory-mapped I/O registers in vmalloc
> >>> space. When combined with a root-writable sysfs file like dpfe_refresh,
> >>> it provides an arbitrary MMIO write primitive. Similarly, world-readable
> >>> sysfs files can be used to leak other devices' register contents.
> >>
> >> If someone can compromise firmware to provide different addresses, then
> >> what stops this person to change DTB with completely different MMIO
> >> ranges for this device?
> >
> > On our platforms the DTB is part of the boot loader which is
> > signed+encrypted and customers do not build any UART driver or
> > user-interface so changing the DTB is somewhat difficult. Same goes with
> > the Linux kernel, it's also signed+encrypted. This is defense in depth
> > at this point.
>
> Ack
>
> >
> >>
> >> Isn't better just to drop root-writeable sysfs interfaces, since they
> >> are the insecure parts?
> >
> > Yes that would probably be an acceptable move forward. Markus do you
> > remember what was the use case for the dpfe_refresh file to be R/W?
>
> That's in this case separate solution, worth anyway investigating.

As I recall, there was a reason the refresh rate was changeable. Note,
however, that this is only available for the older version of the
communication API. This hasn't been used in a while. So, unless you
are on an older architecture chip, there will be no "refresh"
attribute at all (because it'll be using the v3 sysfs attributes).

I'll dig some more through documentation and old email threads to find
the concrete explanation behind the "refresh" attribute.

> >>> Fix this by recording the resource_size() of the dmem and regs ioremaps
> >>> at probe time, and rejecting any offset that, along with the largest
> >>> field accessed (DRAM_VENDOR_ERROR + sizeof(u32)), exceeds the recorded
> >>> mapping size.
> >>>
> >>> Fixes: fee5f1ef6cf7 ("memory: brcmstb: dpfe: support new way of passing data from the DCPU")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> >>> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
> >>> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
> >>> ---
> >>>   drivers/memory/brcmstb_dpfe.c | 22 ++++++++++++++++++++--
> >>>   1 file changed, 20 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
> >>> index 08d9e05b1b33..66343205f585 100644
> >>> --- a/drivers/memory/brcmstb_dpfe.c
> >>> +++ b/drivers/memory/brcmstb_dpfe.c
> >>> @@ -182,6 +182,8 @@ struct brcmstb_dpfe_priv {
> >>>     void __iomem *regs;
> >>>     void __iomem *dmem;
> >>>     void __iomem *imem;
> >>> +   resource_size_t regs_size;
> >>> +   resource_size_t dmem_size;
> >>>     struct device *dev;
> >>>     const struct dpfe_api *dpfe_api;
> >>>     struct mutex lock;
> >>> @@ -401,9 +403,14 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
> >>>      */
> >>>     switch (msg_type) {
> >>>     case 1:
> >>> +           if (DCPU_MSG_RAM_START + offset + DRAM_VENDOR_ERROR +
> >>> +               sizeof(u32) > priv->regs_size)
> >>> +                   goto bad_offset;
> >>>             ptr = priv->regs + DCPU_MSG_RAM_START + offset;
> >>>             break;
> >>>     case 0:
> >>> +           if (offset + DRAM_VENDOR_ERROR + sizeof(u32) > priv->dmem_size)
> >>> +                   goto bad_offset;
> >>>             ptr = priv->dmem + offset;
> >>>             break;
> >>>     default:
> >>> @@ -415,6 +422,12 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
> >>>     }
> >>>
> >>>     return ptr;
> >>> +
> >>> +bad_offset:
> >>> +   dev_err(priv->dev, "DCPU returned out-of-range offset %#x\n", offset);
> >>> +   if (buf && size)
> >>> +           *size = sprintf(buf, "ERROR: DCPU offset out of range\n");
> >>> +   return NULL;
> >>>   }
> >>>
> >>>   static void __finalize_command(struct brcmstb_dpfe_priv *priv)
> >>> @@ -858,6 +871,7 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
> >>>   {
> >>>     struct device *dev = &pdev->dev;
> >>>     struct brcmstb_dpfe_priv *priv;
> >>> +   struct resource *res;
> >>>     int ret;
> >>>
> >>>     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >>> @@ -869,17 +883,21 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
> >>>     mutex_init(&priv->lock);
> >>>     platform_set_drvdata(pdev, priv);
> >>>
> >>> -   priv->regs = devm_platform_ioremap_resource_byname(pdev, "dpfe-cpu");
> >>> +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpfe-cpu");
> >>
> >> You cannot use devm_platform_get_and_ioremap_resource()? Are the 'reg'
> >> entries flexible/random?
> >
> > IIRC the names and indexes are stable so we could do a positional index
> > resource lookup, but maybe what we want is to introduce a
> > devm_platform_get_and_ioremap_resource_by_name()?
>
> If the bindings enforces strict order, that could be a way, but I do not
> want to push towards new
> devm_platform_get_and_ioremap_resource_by_name() because that could lead
> to long patchset with bikeshedding about how many wrappers we need...
>
> Approach is fine then. New wrapper can be brought on top.
>
> Best regards,
> Krzysztof

