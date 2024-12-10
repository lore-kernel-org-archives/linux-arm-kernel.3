Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B788E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=; b=Jy7nx/4+/FsoUr8FCMGbtUwm/P
	vtJ0kRW1+ea6eUPRoldnNM/DcHNNu68ChFPs/n/00i1SoW2zJzcxt/v+UPWKdfrB3xAHls8Zw3fBv
	HBMwV/JG0e7DJ5NVq6qc0YqfbawLpebWs/Ier7dxqEfU2diTujtbS477gu2VDxQbFEu7GrXuCPBmU
	H0YTJpWG5WJv7feVamzXke7eOdSh9fdNAEL01WU9IPh/SCNVWauPvsjkbUkTY9tLoi+MWONae39jv
	nR234BMZceQgh5Gur5v8JqV3DbiQljXPszAP4RGkq4gisa22G4g2NfSU8tH6efHcHcX9y9Zq8hkHo
	9GSwCwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL486-0000000CIBB-08RV;
	Tue, 10 Dec 2024 17:34:38 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL44B-0000000CHCH-35xV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:30:37 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d933736380so1225336d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851834; x=1734456634; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=MDOPcnCgdJNcAL8yD9Z8NnmYJvHIW/5bQyr2ZU1XXOwvv90Oa4DAlox4vD9E+7djzp
         NfTQxWLdjWyqUsM/ViXLIpxaFY7zS+NEr9KCFhxs3K96nPsrRR0VKxO4ngEpKhYAnHHf
         8oPHT+M0XyDRcMzStPPw2D/i6mZONfuiJbqLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851834; x=1734456634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=FxUaRhEwPVDTqJ5lKV1/fsU06QmJ9m8z8ZULupT8q+Duj2I6ITz9w38VnYU/81MpFX
         HA7nV6cj04dkZoQ/cVizPZNkrwMNSWFp9esbihu+dGfdxNBo94sKhWreByIFg0h3S1g4
         9aQh0XfggU+SCWPEnbNQs1KthWak0PmJOwiceOWfIINQ4UN0eHPltWgwImlXQ2lZs5xy
         L/hOoQvAUSO8bhbcZSpOd6sMjBRvbYuuwS1DT2PTdi1yEFpZQW326juoOTDrT0BLVyOC
         0rYL02J9Kgrycv7rzCdAmknTY08wFMevyWVDwVAFE9Q7qSVN6UOKoIHAzEPr0drOMkRh
         hjVA==
X-Forwarded-Encrypted: i=1; AJvYcCUHespwZNoRnDOrvHMzYytfCTGWredJPR7kp3fFRD1jYo8N3AMvnWM0h/maYbI/EHZqgsh0ibhBblC01Aw+wSn5@lists.infradead.org
X-Gm-Message-State: AOJu0YyjeA4MyQdk0iAObm2R7WPme7gddWwOMwtpsSDKA6DNhEvRTjHK
	We5julntvCTRwWO6LKpMypHsUqjOVhMpiyLZmJ7QORE4YbZc4+9VIEbxetH31Q==
X-Gm-Gg: ASbGncvik5vEDJcVAb9reUDPpO2vTgounrhAl2OirOB7xyqft5Ho9F+YKyzkpWLao89
	qmXLZ7GdJgqkCjIpejKoSuHYmg+OyQP3X4ptE9zzPaeblxe+I5ybZJpoGSDEUcqq2iFz7PLc9wT
	ge+t/9M4XBTeosFQz+Ggo6sHaac9yogwdXW9iEHj5cR/nrXtV9wWVQ/VR7SGRUMgoRZ/ozolF6H
	U2A7pKQBnX+8uB5Et2O1rL+FcTfwUpC81OMBxoiL1yJNM01CZy1R7lrLZ9bfqrQjm1tdMjtkalc
	P8H5V0RuuOg44af5QQ==
X-Google-Smtp-Source: AGHT+IE6XUMC4DYavb5+1QKRnRXxBw3DcgJT86nS/fMqAGO0LrolKsMBTfNYrj26qWBSVfQRCwVzHw==
X-Received: by 2002:a05:6214:2aa7:b0:6d8:b097:fad3 with SMTP id 6a1803df08f44-6d91e422080mr88765546d6.35.1733851834188;
        Tue, 10 Dec 2024 09:30:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d90299bccesm33827546d6.60.2024.12.10.09.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:30:27 -0800 (PST)
Message-ID: <d806f833-1801-4d99-8e35-7eb09108d549@broadcom.com>
Date: Tue, 10 Dec 2024 09:30:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/9] net: dsa: qca8k: implement .support_eee()
 method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ar__n__ __NAL <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
 <E1tL14O-006cZg-VM@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14O-006cZg-VM@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093035_773774_312E90E8 
X-CRM114-Status: UNSURE (   6.72  )
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

On 12/10/24 06:18, Russell King (Oracle) wrote:
> Implement the .support_eee() method by using the generic helper as all
> user ports support EEE.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

