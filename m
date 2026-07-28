Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0FBC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYN+MWoB45b0XFF8uhtfviKg9BKAiTaAm42bln7lBx8=; b=mJ010WjyawbKAX6jVGUrw0yLAU
	TdXq6gQTdJpZxryaLKrQfNcweeXhED2cFKmF78VXBW5fI16N5xQZG2ir6GNaG4NB0SqPJ1KzHvEaf
	W/vAH+RdeK7BS7zaaLdKoRC7Rb4oBI7GejN/sqr1p8CToBA5ENQCLi+8PpcH+6HXSRKLiVFJar2fX
	jJnKa/GhcT6UOprFMcMKVsex35nCYwgjxuWIZMjSk7IrhWqPCIfMqhuiauuExc/UhgbCLSFD4LpUS
	kFD0JyjDDJK+kSMeWethdm6arBvWaw149kdc2RfQtV1a8ECSxs5+eIbESxiQNFJaA+pn8twW1P5+y
	TGVNZBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woliu-00000005yfH-2j7Y;
	Tue, 28 Jul 2026 17:36:14 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolis-00000005yea-07kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:36:11 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso69255a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 10:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260168; x=1785864968;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XYN+MWoB45b0XFF8uhtfviKg9BKAiTaAm42bln7lBx8=;
        b=sMncsFwRV0p/BjIgtEDEAfBPzXpFq2RzhEFnkcAxVU1elyRxdbQkGt/S7ZnUhvyo/B
         Cq2Y3spRUTL1iwncmD9M4Zn41IW2b/Ph8eE7Kd7Dnqeze8+W0nMf/92wJtO802tP9SLw
         aAXTZfiUuZ6OA5hxSz+CO3KrJk/47Cw5IZemku6+g1FFinBB/PnR9PhoGr27rnR90hFn
         HKM9vuINY+kQIQoyWSfZDWjDSby6gRGPk1wU1f7L9GfBNGxvT0xcAkNB6NCSaiYWo/wm
         Vtqkf0Oqliv1JeTs72ZSmUwSA4t9t0pyGuUluB9Kv2jPhHn7Q+1QbZ+Cb3WeZCY77mqy
         4fug==
X-Forwarded-Encrypted: i=1; AHgh+Rp+91O8iNVZfHv12B/korFbk+hiCaLOatLR+AXaf4+5eYvWXpdfeRwzME8LkCd+plSpDOHLPjGaOdzuSX92IRoc@lists.infradead.org
X-Gm-Message-State: AOJu0YyNE8XOJFd8fFgz2Fe536eXR/N4HLOHh+hqSvtlVO3O4AiPostn
	DOU+k+PS0pCFXa7ZRiQkyxgKP1DPoBriXrZzw9SdOX48xClZQoPbjlcb8FKIFUoTNXRW4CG/pk4
	elxlck1fxqC7mnFhzBO8qBqiNf8OZYiiCOTDtU/XoV8r4eXFBRKEVoBOx1WT6q96WBjNGZwtkwi
	S2XLItvewafbiR8FK+7ADl8tvxxGzBqookxqE54JSKxtAhCrM0jgZnDWsiZ+m1MnIJ/j8wwefW4
	lZfSv4S9obYWhKjQChcLXePyqQ5vIk9z1o=
X-Gm-Gg: AR+sD105w+h5ceNkkm6xpTwdDITNOk/snCnYTDJFs+b9+FCcI4Hw0Q/kGm+MsQ6H+cA
	lwIDF72HIhLcjKwodf84TCTaXzd3RFlnYNyDOGuuHjVHTuCWTamWG5Ebq279dLVpdwUEeZjGylM
	xpXYTOmdAumV06XdAVz81AA8fDZzPSDmQMV4liUVb9QeRG6jR7cJakf8EeReh3UVHZmcyjfdk/l
	atIivr5wbnNiIZ3Hn81+dVwqwCWjnU9VX7SLTXIOcpNGJgJH5flg28cjIe6ZkjnGepjZIlwwGm0
	VNcPTWIQDSb3oh4hs2eeaaY9a/Iz3tG8XunoyocKqtt5tmb3IpkLos45LSOe4wwu6AhrtjtJlg1
	ncLNQNataP7vsep6+9y1RHiBuXD7992iXbVh9/IH+GQSDBY8ojz3apw0PVH6X+PcM2mcBhWWfTe
	yEFzsBJcBeGxQ/LG+8BlfmIO7QuTrr4T5laOnGoau2
X-Received: by 2002:a17:90b:33cf:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-38f6a34e336mr3819836a91.2.1785260168141;
        Tue, 28 Jul 2026 10:36:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-13e725dcfe6sm12781c88.0.2026.07.28.10.36.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 10:36:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso112491a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785260165; x=1785864965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYN+MWoB45b0XFF8uhtfviKg9BKAiTaAm42bln7lBx8=;
        b=J/VotuP4ub6q1ykQ5aWtVyjXCUtXh1jyl4um0bDFRBXzui+MvCaA66B73K+9T4IlOE
         qgNZ3Ymo2Ef/ajVI9KjOIxQFOEN6hv7DIFCLtEaoIJ3Cdb5v1sIvn0r/1ZnYaoxbNwk0
         eHBOnBEQIdJ1H1cTI8HUJ70Pmy7D7t08LuR9Y=
