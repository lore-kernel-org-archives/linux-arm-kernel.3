Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7486DD5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0sUQjvOBk5B7kF86MBReNvaIgs7XdYt9a7X6u95KvI=; b=xxWluK9PTVrVbpmZMuAnFChrOM
	liIuurDidoFhGu6gS4p9xhptlxR0UgolBemSYHF804ryPxeSwHJPjcrOf8eorNbDz9gOdRHF717yr
	nWXTNChcl+KdoKCsELE3Z0hPXkVSZ7+8gpsbwfyhO3qruQx+yE1zZav7eCNxoqPU1Sblw34WRNzGp
	p032iz1RTgDlw4hsdnBE3GPfsmdLaOWztcHGeU6HQcj9rgRGv2THdZnHeyiia1KTF14UD8zKqrITD
	lyven8pISobCUxYXOQt92XgofFUhbZN5tE3jvmdmFhm/LTJdHuSOjNsTTYNvuSkqEKRFZ2QNulg5e
	EMBnDGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Q3O-0000000Arf6-398S;
	Fri, 08 Nov 2024 14:33:38 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PdP-0000000AnK7-0AYM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:06:49 +0000
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id 98ChtKv3CvH7l9Pd7to684; Fri, 08 Nov 2024 14:06:29 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 9Pd2tCnSxmNYj9Pd3ttILn; Fri, 08 Nov 2024 14:06:26 +0000
X-Authority-Analysis: v=2.4 cv=fb9myFQF c=1 sm=1 tr=0 ts=672e1ae2
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=N0_SVMCKczatFtdaR1UA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G0sUQjvOBk5B7kF86MBReNvaIgs7XdYt9a7X6u95KvI=; b=D1lJq6uUB2SbYrHNUsyv+lKoap
	tPXxNaSsKzycBkj8viPTPeuQzaW2EhEhocHzUx+kw5ShOtGEToD5zrtzAtnPgPAyJvO3EJOCY3Ys9
	C9Grhy7VZFJ2EWAAAjMwO8iFmLWwygp8FBgFyIFI2v4OZCeZs3OY4w3TBaVchSyO2hCYoOGETBvsh
	O/uJcRK84TBuP/s2oBKlhvP9lFNUfF6nwmitZ9jq1YnbHnXsocIhpDzeS3VNWZOPebThnK3zMui5+
	ivFDNY/bWMMhJS0Ijpp8xZl3+Qbk5zo6eqGElJf64EWJHO57KjEUPpjfwPAj6HS9AyRRsOAp5Pl66
	3o3FL5cw==;
Received: from [122.165.245.213] (port=41996 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t9Pcx-001wS1-09;
	Fri, 08 Nov 2024 19:36:19 +0530
Message-ID: <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
Date: Fri, 8 Nov 2024 19:36:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>, Andre Przywara <andre.przywara@arm.com>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <Zy4SKCBwce3q0yj5@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1t9Pcx-001wS1-09
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:41996
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGp5bQgr9nGtICjY1H96pRubavYQohqCj8ciLydGsM1ljzopPIPXEqMXkIZflUmmeIm90nr+5++5HI8MvnMvBBC5Z0Ut9EwjIb51OJ3dPA8Rmr3LZhp+
 wLSMxH3S4iJECKJcqMc0P4EJOW8t0zlzAHG6jX9P/ZaYGJT0Q49OgzwrzsFdXW8gGOahHHBPdDIHDVk3mvbg5IryJdxRYnyGK2cPthqNpHXeP4I8Lopq7WyZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_060647_124955_17BADD8F 
X-CRM114-Status: GOOD (  23.41  )
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

On 11/8/24 6:59 PM, John Watts wrote:
> On Fri, Nov 08, 2024 at 11:53:57AM +0000, Andre Przywara wrote:
>> Hi John,
> 
> Hi Andre!
> 
>> Can you say *why* this patch is needed? Is there something broken that
>> needs fixing? Where does this show and why wasn't this a problem before?
> 
> Oops, that's a good point. There is currently a bug where the LCD output will
> be tinted. I have full context here which I should have probably linked in the
> patch description:
> 
> https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/T/#u
> 
>> To be honest, given the isolation on this patch, I'd rather wait for this
>> full fledged solution, especially if there is no pressing need (see above).
> 
> I'd be interested to hear if that's still the wanted solution given the link
> above. This currently blocks many people from having working LCD output.
> 
> Doing it the proper way might be overkill for now unless someone deliberately
> tries to run two DEs to the same output. I haven't seen this use case.
> 
> Allwinner kernel fork initially sets them up to values like these then makes
> sure both DEs can't be set to the same TCON.
> 
>>> -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
>>> +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
>>
>> Sorry, but that looks weird:
>> First, please explain the 0x20. Is it bit 5? If yes, what does that bit
>> mean? The commit message suggests you know that?
>>
>> And second: the comment above clearly states that those two writes just
>> *clear* some registers, to have some sane base line. So please adjust this
>> comment, and copy in some of the rationale from the commit message.
>> Explaining things in the commit message is good (so thanks for that!), but
>> having at least some terse technical explanations near the code, in a
>> comment, is better.
> 
> Bit 5 is value 3 of TCON_TOP_PORT_DE1_MSK. The R40 datasheet explains the
> values of both masks as follows:
> 
> 00: TCON_LCD0
> 01: TCON_LCD1
> 10: TCON_TV0
> 11: TCON_TV1
> 
> So this sets DE1's input to DE0.

To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
R40) states the priority of the DE selection, which fails to work? Not sure,
may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.

With A133 following the same as T113 with single mixer without TV, still
sets 0x20 in vendor kernel.

copied from R40:
Note: The priority of DE0 is higher than DE1.
If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
DE0 will be used for the source of TCON_LCD0.

Thanks,
Parthiban

> 
>>
>> Cheers,
>> Andre
> 
> Thanks,
> John Watts
> 


