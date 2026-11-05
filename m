Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27311606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HjJycxm8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGMFn+On
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9R8sjon0OoLhcKLtvCx4GBuhrJBqClfpAAsAKQfgIQk=; b=HjJycxm8ez3GOQ
	DLQpGnJBmGH4xQRLosVGJSYbTVXCvvEA1NHRDbpPLa3PqJUAH7fZHek4cJPhkqVETl2BDESsImvbX
	wybOaC1VFQVgwYtE5E0UFcrpwM+swTxPqyD0lArRVxd9isDaoI3lRI5hjt6jBVKjr0h8GameN+T2B
	omVg9GiWqMaK8RbT5xTxirrvI7z0/kNmP3jh0GpaP0nr9VWczLJA2ZAmh50tOWZdV/xcXQOf6YlA6
	R1/NSer9eywWd2cGLhBXdodPeYzLuhzbfxp/BTMFH5VWs+GJR6m9cHt2mX+zugG1faiBz4HxzzOeA
	lIFzaLYcPon70ti661Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOopW-00000007kWD-3HET;
	Thu, 05 Nov 2026 04:12:02 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOopT-00000007kVi-2zMb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:12:01 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso841965a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 20:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793851919; x=1794456719; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R8sjon0OoLhcKLtvCx4GBuhrJBqClfpAAsAKQfgIQk=;
        b=yGMFn+OnMnyqatoUgjxqXukRjsxKnDyrR6G1LTf7F2EFG+7b8IGYEI9nJtXk40aIKj
         4luHeN5hY3WruX5KxB+UrgRtGRDMuM84OtMP4/0tgjmw6FRQ16YsKBVa3c5VXjQSUvre
         IV4fqlfj85sR6CcywjKf1w5EmBN0EPlfsvwHXzO5zSPwCX5HuNzir+cCBjeGcZ8i4eo7
         J+Aw6DZYBCwi5gVLNIXXqQ5ExaOTmXFC1iu300VboJ5LFHj2STCaabxouuHBVIwlBdOY
         GEs+NRnm4ryinMaGyaWp+twv9L5wSsEbcnIIxNOWMaFlFRSHEWzATSOMwzQIhSJ+phQV
         MBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851919; x=1794456719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R8sjon0OoLhcKLtvCx4GBuhrJBqClfpAAsAKQfgIQk=;
        b=bvGPga6TYh68ROkGwNiwwf8Q87y9Je7F+Niq2yGueg2ir1qay5D+GYoPwj4vk95qYR
         9lCyTjAw3xz4pN0hkLAcHwxKxU/9PR0m3PJ09DSFrwGpi4h4+cteomjFqDafi7QvzeiL
         zdns0mwGUy/MCzkjziLIrOJPfKEU/i1QI7UbpiNTQ90PGVFXGdjhl+AVty/Wdy8edhmw
         1uHT7E1028LM8I/LRTZzYKBei3RZ2nNmgAK6S99561eI4kEUJ/nidO//5w57mPhvTqlV
         nVQJnbg0pMkMGu43oLJiuaW5rH67PySDDnmaEKehU5WC6/oaow4fnGYDhWN0bAQX1JvD
         +how==
X-Forwarded-Encrypted: i=1; AKwUvBzquWpRwtKaoaqHwQfK0BLhG9cdRbq6Y3lD+k9yVa7WWW584nm+bZAGiIQQVV+7Bph+UNfjCtUScR3VYR84d9od@lists.infradead.org
X-Gm-Message-State: APuU4Z/KwLISi069M243E/FbdezvCNioGrse4etiFoiAnnfWbUGqJTPu
	Tx8YwVfAS54xDUUYJKDFsTLtH2+4XXK3Pgx8HJBwvskizsmvrHN5Ub+Y+8EdBjxr
X-Gm-Gg: AYBFou02kZaH7dSzi8q+iWz15bA/hdlAHWtOvwD1wRgRxYr21y/7zXuhsVgNFK5Fe+k
	/8ryIRdRtpdFJFM6U5EuQzWGK5ExmfjSrYw6MznwtLeadJIbMiposnezKnmd6ROFuG7QxUsNl6/
	yur9K5KKyWuQzlGKJtPmTFQ3XDRrxooLDfClnj9GTgWnS1sDoMRKjQ9wkHJfmLWVaT4EdMjD/eh
	MTcMciqxNVwNkkehWP17pgo8I3+49OsA3IvlyAPXs3JdNK5sD6r0gYkRwwUNc1x6o754oiOmcP4
	/5rFRmeujY689qf+AG+XIkaI3RnjRxA1bFiMx5P4ZhFy9R0k/HXcFHKQ4FJrQ2IaX2BWa7lpBxL
	9XG4dWxgjFHin62eH/ZfYQaK0ndzAyDUKeMr+8tQ4hQdn5V/6bRQTxGzRgikFDWmDdIXlIFI0Ja
	j8Jm96WVi6bKILYdXbcX5B1QXp9U2009jDoUi4Bjijqtf/i0SJSWbjQXU+rpo21vPHLV33lbbYV
	zFyp3HQ00Mr9cnL7N/KlaJIudq/mAn1N8mwi8RtmFxMwsuXi5izatZP2g4accKQVPksfz2gscrW
	uaZYsUFqD7GzF6vDdqEdOJJcT3zJD09VrC7x0QA7J76xfvsSN93Mi3kDbnlxEsF/JHlsaSXHx6U
	NhqE=
