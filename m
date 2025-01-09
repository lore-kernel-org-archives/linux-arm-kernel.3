Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAAEE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVrZuOPicx40LZ7Pk/cINDz4MDtaqPATdujWA3ojg2w=; b=qsHuHGx4Fze2685k0BXTjoGrDx
	zj4TkwS/v5fZSkhlYwdXzIazAzfIn7OkWBrfqHAk6VB7ooaGOEwXkhCz5g6EQNYNOpUfKXXk/IBTu
	RNKSWwadSxrr/8j/bw6wGjpooUT8ROjZbEa57/oneGA+EtOAfyMG+adOxEKYNNwxyEE6Ge9ZHy+W1
	JvjvIPjExW16b+H3vQpJt7W1LCOg6bHaqs5xRDc2sPRlJlnND5lGds5NVeXzM7w9QVgE2gMT49pYd
	mXqjdYXbAb4tE7mdNTaMF1qF0Xbxk8Q4hla2FfESo0Dv1wIeWQ9wogDQPUAQyT7TBPGiL/hJtbTDy
	qzL5NiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvx9-0000000CmfJ-3U9W;
	Thu, 09 Jan 2025 17:04:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvuI-0000000Cm58-2T5A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:01:20 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so1703130a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736442077; x=1737046877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVrZuOPicx40LZ7Pk/cINDz4MDtaqPATdujWA3ojg2w=;
        b=TqoKTjD3Yn/w6e1+pTLrioKKWNkCFoAwn+qAP+zJjx9m1yOX8qGihClU69fQXhGzKN
         7NPHX9BcTpVtHhYCMwHW5rowQoqsQTtMe5g/eKLlYEFpjedmqVzQT1kVPsfI7UcrpOPu
         j27AcmI+9qvxudnUnXyFldCmo/DrhJjyjJAFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736442077; x=1737046877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVrZuOPicx40LZ7Pk/cINDz4MDtaqPATdujWA3ojg2w=;
        b=B7fgCoUeV1Vs55LF5QC34nJKkr/g/h69LvyzjzsZN6PimkMbdGx78hUpODEpCYKLQ7
         4L9t8HmF7VG89ZYgB6I2fkx1yDGPADJPwTDyO6FSIS4CC4gobJFyroPGhwK+eFhj1bSD
         1KKqvpgDKlgpVb1mjG2hcYFHq567UPvt1pel8UlPLkjbL/uK/wvaG6O3Va4u0/KVE2Mh
         s3Dv9lSLy1Pa4u76t5l7stbwDGoKoeZSwHMY2RDF9YlALD6Mde7yT5ZV75fgb26HqVmb
         rfll/04T3Wrfw48/jxDpiWIJeII/kvy2OvdGNjklt84+kMpGpYUBPNhKSXHVeEeVwJuD
         rCYA==
X-Forwarded-Encrypted: i=1; AJvYcCUG6iVGXVWdLzuo+nKG272Gad34uOez943/AqY8TRl0NcGTHB0AV5ZGbutonTI2/it0FYdTBeq0MbIK3LQxf76N@lists.infradead.org
X-Gm-Message-State: AOJu0YybUagImvx/yXD8HLrDtE5L4jKNPWECRUrYNKus82uWiCdhP63b
	OpntXKSUcpKN+9/IQCGljbQKpD3oNhJFTn1A3kMCunx+AIXKMse7S5fyAePuUg==
X-Gm-Gg: ASbGncsLz9DwT8WG8LuSFGDwiuOKBp3nxxANLpwzhilmYKvsWuLoIKfhiDtKLjMQ1AJ
	ByOgatSHAT+9p2NjaKw1vu0qm63/FrXAtx/hHKPuKbaC/kvESGTBtx9q2vdfAt5YYnhhZgswNXZ
	KPIJmPb7QB17vnJKpwUz0zMcS24CSTLQ5OKuloxR1H3MlxD1gccMKN5QNJn3BhZbs7Y/pADYNjE
	qxON6xNEYQlLJrA7uJGaZjP3QtsYj/GQinzNJs5XFWtKNQTyRRCpOBizQkJ3w5FX/1t5lXz2WAV
	qitsldUql/1TtVO0UXM6
X-Google-Smtp-Source: AGHT+IHLNR8sD2960MANOCP/Ts7EAhg6rlWpqLrdAbKDjCaJDc4xJvvdgJ4/Xtelh6+Q/w0pBPOuCg==
X-Received: by 2002:a17:90b:538b:b0:2ee:f19b:86e5 with SMTP id 98e67ed59e1d1-2f548eae0eamr11707164a91.14.1736442076965;
        Thu, 09 Jan 2025 09:01:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm1818136a91.30.2025.01.09.09.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 09:01:15 -0800 (PST)
Message-ID: <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
Date: Thu, 9 Jan 2025 09:01:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: account for hotplug memory when randomizing
 the linear region
To: stable@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon
 <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Petr Tesarik <ptesarik@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com>
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
In-Reply-To: <20250109165419.1623683-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_090118_658631_37EC7647 
X-CRM114-Status: GOOD (  15.87  )
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

On 1/9/25 08:54, Florian Fainelli wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
> 
> As a hardening measure, we currently randomize the placement of
> physical memory inside the linear region when KASLR is in effect.
> Since the random offset at which to place the available physical
> memory inside the linear region is chosen early at boot, it is
> based on the memblock description of memory, which does not cover
> hotplug memory. The consequence of this is that the randomization
> offset may be chosen such that any hotplugged memory located above
> memblock_end_of_DRAM() that appears later is pushed off the end of
> the linear region, where it cannot be accessed.
> 
> So let's limit this randomization of the linear region to ensure
> that this can no longer happen, by using the CPU's addressable PA
> range instead. As it is guaranteed that no hotpluggable memory will
> appear that falls outside of that range, we can safely put this PA
> range sized window anywhere in the linear region.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Forgot to update the patch subject, but this one is for 5.10.
-- 
Florian

