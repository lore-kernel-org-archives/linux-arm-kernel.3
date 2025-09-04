Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0745BCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRBZV5G/HcBkypwOLz8mqvMSu5Xawkw09o8QhoPdqzk=; b=pEVNH3unCgvxWtgt8phvDr6/V9
	ITww6hlYIQszLYMHUz9+wb7kRpPH1usKuiAzFeeNeosMZdZNe67IB4DuXlXGY/qmeUgHeo5wO1gJI
	8yTLTOhwExLXfYWz8YirQluxCT7fpXN/dXqShMXsjlwSf/jL0b8z29Z1EsgqpVyerqttNy5cIRsJx
	f/2/0Hoa0FFhxU7OyWprlOpxnLTxl3Y5lIC2Ja/S9IaLlJajlgsT7OMV7DwqjliqnFuAW9I9J327d
	CkJv53ltlNbV0AYl1DUhoTD8ulhtIWsF4EeGA1MSn6kFqZBXBwQUy0jiY36nOxcwmwUEWHudUDxK6
	L4DMgiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3B-0000000G1tP-3jQP;
	Fri, 05 Sep 2025 02:19:41 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH6E-0000000ERmn-3Xbt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:02:32 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-7724df82cabso1816776b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757019749; x=1757624549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PRBZV5G/HcBkypwOLz8mqvMSu5Xawkw09o8QhoPdqzk=;
        b=eoMTxCmqxkKRfOiu+Ef9i43C0TK1uZ4Nh2TSI5TrTHYP+smtBS9unCBz8M6uKfx6aM
         btzGw2ZRYmfWQSrnyk4UNqGXAymfd/xmfBfT34TGRu5U1HhYowN7HzgXOXVX9ZGWCORT
         MQstbREQ7rRXromPszXdDgI1Aq3Og5vYGeaevVSqyuOM26WIb69HybZgJiOPsnradgWf
         5iBeSFVJDOcTPcCXNddN/ZITbCgGenuXorNQQVyEaKZqQQEQnLPcjEyZxgt4TDDGIIDK
         vbVAH+qMf5Kx5LwasvxX+O0IAw2EcBhSPU0WgzMScsolgvxBhBAAn2rWJLE1ijo6VNUi
         fi9w==
X-Forwarded-Encrypted: i=1; AJvYcCVtuO9IBgA02zdwqJHXEE/P/l98XU/PSIQLAyMw7YjxyIouh+H8LozIbr34GYc7xDU283OK3NANxI+qgMnuGjIr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vH6VrjTZen5gRJjoT6A6FZn+3Pb+XpbNOce/zaK9G6otOwTg
	5SyQEgBtw/qDtyMpAckgvm4nfBlc3516JRbopE6t7yY9AtBx3OGrx7rgifE6B5dCfUHqi1Tu7ke
	995hp76ji/3gdzwL5JQaJucuY9MZzAixTwU+vEBrup3RKEGz2hrKXIq59FNTRsqkcHkpQSqibsM
	8pcAdhya4RNJZVXwe4JilQRyoI9BtlvfmRtfGL+lL21VK63lmbwnhciG25HazMbCEIC54z3wXMb
	nFkDGvByyea2elsUDbcAH6QbeZi85Ff1w0=
X-Gm-Gg: ASbGncs8X7B3MHylGRffs045QmDAHrBtsTI42wT37kR3t5XQD+wRQuAmFwe+2pDDn0/
	JkL6RrxlIjCgTmpInfNxqehytaqqMYzjt2m03y9Hv84SmRke9zBhoUntvvVftQ7lKDFgG//wKyI
	33BJDHkosbjhp5got6hJmdnQkokAVHyK8OhdpfWPWVcT5G2xWf9EYKChyRhSprbYAPTRwB6OzY5
	euvS33tl/iBZhP8IolNhr1ggcUAZgovb8JGiKc8AfVk3KmbRErD6PX3LTtm5Quu4Ku5r5x0YMU6
	NRWSlITd4bRwfD5mQsw5TfJUEz7A65jjlRXrj6/3/jONtbQnAjrvMBnfMVg52zZOREI+xAtz04I
	rPDlq87i3CB8vuWKGdfNqJKOV/0tDjlsF1Mks2wKQcCE9yPz6zZvlBUA8rq8XgOm16kpIZ4OVjh
	6jGDz0GzY=
X-Google-Smtp-Source: AGHT+IF03BMFOwsLThRqQyMxUpcsi7qlG7ExLc8N/xZUI4wOtrr3jZ4IIW9NRuu+AeTwWWEhNVpjZ9xalWZe
X-Received: by 2002:a05:6a20:c20:b0:245:fc8e:ef6d with SMTP id adf61e73a8af0-245fc8ef0demr11827169637.33.1757019749283;
        Thu, 04 Sep 2025 14:02:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-7722a48e4bfsm937815b3a.10.2025.09.04.14.02.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:02:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b30cb3c705so37995001cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757019748; x=1757624548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PRBZV5G/HcBkypwOLz8mqvMSu5Xawkw09o8QhoPdqzk=;
        b=cpe/qRAYxWvmdxbPLhhfFFxZrwOBVOamnqB44V6i09txZ0Ct3N7/CUo1QibU1mUFVS
         Ydl5cPad+Drxa5O2oKmXfxSRUAMkFa7sKbPT0qzN/Ox293nQM5sIWNTnHHHKLWMeiZyp
         aUy7jGcn8clUroRxvTcd/axyarbMNlEqmWvqM=
X-Forwarded-Encrypted: i=1; AJvYcCVn1z9Qk8oVIln5pHH2SF5dTe2B/HiU9SL7FC53LLGB5alm6YqeHFNRoNIS5wtOcEnzibnD+RDWwVnOW9TNiTH0@lists.infradead.org
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id d75a77b69052e-4b348b2b623mr131348291cf.50.1757019747990;
        Thu, 04 Sep 2025 14:02:27 -0700 (PDT)
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id d75a77b69052e-4b348b2b623mr131347871cf.50.1757019747585;
        Thu, 04 Sep 2025 14:02:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f660517sm34712351cf.16.2025.09.04.14.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:02:26 -0700 (PDT)
Message-ID: <710ae88c-b1ea-4ccb-9fb9-1b30bb9a079f@broadcom.com>
Date: Thu, 4 Sep 2025 14:02:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wahrenst@gmx.net,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
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
In-Reply-To: <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140230_888234_5D7E4A10 
X-CRM114-Status: UNSURE (   8.79  )
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

On 8/28/25 05:47, Andrea della Porta wrote:
> Select the on-chip pin controller driver for BCM2712 SoC.
> 
> On RapsberryPi 5 devices it is primarily needed to operate the
> bluetooth and WiFi devices, to configure the uSD interface
> and the power button.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Applied to defconfig-arm64/next, thanks Andrea.
-- 
Florian

