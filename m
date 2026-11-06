Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IewVP2X/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a/XCk9Hy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WL8nwJ/wMqsPR/6qL4tukpzx0z/mXpqqzRzogjQyULk=; b=IewVP2X/m1vJ7l
	/f27o/GbSXsk4sYRE3sD6fq0FHzhlAAorBoJyfZ7dSAu1HisbxoVvQctA7mF4bUYjxNIW20XSRvPo
	f1SxAsRiUR3Xq/W+bwcp4/XlFVHMEmUsxaNEvqtozP7BTf/3QkohOwC20k6kWJaRbCdjc/68ybdN2
	0JLNaI5JR0Wi9TWz0nIFB4oy3cScE2Q7VAX16jybAi8jzge21p8fLpLyFkNJiSJegM4DMRJprtwBK
	8hCo1fp8/S87rh0aQPFTCW5LFLI/h9IIs3dFZQEKt7+Vcj9csMq8vbfGhFIhjWbqXg4QzZrebWFXE
	is0Zzw64XkBE9t4iCCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7zl-0000000AvV3-42Nb;
	Fri, 06 Nov 2026 00:39:53 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7zi-0000000AvUf-3UHM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 00:39:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc751eddf25so45692a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 16:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793925589; x=1794530389; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WL8nwJ/wMqsPR/6qL4tukpzx0z/mXpqqzRzogjQyULk=;
        b=a/XCk9HyM7q/nY2LpCJfZKMqL5ZOEY20BDCqwNxr5b6vE5cWhOK+pmL/tSTQw1eV7t
         DyI8UK9dgN5QKOcN4FdRe3Ih4UmussKVF6Dp/YDQzY3hfsM87X9WWgI3TEGhO0hGUKoz
         km/SzmoExliXLtmDOxVcdOIvUk3Zn0mWphj/18xw/zhLtyxfk9xpt7+7JxZ3RSiqoh9E
         M1GzYht0mtd3ad27sp514rCl/EFHDBIs7pJMIffJJdrdl1xVelsuiFOBaJLiw3yiD4r2
         NYPsAGHBESJN4VWM77migK3TsrXTFWckt1NIVAqkJvE9bNlmDeEyPxhub4v/n6D4Wmgg
         2ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925589; x=1794530389;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL8nwJ/wMqsPR/6qL4tukpzx0z/mXpqqzRzogjQyULk=;
        b=QoKlSf7ZeKbx4+hmp6KCvXPLkShJqvQa9T3gM6f4EmMNdIVhS1U2z//NX6YTfUmJXK
         jPwu7vc5GqCxemVysTQZ8FuzT6nHmHarUGCx6ayPDkfKu6JXVZmK2n9CcXQ/AdwBVLiF
         Oh66KUo44jMoGn3Mf1PU/9xfwJVm5U+aFPVbDxmflK0Gm43kmSmes090vWgeFqKBNeyq
         fNpVoMcv0om6zVlPUwUfqzQ6NH9fDvy461dnUhRkNeEStF5OQcT6ishwOfHTD6n56Jk2
         BSq8IlAXJjpCh2lCuFNus8yRtquOUH3RszJf8m3SV3BAQqXY5xOc3+xD7+HLNXfeAqql
         vcWA==
X-Forwarded-Encrypted: i=1; AKwUvByIz2HOFiIhTZDvqUTbe2Dw9zX2GqpUMZ3yNZVulABKQMcGmvE+PSEdMgryr4gBIFedGDtEdHXQLZGvQh3fUoN9@lists.infradead.org
X-Gm-Message-State: APuU4Z/iqOact/tkdAEhMnwjrSwenwv6a1WfUR14z0LaKYhROrAkkW3V
	1Nbt0Pn6cJZ/ZaMZO7rwxEQdBrVsFLW6VYztwPZMNVbRbHBlVmw2rkp5