X-Received: by 2002:a17:90b:1c88:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ae8957cff0mr15276654a91.4.1793851918778;
        Wed, 04 Nov 2026 20:11:58 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3280378sm1540693a91.12.2026.11.04.20.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 20:11:58 -0800 (PST)
Message-ID: <de0bcd11-edfe-471b-a22d-f1e748a7fda6@gmail.com>
Date: Thu, 5 Nov 2026 12:11:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
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
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261104-airborne-vivid-caterpillar-991425@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_201159_790959_C9FDBA0E 
X-CRM114-Status: GOOD (  26.78  )
X-Spam-Score: -1.9 (-)
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

Thanks for your review.

On 11/4/2026 10:06 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>> +#include <linux/align.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/compiler_types.h>
>> +#include <linux/container_of.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/device.h>
>> +#include <linux/dma-direction.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/dma/ma35d1-pdma.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/gfp_types.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/irqreturn.h>
>> +#include <linux/limits.h>
>> +#include <linux/list.h>
>> +#include <linux/math.h>
>> +#include <linux/minmax.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_dma.h>
>> +#include <linux/overflow.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/spinlock_types.h>
>> +#include <linux/stddef.h>
>> +#include <linux/string.h>
>> +#include <linux/types.h>
> 
> Do you use all these defines?
> 
> I don't see usage of header with bindings, though.
> 
>> +
>> +#include "dmaengine.h"
>> +#include "virt-dma.h"
>> +
> 
> ...
> 
>> +static int ma35d1_pdma_probe(struct platform_device *pdev)
>> +{
>> +	int i, irq, nr_chans, ret;
>> +	struct clk *pdma_clk;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct ma35d1_chan *ch;
>> +	struct ma35d1_pdmadev *pdmadev;
>> +	void __iomem *reg_base;
>> +
>> +	pdma_clk = devm_clk_get_enabled(dev, NULL);
>> +	if (IS_ERR(pdma_clk))
>> +		return dev_err_probe(dev, PTR_ERR(pdma_clk), "Failed to get clk\n");
>> +
>> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>> +	if (ret)
>> +		return ret;
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret = of_property_read_u32(node, "dma-channels", &nr_chans);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get dma-channels\n");
>> +
>> +	if (nr_chans > PDMA_MAX_CHANS) {
>> +		dev_warn(dev, "dma-channels %d exceeds max %d, clamping\n",
>> +			 nr_chans, PDMA_MAX_CHANS);
>> +		nr_chans = PDMA_MAX_CHANS;
>> +	}
>> +
>> +	pdmadev = devm_kzalloc(dev, struct_size(pdmadev, channels, nr_chans), GFP_KERNEL);
>> +	if (!pdmadev)
>> +		return -ENOMEM;
>> +
>> +	pdmadev->nr_chans = nr_chans;
>> +
>> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(reg_base))
>> +		return dev_err_probe(dev, PTR_ERR(reg_base),
>> +				     "Failed to map pdma global registers\n");
>> +
>> +	dma_cap_zero(pdmadev->ddev.cap_mask);
>> +	dma_cap_set(DMA_SLAVE, pdmadev->ddev.cap_mask);
>> +	dma_cap_set(DMA_PRIVATE, pdmadev->ddev.cap_mask);
>> +	dma_cap_set(DMA_MEMCPY, pdmadev->ddev.cap_mask);
>> +	dma_cap_set(DMA_CYCLIC, pdmadev->ddev.cap_mask);
>> +
>> +	pdmadev->ddev.dev = dev;
>> +	pdmadev->ddev.src_addr_widths = PDMA_SLAVE_BUSWIDTHS;
>> +	pdmadev->ddev.dst_addr_widths = PDMA_SLAVE_BUSWIDTHS;
>> +	pdmadev->ddev.directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_MEM);
>> +	pdmadev->ddev.device_prep_dma_memcpy = ma35d1_prep_dma_memcpy;
>> +	pdmadev->ddev.device_prep_slave_sg = ma35d1_prep_slave_sg;
>> +	pdmadev->ddev.device_prep_dma_cyclic = ma35d1_prep_dma_cyclic;
>> +	pdmadev->ddev.device_free_chan_resources = ma35d1_free_chan_resources;
>> +	pdmadev->ddev.device_issue_pending = ma35d1_issue_pending;
>> +	pdmadev->ddev.device_tx_status = ma35d1_tx_status;
>> +	pdmadev->ddev.device_config = ma35d1_slave_config;
>> +	pdmadev->ddev.device_terminate_all = ma35d1_terminate_all;
>> +	pdmadev->ddev.device_synchronize = ma35d1_synchronize;
>> +
>> +	spin_lock_init(&pdmadev->lock);
>> +	INIT_LIST_HEAD(&pdmadev->ddev.channels);
>> +	for (i = 0; i < nr_chans; i++) {
>> +		ch = &pdmadev->channels[i];
>> +		ch->dev = dev;
>> +		ch->pdmadev = pdmadev;
>> +		ch->id = i;
>> +		ch->base = reg_base;
>> +		ch->vc.desc_free = ma35d1_pdma_desc_free;
>> +		vchan_init(&ch->vc, &pdmadev->ddev);
>> +	}
>> +
>> +	ret = devm_request_irq(dev, irq, ma35d1_pdma_interrupt, 0, pdev->name, pdmadev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
>> +
>> +	ret = dmaenginem_async_device_register(&pdmadev->ddev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_dma_controller_register(node, ma35d1_of_xlate, pdmadev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "of_dma_controller_register failed\n");
>> +
>> +	platform_set_drvdata(pdev, pdmadev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ma35d1_pdma_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_pdmadev *pdmadev = platform_get_drvdata(pdev);
>> +	int i;
>> +
>> +	of_dma_controller_free(pdev->dev.of_node);
>> +	writel(0, pdmadev->channels[0].base + PDMA_INTEN);
>> +
>> +	for (i = 0; i < pdmadev->nr_chans; i++)
>> +		tasklet_kill(&pdmadev->channels[i].vc.task);
>> +}
>> +
>> +static const struct of_device_id ma35d1_pdma_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-pdma" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35d1_pdma_match);
>> +
>> +static struct platform_driver ma35d1_pdma_driver = {
>> +	.probe = ma35d1_pdma_probe,
>> +	.remove = ma35d1_pdma_remove,
>> +	.driver = {
>> +		.name = "ma35d1-pdma",
>> +		.of_match_table = ma35d1_pdma_match,
>> +	},
>> +};
>> +module_platform_driver(ma35d1_pdma_driver);
>> +
>> +MODULE_DESCRIPTION("PDMA controller driver for Nuvoton MA35D1");
>> +MODULE_AUTHOR("Shan-Chun Hung <shanchun1218@gmail.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/dma/ma35d1-pdma.h b/include/linux/dma/ma35d1-pdma.h
>> new file mode 100644
>> index 000000000000..13f1410d74da
>> --- /dev/null
>> +++ b/include/linux/dma/ma35d1-pdma.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Header file for the MA35D1 PDMA Controller driver
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + */
>> +#ifndef _MA35D1_PDMA_H
>> +#define _MA35D1_PDMA_H
>> +
>> +/**
>> + * struct ma35d1_peripheral - PDMA peripheral configuration
>> + * @prescaler: timeout prescaler value
>> + * @counter: timeout counter value
>> + *
>> + * Slave device drivers fill in this structure and pass it via
>> + * dma_slave_config.peripheral_config/peripheral_size to configure
>> + * the MA35D1 PDMA engine's per-channel timeout detection block.
> 
> Hm? Confusing, how is it supposed to be used? Do you just reimplement
> board files?

Sorry, the comment did not clearly explain the intended usage.

For UART RX DMA, the UART driver calculates the PDMA timeout prescaler 
and counter values based on the current baud rate, then passes them 
through dma_slave_config.peripheral_config to configure the channel's 
timeout detection. These are runtime settings.

However, I understand that passing raw prescaler and counter values 
couples the UART driver to the MA35D1 PDMA register layout. I will 
consider having the UART driver specify the required timeout duration 
and letting the PDMA driver convert it into the hardware settings.

In the next revision, I will remove this timeout configuration interface 
and revisit it together with the UART DMA support patches, so the 
intended usage and client implementation can be reviewed together.
> 
>> + */
>> +struct ma35d1_peripheral {
>> +	unsigned int prescaler;
>> +	unsigned int counter;
>> +};
>> +
>> +#endif /* _MA35D1_PDMA_H */
>> --
>> 2.25.1
>>

Best Regards,
Shan-Chun

