Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E0C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWbMHscGv3Im0bK3TqvB+ES1zeFnt/cUkhROc17aQ2U=; b=gYXXRnhOSWSVzkd4AQORdT6kAF
	LLlLEieT2lV8V9PiQC67vnaMCbYWTM3VVitewvYIbeRslGNZNRElCsjT1vX50XN0NVldWQMv80uS3
	RUD623ldiiQF1LxKXeLa8TNwgvPn1CwlLWg8lKe12iAQDN+uKaOm1d+pcLCxoIbsn4oqkkJMUFtnJ
	LQzq4rFbPXdfFZWDnEbBMEfY/Mbbajp32LwAbK9cDHoQ7hclbDwGTkfw6cSR8D2W+Sm8z1y+J2efR
	BiBEC+4UwSQls/QoTs7xo9Aw7K8gJnktTHhM3l4I8F+h9SLR/GkpKRaxGxJ8EAAsfvWA/5ekc4sBQ
	1suUz27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRt5-0000000DmCh-0Vfx;
	Fri, 21 Aug 2026 16:14:35 +0000
Received: from mail-yw1-x1161.google.com ([2607:f8b0:4864:20::1161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRrv-0000000Dliu-1a3V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:13:52 +0000
Received: by mail-yw1-x1161.google.com with SMTP id 00721157ae682-81f64e8dfbcso18199467b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328799; x=1787933599;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CWbMHscGv3Im0bK3TqvB+ES1zeFnt/cUkhROc17aQ2U=;
        b=oqqRdBTrrvX8FTJi77wzjuU3nSqO/a7zdofOZrnnqaD4nDGpooLYYKV/PFFCIqhcsx
         AwOoKlfQwq9J3K9YL1mRFcoEetjXHRqsysK4HNxjPL5Y0QgadA10KsIQTE1cCl9lx7/O
         IiDtdm1JOsK6IvnIuXXNB1RrgTl71wKXbsrPqN1v3tCOxYqYTffTnfywCWgbSTcEw9lK
         n9OXzXbuEstdwFDqckit33/3WOcm2yMzIZ4/+HeOgTq3lSESy7mQ34Peo4xDIY6mm1fJ
         aJn795rFfJ6A2THQVDJl8svJ1I9FcLvtJq0P3HLoX8O0oKzToZTFn+ViwrlI9szCNQAj
         FdLQ==
X-Gm-Message-State: AFuF++m9RUJC4szijNM1LRQT1G3wBG/jkbtvLK5x+J02lVlgRCIJXefN
	olPQ/9sxiVQjzV7gkjvHms4tc5bGrLJhz+KLF+LW9E/caTkLvy00mANDUqdeoir1RYOFIsP2B1a
	Z4O0B5P4jLkw0t8oRGr+EJ3GkMBkEBXI6hMoLWvnfkZb3SP2EF3lfL1cRC4yOviPATWULfDJxuq
	pFG8SKP3SfANnvKcGH0d1s4I6cfQHtqivGwFxfqod3sYq8up1Ge8pjobzvmpR03S7k3zLlzul0J
	Nk1MrJwGwCHbPpmliL10Vt4K4FgXvlp0DY=
X-Gm-Gg: AR+sD12DbKQ1xOJOaSmYpafCtL1Zf6Z+DjvmQJrsVbM/H6KQgaNF/fPht4OK+yOH8rr
	zwNbSxGAcMOnXxXYAZ2tmwzaTd+96sR8hPNTdJIkprb6P1qUfg6NXFTOTvdiagy0YSFSCPxlBXs
	RSMGH7Mj6E9xfrVmBGZkxKJ+rglcq3naxrZlYwiqe6/Zd6ZVGbSEFYsactiv/aE2MNG6W09sHet
	vpST4W7GZySC06PyeTJJTJG+xFo05ZT0jFzRW4GJ9qLRhUsVXWpqFCCRh9/e7DP1zVRtz0ddfAQ
	HMsdLxxIfyctZMQeyZSkSLy+nvPK8CX8DOB1PcjtYvdVVVG9ybc+4ql+p55xUnQG/B18OJmbu9E
	dIMSscvASMjcEfjD80RByxsKTx7eVkEcipMcxpk2lCplvQMFvcuDJtFG/M3KfUKmW2T5g33V5mx
	i3YhFNIZMTPZVCEpi7Lwks3s6ZsXBoREkZ1jNPFcTi
X-Received: by 2002:a05:690c:4d42:b0:81e:deab:43af with SMTP id 00721157ae682-849ef58f831mr37961477b3.4.1787328799226;
        Fri, 21 Aug 2026 09:13:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-84512a45979sm1464867b3.1.2026.08.21.09.13.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:13:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c16711b9473so96983966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787328797; x=1787933597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWbMHscGv3Im0bK3TqvB+ES1zeFnt/cUkhROc17aQ2U=;
        b=UpWI9uq0+Yrq8pDLmj8dWxQJy5KdtRK4BegtEnpEuEqSZb9vRqT441KmhZFGsZJ5E6
         CQKQHVcZocuxZ4k+PTGyhskOeCl08J8VtzJ5RUxpNLlhBtIcAiACNwjQ31yWr8pLSWgj
         +zIsRqEz8mJ2dYuCIrLeSuNkSvEMxWIav3P0A=
X-Received: by 2002:a17:907:1b09:b0:c21:85e2:7427 with SMTP id a640c23a62f3a-c246a4c7741mr796436366b.6.1787328797752;
        Fri, 21 Aug 2026 09:13:17 -0700 (PDT)
X-Received: by 2002:a17:907:1b09:b0:c21:85e2:7427 with SMTP id a640c23a62f3a-c246a4c7741mr796428266b.6.1787328797243;
        Fri, 21 Aug 2026 09:13:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c245940c46bsm641027466b.59.2026.08.21.09.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:13:16 -0700 (PDT)
Message-ID: <7c07327b-2a56-4f62-b1ad-846bff980029@broadcom.com>
Date: Fri, 21 Aug 2026 09:13:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
To: Thomas Huth <thuth@redhat.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260821084145.207635-1-thuth@redhat.com>
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
In-Reply-To: <20260821084145.207635-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091323_472870_C7EF9769 
X-CRM114-Status: GOOD (  10.97  )
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

On 8/21/26 01:41, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Please send it through Russell's patch tracker, thanks!
-- 
Florian


