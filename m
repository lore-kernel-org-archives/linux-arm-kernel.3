Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5404AC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6g/CX+/dSwtyMMTLVD/KiU50D2jdXyznwECf80QCyY=; b=eleYUhjLoUWHVLrUA3qwz/3hU1
	UdlJ/QPJKNlw8jKPByzQJlDP/WKqhakhNTEg7h5kP1jxxBASZSpQddYfjG/dDxMN6fn2yYJme7qdL
	B1nyeqQBKUWTXFZ/m4dnbfBMkBUboL9BBmh+Wo1Amm9QynGhBYWcIs9NXVBmbufPgjDO01XCMlhdl
	vZBry7w+W+V7UdxqkJdeIrYSmCe1O/i9r9VSNZpf6hI02JvKKTt9newNUVK63DEgc+4pE1NqTNayi
	wqY4PtpyGl8I7nK894iBfpBE7r9p9LMgpkd5/vrJVPof21n3zU1zxyd7DasSw1pUFfde5dKsL8FFg
	ReAdmg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ4l-00000008bt7-3rJf;
	Tue, 21 Jan 2025 18:34:11 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ31-00000008bfa-0bcm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 18:32:24 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3ebbe804913so1440713b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737484342; x=1738089142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I6g/CX+/dSwtyMMTLVD/KiU50D2jdXyznwECf80QCyY=;
        b=WDYGAc8yhGQc9E/o434LscxeAurm8bP+RXaXdN8AlzIOL2686k+tVK/mvEFXFcbved
         b0MbqORrA1lE290mx6NZe5gt2YVNzndQ9Jl+J2jgf3Ufn204hMQFAGp3LnzSE5sBcsts
         MIbP4etZeqbQ981sucyP8xkYMWj0GoPM1jHTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484342; x=1738089142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6g/CX+/dSwtyMMTLVD/KiU50D2jdXyznwECf80QCyY=;
        b=J76yj0VHHbSi8rpQMLOtl2/1wn/Ad4GJVEGIB7p7hRBTwpKuuCJzXKxioyXbQFWw+Q
         BnMNwNTEQ3sK9C2VeTOYYH1Bpkx86gln4L+TS3uc5e9Z7peUpJDekcQoExBz+IPTw+U9
         mMATG7zxxvq6XtGZ2BHhri4HixO6+K+iZvsuZcYE7BA/qLHuXGYmL3qEU/4qHKylgiZw
         +vc4dEYeCFV5dqbZmPHv/ZWXmppif0GEVPrwUcBUXx8sJjVJX/R8n8qFxX8exgFkZeZw
         huwUMw6PTFJ9D4Dx/TdoUMKj5tNzQRXRCDh1cqtVMwD9JGdqRaLC4hV7S7ch6XPB+88J
         kI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXikeydS2yz3riXsd5ZO0WYcaEPxe+E9/P9tuvSVw3BfOv+7PZ7yq8deJzkxTuQNnDkgMtLQHQhqRIl89HhlYQz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4NKux7HHr0y8uOjufUcb1r9UwLg0zhag8g9PVR+mCVRsRJt4h
	QQzBZRXVHG00RMPZI4rU+Rt7lbt+nnWsagLT43/O/pwApw43BZve19XZashuyQ==
X-Gm-Gg: ASbGncvNUmU7ODb1fOXaPQEbRucvMKsP4BbtvsBHrR25Oe1GZnnZ1GHDT9Kmyx/AmIk
	iCf3OR8NxVOUn+ADH5fJ732rlp41QmZJvkWWw0YCa8XpSPEwfj5VX6bvqlvfI+DLesUQklmOMIA
	amUGRcAblW+j8sD6GNjNARe/NtRttxua34dXG9jmEzRDH6aiijrM2btfstZ3XDcU1zuxfqamGOe
	ck2YWHFbqSnPTIwPrapQQXyIhL/IvpUp4yvoEjUEojBUD6a5zwosaX1yqErOhOlPqwYZtxbEKa9
	y66u3aXSVOcT1deVoWsDMAbNHOYkkUCU4Q==
X-Google-Smtp-Source: AGHT+IEdmBRPRkWmokta3IssK592zHSuLuOAdbq0f0sxdCFGkG6xlMjxeEXZTzeb5T9HD5OCPu6HQw==
X-Received: by 2002:a05:6870:4f17:b0:29e:5df2:3e50 with SMTP id 586e51a60fabf-2b1c09c5d8fmr10307404fac.15.1737484342205;
        Tue, 21 Jan 2025 10:32:22 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b8cef45bsm3757647fac.20.2025.01.21.10.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:32:19 -0800 (PST)
Message-ID: <1abdd175-280a-442a-a27a-9bc01c0a04c0@broadcom.com>
Date: Tue, 21 Jan 2025 10:32:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 09/11] PCI: brcmstb: Fix for missing of_node_put
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 stable@vger.kernel.org
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-10-svarbanov@suse.de>
Content-Language: en-US
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
In-Reply-To: <20250120130119.671119-10-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_103223_188109_C4C5F08B 
X-CRM114-Status: GOOD (  19.91  )
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

On 1/20/25 05:01, Stanimir Varbanov wrote:
> A call to of_parse_phandle() increments refcount, of_node_put must be
> called when done the work on it. Fix missing of_node_put() on the
> msi_np device node by using scope based of_node_put() cleanups.
> 
> Cc: stable@vger.kernel.org # v5.10+
> Fixes: 40ca1bf580ef ("PCI: brcmstb: Add MSI support")
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
> v4 -> v5:
>   - New patch in the series.
> 
>   drivers/pci/controller/pcie-brcmstb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 744fe1a4cf9c..546056f7f0d3 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1844,7 +1844,8 @@ static struct pci_ops brcm7425_pcie_ops = {
>   
>   static int brcm_pcie_probe(struct platform_device *pdev)
>   {
> -	struct device_node *np = pdev->dev.of_node, *msi_np;
> +	struct device_node *msi_np __free(device_node) = NULL;

In the interest of making this a straight back port to 5.10 that does 
not have all of the __free() goodies, I would just add the missing 
of_node_put() where necessary.

Also, since this is a bug fix, you should probably make it appear 
earlier in the patch series, or even sent it as a separate fix entirely.
-- 
Florian

