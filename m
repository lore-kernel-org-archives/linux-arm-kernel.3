Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0139CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RW4FoR0yOC2JMiMbLT5SyorvPZhEQ/Yzvp8kSN7SoHg=; b=VeuewKJjqWufSeI6QeVpWzWZpH
	ALKnW3mikO/Ue6N2fTdc/WF9wX8C1y1h8EW3RlwXvBa1/9sDa3K8K+p6yqcXM3p0HKRSbARW/L4j0
	Ox7X/lUCpZUR7Tj20KF5p1KBmozfGUurvbdJahL6zkpmgL2G7ez0XDtDBLjpIYbkJXkVgb5c65khl
	7Wc+j1aWxqTv6L6d0lxJwtGbIKAeIk6ipkPRC9Gek0Ps6AuRfaBUbaOqsGnuTcrDOkMKbcD0BCXrI
	K2H1x3PXv57F2+nGTp2tnyxYdfG4honCi5SiFulnuu9ZyHwoBkbXQYWbdWRdRIvj3BlfPO2vSJ9x1
	faGWQ1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6qx-0000000GEt8-1iCa;
	Thu, 06 Nov 2025 20:45:07 +0000
Received: from mail-il1-x161.google.com ([2607:f8b0:4864:20::161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6qu-0000000GEsG-15H3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 20:45:05 +0000
Received: by mail-il1-x161.google.com with SMTP id e9e14a558f8ab-4335726d0f2so236615ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461903; x=1763066703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RW4FoR0yOC2JMiMbLT5SyorvPZhEQ/Yzvp8kSN7SoHg=;
        b=Y1RrLEmWxbdU0x6/O2TtRIxGCvIswy59fDp5uAhlRpqAb9CONdfkutD5i1IILNAGhW
         Kr66mrqHhgXOf9clvhrpMRpezoDAOxfp5TWky5rgwtv8uhZLyoSjS0NFp9ng1hLDNZv2
         s7qAPI9wzfq99EdU8zZgBQTc8aE6S4fMuvYb5qjZGnx27bTcOJ+w/eVrQU49GMqkR4LS
         W8aoctZVWy4Va/ronOHMcHWlreIuSB7RrOwkhr5LeFrZ7ImhvIFkwqHRHb+19kgFToOk
         C5FOSEd3nec4iUvOozFH1s+dSdP81BevlnC8cy2QKnpS7NnTEER/VKjt/IhuNMUgFEmZ
         Vvlg==
X-Forwarded-Encrypted: i=1; AJvYcCUtGBQ20QWwSjCzYSRhCOrcoHCO/pUtHaLxUtxZADWVPzgbBLmv4jYn6Jd4kiTmujnlAirFghi1DgaMcnoJOlSg@lists.infradead.org
X-Gm-Message-State: AOJu0YxyjgNw9tgVZ+elSmtPnzl5I+1YVpTLJpUWl42mZqWqyrtKSnQR
	F0vlfnP4v/1/r9mhoRbXnumff3MaG7Gf2UmLBe9pNu/GkqAm0OpJCtfPKIvnkJ6F5VjIyjbJwqC
	N6JwbdOk29Fmv7EZo9b9p/7HcVCcluHRN100HEONHDnPGtYc3B+s/RsFpfBphe0aCk3H/xpfRBS
	7aHY0zjy+zWME3ciw42o0yb+5o+aSCUYMdKop3HDBW6fvjGv/oTLFhRDRIpfbskR3DWsHKBnYpi
	w9FQEWIMbw98oI/28drXJSCPKWehyCZyFA=
X-Gm-Gg: ASbGncuHDikQ6+fNIyOnE1j5sNsOvLgTHhtVFRBiV5nz9hZW7lFE4phnjnOP6jAcyZl
	iNR6moMZqZEhfvj6LafU+Wy4aoIkuheFdQDBUzVT/FtGRe2Losbekbnzr+vLJX0THlRLMJWoIF6
	gxrmC7Pyx5z5HLzSQE4EZxl6MDQ/D4pPSfgm9auMheP+0jid9KCQCmjJf1zcbinlOxXVHI2OnQj
	ylLIGgCcw0xbodw1v3/hrjTMjoxkE2RacCDQoB8lu9mnOxC7e9CUJGEEV1f/y+EjvSr5bumFa/d
	e5WjK53s0BpZvwroHPuxZKev5dsR7r0dg+emcqLtHIsLyZdQtMT7StyMzRwDAEwZkv5Lbpu92ib
	4wtavZZ6e2/hvzMbeA730iqd3jx1h5vcKY/6i9RZJ659QQRTcHcsWArwYJqJadPrSRdPSLboMQ5
	Nz3vcsISyJW8+AU0LPUXOSWjoU2EiZ6fTZQUuzEpgGxg==
X-Google-Smtp-Source: AGHT+IGQsoce+a+0DApYJwKrQJdOaRy+SYc8XXI6v8J+25nYE6plcbZzTJsGF0NKmKhC3eh5GCiJVPcAb60q
X-Received: by 2002:a05:6e02:3387:b0:433:2cdf:6457 with SMTP id e9e14a558f8ab-4335f3fd062mr11568745ab.12.1762461903318;
        Thu, 06 Nov 2025 12:45:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-5b7468be4c1sm401475173.38.2025.11.06.12.45.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:45:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3407734d98bso94730a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762461902; x=1763066702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RW4FoR0yOC2JMiMbLT5SyorvPZhEQ/Yzvp8kSN7SoHg=;
        b=OBZZK+mUFAiL1/fGOErwl/MCUwkUvFUKG1lxK6F4V5ldtTXXgPUdNZ4xY81T23bm65
         DTTYdhJxdMXlkbojMc3f0x4/qDRF6Wvs9s7E0YmqnkeKbbyD6/NdqxGgjhWFphCOC/ub
         nxhAk5GxjZsTCDh0F/08hXwD2ENgQDOYPJVFA=
X-Forwarded-Encrypted: i=1; AJvYcCU+L1aiLtDF8Evo7ChcDHai60etC4XrvsOrG318c5YKHRJ9m3jmIFpO4cyqxVKVkJhoyQQ31pbJWbCQW5bZIlVQ@lists.infradead.org
X-Received: by 2002:a17:90b:3c86:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-3434c4e3c44mr582838a91.6.1762461901853;
        Thu, 06 Nov 2025 12:45:01 -0800 (PST)
X-Received: by 2002:a17:90b:3c86:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-3434c4e3c44mr582806a91.6.1762461901417;
        Thu, 06 Nov 2025 12:45:01 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c30b96dsm346476a91.5.2025.11.06.12.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:45:00 -0800 (PST)
Message-ID: <b0fd87c3-0127-49b1-9784-51b3738c3b79@broadcom.com>
Date: Thu, 6 Nov 2025 12:44:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hwrng: bcm2835 - Simplify with
 of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, "David S. Miller"
 <davem@davemloft.net>, Tom Lendacky <thomas.lendacky@amd.com>,
 John Allen <john.allen@amd.com>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
 <20251106-crypto-of-match-v1-2-36b26cd35cff@linaro.org>
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
In-Reply-To: <20251106-crypto-of-match-v1-2-36b26cd35cff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_124504_312564_A7646466 
X-CRM114-Status: UNSURE (   7.71  )
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

On 11/6/25 08:31, Krzysztof Kozlowski wrote:
> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