X-Gm-Gg: AYBFou03L9pr6IeyaPp9qJQ51YN6N9/UIamSmExP5NXW1vOL341OcPJjE47jGUKBv7y
	pwia796bbpviTEyXWsms5uxEL3joPvsoa5VFoeCRbIbECzMV2Vh04DuNldJg6wGGCXgvkBgkxb7
	ffb527+cYIr3M9XvcBb26Savk+gVg3rqWkxoOTTy3FwBihPeoLZ+ej6LTlNOz/WW+DfZhXBdcXV
	V5OUn8oGRXPVh38fZV8Qq4eTdGFf7LCgIhQ6kyPKfxGJ6AuuaU/7JOIwlmS64nbb2VySsHM8UdF
	YF/qVdd6En069vPZIihyfjdd8XN74NSoTZ9rr+tyeSmWv6+N0zO3dChlq8oA21okFkROIi1V4QE
	fPwjMieW0iFEzes1ToedTJV2tT2dcvJDRi0cLrODrFedIbs0dglhIS/supwgcXcqoRwtkYfoN9c
	0/qgRhBilFMJHydbv5ViA6bDr1JCH+eNbAFrNbAAKEvK7wWzlVZKkFJdylCbK1AFJnJ+/NGsPwr
	mPEdtdpfqfjyErpk+UKv5Q4gGSQYhUP8WThIGeSrBR1Fr0xfP2+tb0zx4tEpwFJrFFg98w5hDRd
	lxygpGXT6FsNfK2jd/vLEbmoGo9Dkyhnh1xwOjff6IiH7Qq3SXlI7rZKZ7xinDH+VjGriCncFdW
	Hysw=
X-Received: by 2002:a17:90b:3890:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3b0db6bba9cmr784048a91.18.1793925589389;
        Thu, 05 Nov 2026 16:39:49 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0993fb8a8sm5197377a91.4.2026.11.05.16.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:39:48 -0800 (PST)
Message-ID: <4d739128-248f-4b35-8e0c-6f6b8fbebc3b@gmail.com>
Date: Fri, 6 Nov 2026 08:39:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <20261104-airborne-vivid-caterpillar-991425@quoll>
 <de0bcd11-edfe-471b-a22d-f1e748a7fda6@gmail.com>
