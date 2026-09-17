Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5881C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vgy7pM/Q+yzgmJx8Y4gFH5AEXLaNEKRG3IPtSFZXZg=; b=KPnVKGCNVmUZzCjyLxswPkPDoT
	9nTxL1qWTjucz3V59moc1A2FhVMM8rL3JAYYKbhsPixXuYa0Q38vsYTX4z8VzbBCY1zTHf/JA672G
	4+KZ/Wlg67BR3VF3X9orQOzWjdYtYKXXxnl/3p4EzCTFz/mUttLMCAyC/cjGWpV9QWu9VGki5X0M/
	WfoCHqfKvhTl8QN85MuHDDrLF7pm+w9y9l62fCbS/89ACXKa5L8/I88iBEbLgbmIby2nxdqsnf4Qm
	6Mc/4tVtFrYTyLV3uhpPdKOopMV9NB8KClPxTzaxFTy4YFdcCUOFOg9CeXE7pkwdu0XvNwXq5cyIU
	rigeCxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Edb-0000000BohQ-1FXa;
	Thu, 17 Sep 2026 16:07:03 +0000
Received: from mail-ot1-x364.google.com ([2607:f8b0:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EdY-0000000Boft-1QS4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:07:01 +0000
Received: by mail-ot1-x364.google.com with SMTP id 46e09a7af769-7f48c750afcso296770a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661219; x=1790266019;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5vgy7pM/Q+yzgmJx8Y4gFH5AEXLaNEKRG3IPtSFZXZg=;
        b=BnUQHc8UrhebJYoCMPcW+1PaoAJzG8vIsBokgiVbCzirBkh4Ns9997f4otwbBdpMPq
         kBJBczw03sOOsaq6CcBAj7KLPQOwRYkP9kNd8NYtnmiv7FKXYg3jzqb7DLotASbojwgG
         tFDtO0aOrd3JHuTKMGQWmUjy7V9te1DvrDTU3qMt+vyYBePJyCRbf/NqDlUzF22sHHTI
         hawP5DunTlqMx4afiRGxIj62n3PJghoE4cPBlSHOXK7f7urWUuAC0FY8gdNIHDfskNTo
         +y7dnTV7cQA9hv0djOLFMQkHHgB2gsuCt8KAAcT0uX/6SkOzsrOieLIzfdCn5cLBEsBx
         lcTg==
X-Forwarded-Encrypted: i=1; AKwUvBw8kpfLS7eJVd28AHZbouGJCITmYI0McABijCbTFfKziIZxGRBZiz1B5mU3+ay6dlbncFCsETxePTFInPtD5ZZr@lists.infradead.org
X-Gm-Message-State: AFuF++kEU0NUWmA1M9UQxR5g3mBPCTYWZbM1jfEw0X7CwVhB857Lt36X
	zKIH1NXlCmzcjl0PrpfwNGpq+6uyKJWtpGEMymjpwWt2AjnTCQj8KCShdwlyWDhXByFithBuPNr
	9orOduCU3wbqg1hzqJof4N2rMnXGGC5HLmj/VtsI+Yo9FoWj+dNt+q0SXtExzRX8u0IPUGST1po
	/ClMmd46ab3b6lZKLkJhIUQT2YF34NaS4khM/UZGOP6u+Xau/qbElsRw/usnztob1w9b2a+Z6Ky
	N1nb4xeisVbiThYPJTSaWq6GzaP6fh1V9o=
X-Gm-Gg: AYBFou1jnBue7FWHgyr3qgaiKpI2g4mVsX2Pa0R3AoCEwvojQiwahg4BJSsOWRYljUp
	kVOZaVy1MOe0j8+tEwwQYrzs/6l7eN8XUsHZwyAKUg/dVL8lcjZVCccV9COYPvTnnynYBZ8NlP4
	JCsJ0OHzS3N3FnGYvlJNkkxz7XKFlidhfU8dgZYTwr/oY/oKfV4MQBwo3Mj3Uu1RrfJ40HZauB1
	2jG57QtbYA3fMLeEw0WhixnXFRtHXUFtufV6g02UYQkpjTyAla3HN/EBXB8y5dIMf8fc+puXL3p
	ppzNoi53FZoQ6RkQr9hG0ADbZTx+Sh/P1/DO462ygbWpsbrxkDazSuGzSnUGG0DtqFY/j1IprGk
	FPFA4mKVAaVub6NvIv0DXlYjtsx0C9+4TcL3lLDhKELnSA8xNo540UOn2zA4ewItfW+r+a5vA24
	WYSL6b3KtO3Wi58lanT/HevbvV5S2Ean4LV1aD6K3Y
X-Received: by 2002:a05:6830:4c05:b0:7fa:ac4f:7a2 with SMTP id 46e09a7af769-80b2fae21b0mr7337010a34.30.1789661219179;
        Thu, 17 Sep 2026 09:06:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c468a2ea8sm1714218a34.5.2026.09.17.09.06.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:06:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd8920c132so22493065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789661217; x=1790266017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vgy7pM/Q+yzgmJx8Y4gFH5AEXLaNEKRG3IPtSFZXZg=;
        b=akO+xK/lGoeCDJ4mMb4rAEcxGJpHAR7OU4q1xuqLkdG/7HDqUGIQ9iLFNPevt6br8L
         TRjhZYKZYSLewF0N8yikrdQx+n3mlGblhWA80wRuZ2d7WiYW2YEyReIcLMiYXAE5OsAs
         AxeBw6OV+/5mQuOP4NvC70WPzQdCG5aLMmXyA=
X-Forwarded-Encrypted: i=1; AKwUvBx0eqp/ziYNCMerwCB2EyprSoO4ZdvXVVX0V9beC0O/b4tHkQFmjWt1Spb4GbhhckBiqC2u6+o8Xk/ofU9iMUOA@lists.infradead.org
X-Received: by 2002:a17:902:d2c8:b0:2dd:278c:5eb with SMTP id d9443c01a7336-2dd8e3f5a13mr153455085ad.14.1789661216889;
        Thu, 17 Sep 2026 09:06:56 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2dd:278c:5eb with SMTP id d9443c01a7336-2dd8e3f5a13mr153454615ad.14.1789661216485;
        Thu, 17 Sep 2026 09:06:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8ed77sm28778555ad.4.2026.09.17.09.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:06:55 -0700 (PDT)
Message-ID: <d0611a8b-e7a5-4ffb-aa7a-86b14196b6d7@broadcom.com>
Date: Thu, 17 Sep 2026 09:06:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] PCI: brcmstb: Declare and assign quirk
 32BIT_PCI_OPS
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
 <20260911233541.1650895-8-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-8-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_090700_381604_81293102 
X-CRM114-Status: UNSURE (   6.37  )
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
> Declare a new quirk that indicates SoCs where the config-space accesses are
> restricted to 32bit R/W.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

