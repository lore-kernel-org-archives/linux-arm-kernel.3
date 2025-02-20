Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D69C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/u13R5KOWq3pv04QD3KJlgVCEhSKv3/X70G4FsiRMMU=; b=lvrDLJP3qGItGU5OrohCKz06WT
	YV2XQTi6+BVlHgklYr0otnYYqEOjFK3DhwxRsocc0y5z0JbFkXhO2ySyNOAplcVuuDXQ2grVOJnsO
	PksQQV3h1tHsdldjAiA4agGFVdK+ZaEJw39r02PZcqUjLluph1T3EbIzeOAy9wRFTohrqt+WuGnSk
	OFrCFl4YyZI5JvxAo+b13Edx53Xu2P/rPFCRZYBGffP0by1I7M6rBsqxEExIKxfB96BHTfPfvstog
	CdCG3/HIkkrXLwpIVfUaKKiCDrEaDoAyhwOLMFgl/6nKNtUv+61pB81JrQMZVLQm8tkSyJ5VKU75F
	t9JlYC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAMV-000000028pe-3nfT;
	Thu, 20 Feb 2025 17:29:23 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAL0-000000028PM-1rDi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:27:51 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2bcc0c6c149so869750fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740072469; x=1740677269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/u13R5KOWq3pv04QD3KJlgVCEhSKv3/X70G4FsiRMMU=;
        b=DW8Cz3/vmVo4imC5jYFE+Cf5d6YG3tIRZpey1YKOIzGLGavIHxPn8QHlZgePRr//5a
         LavuUMvypSce4lZ0p0bgL9pYOEZlG8rsntkoeQzPoq8PyCrLthrIT9F2/p66HMwMKSpW
         46Ghy9fLOOCglMGn/1K44qjbTNrHz4lKD44DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072469; x=1740677269;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u13R5KOWq3pv04QD3KJlgVCEhSKv3/X70G4FsiRMMU=;
        b=osjrCLU4DBfOxeSQW+/UotmoqKJIq/CdD1APoi7O0gBNdviVdQfFxU2JBk3wfGAQO9
         wx5waluujjY+UcFYV/YyNJukzCeFt5ea6Opbaa8UPi1CjIcx3Bbvi3o8JGytLGvnjBAu
         PpWkwCgJu9aDiXlcZP5ne6GoVG5J4AGcTRBvAH4IqbLSh5oq/bor/LoLc3z09xB7i9v8
         EB845paSn2WCL9G7OgW4Q4ItudjVlaXF5Hw57Q2GFSjcQ/0lMUKstbjfCmgoSi9ZleZF
         kYeIEJSuDLtIGjL9bcWUjoonHNeiWcFxYl5IS06TeZ5aYIyLl548seZZibYVhPLMNiZR
         vRJw==
X-Forwarded-Encrypted: i=1; AJvYcCVrc5TLPwAm7SxCQ78x21XAvYcdj4LUgG7QPD8K8DUaBEiYGyQ312RAJ/Ncue52moQYkS62KEcLbLrQTv5nOJK+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1hQgrxxMVJRT5HN1VimUzZo54UCEvPg2YM2uI3vl/TasHOFGY
	yV4ZSd2Htpk3cbhav3WJhQfdLynrVzFjKxQkr68yYfYgoUR/7t7hx5Sanbq8hQ==
X-Gm-Gg: ASbGncvd8SdPCXf4afY0/7KFEMgnVsJaUF82VJiYGhfrLMnGeAobSA7R7d5458rhuTT
	QTeVNbJ4594JcdV4rASdX3oUxYpqSau3ZdPUfa4sM6HO/GOXC1Xam/LL63dsgD//WXevlqjoOEa
	nk8zzwmGVyjRjku7xKxcscVWElCDPbWeOxKu08WwUn3N4HNsMdrWXGRwndI9M9RBzyIuRgxm3OO
	eg39DBy1hyZytYOVUqSkkTlanvnLRwjcHIbfZo7FW4TDp323QcWzOi+c6VA2gBtLnMtZk/yC/Be
	rFAnK3vxshfXb/Abp9GA+tVXiTLXohwzoFepNAWmUmtgcQcl2//YHwvucDcttH6kRlvGrchQMWP
	2kZ/B
X-Google-Smtp-Source: AGHT+IFpe+7WNEMHf/e1K6RN6XXnxM2f+u9ir5hEJr+L2Qg9sOoP7MoRY9KKhkttJDVKbKrszFf5hA==
X-Received: by 2002:a05:6870:6129:b0:296:9c08:51a3 with SMTP id 586e51a60fabf-2bd1052586fmr6219961fac.39.1740072469073;
        Thu, 20 Feb 2025 09:27:49 -0800 (PST)
Received: from [10.171.122.29] (wsip-98-189-219-228.oc.oc.cox.net. [98.189.219.228])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b9548b8b8asm6393725fac.21.2025.02.20.09.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:27:48 -0800 (PST)
Message-ID: <3e2eef77-2aaa-4140-9e91-59173445c929@broadcom.com>
Date: Thu, 20 Feb 2025 09:27:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] PCI: brcmstb: Set gen limitation before link, not
 after
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jeremy Linton <jeremy.linton@arm.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_092750_485261_D458404A 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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



On 2/14/2025 9:39 AM, Jim Quinlan wrote:
> When the user elects to limit the PCIe generation via the appropriate DT
> property, apply the settings before the PCIe link-up, not after.
> 
> Fixes: c0452137034bda8f686dd9a2e167949bfffd6776 ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")

Looks like this commit ID should be shortened to 12 digits. Other than that:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


