Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1816C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8YiPd1ZphysNTUjgASCoCw3dBdpJDSVkH79WF+uK0o=; b=PApLccbKaDGP5p9cJpVT5RuYh7
	pQuqDrX2xp8U9q4gJlJL3pvhnbOszXruuyTHRKdZxTGOM37CkID0hulpfsna9wl7FtwK9D+qXgizU
	X3hSZm3YhzpAJ3fvMQIx1LUM+Bfe78FtOLJ2ZmbYBrQabragDvdkVy2BKsM0oOaeFCkIbqGNu8y3H
	TRF6Wfu8iCOKfyskWcq1jHVsFwuI5vey85KbeqpgQOrekbHTScPGOytwOwbVRQwJMhdR0r0p4d7Yv
	V8tGVmZB2X0ElxilA9yv4tJt4RQamSQr28WiRr28hQG50oHRvsDXknIqgGEocfGicPttmf8RCPK0o
	J9OFtZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lmf-00000006rGc-47pZ;
	Tue, 15 Apr 2025 19:17:25 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4leU-00000006pTA-3e20
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 19:09:00 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72bbc03d436so3675360a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744744137; x=1745348937; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t8YiPd1ZphysNTUjgASCoCw3dBdpJDSVkH79WF+uK0o=;
        b=PGFzppzuR1tarAt5QwZKgd7G2b9tJO39FDblOcYUie5AM0HB/U4HYIVYjjTpVTL6YB
         /oiqS/W0clGaQhi+7F1YvusUuKskmEAs1xHdOOQEQpuYUg9+J5bLDqox1s/yFXazMadL
         XcAhEnV35PwLFyr8xqN0J1Ay6t+ZSQnYdiJZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744137; x=1745348937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8YiPd1ZphysNTUjgASCoCw3dBdpJDSVkH79WF+uK0o=;
        b=qf0jiose+5VR9qVyRUVCkFUK1FHzrqhq7NCmE0JxW/mIQVI/YGg8LhUxkldcc97ZbJ
         bTu/NbSDpK8Zyg7PXt/WXGqnAr/8yQ1cD90rfM8QjyTv8YpdXd73hVjpCC+4gd2DGVjH
         /4nfDLMubKoQbjzjUFIMN/x+nnRvlfxX/SOhxC7gYxJ7rO9GVVLpdhzlkzeMPTwnV/sx
         FwAYYVitt+epMRI0ddk2zhktm10PhgmrtmjF36OImCGlhCUpJiVvxRNQJ4DaFneAG5Qv
         nw4SkcyDL8s2q4c5SqPcrmX6LxPTPykLNiJ632RcZClw06GB47Sv9nn/1lVPS8bKc0Og
         GkWg==
X-Forwarded-Encrypted: i=1; AJvYcCXbJ2kWUydPc+g/HxMvaib3j23ccVspOe6JZc5ihyV5Eta48un+k3gUMqtcaXseJHlFf/mBOsCmnS0giSs93jRM@lists.infradead.org
X-Gm-Message-State: AOJu0YwuXsjFlSqB+K3QllNLUJXOryKgvNS40FWxuqkhzUCoqjoHu68F
	JgahSQSsv8LHAXvd2rvB/rVVXFJBuvGLsac26JX49d8qN/W3WZMcX3A7WzH1t6gMh7z0cMQYAay
	M6Q==
X-Gm-Gg: ASbGncunYhoS0mojzF20/XDo3zN8yZi+hYakLcLjMBpxMzAfE0L4jDaD8gpa1PuByYM
	lehrC6HMNsbqdoSbjYBbG2MqC13nCjZo7Y1r31tcUkU+Bf2fMNFv0xqlvfZ1bDQNT7F2iz2tmCF
	VvbRB2t8LAgaCVC3go++SOpccjacMjsLjKl2kR4qAa71s2HUACzoQPJiJZW9bKUtsan2gPQDwuM
	K95p4fjoCKPpoqoGNcu9SbO+D6E+eS2VkzReSKWbu1UZlOu+TDgPE8pgme2pSv6ORB8/iWP1ONG
	VmYRA9X3iK9Cj0FwH6oVuJcFi4pVACKgLI4jJPzaaUnxjLMHwacqG8EA4eHBdLdGaXmvmVn/p3s
	DcnYUQPEKD8fP4ys=
X-Google-Smtp-Source: AGHT+IEdIO6hs+AQENhHU/Q4pBw0xIAh3rKosnODs1WPRYYqWq5Vk2+oRWHgZPkrZVPbj0ckU1aOlQ==
X-Received: by 2002:a05:6830:aca:b0:72b:92aa:b69f with SMTP id 46e09a7af769-72ec1b5249emr392783a34.16.1744744136978;
        Tue, 15 Apr 2025 12:08:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8cc9asm2526253a34.30.2025.04.15.12.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 12:08:55 -0700 (PDT)
Message-ID: <1b2faf6c-6a8e-4d16-8248-ba7fdb5c1702@broadcom.com>
Date: Tue, 15 Apr 2025 12:08:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Use devm_clk_get_optional
To: Stefan Wahren <wahrenst@gmx.net>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-pm@vger.kernel.org
References: <20250415190558.16354-1-wahrenst@gmx.net>
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
In-Reply-To: <20250415190558.16354-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_120858_951091_66B82B35 
X-CRM114-Status: UNSURE (   7.87  )
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

On 4/15/25 12:05, Stefan Wahren wrote:
> The driver tries to implement optional clock handling with devm_clk_get.
> It treats all errors except EPROBE_DEFER as a missing clock, which is
> not correct. So use devm_clk_get_optional here and get the corner-cases
> right.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

