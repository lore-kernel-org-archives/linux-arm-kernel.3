Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F39109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOzJPTVd2K0ObveD8TmPHZd5icUhrVuBV8d7L+Wyo2o=; b=k2ozUNyWXNn8tWtoPrlTnxyjnK
	i2LQ2vBte+77bGedC5eVhA+2Ovk9V6Qh5CQlu0kFs0e1nTVc/g0wAHm4/YMWjOw2MrZ+RpPdJt6r1
	elLVxbwWZ3f7IheAwNLdwCOw1o1TztUKXl+f8UgbC/BFRzM6iwXyZk5CxOUvltw4ePj5ZGzO94pDz
	KzwsBeXhnv6GQzQDVgdUYwQ+eciYU23Zg41CGS6N1XpySFweEw8LsqW+MS3kjQRDF+A9QuE/oW0iu
	dMXYnUPHi6uqtLOHxfCY+KaWk2UIxWMN/unXSOLZMeRpzhFNrBoNvyrkfXKKlXm0aFcrAotaVE9I1
	Cizyzstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G4B-0000000B3Mj-2MFZ;
	Thu, 19 Mar 2026 16:17:47 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G49-0000000B3LH-0EJB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:17:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c648bc907ebso680154a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773937064; x=1774541864; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOzJPTVd2K0ObveD8TmPHZd5icUhrVuBV8d7L+Wyo2o=;
        b=ejpVYZW/ZyFoMsD+skQKyejr188VPJfP6Y9OawQprsJ3XLr8PUlqbntwxYmmEhj7KZ
         Mk602JfxxmvtbPu0BozGUzqk0dKZ80Tk9h7My3V3w/SyejztLOvLcBWfK6lJNbFgfqid
         ceDe6V/lbxXlYm9YUASVvw50A7+mQ+UHIhI/DpISu9cXPp26ogYQExnjeaZ/l46FE/32
         L09tN8AadL1D3VFOFla/y+P5pfTfyk9lMkx7VDbFMkJkWQJCGaXHsMytK9ymd31YyBXf
         GclRMMoMY0cMG8gw9kKU+9+FONiHyyduXyppVkibqFJ4GAThjIekx585Omv4G8Ws643v
         XrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773937064; x=1774541864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOzJPTVd2K0ObveD8TmPHZd5icUhrVuBV8d7L+Wyo2o=;
        b=cUP/RYy8cnCeGwwJ602jNR0zqiUqF+vyNvXeeXOOnetM3HnG1zDrOwOBbDy7Nr/X7Z
         dIuloeC9RnuzDMdv1pM7CXa7RYl2B66kLdr9vv8ImS0qrIByCYZtf6rTWSwuHU9061IU
         E+gkAN11SM0iZsaZ4s1o56M3I5fKxc6Gfx2D4oLDARcjlD7nld0kQ1SGF7mcUx1B9H3H
         IxLV2IJoDRQ23oh4J1VRlhryKivhT+DT2DT8fH2Rug022oLaf2EWHvGuHXyiyzhd/xoW
         nS2KraQtu0e2cU5IfAMsNHomAIo3OfMDTOgFxFiP6HzyhedPkoIonQPbi0rE0wpn5i41
         OUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDYrfsMPbUu6A+6qNgSkjtjZjm3DvkAS0dtAcWyJQ4Nvwy/C6gQm/eAwGKv1LRaleLIOuC5bPQ07bkiqN7/vHi@lists.infradead.org
X-Gm-Message-State: AOJu0YxaELDYqj8IrRjZ6/REePjs1sX0mmmkTuQ0f0FljEJqhSKkCaK4
	mhuz5cEbzcFX5LpKzcPEbFGelhr8de1WlfYpOx2X5UfjxZr0ID0VhJxp
X-Gm-Gg: ATEYQzxxjDX0wyHSkwTYtO8lQIX9wqF5/WHZjqt3U2R35I9R3THdNE3fIFfVhJe6RPs
	bR9SlVHLbd/rKoMC/ziYW9mo7NldEkjz7c0OrsSJu6w1OHbsEXPSCLzfarOhOSzpqefzB1lv7tF
	c58GsZifu3o95+Db+BTIpSp/YKFJMmfybMBQrUYitQORP82bUry0Sb8HjlT7QaKcT5QnyBgnisc
	BGho9O29XtM/rUDblFb/+kS+oxksiiDHdsqj65yqkYQ/16WEAeENUXgUy9pes+26TMIZ+6YKcEy
	b6BT756D8dPkkTuu9awGJMZEfxRXS2+yw8qTgwAmUiat/OKEvKAIe2YXUlCgv9I8p/QxRozFxVR
	8FWIhJi3S6T5WtoTz6edlC1iBkZHrDq0gbe9dZcFGGJ0a4R87VyVXvW+1etSqX9CCDk11Hi+Xnm
	hrwPNO1P5GAR7rvFkw0QHDs6d6/0OO3juO6Q==
