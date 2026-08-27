Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D3EC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl7DYaCAgT6voJx+/pTYVo9JkDp1mfF80CDgV5Jiw5A=; b=XRXpvvk7SuElKhG/4J1ViFUU+7
	+SgP+u8KMMKP5rDWfPLYbEcy8Py68w7V0wmlEp0KmCzNY1aakzIcLW5LcOsF2T+TkjRf+FlzER7UL
	xAd+Mo99uhX4SlmP8dGgNvgUbDNI0oT+YoJ4clV4H4agzW806p8y0fy0DK+8kcIjEoBvm79JC3ukr
	B3wB1DMIo5/IUpYlskGnPiBgA1JrJWS4rE/nGaB6I8XBT2OwuDQ4gX12vYFeDYIq8upiJzm/IKRrA
	wKERPXPR2PHyCDDeWxeAkKHBFSeLQGe1gQ2tvemPlN5jChC0YIPYTfu+JrLJc9aOEWRgrABags86R
	bsC59zEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze2o-00000004U4Z-0BRK;
	Thu, 27 Aug 2026 17:37:42 +0000
Received: from mail-vk1-xa62.google.com ([2607:f8b0:4864:20::a62])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze2k-00000004U3p-1OjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:37:40 +0000
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso68106e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852256; x=1788457056;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jl7DYaCAgT6voJx+/pTYVo9JkDp1mfF80CDgV5Jiw5A=;
        b=pY5khOsWjJaG+dRruTUq1GQ+h/LFC1aEKUIQw0NCNY9czdFYHP9pLbshCVnTo2jrJO
         QgBJmOdaM+Sbz1/CJQg7y3y3UzQi56gfB3YXGLseKxoVbETJFL+1pmymZjmcLML+B4CF
         HwTW7ZsaA+R/N4beOswDFlVahmb7VnOgfzqJnSPHXFszFfIoUcOyy2UW6X3A5g2Lg+jt
         4KAbpitcg2oUDIOSvwpsBQNYisp5PdiHv7jF1PJY3GcZWCBlDGHKqqu+8Zgbt3ArVuQb
         TWOVmJp0R0ojJntCaGzVpceEFLCHkpyIp9yLnmPsRI0yjwngW6TmxmlwneNPX/T27IWX
         wjdg==
X-Forwarded-Encrypted: i=1; AHgh+RpZSiKRhbldBnqL3qNeOo+HAH3XpPFiR2SJeV/VBZY1E53bmKLLZ43SmRYAc10sTxY+GBgRBQbhnCOio1m4pt+l@lists.infradead.org
X-Gm-Message-State: AFuF++nZ5IbpkeprlJO6qqK4UozFArX8JGCMkMoQLDPMqXsAsikkJzd3
	NSVxI070fRW0TwRI423eUduu5vjjKP+V7WkaTA/kR5QpF1SMGrPLQx0QHDK8TS2PEu05KU46WZ2
	XIxOJUJ6tquMOLoXNgohdr+2ujAOsY8p85HM685Z5+ZhJEsMePX+ciwBL83fEk2n+GExU5seFSF
	nXCiYcD8PQCsC9XvSqf8aYtxgOTDPAiUWs213Lex0l39qpp/TPKlDG3vwsJVrfuWkdR0B7g6sym
	6ECHrScxeNfHqnuBcQmiJbbEGTiuybHmio=
X-Gm-Gg: AR+sD11X2pEpjjB9Bkkc2WXEDQdRGDY0p3PhQ+YZaG48jwv1cbEXDtunbdjrCMbS4Eo
	YZ8LA0jl0FnMl3RXSCwM9HkW+pDqJ13lHMq+90RVOglHPIgSjbLFIp4nHsRNDTKqg713hAH39Zm
	nxL0xlxgJVMwSUasryn9s7BH+72LUyG2n0RWyT18U/K0qJWQo1JeOpfD//1hJWWyI1BePf7yU5N
	t7Sy1N55lCymdxtiyxzZkcIic3yFe9opeUpQH4ntc90gaMa2caYSF8BbVRrnQuqtx3w+yELlCrA
	qnhTM9RmiM2lfu+cEJTj+Su73uC53XSMUNXsFS5mkTQfSJe8KazQLvd9OLd3zDZBPWtEq3mlH86
	Xb3FgypfL+uVc3YJn02FpZ3I3ZP5LcpOLp0PCev0sDvMWzHMqA1szuuosEK/NxZms2Tpx6jaWAD
	v8aN0t07TpkLSsURStrdfTQYADBTUpT+eFxVYh6U1d
X-Received: by 2002:a05:6122:1c85:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c680ebbf4fmr386442e0c.0.1787852256412;
        Thu, 27 Aug 2026 10:37:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c65f9cb133sm1798257e0c.0.2026.08.27.10.37.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:37:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so13482785a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787852256; x=1788457056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jl7DYaCAgT6voJx+/pTYVo9JkDp1mfF80CDgV5Jiw5A=;
        b=BGmn7Yu6qytiDFWdUEOne0zdYxAjAvs/obfisSFuhfb2AltnnyqESqZTXwZadXT4zz
         oSEEB+J+rU6CayjMm8rwWoK7is8JaLZE1+fruxmLkdZI1h7UC8waLk1lV2bgXiniZa31
         bOadROWIYSAR/BoJ0Lg9pNGeFUP9/l62pQqIg=