Content-Language: en-US
In-Reply-To: <de0bcd11-edfe-471b-a22d-f1e748a7fda6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_163950_915519_15A59492 
X-CRM114-Status: GOOD (  29.55  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Sorry, I missed this comment.


On 11/5/2026 12:11 PM, Shan-Chun Hung wrote:
> Hi Krzysztof,
> 
> Thanks for your review.
> 
> On 11/4/2026 10:06 PM, Krzysztof Kozlowski wrote:
>> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>>> +#include <linux/align.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/compiler_types.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/dev_printk.h>
>>> +#include <linux/device.h>
>>> +#include <linux/dma-direction.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/dma/ma35d1-pdma.h>
>>> +#include <linux/dmaengine.h>
>>> +#include <linux/err.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/gfp_types.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/irqreturn.h>
>>> +#include <linux/limits.h>
>>> +#include <linux/list.h>
>>> +#include <linux/math.h>
>>> +#include <linux/minmax.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_dma.h>
>>> +#include <linux/overflow.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/scatterlist.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/spinlock_types.h>
>>> +#include <linux/stddef.h>
>>> +#include <linux/string.h>
>>> +#include <linux/types.h>
>>
>> Do you use all these defines?
I'll double-check the defines.>>
>> I don't see usage of header with bindings, though.
The bindings header is indeed unused and will be removed in the next 
revision.
>>
>>> +
>>> +#include "dmaengine.h"
>>> +#include "virt-dma.h"
>>> +
>>
>> ...
>>
>>> +static int ma35d1_pdma_probe(struct platform_device *pdev)
>>> +{
>>> +    int i, irq, nr_chans, ret;
>>> +    struct clk *pdma_clk;
>>> +    struct device *dev = &pdev->dev;
>>> +    struct device_node *node = dev->of_node;
>>> +    struct ma35d1_chan *ch;
>>> +    struct ma35d1_pdmadev *pdmadev;
>>> +    void __iomem *reg_base;
>>> +
>>> +    pdma_clk = devm_clk_get_enabled(dev, NULL);
>>> +    if (IS_ERR(pdma_clk))
>>> +        return dev_err_probe(dev, PTR_ERR(pdma_clk), "Failed to get 
>>> clk\n");
>>> +
>>> +    ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    irq = platform_get_irq(pdev, 0);
>>> +    if (irq < 0)
>>> +        return irq;
>>> +
>>> +    ret = of_property_read_u32(node, "dma-channels", &nr_chans);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to get dma-channels\n");
>>> +
>>> +    if (nr_chans > PDMA_MAX_CHANS) {
>>> +        dev_warn(dev, "dma-channels %d exceeds max %d, clamping\n",
>>> +             nr_chans, PDMA_MAX_CHANS);
>>> +        nr_chans = PDMA_MAX_CHANS;
>>> +    }
>>> +
>>> +    pdmadev = devm_kzalloc(dev, struct_size(pdmadev, channels, 
>>> nr_chans), GFP_KERNEL);
>>> +    if (!pdmadev)
>>> +        return -ENOMEM;
>>> +
>>> +    pdmadev->nr_chans = nr_chans;
>>> +
>>> +    reg_base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(reg_base))
>>> +        return dev_err_probe(dev, PTR_ERR(reg_base),
>>> +                     "Failed to map pdma global registers\n");
>>> +
>>> +    dma_cap_zero(pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_SLAVE, pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_PRIVATE, pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_MEMCPY, pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_CYCLIC, pdmadev->ddev.cap_mask);
>>> +
>>> +    pdmadev->ddev.dev = dev;
>>> +    pdmadev->ddev.src_addr_widths = PDMA_SLAVE_BUSWIDTHS;
>>> +    pdmadev->ddev.dst_addr_widths = PDMA_SLAVE_BUSWIDTHS;
>>> +    pdmadev->ddev.directions = BIT(DMA_MEM_TO_DEV) | 
>>> BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_MEM);
>>> +    pdmadev->ddev.device_prep_dma_memcpy = ma35d1_prep_dma_memcpy;
>>> +    pdmadev->ddev.device_prep_slave_sg = ma35d1_prep_slave_sg;
>>> +    pdmadev->ddev.device_prep_dma_cyclic = ma35d1_prep_dma_cyclic;
>>> +    pdmadev->ddev.device_free_chan_resources = 
>>> ma35d1_free_chan_resources;
>>> +    pdmadev->ddev.device_issue_pending = ma35d1_issue_pending;
>>> +    pdmadev->ddev.device_tx_status = ma35d1_tx_status;
>>> +    pdmadev->ddev.device_config = ma35d1_slave_config;
>>> +    pdmadev->ddev.device_terminate_all = ma35d1_terminate_all;
>>> +    pdmadev->ddev.device_synchronize = ma35d1_synchronize;
>>> +
>>> +    spin_lock_init(&pdmadev->lock);
>>> +    INIT_LIST_HEAD(&pdmadev->ddev.channels);
>>> +    for (i = 0; i < nr_chans; i++) {
>>> +        ch = &pdmadev->channels[i];
>>> +        ch->dev = dev;
>>> +        ch->pdmadev = pdmadev;
>>> +        ch->id = i;
>>> +        ch->base = reg_base;
>>> +        ch->vc.desc_free = ma35d1_pdma_desc_free;
>>> +        vchan_init(&ch->vc, &pdmadev->ddev);
>>> +    }
>>> +
>>> +    ret = devm_request_irq(dev, irq, ma35d1_pdma_interrupt, 0, pdev- 
>>> >name, pdmadev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to request IRQ\n");
>>> +
>>> +    ret = dmaenginem_async_device_register(&pdmadev->ddev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = of_dma_controller_register(node, ma35d1_of_xlate, pdmadev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "of_dma_controller_register 
>>> failed\n");
>>> +
>>> +    platform_set_drvdata(pdev, pdmadev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void ma35d1_pdma_remove(struct platform_device *pdev)
>>> +{
>>> +    struct ma35d1_pdmadev *pdmadev = platform_get_drvdata(pdev);
>>> +    int i;
>>> +
>>> +    of_dma_controller_free(pdev->dev.of_node);
>>> +    writel(0, pdmadev->channels[0].base + PDMA_INTEN);
>>> +
>>> +    for (i = 0; i < pdmadev->nr_chans; i++)
>>> +        tasklet_kill(&pdmadev->channels[i].vc.task);
>>> +}
>>> +
>>> +static const struct of_device_id ma35d1_pdma_match[] = {
>>> +    { .compatible = "nuvoton,ma35d1-pdma" },
>>> +    { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, ma35d1_pdma_match);
>>> +
>>> +static struct platform_driver ma35d1_pdma_driver = {
>>> +    .probe = ma35d1_pdma_probe,
>>> +    .remove = ma35d1_pdma_remove,
>>> +    .driver = {
>>> +        .name = "ma35d1-pdma",
>>> +        .of_match_table = ma35d1_pdma_match,
>>> +    },
>>> +};
>>> +module_platform_driver(ma35d1_pdma_driver);
>>> +
>>> +MODULE_DESCRIPTION("PDMA controller driver for Nuvoton MA35D1");
>>> +MODULE_AUTHOR("Shan-Chun Hung <shanchun1218@gmail.com>");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/include/linux/dma/ma35d1-pdma.h b/include/linux/dma/ 
>>> ma35d1-pdma.h
>>> new file mode 100644
>>> index 000000000000..13f1410d74da
>>> --- /dev/null
>>> +++ b/include/linux/dma/ma35d1-pdma.h
>>> @@ -0,0 +1,24 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Header file for the MA35D1 PDMA Controller driver
>>> + *
>>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>>> + */
>>> +#ifndef _MA35D1_PDMA_H
>>> +#define _MA35D1_PDMA_H
>>> +
>>> +/**
>>> + * struct ma35d1_peripheral - PDMA peripheral configuration
>>> + * @prescaler: timeout prescaler value
>>> + * @counter: timeout counter value
>>> + *
>>> + * Slave device drivers fill in this structure and pass it via
>>> + * dma_slave_config.peripheral_config/peripheral_size to configure
>>> + * the MA35D1 PDMA engine's per-channel timeout detection block.
>>
>> Hm? Confusing, how is it supposed to be used? Do you just reimplement
>> board files?
> 
> Sorry, the comment did not clearly explain the intended usage.
> 
> For UART RX DMA, the UART driver calculates the PDMA timeout prescaler 
> and counter values based on the current baud rate, then passes them 
> through dma_slave_config.peripheral_config to configure the channel's 
> timeout detection. These are runtime settings.
> 
> However, I understand that passing raw prescaler and counter values 
> couples the UART driver to the MA35D1 PDMA register layout. I will 
> consider having the UART driver specify the required timeout duration 
> and letting the PDMA driver convert it into the hardware settings.
> 
> In the next revision, I will remove this timeout configuration interface 
> and revisit it together with the UART DMA support patches, so the 
> intended usage and client implementation can be reviewed together.
>>
>>> + */
>>> +struct ma35d1_peripheral {
>>> +    unsigned int prescaler;
>>> +    unsigned int counter;
>>> +};
>>> +
>>> +#endif /* _MA35D1_PDMA_H */
>>> -- 
>>> 2.25.1
>>>
> 
> Best Regards,
> Shan-Chun

Best Regards,
Shan-Chun


