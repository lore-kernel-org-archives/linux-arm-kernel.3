Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66AFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faqWqp1PBWz6bkdg4gIZKK3WyZPaPTN702mjk2GZjXI=; b=qQoTLcmeeQ5QAU6qt7b89rhX3j
	pM4/a9tO9JtlsHVaaUPxJORGX5cadZToRJFQMq5MA36HezRfEHhUy3lxN72eXtQ8RCS+Lfsk/t7eD
	Du0AXotyCGpaVHI4jwKisSIgvc7Oup5nthaAtyM7k3kAlDSCJ6xzkJRclT27zi/N6ECHc331QAekq
	3jJPSKBJpQ3tvggHzwJemv5d5HNyefEW+cPpgfbz4gGeeGsrgGNnqk2adOuLm7Cjk+GbhVf0nEQtZ
	vzyIpiEET/EjlrS++Un10lgua8GGt5XJDHt4YQbHWUotYCCf2Mp8yETy+4Ly3GOfpKFajkbve4P33
	xInP27Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdKB-0000000EqRr-2MdS;
	Mon, 24 Feb 2025 18:37:03 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdBV-0000000Eo55-2V9L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:28:07 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5fce5eee2beso2911990eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740421684; x=1741026484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=faqWqp1PBWz6bkdg4gIZKK3WyZPaPTN702mjk2GZjXI=;
        b=Irr2cqB8EPyNBS3mtz7X9YUPVdn1kce0YbbjqhmlcHWR3qURMiL31NNghBONvCP7HH
         NPqUD0d7vVF1ILjsAc+q7UaiiTmBUxqN5X1xWMCcUVEz9Wz2cD6Xhakbh1H8MU92vPDW
         V/G4Hgm/NyauyNtt7PgoCZ7VGoGBOhZ7mGqyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421684; x=1741026484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faqWqp1PBWz6bkdg4gIZKK3WyZPaPTN702mjk2GZjXI=;
        b=lqlnYn4lKV2TBzOvFeuiFsSxQn0IaD8qx7QR2TTzJQnVxgkVvVdAJbDrvGAnU1IXlR
         q7vxiOKbJmOUrMtRGpZR4oaGgQiKk7p/LVG/tZrR8loBRrYPJU80qhVQxDORRTjh5YBN
         vz6MyForz60FGNAiynAbv9pI5qr/9sKmg2GUPtSiaNwzulMZ24dbtX9o55cqyT+o49fj
         UoVG99f2hiFwz3XyPTgftz9Hp4QaV8WWzoOVFvB8nBWwbF4XrcYECzfamdP6Sp0KDiyC
         889Wt03kHkT0XryhNYsHm3rv/ad1Gg2PwAHAo649GlXNPRaRx6Kf157pZJyfXCxMTRQS
         bFNA==
X-Forwarded-Encrypted: i=1; AJvYcCVpbNqJEPw54xNEL0WyfOwnXk3wyJc7kPcg3oD+kCxS95Dz6Q3rDABPtgtoXDsCc5RYCkHYx+zXeUnAbDbREZTM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HKbcOhIV3ojJpX1hkmSS8+2YWMlWcWeEnzuixsCnp0i1msRu
	zoRCdLh+2kb+myoyB+BNy8/uoB+04IeW3Zd2UH6FFx32luazQ/iyPAzZR+rIPw==
X-Gm-Gg: ASbGncu+m2/+bnXoNSsSgx8gobZ/9PxXfd7z/cw5RoYRgcPZkidG/g3kMBSVrVhRKl3
	JE0vU73fV64o8MT/1c0Goms7eBejm7twzaEr2UnAZ/LiikYG525KC8GtoeRgbKDB0/3ZS2zK4vZ
	WnD9gJtgFRYv47y11U076afUaWIK7WU//DOHUZR33G5cUd6hdzpTk9hQScr8JBlP13r6FPyYBFH
	gjxIQJYAuToYJoZIRXxvTMqUViTcc55MVM5+49C3XLB+oEQyzYkhSmwDO64xMowTX7WJabd07aF
	rVdXGtmTdhygL6W8PNQNBr65vUYNibvjRHjTh4eRxQ+UEbEi39mZ7g==
X-Google-Smtp-Source: AGHT+IHVs9kBI7BshAjDAVWgrh+i3GPuho/Oqa5W57T3L5uzRkaZm8JCVHHG2193N2YMEmrqfP7G6g==
X-Received: by 2002:a05:6820:3284:b0:5fc:f02e:a7bf with SMTP id 006d021491bc7-5fd0af6c89amr17901209eaf.3.1740421684520;
        Mon, 24 Feb 2025 10:28:04 -0800 (PST)
Received: from [192.168.99.86] ([216.14.52.203])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fd235ed4fdsm1300638eaf.24.2025.02.24.10.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 10:28:03 -0800 (PST)
Message-ID: <f9ff16f5-9eb2-415b-acaa-706a6ccc8c42@broadcom.com>
Date: Mon, 24 Feb 2025 10:28:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: bcm2835-dma: fix warning when
 CONFIG_PM=n
To: Stefan Wahren <wahrenst@gmx.net>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250222095028.48818-1-wahrenst@gmx.net>
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
In-Reply-To: <20250222095028.48818-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_102805_640468_7AAB91ED 
X-CRM114-Status: UNSURE (   8.19  )
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



On 2/22/2025 1:50 AM, Stefan Wahren wrote:
> The old SET_LATE_SYSTEM_SLEEP_PM_OPS macro cause a build warning
> when CONFIG_PM is disabled:
> 
> warning: 'bcm2835_dma_suspend_late' defined but not used [-Wunused-function]
> 
> Change this to the modern replacement.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501071533.yrFb156H-lkp@intel.com/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


