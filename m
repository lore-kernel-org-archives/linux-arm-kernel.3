Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B8AC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og7k09noHtZfCJVyKsPNkxjxxAFKMtNjRhhBEMvppsk=; b=kJudh5LJ7I2Ixp11WtjjmJ9DWi
	MLMLHk8z3YTlyx601VV8foOuK80ha/2/OCl7UauQ5ths6fGhTqZ2xBgUtcn/CYsC6NoI/ypA1OKTH
	JYVzwNLDTUbBOW3Qq+LqeLvb/ORix3tIgK5u1kiHzRySWIcxCKFtS9GsgFFRb8Mmk05T4h+TOLB6P
	U8b0j4K+GneMmEUJAc0xMkPBEcGO9R/JtQjHzGdwLm150gGrGiueExJG3nK24OPId08jtm4dk+wz2
	k2IUSbBU29DOzFQk2MJ8hAL92ziDtgW6GVIF1bHHJtm2BSyo2GMNIhBuSYcLpJw3EfPW+S9FyDiiA
	gjUHR7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ToN-0000000Dzhn-3dyg;
	Thu, 17 Apr 2025 18:18:07 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TRm-0000000DvfG-0WLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:54:47 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-72bbead793dso750566a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744912485; x=1745517285; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=og7k09noHtZfCJVyKsPNkxjxxAFKMtNjRhhBEMvppsk=;
        b=HGhijkz9hJA8npXFHartekIFb2c+QbdybPRNXjf5bHzjEJoafD1nuwHJUyLZhMgC+3
         TIIqTvd6jrJylQegy/vJ52JxsuZAN0lU0hH7QozTqoHIGKoOBQZPUbM/RUJuWxppBR7l
         Cfyb7SoNJm91ach8J9/P/IPKBntKqvc1PO690=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744912485; x=1745517285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og7k09noHtZfCJVyKsPNkxjxxAFKMtNjRhhBEMvppsk=;
        b=sCYUF+6vxh931Z2qIEeNK4jSxBeS8mRjMcf68K3yI4kIOW1RfKij7AWlX6nSCEVXYM
         4Jphd6DOwX8DS7L2mANuDpXApgh2TVoN3Y3XWXpH4poD8XMGi0SQI2sg/aCla9drDETR
         FngkjIz9Ef91kptGdqI1AGWH1jgpimgPLiZ8iM9NlnESmZtVyb0RvmZzR7uPtj6ESJay
         K9AbR5xgFFQyNTtDxl+xOm6tMxsmqW/1rjl4ymmE/IV5yLUQ3CwM3UzNwmTlr+AxD3mR
         3cRFeZg735dXmCNk1WrCK1EfgCOxzb1dcsKV4edkqEVJhIwoO4tYujcpGvK570UobudJ
         hloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfUTmX2hWbiDaZxLmMJwaPHrD7tct7PAya0szBC4AE6gmDACZVt3GTSra6BzZ5EgIzgKRzj1wy2Zf6hKGpkbF6@lists.infradead.org
X-Gm-Message-State: AOJu0YzzBGleSQQEGlerdxTj/C6/dKKsF0GCmMXv6fRMCZqzcnQeeHYO
	VKwm21i7CPTGLvPLIhMWycLbi9OyvfElpfeKCM0qA0eK9O9VrUI+R1pVgXjKXQ==
X-Gm-Gg: ASbGncvC2vb7y0YA+5XjcjtlNATPDZlYo2H1BkFnWAmBEDG7F2FWh+nc4N5BCF/hXGy
	br1dI2Fl3JIsYz99j9S/DT8R74n1iNnV/Eij2FdxKqL3mzo95Fklf2qyB5m4LsDucOiCaRVe1Si
	lUP1R3IzqJ9Pbf0+H6/grMMPFN24s/Pe7ZzPtuCCW3ctQYZEOta5nhuZwoEm5Dk+1OeVTRN/M+7
	WZB8EZ1FofltoL9qmZzhBiPgTOALFEnFOXFCCCSv51vrCcXu09UZfnCceWbk3bB8V0n1WUXM2RF
	ChM7VhRSpza3+7hxh0o7Gl/WDPeLenE1kjV5X6qEK0Snm3K6lFNtUnU492fNAiFCMKf/y9Yk9Oo
	0QTJb
X-Google-Smtp-Source: AGHT+IHc2QyMx7vxFWIH4oPxUzj4+ePDTI1XAQL3ZEdUDj5rUuKF8oPqdm3pGkJLivkIt+qNCRUv4g==
X-Received: by 2002:a05:6830:f95:b0:72b:a712:4b72 with SMTP id 46e09a7af769-72ec6bf43famr4298912a34.9.1744912484732;
        Thu, 17 Apr 2025 10:54:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047b6529sm34258a34.28.2025.04.17.10.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:54:43 -0700 (PDT)
Message-ID: <35f82d96-6c93-4036-8499-2cfd4cf00c45@broadcom.com>
Date: Thu, 17 Apr 2025 10:54:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Drop module alias
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com
References: <20250415185614.16292-1-wahrenst@gmx.net>
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
In-Reply-To: <20250415185614.16292-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_105446_163668_C840E6A9 
X-CRM114-Status: UNSURE (   6.42  )
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

On 4/15/25 11:56, Stefan Wahren wrote:
> Since commit fbac2e7787ac ("clk: bcm: rpi: Allow the driver to
> be probed by DT") the module alias isn't necessary anymore. So
> we can drop it.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

