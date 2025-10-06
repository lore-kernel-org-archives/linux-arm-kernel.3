Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A70CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g33QJENoKMBd4tbu8sSihTDRSw0h67rGYA9n8lHSYDU=; b=2y+FwYxsuPBHXm8hrT7+KUjhzU
	vagCrNBhb0TQvi1hcd8Kfy2yUGSTFxq5R3AJ9vgQsLEfnarA3CZJlMISBZO7G27BW3UBSQHGtHON0
	qwz7LQdh4LJrkBISssaKfXamvfLkJ/s00J/BOuWkMs7Qn4sGIwftaoF0a38DuWLxRG/543b2EVK6f
	HcHZuiGWYL3XkF0iLQzyuuGPDF6h+IK+K6FEldzkCKzbqSeLDayVoJAFumLdqYDwbPEez1UY053eJ
	XDlLlPqDK9/ja8UA73ItnU3ng/Eki/yequWGXrDIcAyK5hAj7Z0GiHjZg9rGlou5YE2U1MZcUH8Uo
	6Ejtd85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qzb-00000000gAg-0sVW;
	Mon, 06 Oct 2025 19:35:31 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qzX-00000000gA1-3swX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 19:35:29 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-71d6051afbfso58750417b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 12:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759779326; x=1760384126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g33QJENoKMBd4tbu8sSihTDRSw0h67rGYA9n8lHSYDU=;
        b=hdRGB3P+Fq45Maf72YdgVvvqwfL/yDZ3K1vM0w3ZFGlKBVMpjiU3s22fnpG/okshgk
         qH5hrSP1i1BJerHEIAQKEw2YRM9gwC5woPYXxyuDjbtS+f8c1Wzgv6YMaMK8h39DYAPn
         UViO/oEmVKmaJ/PUCWenaq7dd8bVIxrgGTn+Mh9/QrNgyvO8oCScPMrUoQibIcBYaLJS
         Fdj2wtfruq/AdiwH81RPM2lUYtsojJwuSQ6FAcERJSSAJlvn9iZijdBk3/5N1wipmKHk
         RZ4+LCMC3fyyV/exAjmPZ7eEkiaNY0TEYoY5lMwk6NlZqSbT5yr4K83vnHp/iUDIM7Y8
         Jq0w==
X-Forwarded-Encrypted: i=1; AJvYcCXKVgrT+niumniDjUG/DaElDXDwrdxY1ri/y3lhSz3EhrfxTbUakfGhMCRmVa1dzSBbkSoHoUx/Tg9hcyOEDkbU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4kj7CJtD41DjzLFGLIYgq4zAhN7QOvtV8LOp6o1E72wSfwa46
	5gsrm0S2w8wgVaGWeV2ROE8cKr09y8GEm0OcYrv8a8UBJXDZseFrOfEEoMVBaPWWtySIWW7zXIE
	ZHzcuiY9HL1hwyVEuMd5VXwUqJki3KRJZxQ2qNFdQfKse2HkrSUs9oyF7ivgksSoGHcRn3Zqw74
	A9VeR3YuiYynRW1rRb02ZjQQcI4gUsOhSXxPdRoejjgtcu4CoAZKZJQpaXMULG07bUjSv7AucS8
	8/X0kRCEULzu6qMqjKNriPPmLzZ7ZZ5lIg=
X-Gm-Gg: ASbGncsXovRlOOw4yVv1snhLG7L2JWfEpmcrzkOkZoWnYYT6+WDRL3FdwkbS30oVw8c
	aJqlY40zEAyeTWHr1kL1d6HiZ4T8g6WBKBYu93v5DTTv5ToidGwSOXPSJNVa9DNQ0ufs57kzINC
	tlHDmG37avj44wK9q+9XelYtBIpHGZnT3PGTtGqs3f4g/i1P995r/DmjsXIW1NexpHGTqZvohu9
	Ic9ze+Akm6Jigd5CYJDiD8SGKukyJmNtf8FjVRVC/Ox0HCgrAc+knZsZWL753UtL2nSLLcN4gf7
	27VzYtLup+KRwPC1ot0ysTo4Dgj8ny9oxefta+aNwkF6fWb43ldFf1J1K0hyeJNiz87z0NumoDm
	5e3IEs1U329y3dbRpFLp6E1mjFkpfM5OeSw==
X-Google-Smtp-Source: AGHT+IGbYG0jPXfPM1u6kQvf2VQ7cdcH2emURk74Tz5L8PMthdxdMkasxhCB8rWYK2CI85dlN6l3jP/9rLmt
X-Received: by 2002:a05:690c:6f02:b0:76d:ede6:d695 with SMTP id 00721157ae682-77f942b92d5mr164974247b3.17.1759779326293;
        Mon, 06 Oct 2025 12:35:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-77f81d026c9sm7981397b3.21.2025.10.06.12.35.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Oct 2025 12:35:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so952229a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759779325; x=1760384125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g33QJENoKMBd4tbu8sSihTDRSw0h67rGYA9n8lHSYDU=;
        b=baENvr0krJk1vXIFbtGJp4LN/+yVkLZxE9mL7W1js4m2dSUnlqsS8jp67k2gr5OBuY
         7jYzcRGYdABD6IDMw6aE4E2uW1Ggwx8NwWgPSO84nkyDUVI3WWKjI02TTR1nxDhRh8wR
         7u9RmRH5yaaHoGPuK5gfXEfjpjJLPGEWmvBus=
X-Forwarded-Encrypted: i=1; AJvYcCUSYN8L2JRGQJ/VImequ1nHksd+8qjoK1E6ia7AFdcvJzdFDxtsL/wbrwTLwfs+0nkfY6lDW40j2wP77WMD1Mt3@lists.infradead.org
X-Received: by 2002:a17:902:f78d:b0:28e:a70f:e882 with SMTP id d9443c01a7336-28ea70feae1mr113856375ad.11.1759779325011;
        Mon, 06 Oct 2025 12:35:25 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:28e:a70f:e882 with SMTP id d9443c01a7336-28ea70feae1mr113856075ad.11.1759779324589;
        Mon, 06 Oct 2025 12:35:24 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f19ddsm141472345ad.127.2025.10.06.12.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 12:35:22 -0700 (PDT)
Message-ID: <23cc004b-f3e9-4685-880d-362619c180e6@broadcom.com>
Date: Mon, 6 Oct 2025 12:35:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Fix use of incorrect constant
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
References: <20251003170436.1446030-1-james.quinlan@broadcom.com>
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
In-Reply-To: <20251003170436.1446030-1-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_123528_035672_CFDCF01A 
X-CRM114-Status: GOOD (  12.53  )
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



On 10/3/2025 10:04 AM, Jim Quinlan wrote:
> The driver was using the PCIE_LINK_STATE_L1 constant as a field mask for
> setting the private PCI_EXP_LNKCAP register, but this constant is
> Linux-created and has nothing to do with the PCIe spec.  Serendipitously,
> the value of this constant was correct for its usage until after 6.1, when
> its value changed from BIT(1) to BIT(2);
> 
> In addition, the driver was assuming that the HW is ASPM L1 capable when it
> should not be telling the HW what it is capable of.
> 
> Fixes: caab002d5069 ("PCI: brcmstb: Disable L0s component of ASPM if requested")
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