X-Received: by 2002:a17:902:e752:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b06e3941f5mr79049735ad.23.1773937063958;
        Thu, 19 Mar 2026 09:17:43 -0700 (PDT)
Received: from google.com ([2402:7500:a44:85b:69b:67cd:27b7:b4b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e41990dsm86350305ad.3.2026.03.19.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:17:43 -0700 (PDT)
Date: Fri, 20 Mar 2026 00:17:37 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, srini@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
Message-ID: <abwhoY0vlmgQ0J1P@google.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
 <20260318193538.246853-3-visitorckw@gmail.com>
 <CAP6Zq1gJOrEii97X2XjXexZeEQ5SN4F-wW334BN7SOrGbiVQxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP6Zq1gJOrEii97X2XjXexZeEQ5SN4F-wW334BN7SOrGbiVQxg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_091745_101302_28C8EB87 
X-CRM114-Status: GOOD (  48.19  )
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

Hi Tomer,

On Thu, Mar 19, 2026 at 12:57:04PM +0200, Tomer Maimon wrote:
> Hi Kuan-Wei,
> 
> Thanks for the upstream Nuvoton OTP driver.
> 
> On Wed, 18 Mar 2026 at 21:36, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >
> > Add a new NVMEM driver for the OTP memory controllers found on Nuvoton
> > NPCM SoCs.
> >
> > This OTP is read-only and manages two independent arrays: Key Storage
> > and Fuse Array, which contain cryptographic keys, hardware strapping,
> > and calibration data.
> >
> > Each array provides 1024 bytes of storage.
> >
> > It can be accessed by writing the target address and a read command
> > to the control registers, and then polling a status register until
> > the data is ready. Concurrent accesses are protected by a mutex.
> >
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  MAINTAINERS              |   7 +++
> >  drivers/nvmem/Kconfig    |  10 +++
> >  drivers/nvmem/Makefile   |   2 +
> >  drivers/nvmem/npcm-otp.c | 129 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 148 insertions(+)
> >  create mode 100644 drivers/nvmem/npcm-otp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 61bf550fd37c..e391e2bcb5f6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18894,6 +18894,13 @@ F:     drivers/nubus/
> >  F:     include/linux/nubus.h
> >  F:     include/uapi/linux/nubus.h
> >
> > +NUVOTON NPCM OTP NVMEM DRIVER
> > +M:     Kuan-Wei Chiu <visitorckw@gmail.com>
> > +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
> > +F:     drivers/nvmem/npcm-otp.c
> > +
> >  NUVOTON NCT6694 MFD DRIVER
> >  M:     Ming Yu <tmyu0@nuvoton.com>
> >  S:     Supported
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index 74ddbd0f79b0..5d065b7448ff 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
> >           This driver can also be built as a module. If so, the module
> >           will be called nvmem_qoriq_efuse.
> >
> > +config NVMEM_NPCM_OTP
> > +       tristate "Nuvoton NPCM7xx OTP Controller"
> > +       depends on ARCH_NPCM || COMPILE_TEST
> > +       help
> > +         This option enables support for the OTP (One-Time Programmable)
> > +         controller found on Nuvoton NPCM7xx BMCs.
> > +
> > +         This driver can also be built as a module. If so, the module
> > +         will be called npcm-otp.
> > +
> >  endif
> > diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> > index 7252b8ec88d4..63c23b304d64 100644
> > --- a/drivers/nvmem/Makefile
> > +++ b/drivers/nvmem/Makefile
> > @@ -95,3 +95,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)            += nvmem_zynqmp_nvmem.o
> >  nvmem_zynqmp_nvmem-y                   := zynqmp_nvmem.o
> >  obj-$(CONFIG_NVMEM_QORIQ_EFUSE)                += nvmem-qoriq-efuse.o
> >  nvmem-qoriq-efuse-y                    := qoriq-efuse.o
> > +obj-$(CONFIG_NVMEM_NPCM_OTP)           += nvmem-npcm-otp.o
> > +nvmem-npcm-otp-y                       := npcm-otp.o
> > diff --git a/drivers/nvmem/npcm-otp.c b/drivers/nvmem/npcm-otp.c
> > new file mode 100644
> > index 000000000000..abe4bab66c06
> > --- /dev/null
> > +++ b/drivers/nvmem/npcm-otp.c
> > @@ -0,0 +1,129 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Nuvoton NPCM7xx OTP (One-Time Programmable) NVMEM driver
> > + *
> > + * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +/* Register offsets and bitmasks */
> > +#define NPCM_OTP_FST           0x00
> > +#define NPCM_OTP_FADDR         0x04
> > +#define NPCM_OTP_FDATA         0x08
> > +#define NPCM_OTP_FCTL          0x14
> > +
> > +#define FST_RDY                        BIT(0)
> > +#define FST_RDST               BIT(1)
> > +#define FCTL_READ_CMD          0x02
> > +
> > +/* OTP total capacity is 8192 bits (1024 Bytes) */
> > +#define NPCM_OTP_SIZE          1024
> > +
> > +struct npcm_otp {
> > +       void __iomem *base;
> > +       struct mutex lock; /* protects concurrent OTP accesses */
> > +};
> > +
> > +static int npcm_otp_read_byte(struct npcm_otp *otp, unsigned int offset, u8 *val)
> > +{
> > +       u32 fst;
> > +       int ret;
> > +
> > +       writel(offset, otp->base + NPCM_OTP_FADDR);
> > +       writel(FCTL_READ_CMD, otp->base + NPCM_OTP_FCTL);
> > +
> > +       ret = readl_poll_timeout(otp->base + NPCM_OTP_FST, fst,
> > +                                (fst & FST_RDY), 10, 10000);
> > +       if (ret)
> > +               return ret;
> > +
> > +       *val = (u8)(readl(otp->base + NPCM_OTP_FDATA) & 0xFF);
> > +
> > +       /* Clear the status bit to prepare for the next read */
> > +       writel(FST_RDST, otp->base + NPCM_OTP_FST);
> > +
> > +       return 0;
> > +}
> > +
> > +static int npcm_otp_read(void *context, unsigned int offset,
> > +                        void *val, size_t bytes)
> > +{
> > +       struct npcm_otp *otp = context;
> > +       u8 *buf = val;
> > +       int ret = 0;
> > +       size_t i;
> > +
> > +       mutex_lock(&otp->lock);
> > +
> > +       for (i = 0; i < bytes; i++) {
> > +               ret = npcm_otp_read_byte(otp, offset + i, &buf[i]);
> > +               if (ret)
> > +                       break;
> > +       }
> > +
> > +       mutex_unlock(&otp->lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static int npcm_otp_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct npcm_otp *otp;
> > +       struct nvmem_config config = { 0 };
> > +       struct nvmem_device *nvmem;
> > +
> > +       otp = devm_kzalloc(dev, sizeof(*otp), GFP_KERNEL);
> > +       if (!otp)
> > +               return -ENOMEM;
> > +
> > +       otp->base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(otp->base))
> > +               return PTR_ERR(otp->base);
> Since the driver already opens and manages the OTP registers, it
> should also be responsible for handling the OTP index.
> The NPCM AES driver can make use of keys stored in OTP.
> We would be happy to help add support for OTP‑stored keys to the
> upstream driver.
> If you’d like, we can set up a meeting to discuss how this can be implemented.

I would be very happy to collaborate. :)

Regarding scheduling a meeting, I will be traveling abroad from 03/22
to 04/01 with very limited and unstable network access, so I would
prefer to avoid that window. We can coordinate the exact date and time
off-list.

Regards,
Kuan-Wei

> > +
> > +       mutex_init(&otp->lock);
> > +
> > +       config.dev = dev;
> > +       config.name = dev_name(dev);
> > +       config.read_only = true;
> > +       config.word_size = 1;
> > +       config.stride = 1;
> > +       config.reg_read = npcm_otp_read;
> > +       config.priv = otp;
> > +       config.size = NPCM_OTP_SIZE;
> Suggest setting the size according to the BMC SoC,
> The NPCM7xx has 2 8Kbyte OTP, and the NPCM8xx 64KB size.OPT
> > +
> > +       nvmem = devm_nvmem_register(dev, &config);
> > +       if (IS_ERR(nvmem))
> > +               return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register nvmem\n");
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id npcm_otp_dt_ids[] = {
> > +       { .compatible = "nuvoton,npcm750-key-storage" },
> > +       { .compatible = "nuvoton,npcm750-fuse-array" },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, npcm_otp_dt_ids);
> > +
> > +static struct platform_driver npcm_otp_driver = {
> > +       .probe          = npcm_otp_probe,
> > +       .driver         = {
> > +               .name   = "npcm-otp",
> > +               .of_match_table = npcm_otp_dt_ids,
> > +       },
> > +};
> > +module_platform_driver(npcm_otp_driver);
> > +
> > +MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
> > +MODULE_DESCRIPTION("Nuvoton NPCM7xx OTP NVMEM driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.53.0.851.ga537e3e6e9-goog
> >
> 
> Thanks,
> 
> Tomer

