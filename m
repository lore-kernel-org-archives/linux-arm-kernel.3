Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729B6FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nICD9QH80KQE/DIQm2+h3YrwvCaM0Uimxef/gUfh8Ss=; b=ZHwMw3N3zelR0DdNMWxjr3Z+0G
	tFXEFibuGlhrCoNZp9XssSfMdy9+rGJX6iOmJfT2EXckVGslHNYd4Vb6FzfUEAgUvt/t6ia10ubWX
	8uCxSw2iw/ofYD0SC1fZCYsRod6C4CvhLWoSmta90TZcT5lm8d9SnJGO99oAjngBaEaOBYULR+gKY
	S8agU7HYPNVfGWG53MbJjtvvkt3N53+mFsz0LYqxmYVzcGYP6SFoTSsE4y76QcFXEaYFB/QNXADHH
	tpekUVk/f82NfoEgaH9Yd25Z311p/VHa9GhWEK2Tudi1KouixIjdl/seVEPqAdLzcw9X0hpiY7xar
	HjDL7n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyepf-00000004fiL-2meS;
	Fri, 06 Mar 2026 23:43:47 +0000
Received: from mail-yx1-xb161.google.com ([2607:f8b0:4864:20::b161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyepd-00000004fhX-3giP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:43:47 +0000
Received: by mail-yx1-xb161.google.com with SMTP id 956f58d0204a3-64c9ebd1369so9037662d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840625; x=1773445425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nICD9QH80KQE/DIQm2+h3YrwvCaM0Uimxef/gUfh8Ss=;
        b=uXsuzHPYoXHFuIItFEuBKTtaTcpgOWRuM/LAf1IM8xy0NMdEQSnLKjFhwxbvFKDHtR
         wH+dWqr4PQfJpasW4fu2HR0l4524a3UPQUf97kjWLfyYWdD/a3rFcUiTjnD/7Te7UXcp
         48HCvYW3KxUXDWuFaugpz3SNPLxic8BBVJEor1pQhygR8HBzUORboobmovbWr03gIK0G
         2Qd5jyEwZtnU0AqBjXguNX12WbrYrgtS3PW+8o5Bje+Dm1D69JvHrjysBxIU9naL4RJc
         xc1Sxx8jkPhQju4lVbwdr+6/Hk2XhmWy3qhBkCRd7MI2omFdNtAyaj3BxdFJwoZpIs0L
         dDig==
X-Forwarded-Encrypted: i=1; AJvYcCWTxoVxge6SftS2c0dSJqwo7lCtCYqz/0/uWK2jp7sU1QGLLI9T7ysD1RCy2uD+a8DURDNAOd66r/jJUSl8ihZn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Nu86ctq7/h98QA/vTxdxo7pzTLifTVc+7TlUY2IHomxkTkmy
	8Z77XW1cGUHCA7WmWh2iO+67+iva2pqYGcLcWpuHbTVhbo6U6KYxPT1imuoCnieNN4TS/XcEe7+
	ySbwnZt3c13cN758QP1ZryHGqpkmoILGEVZzfSIoRwZT9KrhEjjRbneVKWV5Mkh9rAknelykMuL
	dxvrLAWhR5YFZWEz9vO1byE4EeWSEwJIW4sB9RTEDX1wB3iBtTcR7yx5Ysx+4dmk0+NDuJhhHGG
	RfaAZOsllzMMU3xEFfroSHKkypNnXMlgQM=
X-Gm-Gg: ATEYQzxUxLEFGs8k6a1MJwechxSjRb60sMasCOG1k5N5mhA3chBH0BOjhUyZeFmBlcn
	s8FzDzE/vm6DUo0FbZhxxtkpXPfnvsyjaBfBFjdQyEtfHpxJUPZn0FDgXMOP9omOMtIAz907fWJ
	vooTJSlowWyxiEZAPslYw/usNXtWZcIQQSMQ4TOFmSfhctKs7oMFGpuQQL2PLwAyvAjndIII45e
	tQddY6QPhctuoW81Z94nSlu6xiGavG1/XgkA1XcR9ZYhWtZ03rg/cTbWhpo7ERbehX1JWJ2Nljy
	nuXv/Iy3isskT2oRYnzV+y6rHsy601lStg2mxZPxtRUXSN9rRcK/m0oM43/QbCPMr6sZnJXBQIP
	x0FAxfOr02thXN4rG8WAKbJvr8XptEJhHP5EvcY3VpOWa7KqNB6J8vGcXJrvpsdZg4F+MHHRp2I
	iM6HEIP95eyXyUToBuPQJhvfWYSwXOt4e+mTftfE/KLGwW7fPYyMN/X1baqY/y3Q==
X-Received: by 2002:a05:690e:130c:b0:64c:a593:f71c with SMTP id 956f58d0204a3-64d1427be50mr3830287d50.57.1772840624552;
        Fri, 06 Mar 2026 15:43:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-64d175d1b42sm243412d50.2.2026.03.06.15.43.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 15:43:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95b6f61so8590798c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772840623; x=1773445423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nICD9QH80KQE/DIQm2+h3YrwvCaM0Uimxef/gUfh8Ss=;
        b=bvycE4tiU8v0tlcyXbIbZih5c8QIXR6LfSJWPs3ctMwbCGmCkyy7dYSMy4EGC5x50p
         WIWH1i6WBMfm+c3bt10BUtZwNzAZctNVy199Y8swi1OZQ9hpiglxMWcqrlt6SbLg2/Xx
         dpdKwpadY9U48aFV8icALOjW1Jpn4KCAH7e8M=
X-Forwarded-Encrypted: i=1; AJvYcCUsgVSlKbQOVv7v84MHhEGDgQMqJhnl1YskoneQ56+uQ31iZf6altQKCHddq3yzxi+jw6KQlrfgECPXjs5rE+9o@lists.infradead.org
X-Received: by 2002:a05:7022:1094:b0:128:ca6f:ade8 with SMTP id a92af1059eb24-128ca6fafe1mr535246c88.28.1772840623411;
        Fri, 06 Mar 2026 15:43:43 -0800 (PST)
X-Received: by 2002:a05:7022:1094:b0:128:ca6f:ade8 with SMTP id a92af1059eb24-128ca6fafe1mr535235c88.28.1772840622773;
        Fri, 06 Mar 2026 15:43:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3bf4cb2sm2124716c88.0.2026.03.06.15.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 15:43:42 -0800 (PST)
Message-ID: <cfa04fd5-6736-4077-b6fb-61d32f13f17f@broadcom.com>
Date: Fri, 6 Mar 2026 15:43:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mfd: bcm2835-pm: Add BCM2712 PM device support
To: Andrea della Porta <andrea.porta@suse.com>, Lee Jones <lee@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
References: <cover.1772839224.git.andrea.porta@suse.com>
 <c0b5793868f138bf5c928a12b2763d3e183e2e59.1772839224.git.andrea.porta@suse.com>
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
In-Reply-To: <c0b5793868f138bf5c928a12b2763d3e183e2e59.1772839224.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_154345_932596_20B83DFD 
X-CRM114-Status: UNSURE (   9.18  )
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

On 3/6/26 15:41, Andrea della Porta wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> The BCM2712 SoC includes a power management block that serves as the
> power domain for the V3D graphics block. Unlike other PM blocks in
> the BCM2835 family, it does not feature an ASB register space.
> 
> Conditionally register the PM device depending on the SoC variant.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

