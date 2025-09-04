Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15004CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByPLAhnppoP8CNiz/fVGR4JNCX8K97yEjrDCLtVL03I=; b=rXMaNrVXS30QQ3lnO4WrfVtWZ5
	uTflYA6iVN3H1xmNDT6oruPtwhh17Y59dwn679ObnH7pqXzkiCIOTDlmt35YBsb8yp54bqQIjmmL1
	KCK1io6aoQdmkASW8sCcRiL9S32kZ3oUfAAObL+YGRQTj90geaOVc9hsRhRVqXE9GUzAz4nnLe58n
	me2nQaPbq+716xiFS/CSPyMS84vHtrRxHRlXssokW40xIu9fSOxWb77SxJihclTMZtl628EZDDoq4
	lemyDtZH7A7ey81XCc6WuqVANsqZxzcgfcfWZfREq3ZPVB7vL6PChbVsdG64uPfmSZCM4uTKSp2xz
	IgSBgSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3m-0000000G2hG-0rhc;
	Fri, 05 Sep 2025 02:20:18 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHBH-0000000ETEK-2jtj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:07:45 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-7240eb21ccaso19353006d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757020062; x=1757624862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByPLAhnppoP8CNiz/fVGR4JNCX8K97yEjrDCLtVL03I=;
        b=rXLHQ5qp4Z8eXvrhoFLOWMO4kmvI3DDfoRuBfOd5JL8DPTTM9kZl3wa0myTQyi47HP
         uG4ktsps72CxNrunyZMe2S5dmfuizW+h6EZMqv65II8VPXFfNXbvVxEnnwsnbUYLef0b
         wmzRdFCCIrC/xT1lctcWRv9WByfxcAtDOBV14OTxIS/hnkYWNFZBknDpVOM1dW1jQ7mD
         5NUkPl7LIrzcIWbLCKdpeOtSTkDbXxrEs6CdHeTxDAV3OXz+/gcuqvcI/LockfU5FXfH
         MQK/XQIwZv4tJTY8QdW3eSGfyIwdpSTUC5aZmmlrkdOid+qzrHIX0OUAXDMeoeUzLjvG
         cJxg==
X-Forwarded-Encrypted: i=1; AJvYcCVXvualy59qfFbOHUJhLb4xuGtrVRnYbogMjmCgv+fzmDnBE6AzSF+u1ROrymXH75+aVCp8MZ8IufxD/2WGvm5Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxQmNFKSe/TAZtBAr4RVEyVk0/EuNBjW9BNY4mgSaqgFfwn23dQ
	MTnjjGUQy0BtrS9G39xgS2/j0iiIlqlx6An4yc7C/0O9OEf+ZXCDHcSwe9AIWHR62JJAdoS4Ulc
	gI3dkQuw0bDrqun/yv0YpVbPTGUjUnCqqdzeVjMiW/P+vdCb3MrTbxMCTIOmsBVyZyNi7CqYjHW
	3zd+G0H57i9A20kmSXRca/tv4MMpSPhRk/2ktw9VbyOtpMx59xW+MolAqTbHpPYf4QneXlX6dlb
	9Cm8cmg9L8ashzKWdXr+JcRTI2KA70ldD8=
X-Gm-Gg: ASbGncvp7ME8AlagksxHslUic3DRUmuQZILxpmpYtIQHfhfvsltA4W6swzcfkxOz8kE
	9sdYq5HL4RfRtC/x5+6/8LQyYXZNU5+Hqa95AELSJSPLVkuYQ/Sa4/9aVdh+kR25qi2H48JSlA5
	PxtechRXFtmFcJqie7ao8EIRVGY1pMYAdO+L85SyTxi2yIu24g4KT6aW7c3l0OdJvrtwqSMYb8T
	go5QD//uj4CZz1LJonvCCdkXU5bs62T89MHrhW/dknoAsi5Jcq6Q6SA5t6yGs0zMB1TFDBRSDqu
	GG4ZU7YF8SzZAB/XyssnwCQPJZGaXuAGiGGPeg2Djh8K0Ny34Fx3ry2e+Rlzqb45wr9Mcvvu7sm
	oUKMpqQNFSe1i8numQHq0XkGgyFhl
X-Google-Smtp-Source: AGHT+IE7vZJrUY8Zck0O4FNeee3iy3q5mOmdDks9xBqLpcdWHc6c8EzErONKMA9y2ZfsPAHj8sLvPbIasVD+
X-Received: by 2002:ad4:5be4:0:b0:70d:dbb8:2a08 with SMTP id 6a1803df08f44-72bbdceb182mr14247826d6.3.1757020062457;
        Thu, 04 Sep 2025 14:07:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-720b59b1967sm5326856d6.39.2025.09.04.14.07.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:07:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7224cb09e84so24154666d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757020062; x=1757624862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ByPLAhnppoP8CNiz/fVGR4JNCX8K97yEjrDCLtVL03I=;
        b=b3+VKxMuptX6ikLBLUIj7Fem/fYafe74HudjdlFDfRL2ocmcRJ+dwsj0h7dYN/sjl+
         JcfCsG6f79SvAYQJZWSrWEHaFeIpXOXIbXy60W15dKO/xIpaDMQpjsjk1LVmPJUoLPaP
         4jusY5/2sBbqwPbzq5jOcuFJFloWGGf5nBv/I=
X-Forwarded-Encrypted: i=1; AJvYcCVGoD6TyLgAB/36bRTzM2CQoTTAuHO3kZ9mz+8I1fz27D1OnfNdNJBAsn2/SEPzPIofLuKX7HH7Qn0G6OiIaJcG@lists.infradead.org
X-Received: by 2002:ad4:5cee:0:b0:72a:54bf:1f04 with SMTP id 6a1803df08f44-72bbdfc8ff7mr15622006d6.7.1757020061615;
        Thu, 04 Sep 2025 14:07:41 -0700 (PDT)
X-Received: by 2002:ad4:5cee:0:b0:72a:54bf:1f04 with SMTP id 6a1803df08f44-72bbdfc8ff7mr15621476d6.7.1757020060999;
        Thu, 04 Sep 2025 14:07:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7220f78b9bfsm43245116d6.64.2025.09.04.14.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:07:40 -0700 (PDT)
Message-ID: <06017779-f03b-4006-8902-f0eb66a1b1a1@broadcom.com>
Date: Thu, 4 Sep 2025 14:07:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
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
In-Reply-To: <20250822093440.53941-1-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140743_695565_C14C91C1 
X-CRM114-Status: GOOD (  11.58  )
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

On 8/22/25 02:34, Stanimir Varbanov wrote:
> Hello,
> 
> Changes in v2:
>   - In 1/5 updates according to review comments (Nicolas)
>   - In 1/5 added Fixes tag (Nicolas)
>   - Added Reviewed-by and Acked-by tags.
> 
> v1 can found at [1].
> 
> Comments are welcome!

netdev maintainers, I took patches 4 and 5 through the Broadcom ARM SoC 
tree, please take patches 1 through 3 inclusive, or let me know if I 
should take patch 2 as well.

Thanks!

-- 
Florian

