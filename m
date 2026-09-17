Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60875C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZBcYFlUWh2QD/UxUu1L+haLQxP28ejhx5/K8jLq5F0=; b=hJbMBMXAZGPw4wDPjqrYueppYN
	x5BxrjLstAV+g6xPqtKGVlS4jdUDVIwEfyf3hE6+egXPAFNAfgCcpErpuSjQPG+Bu5KarUI/clHnX
	faZ8n4nFQEKaM9o70AFOoAcAi7DL5xJ1egRQj1C4C0rkNsAT+Bon6LubRxHLUI4NoGo4HZ0OfzFli
	LDpBusxawn26PooQAz2wsLLvEcj0PIn6ngOqmc0iFJQpNx/IICj3yMBfNm+W4ecJYKJpgwQeGlW2r
	HQeKQP7VmurEVXBDSb6GyypsvjziQmZK1a4TXZDn6GeCl1lp0bApVEJitCYfGEAP73GxRa/EfMhg8
	ECBR4Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FcH-0000000C3JQ-3vXW;
	Thu, 17 Sep 2026 17:09:45 +0000
Received: from mail-oo1-xc64.google.com ([2607:f8b0:4864:20::c64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FcF-0000000C3IP-2O2c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:09:44 +0000
Received: by mail-oo1-xc64.google.com with SMTP id 006d021491bc7-6b3671a1b20so334392eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664982; x=1790269782;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6ZBcYFlUWh2QD/UxUu1L+haLQxP28ejhx5/K8jLq5F0=;
        b=V+N9t8xZJ/mmCuHNeCPKFdaLM552IRBPhpGFUBJfQoRwUCaUeFecvrLZBI2Mll/3bQ
         Hs6kkzQ9iUCimqC+Zhj7pDrvOJQpg6tDK2+vl2kbThCZGZzzJJ1mKdH/XDqnDBV1hIC+
         KYPt/UKCqg0nDQIJvwRZknsfDdPUknophbP/Is2QPsshd2Ds4fYSrRoiXf+qmV3UkrWF
         SsNn0SgQGnop57nP38mH/7S7gMoY+UUac5rxsxeQP5XOjYZWNnwPxl22LdUrBUWRODJ6
         4AaipNmlf8gfTcExcnEhJDDdYE7DcfZwycN1vf1AZp/b+4zB2Xtx3DOYASdUwWaLE/hz
         ZsEg==
X-Forwarded-Encrypted: i=1; AKwUvBz4HvpZXYFQFixyXy0uwKGdUZ68uBQKxz5eU53N+HUZnSMVxdKpRxfETHsJtFs9iTrLE/sdQ6QK2xcJ09P0YZEL@lists.infradead.org
X-Gm-Message-State: AFuF++n1GSNM57jOz8eJ07uDOvWW/R/XvViTDCM8JW25OHIV2I5IpyIE
	R3jjjYbKGv5L/61ELPvtNM0/ZPG6gIzKcrG4FppBTvV7mw7R9or4vfNh/NLQOd1Ozc7eS+7R0nv
	YPieSXMrjx4G7kYKK83pM5POFw27UCYiGbMFpsj0fXtyrIuRbtHEGH5CXaxS0aSHlcYxTlr21Jv
	jBQZZPciNGTSypd1EJ2ajA51chw0VkedyyIjWkDv6oxa0Q7tI+4/wJ4vcD63oOP1r7SwU6MkMCQ
	b2mWPODEbO0SKdwsk3C60Ydx4bkXnzkPsM=
X-Gm-Gg: AYBFou0DHU8IQaAXIW62AAWAgt3v/8pXFjgKwM6IQRsFXkopWxkoSIVGeM/uRs8qrvx
	y0W8YtWFO+KlwedoAUQPKfL9MOE+sjQ9eVkG3VFl6PkGvOyCgkTKojdLt1Ewc2c9tmBzFajCZUi
	fKj3XPWTSBVMtnO+WjMYsfiKSEUme1whEJpMOJ1zLGjAu972dMA4piuXStAHyFsULzZoHal5X/z
	VQ4fQA7EPwlYLH6P9skX4CYrX8SZRKlXxpNwXzZvWGqiBq3SOKLYM8tHcQiw07JOPmZ1kJ0lV6O
	mvhfKRE5dxdclsYpvFoiou+MVlyYCCR52aYvxirC3Xw2Nzng7HKWH4YTQ394W4VA7ChdnE2d0xE
	uOXzKK5631xIT/PUaqdwD0fsCNMdw3Crmk0ZldwPB7nobVKg472MxyUVk70YSlSXsNldfnt7+h0
	wbLBwczinRMpkjb8XRwUe5gFu+m3Samm9HZ6Ixdl2B
X-Received: by 2002:a05:6830:67f7:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-80b2ccc3114mr13710109a34.2.1789664982271;
        Thu, 17 Sep 2026 10:09:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c468a2ea8sm1785162a34.5.2026.09.17.10.09.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:09:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so201950285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664981; x=1790269781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZBcYFlUWh2QD/UxUu1L+haLQxP28ejhx5/K8jLq5F0=;
        b=cHDim7bMYBiaS2OkTM5yztEx8LtqbDFGXrjnwVSOu9WK52oK6p9Pvpc3EJNshKtcri
         dnfVwIstpB6ZXIns2E28e5pbNtV/DhF8pXaMOAZ6k/yPCbQnEUawitHMaHXpOmtA/g9u
         f9PB96zsYWlKnudk7sAHFVb7ldLxf9+hC7tCg=
X-Forwarded-Encrypted: i=1; AKwUvBx0oFX9xioUq8tUiz41JeF2brEgidnSO8r7cgr1Hhgv2Ria3Xc2rtlliJWXPX/JYmc96rLdShb+IA+CA+ggljw6@lists.infradead.org
X-Received: by 2002:a05:620a:a18d:10b0:93b:b849:d11e with SMTP id af79cd13be357-93bb849d318mr1128743685a.49.1789664981345;
        Thu, 17 Sep 2026 10:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:a18d:10b0:93b:b849:d11e with SMTP id af79cd13be357-93bb849d318mr1128738285a.49.1789664980874;
        Thu, 17 Sep 2026 10:09:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc7ce2sm2236776d6.34.2026.09.17.10.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:09:40 -0700 (PDT)
Message-ID: <34743ec6-9f95-4be3-b941-a1873beea3ee@broadcom.com>
Date: Thu, 17 Sep 2026 10:09:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] PCI: brcmstb: Split up complicated function into
 two variants
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-14-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-14-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100943_628162_3E88EE6E 
X-CRM114-Status: UNSURE (   9.86  )
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

On 9/11/26 16:35, Jim Quinlan wrote:
> The function brcm_pcie_get_inbound_wins() is abstruse.  Most of
> its code is used exclusively by older chips, where the PCIe HW employed a
> baroque internal inbound window mapping scheme which was an artifact for
> when the PCIe would be configured as an endpoint.
> 
> Create two variants of this function, one for the newer chips and one for
> the older chips, and assign them using the config_data structures.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

