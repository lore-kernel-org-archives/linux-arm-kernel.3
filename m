Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EE6C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSZebXv4BWY0XMsVIBwkftKe1sIwcAMtAxU1OIXCMMQ=; b=2bBGRGH+vDy8YmNRdF0P0feQ3m
	n6lQrjNi8U5Bcqb1Dbx67lyRP8GuD/uzXtnKH+IhcB2LpMglwELK+u9ynuTgqVIg676rMPNCJlLDU
	17wVlrG32sv/m4t1rhuzHblo2kFrGQGm6tbIhvo6ycrpYr60vnbLlWpoaYTrwvrYj3+PlXyj69NsM
	tBmSpVV/dmA52P18dXx7XxvXlXNMvd34xtI37P81NVVtHKW5fULXLCo5RhRiRvYMulJ3XJbbpq9pI
	U9hPqomRGKE+spsSzmV81nNPmXBi1DylBNFidmiiEzSd0UxJv4wXFMfNXqgKxI4WCboqf4cTBIkET
	9Ejan9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FbH-0000000C39U-2i39;
	Thu, 17 Sep 2026 17:08:43 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FbE-0000000C38P-3jBv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:08:42 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2dd4593291eso2539975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664920; x=1790269720;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JSZebXv4BWY0XMsVIBwkftKe1sIwcAMtAxU1OIXCMMQ=;
        b=RhXrPgcubks957SKlHXtX+0QAIpkgsLQWE8fsgz65QdFu53e2Mpu5E27lFrWIQEW9a
         NSBInVayqhcco1S/qlVV7dwahQ2TIFeuBjBWwxV0tkcc28bt1jTE2fAQVacsdu7aE5hT
         clu0O2gu8k4FfMHE5eqC1gxlIw4/IP/N2rZK2gsJ9AV4nVqlMoM1PaTn1EFUAzuimHih
         zj/u9CgCB4ba3vNwHSZvk6GJAqVcd4lgqgpMeVINS4Sb0DkMRh1glfcizhKgb/f5g0Vs
         zMAJC02ACoH5Nl6d2YD0ozQP0VVUkvuEDIb+NFxNjPpj8UFcU0ZdUSuEo9w+BXQmWyZs
         Fo0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKk1svzBtmyuQEO32sbqGggultXpleqMei2f43o+wgZs1UEl9vlJCZLC/TEOQUazj5W1p5QgckTrp3m50IJtYd@lists.infradead.org
X-Gm-Message-State: AFuF++mI2BMf5p3e9Engg2pG+yKwIwoSLb/gatdYsUtVEhYTT9Dnh16r
	dn9RTwSM+eQBsh/iYk72yglhLWsi9UDK6XDIdKZWdxA6XCLevexhVMWcnyEHD0obqu9yq/LeyNc
	YqeJxJPbfP9zOJGmNV0YbaqKKuQENYYy6dGuPGKfwcz5xkk0VFD/ow/8ilrmRlRyoSAZVnuSj3B
	1nkKshFjf8QcLiQtBQVXWSz/9ftJEkXZjP22WBt0LCrmgqjoPXXPI+2Qt7/8X2ro05IbbmOlok3
	2sy12om9F1hKE6osbWPBT+oOTunMM+Z05I=
X-Gm-Gg: AYBFou035Zt46bBNuln9WwFEL5Ud+FIHxVGB6Ut4foCCOQ9QNF8kaDYZOSrRrUTsehO
	T70f5QQSoerNy8Gvn9krNR1rg0Ahg5GGKxBhtuL3vWn6oeZaeIHa87oXIoG2+JFGVYr7uKn5NwV
	y7XFzedgG/Or6BQrtj8w9/Y8XZzQcnUdzYCM+I8KGDwV+FcUpU8zNn+qGMmwX5cjL0Nkl68egwY
	PPMiWs24uXJ7m5kjnfxoTAh0BHLrD0QeMNcPS4+IZGTSQN/qdaSUKbXGtjAysoGL1Dj9ILT9WAH
	xBkOFiESyLOM+MnqTcQHipNdCdB+uJ8Rj2p4GVc5WIe7Mni8ALb9dVQkHCTRnxRNkz2oBJQBqSe
	UJQ1GvDMr7cA3BmltHpNBKdBuglx58xpHcXvNZ+9T+l17H+Xmt3H66GKfTIOpqIWThlfjufw1cd
	Yd42qyggneTZJqy6BurkAyy1lpnjf6PY0o5wClQOXa
X-Received: by 2002:a17:902:ccc8:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd8cc84dc7mr158205405ad.0.1789664920042;
        Thu, 17 Sep 2026 10:08:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2dd89e96f5fsm2661675ad.13.2026.09.17.10.08.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:08:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106fce784dso19708686d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664918; x=1790269718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZebXv4BWY0XMsVIBwkftKe1sIwcAMtAxU1OIXCMMQ=;
        b=UFCAw2wvuMEJ+Rx6vI/b80AhAxkly4GnrmzSXewRRp4yQ4ShDkO6cmlLZQ+W+kAyv+
         8Ha8Z9uPCfLTYE8/bZ6pHLittNetqkOGzmK8ZETD72LZzFa36DBA42TXmx0qGyXPqYtJ
         EUmTWmZsWfg0tUp7nZsldjBmWZYWPZ82+o1pg=
X-Forwarded-Encrypted: i=1; AKwUvBwQu772xma7x3O3UQELw16MSrXGIFvgMHxOJ6rTo6wUtV2ws7kr8YKiin6t6yQT1GjvYuvCk75kpaXQO6AOotty@lists.infradead.org
X-Received: by 2002:a05:6214:2261:b0:912:517b:856 with SMTP id 6a1803df08f44-912517b0b5dmr22214186d6.58.1789664918506;
        Thu, 17 Sep 2026 10:08:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2261:b0:912:517b:856 with SMTP id 6a1803df08f44-912517b0b5dmr22213186d6.58.1789664917844;
        Thu, 17 Sep 2026 10:08:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cb0b52sm2227776d6.28.2026.09.17.10.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:08:36 -0700 (PDT)
Message-ID: <b8c0c201-ae33-4a0f-a145-0c20836f38a0@broadcom.com>
Date: Thu, 17 Sep 2026 10:08:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR
 window array
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
 <20260911233541.1650895-13-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-13-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100840_925434_82B6CC5C 
X-CRM114-Status: UNSURE (   8.85  )
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
> The register names for the inbound BAR registers use order-1 indexing,
> e.g. the first is BAR1.  The code followed this nomenclature by not using
> the 0th element of the inbound array.
> 
> Undo this approach and use order-0 indexing.  Also use a struct pointer
> variable in two functions instead of array indexing.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

