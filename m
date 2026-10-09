Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41A4CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoAcjmTGDMQ7W4hCyrQKpaXZFHre/1+/rFWZj/Zjma0=; b=xSbcM+mFETo2+9zTuzahkRpGog
	UE688THnu8L6AK08CSqPW36RW+6gObEcDohAxxO76dhMC8E4bZv3FBPY5oOypaWX0eLfs1glyzeNs
	JpwgMbfuqipTy3CwFs5qtrHc0iLYPoYf/9BC2fsy83AVrZQejqKWUmmRNmTE/cu4S20McPmFNN6u+
	qXOUAp9Hj8m5jBxkBqhXesr3qzFJ2GoqaUg2swCLOcdA3Ltc9vs0QCU9gfiYCZwkAWY7fbpRQ/ey+
	/VpfpG/uDZdixNzNQr2caVykW1B9vYws85Ziae6Lp/saZITVi62n7wgP1t606MDYVBW8OkUg+TdwO
	6sYQ695g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFD1M-00000006bqS-3pnv;
	Fri, 09 Oct 2026 16:00:32 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFD1K-00000006bpi-1irD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:00:31 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3a813079a55so1299236a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791561628; x=1792166428;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BoAcjmTGDMQ7W4hCyrQKpaXZFHre/1+/rFWZj/Zjma0=;
        b=Ds0F+PzEATCFNSrsHVI+gNkwc73N/5ScKA2IhvkFTNc6GznfFNPCBD7sNLNGz1uBXJ
         /glS55XIJMTKua7W1iFSYkakx98+k7oXAhyUmFNFLKwkvMtLRyz++RtMTK6Kz8MVVERo
         1SZLhG+yqZ/F9Q3Kd6scvD9FFE+3rWQ37bck+2TyXD0lalcZ63uUIXRO/P0brmunAkL0
         zQiGWYoT7Qbk4DdDVlQOViVbAbI1kAmWQK+z72EK4mjMW5Ky/MesiCIBPfaNwp/Cdu4y
         uJmrOiioRIYit6HGf/LmtcM09w1jSJ/DBki/pxz7AuVWzksIp7cKhstjlvu9JSr0brwo
         Py/w==
X-Forwarded-Encrypted: i=1; AKwUvBx4CVujjPhCBVMOySpBbvsDw+lqs6mqnoD++73gz5NSOfmn8QAQwLkwtBRauPo5uq6eTv3LwipIg6FHQeve/nbK@lists.infradead.org
X-Gm-Message-State: AFq9FYLJu7z3NE7U1hFOQgN3fI/qco0IEgXX3UQQ3Tn629tI/4xpVVMM
	n0XGj2SKd0dFtFL77JZ2rsngKaCgfTQW67iFBiH67CoYOkodidX+V3SCFjIFGK7dPqttp6Q31ZQ
	eyoUFcjnazI9Rk/fc3WVbgcWgSjxCvT9CMmm2aaIPmGQRpi+a4GfQo3OF2aSR2Cui4tzTTU6av3
	zz4JMEiNj+IZOyFcbJeDk1URig+CFnf0MlenRl/237pHzQKvuHWUlSG7nVTc8q09JKBeO5UN94w
	OHde91Oto/7aOyeho/Bv+CnX0gjPkRJIr8=
X-Gm-Gg: AYBFou0QrExCWMaNYKeOTvlRS5eSxO/m+M0n8oNHe/9mhp9OZvx0FuYO0jWXsCZHEKH
	hy6ryJzg49asD1TcIp7gwKE0Jki0JuHPAXPwt0JW3bESnirplCHI1sYMThdEG3HoumPKLrhpVDy
	NBQrVciVTIDh0YOl25Yq+xN4oos1HU3OFY47dijDAF9L7WAY8FutQMFxdzPH6BgQX9b58nusbP1
	2lrrZkKFklrSjEoX82d+wKiMMJk0gFlEyHVaQiy59NrFnmQu3maEK82QrpF7R1QJM+gwQ9yT35R
	1dnDPyYjNjLARKoY1gxU5NqtzEgXKxkTkkck8rIFzHXCXIfiNMczbK4eHnRrPIlFq9KNuKSXsil
	PbkvkWAt8LY6efc+uaAk+0JkCJzWiO4cUwsF/YM/4mgC7szdGE+9QKnXEsq6cDZCmH573glxolD
	q8YIXYct2z+lLiQUKYB7Pj3D3YUEp0VIP4LDATDhOn
X-Received: by 2002:a17:90b:3145:b0:3a8:a62e:d6db with SMTP id 98e67ed59e1d1-3ab36f1a530mr1953283a91.54.1791561627840;
        Fri, 09 Oct 2026 09:00:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd3da0634d8sm107711a12.17.2026.10.09.09.00.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:00:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1301381a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791561626; x=1792166426; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoAcjmTGDMQ7W4hCyrQKpaXZFHre/1+/rFWZj/Zjma0=;
        b=Vg51/qMW1H76xWeL8kLXQKLpk3YT7QeJCbaqujph2icVKgn209hG0CgzbsReUum5yp
         l9ALzsnCTJHJZwMgUl5o3BKWCEFq9vBR9aRtfkeEsiY58DdMZvdjpsglqHP6ohqZnnAP
         2Hwd7/A8lXDTzHhVpcrPPDaPZAi8QtsamRM78=
X-Forwarded-Encrypted: i=1; AKwUvBy4p3lBWBR0Eay0lJb/P5XXsoR70d5HSDtCxscm+33ZDYWbbWkKhzFTmXSa9dekrfTTtc9shRQG7IdX7pGPA8I9@lists.infradead.org
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr1568078a91.0.1791561625667;
        Fri, 09 Oct 2026 09:00:25 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr1568053a91.0.1791561624978;
        Fri, 09 Oct 2026 09:00:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d3b4f7sm2008141a91.0.2026.10.09.09.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:00:24 -0700 (PDT)
Message-ID: <688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com>
Date: Fri, 9 Oct 2026 09:00:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove {sbranden,rjui}@broadcom.com
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>
References: <20261009060035.544789-1-jirislaby@kernel.org>
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
In-Reply-To: <20261009060035.544789-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_090030_488360_C1AD59BF 
X-CRM114-Status: UNSURE (   8.36  )
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

On 10/8/26 23:00, Jiri Slaby (SUSE) wrote:
> Both are bouncing:
>    Final-Recipient: rfc822; rjui@broadcom.com
>    Action: failed
>    Status: 5.1.3
>    Diagnostic-Code: smtp; The email account that you tried to reach does
>      not exist. Please try double-checking the recipient's email address
>      for typos or unnecessary spaces.
> 
> Anyone knows if they care about the entries/what's their new e-mail
> address?

It's first.lastname@broadcom.com, can you resubmit with that fixed? Thanks!
-- 
Florian

