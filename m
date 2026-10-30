Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E993606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEOP8nIW;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QHR6kgUV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DFrEXZTm+iWrPConGaRa1dN06L+AXpLuI1/eZZLz7wQ=; b=yEOP8nIW+oSo3R
	+MR5PGup7CBtLfJU8vM1UK64Q9BjPkuEDIPruqUiSg9eN0v6tPuKDAi4+R3Qnt+X27VoRoDEJvl8i
	xEOY/EuQjLnUtUBRfdb3GA7e2zHwcIIfApsP0mskvwaWpXJLATxCUXSJhE6Bv/DY7Em8FPPZYjC9K
	9m3z+gLfF/Mb3Kv2SBGFGBkAPYicjeC2YqrGRwvOBqvSTkIKftnBB2aUMyX9sA62EOxFRXlgJU3fe
	S3VgTzzLX23rFuef2Tel3Lh3jXJlofxz3ZWwisPKRG7IskJj0658I7GkApj4x4TBzYRrzg39ouES4
	dMTTopvwbirvDaZXOohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMs47-0000000CTP3-2AMr;
	Fri, 30 Oct 2026 19:15:03 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMs44-0000000CTNj-0HGa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 19:15:02 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso455786a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 12:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387699; x=1793992499;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DFrEXZTm+iWrPConGaRa1dN06L+AXpLuI1/eZZLz7wQ=;
        b=Ht+qr4smaBUEhoa97zqhfgpNExLiG/pq+2SJNo60yD9XT0iXpwZq+zSctWQ2+FEg5E
         Y7SfyJKuDxpsG1lTUn3yIFHN5t/lWwm6yyjGIKNLmnxoIhIgF4BLHBAUfZmCSqQo6JcI
         +1DQcaMdNyk04oXmwuQ/kV+K/RiQcNrDBv2i39Xt3yHSNIJ11FKinash509hfL/Oan9m
         RBp2HB9LxAuJ4vZt8vIRw/LUDRtRw0FdUr/9m5rCRDvaMpESn5WZefkiNIyZZDfvkKCd
         Me+W7Ega7bqMSONb0HM/q9qfZTlviJWgt3PZ9NnlbcV73FFPU2Hq2VlKKLhtpUqFSX9P
         OPDg==
X-Gm-Message-State: AFq9FYIVVzpr5+Nii5H0rcE7MAAyRthQZk7YVD31Vl6lAXryM2zNj8wB
	AiBPEjKdXJjkZgUXnfP7RELRmTqA57RkHg6OUW9rPwEMJNI9PraGR0dEbRAG3IWoiAC5vftQ9Yu
	/boOBsuXt9Deu8KbrqassaLoD1QFVEQnFdAgqTSN97eWSYACDu5KCiQf3BGSmkyPNlX1ik0toMM
	qn2R6eyRmZYccMVN6K5mDGXlY9M9GF+xCkLpbH7DcskJNcyxEEgrfLb2nxDoGLueMbq4cVn/dLI
	1Tcl8mWgvjql/mBq7aGZ0NDh3oKTQj4EQDHZg==
X-Gm-Gg: AYBFou3ZlfdDgdHBG69mI8h5bwWDzPgqWDTaEcszEOEEJYkVBxsWIAiAgkph8CkhPRw
	O1QEgb8KWGwheSZX0LGh39MLmKdNs/Ha8iULgZjP2Xo5Pi3zUM6h3OOuFfTY+GQmOuzZUVChaLh
	vOfapPw+VHWm5mRkRhl/rVhKKWIAeQwMEdib7H/aFUoNqvDzUsNkUWvCUHqy/t0LlR4PdZbkaN9
	v0ygNkU0CQdUpjKgJrncoe268xQQ2MpatPGRCmpBHw172QjLprsAgC+Jh+r9T7HDZ8tK7/5AMVC
	yiiO3ZEOyBcZVsaCstmKb8stTZJ2H7fZFe7yaQybT/WsYcYM574IIDjO2wR+isee5RrJ09KKXoq
	/RkSV0ATdwX/w+95ZDy8qQrYTret/0yWrbpuCUmnoBojx3bAG8c7Q5yHBaMVeB0JmiKvcFpXCAa
	H5UbTI5LKbAC8WOXBqdIg9klYSuwGlkQvMk6QFIBbk
X-Received: by 2002:a17:90b:54cd:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3ae897a87admr2812952a91.53.1793387698580;
        Fri, 30 Oct 2026 12:14:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e8b50f9sm4832693a91.8.2026.10.30.12.14.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:14:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b92acedd9so31071676d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793387696; x=1793992496; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFrEXZTm+iWrPConGaRa1dN06L+AXpLuI1/eZZLz7wQ=;
        b=QHR6kgUVjYqRTA1ovZZt2rx2KxV+8jbkxNULm+y+ZjKypyhppbDvWThc71neKbr7w5
         hp5PxTCRZ8sJj7/2In3tkhVN/qvmbPKFDvv2rx5dVClDB9zzLYyJgN1NLucAH7SCury+
         Zx/P0c/C8sI8j6cyf/lKhoXD9XLl6JTZe7Gs0=
X-Received: by 2002:ad4:5c61:0:b0:91b:5d39:e13b with SMTP id 6a1803df08f44-91ca4bda1d7mr54317426d6.48.1793387696570;
        Fri, 30 Oct 2026 12:14:56 -0700 (PDT)
X-Received: by 2002:ad4:5c61:0:b0:91b:5d39:e13b with SMTP id 6a1803df08f44-91ca4bda1d7mr54316986d6.48.1793387696200;
        Fri, 30 Oct 2026 12:14:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f3db1asm23125436d6.16.2026.10.30.12.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:14:55 -0700 (PDT)
Message-ID: <e25714a5-98b3-4a0e-ad9a-a644b5485749@broadcom.com>
Date: Fri, 30 Oct 2026 12:14:52 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
 <20261030182151.GA1206797-robh@kernel.org>
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
In-Reply-To: <20261030182151.GA1206797-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_121500_104523_F984A664 
X-CRM114-Status: GOOD (  13.36  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 11:21, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
>> Northstar Plus uses the Northstar Bx PHY register sequence but also
>> requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
>> clock enable.
>>
>> Add an NSP compatible with a required USB2 DMP phandle. Describe the
>> shared PHY relationship with EHCI, OHCI and xHCI so initialization
>> finishes before any host starts operating.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
>> index 7fd419db45d0..00d69b86cbff 100644
>> --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
>> @@ -14,6 +14,9 @@ description: |
>>     Known B1: BCM4707 rev 6
>>     Known C0: BCM47094 rev 0
>>   
>> +  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
>> +  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
>> +
>>   maintainers:
>>     - Rafał Miłecki <rafal@milecki.pl>
>>   
>> @@ -22,6 +25,7 @@ properties:
>>       enum:
>>         - brcm,ns-ax-usb3-phy
>>         - brcm,ns-bx-usb3-phy
>> +      - brcm,nsp-usb3-phy
>>   
>>     reg:
>>       description: address of MDIO bus device
>> @@ -32,6 +36,13 @@ properties:
>>       description:
>>         Phandle to the DMP (Device Management Plugin) syscon
>>   
>> +  usb2-dmp-syscon:
> 
> brcm,usb2-dmp

That would be inconsistent with the usb3-dmp-syscon property that is 
pre-existing, hence the name chosen here.
-- 
Florian

