Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97394C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rCSqMUFH3Lxxpziks2c8kLHTQuu4M+hXz5ckQbu5Xs=; b=VvI0Y9SvWqd30DriRYi2k+Gk0H
	CNmaxR6zOM/TWyq+aH12JScEzBBrAAD/hWcVax/CmxIV1NRb1mq9Fi74/WKxiI+zK6QPeo7g4lQrP
	xSyGNSB2rKJ5NJBwHKtDQoKGQBDojEc2kUJs0oN0Qkqmxjbh5SIYHq0rdj33vWHnC10Xc9TFr0Eov
	WY3tq8AExn4uU90+aCB7zmFDMjcc3Xziat1nL4lF2NLARab3Arl88e4S9mFqSECcKJqcJwSuy7xXq
	4d1TEYob8bj3+YVspMMcBQJPnEG6cblr5nwz9/f/wFVyFQ/SKSR6yDu0nmd00vA8Hpf7YNOZPzjGt
	18c6WnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FU9-0000000C1Zw-16hG;
	Thu, 17 Sep 2026 17:01:21 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FU6-0000000C1Z4-11nj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:01:19 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2db18e5cb56so4603205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664477; x=1790269277;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8rCSqMUFH3Lxxpziks2c8kLHTQuu4M+hXz5ckQbu5Xs=;
        b=jFRIE+FC6HdRmoBZBz1JKaid3YogAzTOS+uMYOipLjb3xlRd8rAtjEO1UV9WNhUJYI
         0QDTSvqvAcdhU9zuzU+ap719uSFWnX7LArpCKK+z6u+kX+7aNFWA3vGYNTam6FKbAUSN
         Lc9PpBfvXB0HcI1VbYAxwYW0ef3am7X6ll5qZJfZGic88Chwks/VOrqzh3VReDf887Zw
         41szJQxWVzRNjiV7SzsCbADgi2xvigzMTA7upcZvnFuylZbTrHSH75HL+ppUKUhPQLfz
         70SXYo6Pn1Rax9ITcD3S+duf2nHJGPJpAQoHlheSzjOFYn676XxCvYqEtiTQXpzf2BXg
         yUBg==
X-Forwarded-Encrypted: i=1; AKwUvByW/f4OCv17u2xrAkuRgVs+iM6a+He/L2srG+nPF+v7UiR0voRLw7fHbZIFT+gHr3HJEECHsuDIUhMIRNtAvPoS@lists.infradead.org
X-Gm-Message-State: AFuF++l4QO8JjsZPxPRwRl9wbwbGl0/hZUEDBcWFAqY9ufhn6grc6TJF
	0kphALgrdQ73KJKfbsRYVUjBn7NeCnWEyf877M7/vfq8a1YTMZAxbO30ZraoCWsYlyRaYtT1hSz
	d4BeqO1idlRDt9FP27X1ws9D+S0+B2Nn9NjHiDIDgkipzaOiKisK47WtyzMoUJKKFVlhWn2oa5G
	L3EKnFBTPrhFLjYbw9mOZ/UkgRLk4ep+eujx0taAKdssp8B1cmenpg8nVgGEdsgJ6mMNJqXoPD1
	zzZOVqRoHHq/bBH6QTogPtu5JeyqXp5EzY=
X-Gm-Gg: AYBFou1VqWYmppxXwzS98T7FMPstjYJ8+gaOJe0x66YGyjd/uiYN9IeD5dyfmaRPkPx
	/BKKElFnc5AYO4E/njMa6VEEXS7RvoJvwkkQ1aP0ewaBgrrEsqoKZbvaJhoGNRL70Q2WbXH+Eqc
	TSVvaJGv7naAFEOjxNUCYhJzAkj8nf9Ev3Ax3T9Og2tG41rLtWbOf39GI3bAyG+UHBkHzIcaddZ
	aLYiX4n4VTxOJzn6EEVbQR23QJy5+1ftoH9ID+LEPx2OzjxZp9wD+SoMe+B8j07v3G/Vm4DtLFV
	M5DCfaliI7B9rZLhTq6hGyLHfEGLi5bQfFFcJ/Hpb5LrV34JyuHKU9aboF6mTDm/l/2JmXhE4Ze
	iVWcb01PMlJimObMF74EqDDXewlHiwnSDzRlaJefNRP4bh2aWj9zHTIFkNO0tE+g/ue4ZBwij+J
	fku4baHBMA/6O/uc1rffB1HLjEBmj25ckW4cJjLW2/1BI=
X-Received: by 2002:a17:90b:3e85:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e1e55f7ffmr16021861a91.24.1789664476819;
        Thu, 17 Sep 2026 10:01:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e45d9d41bsm746634a91.8.2026.09.17.10.01.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:01:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so20909571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664475; x=1790269275; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rCSqMUFH3Lxxpziks2c8kLHTQuu4M+hXz5ckQbu5Xs=;
        b=Xa4oqLSHRrq8G4ihlBJje17dNDP/Jg9ekzeTEQuv6Urx1gx/cC//7vCLMWIvqovdTN
         TBlhYaa7RtbsCRBwQqDOrTmeqolqys0pz05GemyY3f1n8wNuFfz9NuPlbqii1lpsjVy+
         OKUP0zvzgeCHofLY977cwc9pRxsOtMBi0rR5U=
X-Forwarded-Encrypted: i=1; AKwUvByU/sIKvZbfuYz5SLpd0S2BZa6rQGmzzbdrIs/JXSI3JJ9zOQHSZ44UMbjRyn1ochM/OJ/dJAdfufIZEwwlv7cA@lists.infradead.org
X-Received: by 2002:a05:622a:1214:b0:530:42e5:f3a3 with SMTP id d75a77b69052e-5327f16318cmr121319811cf.44.1789664475133;
        Thu, 17 Sep 2026 10:01:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1214:b0:530:42e5:f3a3 with SMTP id d75a77b69052e-5327f16318cmr121319081cf.44.1789664474364;
        Thu, 17 Sep 2026 10:01:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53291651dabsm20372241cf.10.2026.09.17.10.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:01:13 -0700 (PDT)
Message-ID: <85444883-ab1a-49a1-a356-27dd9f6b77cb@broadcom.com>
Date: Thu, 17 Sep 2026 10:01:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] PCI: brcmstb: Declare and assign quirk
 NO_RGR1_TIMER
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
 <20260911233541.1650895-9-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-9-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100118_316761_0E254503 
X-CRM114-Status: UNSURE (   6.66  )
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
> Very few SoCs do not have an internal bus timer whose timeout value may be
> adusted for L1SS operation.  Declare this as a quirk and assign it
> accordingly.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

