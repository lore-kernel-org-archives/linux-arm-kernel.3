Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1798FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fHwIyv9G/G9d2ElUeHUuN1VT5S9rxCMbyr+I9u3NXE=; b=ijEUJs8h+HiYzHWSanjXBxWrEy
	JB2PorbEmmLGeN8qeKQOR0pxy56W81lmFEUEcFRs150otcmZVLMPYeUQtaAaBRHrUmwHO6gJLiFqc
	/kwrfMsjbWYAQMYolpIZfb+nN28cOTbPGf+oXqgo6qtQAKlukUEWYCf7KXe2fPJVHZl4eJF8W5tK5
	mcR6PnEPm+GtaL3jVPFUWDfpvMatlpp1qvYCzNBm7m0rMIbwkCrQliCvOrasqBL/7x+TXN8zBzodw
	IdrfJ0/tL1xV4nwKeBBWUpbEbEXlw3OXTBCJI0LGwFIeLHKHNk9EuEGeRG/ZLFiTcZZPUNtG9+IHP
	VWbadPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIMx-00000006wmI-48up;
	Wed, 09 Jul 2025 00:09:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIKY-00000006wBh-1l5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 00:06:38 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-747fba9f962so383504b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 17:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752019593; x=1752624393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9fHwIyv9G/G9d2ElUeHUuN1VT5S9rxCMbyr+I9u3NXE=;
        b=ZlSjrhoHjWDnpJ7fxyG270B+S3uhY/VRLFRfjt3l7ptYV+V7I9KU7iSArk3/+8/X9n
         COfDuHGaRfcnVh0DquTUzIOOYKSEiMCOVWo45/wqIwJRC20PuRcF8Qpbe061YwjsSHVq
         M+TEk5qORTMOFKMXAtjj7GBiBTePTmcYiAiCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752019593; x=1752624393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fHwIyv9G/G9d2ElUeHUuN1VT5S9rxCMbyr+I9u3NXE=;
        b=ADsurtXWoLkBUDdO7OcPB2D5xEjFUZKPpa1RdwrpuqPAPnUN1RHkNRUbOGy6ZTL9C3
         q+kX1Sx2SokOVsDJUTxda9qDHtmC5ZlulGIaHkP12ezNSAk5N94IuuXWBqvaoMWIcjd2
         angS3kdG4FCZFnoacZe9G9FnZ16AQs40rjbRsbnaHZdREJxpVDKzs2Nn8QwvgAZe4x23
         UYYo98oeazc5Os00AwvkiuhSJhq0V8vE1l5kQjPEKivqAPlW+unO8KuCJA7qclwlNJBj
         n5D8+s8/f+zejEHY6Jzdeck0+RcbdFMnsnQpbzc2lgGT/Bu6lNmMrnEHroY+uV2Qoien
         60lg==
X-Forwarded-Encrypted: i=1; AJvYcCXj2lGMgB5cEWJgXJlWVj3l7/p6nAyGATPuXteGaVf74FJ6SXQksDDBgrhShuCDa6kOGzu1yRdmMYwpe8M+7yeC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzqtcn21pGNkplM3EvMBNQNHMHta2M42qTkYKDhCosP8pXEenx
	TZOC8aQn7rJaVYBOe71IXxnJRFNNDDFQaZ3akt2X2fgD9GHoPHkZDbr8tO7CCqL7yf/SLBrqNSt
	3HWU0kA==
X-Gm-Gg: ASbGncvf+6cMjEbgLAqgt7xHzy87LzIvE7e4l3rMNlE98R/jBTzeQy4G1fvev1JLNkj
	C4mgVnBpBt9tL0LA//xthDRRSoEDZn9CRmPGZ7re2ljdwzt+l8AvdRMO+hggBBSLWnKpXO7jd0S
	QfODYnPuYtEoGDT7lxZd+LDV8ZZJU+L8Na4GhWw2dBrxMRpj97GrwOfLh2y1WhU7fwTL6rbRK6l
	Ye6V8aGhPAnbILo9pf4sv64Yo/9P/guHF+zS0PT970ymf/uOkUBpTvN45UJa6qYNNDAz/1AqwI2
	x50xk9NR3p4DKKRz5RKE3CaGxIRpRuVo0opK3gxVnkI8Xe1zBHqXikCf1qWoYZ/K/J2YrgDtOH4
	BgsaQ9thTiiJfMmDywc8=
X-Google-Smtp-Source: AGHT+IF+YsDibkKRG4hNYPCm+z7B14XbwLmHtSCM1GJNJMtufORbxAG8E0Sby/ii3JnXO0r5SvlBRg==
X-Received: by 2002:a05:6a20:4328:b0:218:159f:1e87 with SMTP id adf61e73a8af0-22b61c6954dmr7148001637.19.1752019592947;
        Tue, 08 Jul 2025 17:06:32 -0700 (PDT)
Received: from [10.230.70.142] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4510a6sm12674092a12.16.2025.07.08.17.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 17:06:32 -0700 (PDT)
Message-ID: <e2c66c4a-93dd-40e2-9ba0-64c505287754@broadcom.com>
Date: Tue, 8 Jul 2025 17:06:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
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
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_170634_501915_BF737BF9 
X-CRM114-Status: UNSURE (   8.98  )
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



On 7/3/2025 4:22 PM, 'Brian Masney' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


