Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F044EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnTOe7yFWT4UYNJIuLdQZTeHUNhoeVu47fqL7N52te8=; b=Y1aPrJbGqCva2NffA1D5xy9uNW
	s11iHOYtUkNU0dKnMmXJanhRRAKGL5kvURjn156mMF2N3KLy8MDl8LLex49TS9H88gHLV/Inde0h+
	1POxdVYX8A0qA1G/Hryt746Akui2DauV0z+dLoL/SG3PEi2n2TllYNP89R7+VD/6l6LntWSQMtKYH
	M5PUoLlDzBjpiiu8fyeJajRhpDCzfx2XZhxCjwDMj0PwYXg9VnvPB3mHgH0btaPBd3atKwdI1HwV7
	u4ncSc3C9+qlq/gp0n7hxy0htboYlLTK9wkoPs4r7goimKBkz+mLf4gF7aUIL8OxFF1SsWJ7KKJbr
	ChKnLiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3oQ-0000000DEuq-1T1u;
	Thu, 23 Jan 2025 20:28:26 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3n7-0000000DEWo-0r7P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:27:06 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3eba50d6da7so351535b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 12:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737664024; x=1738268824; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RnTOe7yFWT4UYNJIuLdQZTeHUNhoeVu47fqL7N52te8=;
        b=Zw7aZyAC/urbv0tBajqIQbAY9iR989LLR2ORw3jqEpEQ0Z8/zKaSwDukLxrRsb3R7/
         jYkT4ENSoQxInOW63vNoM+Wu3JR9YAz0nEvWPakBUClqc5+oP5vz6+/viaAiIggIuROS
         NGF82aVnqh3ZpFHWp/iStTZS9hmqKkMKoYbyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664024; x=1738268824;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnTOe7yFWT4UYNJIuLdQZTeHUNhoeVu47fqL7N52te8=;
        b=ogSZnYtdXSivrO/H8VD0yAE9jSuIodAg8rlwjmrv/iryMbOXe3Aed9DOW5NDkYojnK
         5SWU0bRfH3K3yJMpd6DZI1MzrHnJkIQUf3XZHydNPsUiI08D3daq1Irq/Ij+E9Y37WgO
         4/zrLeDRMJOqfMKUcMI8JRBPqIpC8MBdgWlIqUcxeggCG0k3wbpEt8HbRLBmv6JkLD5z
         +S8GXbOdxCiWrcyKsZ11ZvdRU5unWKxjKTeG5pUnPgCUwDmXiSp0Ly+JmjfK3zAoR3H3
         fLHgSM8DoM73t7DpVctC3kkztvFvC5bQNCsFCFlBtxARgrXafYCLnIaP0lWbSxm23mp6
         rxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjtjzgDnP69/oh9HCUCGYc6OJEvRWUEjPxKStLYTeHJZB818O+AAxgFLzo1tm+KBjXaCmAqJypbniDkhrZJbmm@lists.infradead.org
X-Gm-Message-State: AOJu0YyjLuPVwvXWuPYMIUZBwAZOVel0cHnb28BxvfCmrzbLAjG1w18b
	gRippPTrGSLTebHXNdpmPBKOd2wMy8K7pNALot4gbmhEKhAG1zGIQh9i/0uk9A==
X-Gm-Gg: ASbGncuPytYZBKDtWJWtvecuXxF3l+UhRG/I9GIJC1KxWYhKSYvDEJEHDpi+aXut7LT
	3LMo61k8uRoX0Xk2LN1msnPP5jtd8ylvhNAyffy1I60vLFZe6BDS9i2vpkMZ8Vsg7aNRJPZ8o1T
	WK0jvtAzAFPaoKMMgzx7Q9m0/lzlj3GlhSvLkP+7ywg3TYRFt5GzQQyjN3e0sXMJsvgYVYvfhrZ
	9tQeDojaVIYBa3AlI6AwpEQogzEkLcDKg72s7l1ISpDOBwxju20GInmDYTzNs4/Qijo4xeP+2gr
	x9+qkjfs5dqxZqt1jIouYSuE3STeXCVyar2pX14It+TV
X-Google-Smtp-Source: AGHT+IGoXpwCo6KUpEa1mgyEsN3GlaOew1nrW9GfIqCjqRaZGtjUxFVw4Q2NPiRX3bzz35kSues//A==
X-Received: by 2002:a05:6808:490e:b0:3ec:d251:d758 with SMTP id 5614622812f47-3f19fc9e9e8mr13292209b6e.23.1737664023776;
        Thu, 23 Jan 2025 12:27:03 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f1f08c2f03sm58176b6e.30.2025.01.23.12.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:27:02 -0800 (PST)
Message-ID: <f27f9f63-32d3-4e90-9e12-2f893198f02e@broadcom.com>
Date: Thu, 23 Jan 2025 12:27:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/33] cpufreq: brcmstb: Stop setting common freq
 attributes
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1737631669.git.viresh.kumar@linaro.org>
 <3e6d8f8ac58727a8ca4d2a57fd90600618085936.1737631669.git.viresh.kumar@linaro.org>
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
In-Reply-To: <3e6d8f8ac58727a8ca4d2a57fd90600618085936.1737631669.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_122705_295765_FF9D9D53 
X-CRM114-Status: UNSURE (   5.57  )
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

On 1/23/25 03:35, Viresh Kumar wrote:
> The cpufreq core handles this now, the driver can skip setting it.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