X-Forwarded-Encrypted: i=1; AHgh+RpJe5jlSwq4tiuq9XYblWzBJQbjuuCgvpD9xT48/i+G0qg/TTY9DAzBqiigHgS81miubmEhwIv1IkCGn6FABlK/@lists.infradead.org
X-Received: by 2002:a17:90b:3b41:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38f6a4716aemr3632515a91.28.1785260164839;
        Tue, 28 Jul 2026 10:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3b41:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38f6a4716aemr3632479a91.28.1785260164236;
        Tue, 28 Jul 2026 10:36:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm687356eec.20.2026.07.28.10.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 10:36:03 -0700 (PDT)
Message-ID: <1393e77c-a197-4ce6-b0d3-f96206145ab1@broadcom.com>
Date: Tue, 28 Jul 2026 10:36:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] irqchip/bcm7038-l1: clean up init failure paths
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>,
 Haofeng Li <lihaofeng@kylinos.cn>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kevin Cernekee
 <cernekee@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
 <tencent_4839362F248901E45E50D9AEF6823DFA4007@qq.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <tencent_4839362F248901E45E50D9AEF6823DFA4007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_103610_085703_01D20F89 
X-CRM114-Status: GOOD (  23.41  )
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

On 7/14/26 06:24, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
> 
> bcm7038_l1_init_one() stores the allocated CPU object in
> intc->cpus[idx] before mapping its registers and parent interrupt.
> Failures after that allocation leak the CPU object and possibly its
> MMIO mapping.
> 
> A later IRQ domain allocation failure also frees intc while leaving
> parent mappings and chained handlers installed for CPUs initialized
> successfully. Those handlers retain intc as their data and can access
> freed memory.
> 
> Free the current CPU object on local failures. Remember every parent
> IRQ so the common error path can disable wake when it was enabled,
> remove the chained handler, dispose the mapping, unmap the registers,
> and free the CPU object before freeing intc.
> 
> Fixes: 5f7f0317ed28 ("IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers")
> 
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
>   drivers/irqchip/irq-bcm7038-l1.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index 54a8557ef557..b42c4f4df6bf 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -49,6 +49,8 @@ struct bcm7038_l1_chip {
>   
>   struct bcm7038_l1_cpu {
>   	void __iomem		*map_base;
> +	unsigned int		parent_irq;
> +	bool			wake_enabled;
>   	u32			mask_cache[];
>   };
>   
> @@ -247,8 +249,11 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
>   		return -ENOMEM;
>   
>   	cpu->map_base = ioremap(res.start, sz);
> -	if (!cpu->map_base)
> +	if (!cpu->map_base) {
> +		kfree(cpu);
> +		intc->cpus[idx] = NULL;

This pattern repeats below, consider creating a new label, that would do 
the 'cpu' variable freeing and assigng intc->cpus[idx] to NULL?

>   		return -ENOMEM;
> +	}
>   
>   	for (i = 0; i < n_words; i++) {
>   		l1_writel(~intc->irq_fwd_mask[i],
> @@ -261,12 +266,17 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
>   	parent_irq = irq_of_parse_and_map(dn, idx);
>   	if (!parent_irq) {
>   		pr_err("failed to map parent interrupt %d\n", parent_irq);
> +		iounmap(cpu->map_base);

And this would belong to a new label as well

> +		kfree(cpu);
> +		intc->cpus[idx] = NULL;

That new label would be used here.

>   		return -EINVAL;
>   	}
>   
> -	if (of_property_read_bool(dn, "brcm,irq-can-wake"))
> -		enable_irq_wake(parent_irq);
> +	if (of_property_read_bool(dn, "brcm,irq-can-wake") &&
> +	    !enable_irq_wake(parent_irq))
> +		cpu->wake_enabled = true;
>   
> +	cpu->parent_irq = parent_irq;
>   	irq_set_chained_handler_and_data(parent_irq, bcm7038_l1_irq_handle,
>   					 intc);
>   
> @@ -408,7 +418,7 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
>   			if (idx)
>   				break;
>   			pr_err("failed to remap intc L1 registers\n");
> -			goto out_free;
> +			goto out_unmap;
>   		}
>   	}
>   
> @@ -440,6 +450,12 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
>   		struct bcm7038_l1_cpu *cpu = intc->cpus[idx];
>   
>   		if (cpu) {
> +			if (cpu->parent_irq) {
> +				if (cpu->wake_enabled)
> +					disable_irq_wake(cpu->parent_irq);
> +				irq_set_chained_handler_and_data(cpu->parent_irq, NULL, NULL);
> +				irq_dispose_mapping(cpu->parent_irq);
> +			}
>   			if (cpu->map_base)
>   				iounmap(cpu->map_base);
>   			kfree(cpu);

-- 
Florian


