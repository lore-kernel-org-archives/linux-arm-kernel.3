Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E7606EEB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gi6e8TDT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=O7CvlFch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3LWSzGS2M4d4ZV9UBRwC/myQQ0a6KadX0vuHW/VG2Go=; b=Gi6e8TDTvVCj7C
	hZ2KJAvX3uGBpNHrY8rDLnrWhrE/rCw5ZyenxxJNS7/It8n+skVp/pd7tSiz7yx1db7wa+b5+X1GF
	vzQbOurudXcXKXuycicXU/h8IuIN8CibBJ7KM7FhfV1oHNk3ebBJ7eNJkhId3u0a+qylI6D/0SM3o
	5kl8Tdn2oJkkrHDKDF6CNjJB1isXmN2avtEnPwXEBNMxiXZxtTDHxeZv119m/nVcZ3wZljAfFaKM0
	lBmCuU4RTNdDDMyBO2cM4Z+WItGKWHIt58hWp5zpDx2Y3ZdnV5jJZtVkpk+3kWttNCWvc0dDuGioO
	C8elPIbce8KhDqltPuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgCn-00000006V2O-09q8;
	Wed, 04 Nov 2026 18:59:29 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgCk-00000006V1P-0xDS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:59:27 +0000
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id OIFfx0q9GAR1iOgCixvfoH; Wed, 04 Nov 2026 18:59:24 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OgChxWRapNBINOgChxyPw6; Wed, 04 Nov 2026 18:59:23 +0000
X-Authority-Analysis: v=2.4 cv=fvzcZE4f c=1 sm=1 tr=0 ts=6aeb808c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=uChsZFC9AAAA:8
 a=ZYZN6JFVlrb8GS7rZWoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ULtXvzFHYWHLyBAuiDia:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=3LWSzGS2M4d4ZV9UBRwC/myQQ0a6KadX0vuHW/VG2Go=; b=O7CvlFchzVm2
	LU9Vh4hwKtXjicNibNvf3z13BbgzCY+AO3XQmrUM/u8oDbmlu61BLS/+3l+AVN+CZ7+htDmZjz4cp
	aKKR6eoxL3s/zsruvjHM8tLvFn0QjZcFmK967lcguf2GGKr2Lj/3TFxzOve+6KI9HVwvQIQaqjz3i
	tw9tM2IL1nfTYwbGYUa7bmb8NSnM1ZQC67GSu25OH4zZH1Qk7Ri0EZV+Irn1SBmFdiVnJoSv/PAvu
	X3e6diYrCCYYw8nBMHva8FpsXLcA+TjA4tu8oicvvHBBM4NxE2TNiHcY1uxvQN+4S3TPYNSXnaUNT
	E02szdHQJKrHu0qjOY8JQA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49340)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOgCf-00000003kFG-3QtC;
	Thu, 05 Nov 2026 00:29:21 +0530
Message-ID: <fe63bd63-bc70-4acb-84c5-225fb11021b2@roeck-us.net>
Date: Wed, 4 Nov 2026 10:59:19 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC
 function ids
To: mateusz.nowicki@posteo.net
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
 Evan Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
 <37f9e5e73070972f224583bc1581e400@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <37f9e5e73070972f224583bc1581e400@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOgCf-00000003kFG-3QtC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:49340
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAmZr2fVCwGFYYiHyfktL96S4kDQqFZdo81yFPInUaftWTqowRaXqqeBoQS52vwTUc5Xmdbv3ejEFp4s43Tt9zAvLhU851I2uzxsqhvw3eWc/7K4XIDg
 ZkA/8CE9pinfcLdyOJnefpqI/JBz8y/9KO8zD9OYaiBOlLD7BSJzSF2ijVR8yi8YPXiA73YMxU5PI9dYBTYivm40ORlBK/O+fKKJCmX48O0wMN+oTUiTg6rj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105926_340536_A201BF89 
X-CRM114-Status: GOOD (  19.68  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 10:10, mateusz.nowicki@posteo.net wrote:
> On 11/4/26 Guenter Roeck wrote:
>> On 11/4/26 08:16, Mateusz Nowicki wrote:
>>> My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
>>> of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. That
>>> made the watchdog work with current OP-TEE, but it broke boards that run
>>> the older firmware. So today 6.18.y uses one id and 7.4 the other. When
>>> the kernel and the firmware disagree, nobody pets the watchdog that the
>>> bootloader started, and the board resets after 32 seconds. Marek hit
>>> this even with a recovery kernel, which is about the worst place for it.
>>>
>>
>> So the DT on the board is updated to use the new ID but the firmware itself
>> isn't ? That seems a bit odd; I would have assumed that the DT on a board
>> is kept in sync with its firmware. Is that not the case here ?
> 
> Not necessarily. On these boards the DTB is built from the kernel tree
> and installed with the kernel, U-Boot just loads it from the boot
> partition. TF-A and OP-TEE sit in the FIP and are updated separately, so
> updating the kernel alone changes the ID. That's how Marek got hit: he
> updated OP-TEE, but his recovery kernel still had the old DTB.
> 

If the DT does not really reflect the HW, is installed as part of the kernel
image, and the ID can change across FW versions, it seems to me that it does
not even make sense to store the ID in devicetree.

>>> The idea from that thread: let arm,smc-id be a list. The driver tries
>>> the ids one by one and keeps the first one the firmware accepts. Older
>>> kernels only read the first cell, so they behave exactly as they do
>>> now. For stm32mp2 the list is <0xbc000000 0xb200005a>. Calling an id
>>> that belongs to some other firmware service would be bad, so the
>>> binding says the list may only hold ids known to be this watchdog.
>>>
>>
>> Would it possibly make sense to check keep a list of known IDs in the
>> driver ? It already checks 0x82003D06, so it might as well check a sequence.
> 
> Fine with me, and it avoids the binding issue. I'd just rather not try
> the ST IDs on every platform, so how about making the list per
> compatible:
> 
>    compatible = "st,stm32mp25-smc-wdt", "arm,smc-wdt";
> 
> with { 0xbc000000, 0xb200005a } as match data for it. arm,smc-id stays a
> single u32 and, if present, is tried first. Older kernels just match
> "arm,smc-wdt" and behave as today.
> 
> If that works for you and the DT folks, I'll send v2.
> 
Works for me.

Thanks,
Guenter


