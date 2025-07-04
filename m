Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38926C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjsYeltoq6ttH3cwmNsrMyTVKdEhqYm4Z5XYz4FQdLU=; b=tTSet4ZdjPj7SvPsyCHh8QY7+F
	FqT+xoXBradeXswxXdKpZQWMJRtje0KCP4/JEOonjYv9M5hjZY6mn9toMFHlOrsnuzXRKUnPqIHTc
	iGwGtwE1ZR20ZHzAVl0PhpweFtYzG7IjdsT1D64hSJUMA0bBHAzWqsuv+7VZ5337nvZo8f+EXzJvH
	cLvx4833m5yHCxDfylNYOoN5MxNMP+4F0w3fEaHqaMIvtkVRz8IODRL2RursHjIAqUCNm+pA5dpr9
	SJF7GVpmY5dYMQDV8SguArqmQ3jmHw1H0zuqcEM4IGk6360b2es3lrfYoq+KWbA9kl1op9sELv4Nq
	Uto5Ud+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWOa-0000000D5wA-0cUc;
	Fri, 04 Jul 2025 02:43:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWKl-0000000D5L3-2GJ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:39:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235a3dd4f0dso3957495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751596767; x=1752201567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WjsYeltoq6ttH3cwmNsrMyTVKdEhqYm4Z5XYz4FQdLU=;
        b=G8ZNMdCU2dyL1ANotPDpgO5kkYnb8AM48aeK+6y4SG/p13f46ZYaKB1ClblwCyNB/3
         VzIpzN4+SnLcQKa+UwhgdHL1bTr9qZB17vOcuNLqTsDR8QE7nhiNc0j2ggQpuazhHZGp
         xOO0C5eXfcSTqvVfwMVzmBfna3YHS2cyR6h6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596767; x=1752201567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjsYeltoq6ttH3cwmNsrMyTVKdEhqYm4Z5XYz4FQdLU=;
        b=kyMk1PyMGH/n2CbY3vCAwop7IQVK/9RVwvgToJI6J62mthiMvzS9jHV7tIxx3YCBfh
         mEyv00oF5mk5LuMy5mH/zLef0oj2j1hP8AaiXxGyGnQgr0XeEYZ5Q4pVlEIywtU371bE
         QNfziM6ukyAIcxoytSi72LFYDZPMi5IqjKmPiXVjl5yi1sdisvi3yNVBndb4JU7b2hRf
         MtAHwT5r5gssNtW/QrN1dXUKJEsLN7bzxnXSZKiXHgGaO3VGoXB6xZkKvx8ZWLNBU6Pm
         aVBX9OIVjnrC1KQgTiDZ4qDDz5Y7KA5W3ZVMrnyseLQxQugY3y/d1kkcrTmcXBoh+mmM
         PD1g==
X-Forwarded-Encrypted: i=1; AJvYcCUyh/B5H8bQWG8JUHluVgZB5+hqcgHI8WKlkdj3VFNIuQaX5I4TdtLzoDO9StPAqx00rM/kU5HimpPleUSEZZy8@lists.infradead.org
X-Gm-Message-State: AOJu0YwQmCkyiTHPiE/+YE9ltgUEICV5MJynFRbBUuvLB9HKNmuoOqUS
	n7Tq4cvlyfDwdYNu0n/ovfc2S40GAK2ZWWhtvFuNIhnlT5WM6qeVvbS0HlIYeri/9A==
X-Gm-Gg: ASbGncuxwx2WBA6BnczL/GiYi+ID3M/GbnWPDkP5qtJLAfQqdQkWy6mOMzkReEYxK6X
	HkZ1n3L96UkdejZcf0WSWM+AfghE2PiqxwZB3G/ZU7/aYds9v//Vn5yppC6z5TUcyA8d/YAwiKp
	wgx9Uly6eL/UbNZ3SRwxbFgW8Y/VUYVo2+cElXJY5BS1aaLBRtVpMEn87fPvh66ETCnol53FZzw
	nLJ69Esbjzqo4w7CJqVzHc5WInXw4j2/vs8vGj1pEiXBeTXZeC1/VMJt+Gi2c03/Kn2DJPqjY4b
	KkfyRbNfKKIhbEo6/FnO1EVtlDBFZv6PX1v8IrkYo8NR4IH3OEpkbmdqERZwaIG25yF2n21qLZB
	CnhLfJT7uQleylgvXHlglybZ7mVFToj8lkPbD4OsN
X-Google-Smtp-Source: AGHT+IGZi1m1NI9Byy1yHxIFLZRuzt75eXMvVLKpGTFbwlrlqzm3bvj+yjH+ivXGZkxE5IzAgnm9Zg==
X-Received: by 2002:a17:902:cccf:b0:235:e1d6:4e22 with SMTP id d9443c01a7336-23c8607681bmr13001825ad.18.1751596766775;
        Thu, 03 Jul 2025 19:39:26 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d09esm7617715ad.90.2025.07.03.19.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:39:25 -0700 (PDT)
Message-ID: <cf125ff4-e124-4f1f-a761-ce82ab5bd7d9@broadcom.com>
Date: Thu, 3 Jul 2025 19:39:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: brcmstb: Acommodate newer SOCs with next-gen
 PCIe inbound mapping
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <20250703215314.3971473-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250703215314.3971473-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_193927_585279_DF54AC54 
X-CRM114-Status: UNSURE (   8.03  )
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



On 7/3/2025 2:53 PM, Jim Quinlan wrote:
> New SoCs are coming that are not encumbered with a baroque internal memory
> mapping scheme or power-of-two restrictions on the sizes of inbound
> regsions.  Enable the driver to use these SoCs.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


