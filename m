Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KEaB2BYB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rP2S6qUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j/qonkLTfSJS6fOcfIBVACKrRZK2oHEhnPOu7N9/zz8=; b=KEaB2BYBRof6il
	SCzXrL8ImIMbv2bhflLP4mJ/vzRUGUUDPy28BQzrZzOgd/ZmiK9jntUn/0aqdnbDydNPKlQT+QEDD
	0KJRTz2JfqDn0Yr0zdcy4YZizn3LD47nu+juDEvwtRiZ8iQm76BzzGlefaUe5qUyXw63iX3zPlgH5
	3y+R/zDlC/As8socV8lRO9WbNo0cJ9djCfjG6GgadV+Dml6ETJq/7xjUkNTP37xd2dxHWls7h3e89
	h2BGjZvh9XZU2jLDZUmIQDfH9DbCeJThB3Pd0aqUTcq9zxFHTdPlPxNPVwEzLU2Yvb1bVqVfg4OXS
	ZmOarIxsypVKpzuOX5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe1V-000000061RV-2M1Q;
	Wed, 04 Nov 2026 16:39:41 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe1R-000000061Px-1Ghz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:39:39 +0000
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id OIa2xS6VC4vCDOe1PxWQU8; Wed, 04 Nov 2026 16:39:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Oe1NxNivXVqSeOe1NxoFvC; Wed, 04 Nov 2026 16:39:33 +0000
X-Authority-Analysis: v=2.4 cv=eLETjGp1 c=1 sm=1 tr=0 ts=6aeb5fc7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=p-LfKV-GAAAA:8 a=14k-HqQmNQMTK8QvfVQA:9 a=QEXdDO2ut3YA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=j/qonkLTfSJS6fOcfIBVACKrRZK2oHEhnPOu7N9/zz8=; b=rP2S6qUD2i+9
	HPp78wilmv51lPsJeYeSL2+Q992YgG8wmyBV8UHhCQaaCj+XNlWTLP49bOIFZlJxpMJQqskrNV1cI
	PnTqxVJwwABcrId1lVrr/DIfCTfHBeaYZBbzneINJzlpbM++M9QyYMRYTTe77kBfZlZUCGiW6h3T8
	pp7jO8yQ2iIZ4KouhqodhcjpbtQqWeWdXPDNUaOspyXHA0WeCD4sVWY5dvra1xuVF3+2KohwcuLWA
	1qnlbIlhrbog65pGimvDtWupyLt3sdpY8Q/WySQSASpiHIzybLVSuQHa+8QjB5ZHN0k5V9BHb14eA
	EW8CJ9wtFqUJa++7UoaqDg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44006)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOe1K-00000002Xpu-1SC1;
	Wed, 04 Nov 2026 22:09:30 +0530
Message-ID: <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
Date: Wed, 4 Nov 2026 08:39:28 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC
 function ids
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Cc: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOe1K-00000002Xpu-1SC1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:44006
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAc4s1e2D2j+sDhYgYVEGL84a0ZRgSMHu3tSkZv3wk7glGOzMxxUEou+pcORZPK6yNoD5ZL2JYMXXpMXrQr5mNT277AjGAX8LWQMTkCxkE4aERqtlxNS
 M+LvFzMzGyrYO2tZ1glBFYCDWOuPZaYGR7SzMKz3TnekEmHkFChq9ONPsrOzyfOyzTmW2zFHXfHQ7TlN4c2uDzoTycOxBn2azWZgzHW2UwMbllFrwNepCuiO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_083937_417369_5CABB660 
X-CRM114-Status: GOOD (  27.15  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 08:16, Mateusz Nowicki wrote:
> Hi all,
> 
> this follows up on Marek's report about the stm32mp2 watchdog [1].
> 
> A quick recap: the arm,smc-wdt driver talks to the firmware through one
> SMC function id that it reads from the device tree, and there is no way
> to ask the firmware which id it uses. On the STM32MP2 SoCs that id
> changed over time. ST's OP-TEE from ecosystem v5 expects 0xb200005a,
> their 4.0.0 fork accepts both, and the 4.8.0 fork as well as upstream
> OP-TEE only accept 0xbc000000.
> 
> My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
> of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. That
> made the watchdog work with current OP-TEE, but it broke boards that run
> the older firmware. So today 6.18.y uses one id and 7.4 the other. When
> the kernel and the firmware disagree, nobody pets the watchdog that the
> bootloader started, and the board resets after 32 seconds. Marek hit
> this even with a recovery kernel, which is about the worst place for it.
> 

So the DT on the board is updated to use the new ID but the firmware itself
isn't ? That seems a bit odd; I would have assumed that the DT on a board
is kept in sync with its firmware. Is that not the case here ?

> The idea from that thread: let arm,smc-id be a list. The driver tries
> the ids one by one and keeps the first one the firmware accepts. Older
> kernels only read the first cell, so they behave exactly as they do
> now. For stm32mp2 the list is <0xbc000000 0xb200005a>. Calling an id
> that belongs to some other firmware service would be bad, so the
> binding says the list may only hold ids known to be this watchdog.
> 

Would it possibly make sense to check keep a list of known IDs in the
driver ? It already checks 0x82003D06, so it might as well check a sequence.

Thanks,
Guenter

> Why RFC: arm,smc-id already exists in firmware/arm,scmi.yaml as a plain
> uint32, and dt_binding_check complains when another binding turns it
> into an array:
> 
>    arm-smc-wdt.yaml: arm,smc-id: multiple incompatible types: uint32-array
>    arm,scmi.yaml: arm,smc-id: multiple incompatible types: uint32
> 
> DT folks, is there a way to keep the list in arm,smc-id that you would
> be fine with? If not, I can move the extra ids into a new property,
> something like:
> 
>    arm,smc-id = <0xbc000000>;
>    arm,smc-alt-ids = <0xb200005a>;
> 
> The driver side would stay the same, it would just read the fallback
> ids from the other property.
> 
> One more question: should patches 2 and 3 go to stable as well? Then
> 6.18.y would also work with both firmware generations. The 6.18.y
> version of patch 3 would turn its 0xb200005a into the same list.
> 
> [1] https://lore.kernel.org/all/1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com/
> 
> Mateusz Nowicki (3):
>    dt-bindings: watchdog: arm-smc-wdt: allow a list of SMC ids
>    watchdog: arm_smc_wdt: try every id of arm,smc-id
>    arm64: dts: st: list both watchdog SMC ids on stm32mp23 and stm32mp25
> 
>   .../bindings/watchdog/arm-smc-wdt.yaml         |  9 +++++++--
>   arch/arm64/boot/dts/st/stm32mp231.dtsi         |  2 +-
>   arch/arm64/boot/dts/st/stm32mp251.dtsi         |  2 +-
>   drivers/watchdog/arm_smc_wdt.c                 | 18 ++++++++++++------
>   4 files changed, 21 insertions(+), 10 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4