X-Forwarded-Encrypted: i=1; AHgh+RrGNQ2kz7CXLOKTMSW/pbzxabuDMomuxxXJJNLAnyFLonwoR5OCMApT8V8bo3mww36hZIoITfRe9MDC1YlfTMjP@lists.infradead.org
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr36639185a.23.1787852255699;
        Thu, 27 Aug 2026 10:37:35 -0700 (PDT)
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr36628285a.23.1787852254803;
        Thu, 27 Aug 2026 10:37:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93913734be9sm12011585a.15.2026.08.27.10.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:37:33 -0700 (PDT)
Message-ID: <682b68a0-03b7-4ec9-9d17-698fe134b57a@broadcom.com>
Date: Thu, 27 Aug 2026 10:37:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to
 DCPU offset
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Danesh Petigara <danesh.petigara@broadcom.com>, mmayer@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-2-danesh.petigara@broadcom.com>
 <067b7e2e-f2b2-4462-96f1-3a1e35bd25e8@kernel.org>
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
In-Reply-To: <067b7e2e-f2b2-4462-96f1-3a1e35bd25e8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_103738_435401_BFA5D95E 
X-CRM114-Status: GOOD (  26.74  )
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

On 8/26/26 23:48, Krzysztof Kozlowski wrote:
> On 26/08/2026 22:14, Danesh Petigara wrote:
>> From: Justin Chen <justin.chen@broadcom.com>
>>
>> On API v1/v2 boards, the DCPU coprocessor can steer kernel readl_relaxed()
>> and writel_relaxed() to any address within 256 MB of the ioremapped DPFE
>> dmem or regs base. The DCPU firmware provides a 28-bit offset which the
>> driver adds to the ioremap base without any bounds checking in
>> get_msg_ptr().
>>
>> This allows a compromised DCPU firmware to trick the host kernel into
>> reading or writing arbitrary memory-mapped I/O registers in vmalloc
>> space. When combined with a root-writable sysfs file like dpfe_refresh,
>> it provides an arbitrary MMIO write primitive. Similarly, world-readable
>> sysfs files can be used to leak other devices' register contents.
> 
> If someone can compromise firmware to provide different addresses, then
> what stops this person to change DTB with completely different MMIO
> ranges for this device?

On our platforms the DTB is part of the boot loader which is 
signed+encrypted and customers do not build any UART driver or 
user-interface so changing the DTB is somewhat difficult. Same goes with 
the Linux kernel, it's also signed+encrypted. This is defense in depth 
at this point.

> 
> Isn't better just to drop root-writeable sysfs interfaces, since they
> are the insecure parts?

Yes that would probably be an acceptable move forward. Markus do you 
remember what was the use case for the dpfe_refresh file to be R/W?

> 
>>
>> Fix this by recording the resource_size() of the dmem and regs ioremaps
>> at probe time, and rejecting any offset that, along with the largest
>> field accessed (DRAM_VENDOR_ERROR + sizeof(u32)), exceeds the recorded
>> mapping size.
>>
>> Fixes: fee5f1ef6cf7 ("memory: brcmstb: dpfe: support new way of passing data from the DCPU")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
>> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
>> ---
>>   drivers/memory/brcmstb_dpfe.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
>> index 08d9e05b1b33..66343205f585 100644
>> --- a/drivers/memory/brcmstb_dpfe.c
>> +++ b/drivers/memory/brcmstb_dpfe.c
>> @@ -182,6 +182,8 @@ struct brcmstb_dpfe_priv {
>>   	void __iomem *regs;
>>   	void __iomem *dmem;
>>   	void __iomem *imem;
>> +	resource_size_t regs_size;
>> +	resource_size_t dmem_size;
>>   	struct device *dev;
>>   	const struct dpfe_api *dpfe_api;
>>   	struct mutex lock;
>> @@ -401,9 +403,14 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
>>   	 */
>>   	switch (msg_type) {
>>   	case 1:
>> +		if (DCPU_MSG_RAM_START + offset + DRAM_VENDOR_ERROR +
>> +		    sizeof(u32) > priv->regs_size)
>> +			goto bad_offset;
>>   		ptr = priv->regs + DCPU_MSG_RAM_START + offset;
>>   		break;
>>   	case 0:
>> +		if (offset + DRAM_VENDOR_ERROR + sizeof(u32) > priv->dmem_size)
>> +			goto bad_offset;
>>   		ptr = priv->dmem + offset;
>>   		break;
>>   	default:
>> @@ -415,6 +422,12 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
>>   	}
>>   
>>   	return ptr;
>> +
>> +bad_offset:
>> +	dev_err(priv->dev, "DCPU returned out-of-range offset %#x\n", offset);
>> +	if (buf && size)
>> +		*size = sprintf(buf, "ERROR: DCPU offset out of range\n");
>> +	return NULL;
>>   }
>>   
>>   static void __finalize_command(struct brcmstb_dpfe_priv *priv)
>> @@ -858,6 +871,7 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct brcmstb_dpfe_priv *priv;
>> +	struct resource *res;
>>   	int ret;
>>   
>>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> @@ -869,17 +883,21 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
>>   	mutex_init(&priv->lock);
>>   	platform_set_drvdata(pdev, priv);
>>   
>> -	priv->regs = devm_platform_ioremap_resource_byname(pdev, "dpfe-cpu");
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpfe-cpu");
> 
> You cannot use devm_platform_get_and_ioremap_resource()? Are the 'reg'
> entries flexible/random?

IIRC the names and indexes are stable so we could do a positional index 
resource lookup, but maybe what we want is to introduce a 
devm_platform_get_and_ioremap_resource_by_name()?
-- 
Florian

