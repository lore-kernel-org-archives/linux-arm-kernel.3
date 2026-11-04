Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF6F606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eh+PhL2a;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=J5/mxXhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5OwW+SfjYYUJ0QH9yKR4JOcy3/2WNa736ug8KBYjC3w=; b=Eh+PhL2aRnUI+/
	sD+/2jutJzHlZDnIkB1OP8eCXZ1ELV1wWx+um+/vUOPMdAAYN3sWBKjsdWpOYsQBmMzVGSZcrXLKk
	7CORxqWWRtYawxV9FUFBf2KUJi00oTWNNUuXGdjtc1S6tqK1sMECsxHeKTIwiO7x0cjz6yN34202a
	jlMIH0B4gv1ROTIY6pGpKEjKMplr1RxD5HfvS75vs7XGMuroy6LgC5fFENtR8iqE+Su0Of5vEBGGy
	17IXS2XgZq+XnpdlHQ3TYGNAopRc9BdPMPLRuGk1mPzm7yQ/NFJybHOYpSO3hgf042wLME8FjXJX6
	nZK1ugDLucVc1AhL2dYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHO-00000007mzr-1kBy;
	Thu, 05 Nov 2026 04:40:50 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHM-00000007mzB-22yC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:40:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E85C108F80;
	Thu, 05 Nov 2026 05:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793853638;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5OwW+SfjYYUJ0QH9yKR4JOcy3/2WNa736ug8KBYjC3w=;
	b=J5/mxXhhDH5mkybAcMGCNjxsdyk3bX4hRAXXnSF4YQDcHTnHBs0vEtw/Ose/80IkaQRvNK
	7/NutXm+nhU8ut5+MbW7br2rgqiqCVL+V+OnjOKY9KxrXGXGpZvCnOLqv6JfdEsq17tplX
	EIK7fkMvTGaHHBTohnRbYaiY+42ACbokya+DEl682O8XaRnMTScmT+Z1zbLRl2lRmGqNqD
	Gjl4I/JRPTxGV4s/JJ4PoUQQ/wG7/2owL85e7aTJ6qF3ES7DPONafp4xHEDATCy2bereZf
	JIbF+kjggqjacSgcyKRpin5KocQj7ii7VrzbGdEo0fvPXlbOMRQLT4dg4ck76Q==
Message-ID: <43352a45-1f0e-4d16-8846-63861e4ebda9@nabladev.com>
Date: Wed, 4 Nov 2026 17:46:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC
 function ids
To: Guenter Roeck <linux@roeck-us.net>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Cc: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204048_771412_A92A6079 
X-CRM114-Status: GOOD (  22.18  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 5:39 PM, Guenter Roeck wrote:
> On 11/4/26 08:16, Mateusz Nowicki wrote:
>> Hi all,
>>
>> this follows up on Marek's report about the stm32mp2 watchdog [1].
>>
>> A quick recap: the arm,smc-wdt driver talks to the firmware through one
>> SMC function id that it reads from the device tree, and there is no way
>> to ask the firmware which id it uses. On the STM32MP2 SoCs that id
>> changed over time. ST's OP-TEE from ecosystem v5 expects 0xb200005a,
>> their 4.0.0 fork accepts both, and the 4.8.0 fork as well as upstream
>> OP-TEE only accept 0xbc000000.
>>
>> My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
>> of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. That
>> made the watchdog work with current OP-TEE, but it broke boards that run
>> the older firmware. So today 6.18.y uses one id and 7.4 the other. When
>> the kernel and the firmware disagree, nobody pets the watchdog that the
>> bootloader started, and the board resets after 32 seconds. Marek hit
>> this even with a recovery kernel, which is about the worst place for it.
>>
> 
> So the DT on the board is updated to use the new ID but the firmware itself
> isn't ? That seems a bit odd; I would have assumed that the DT on a board
> is kept in sync with its firmware. Is that not the case here ?

That is not necessarily the case, no. Consider a scenario where the 
firmware is old, kernel is new. Bootloader is not always updated in 
devices deployed in field.

>> The idea from that thread: let arm,smc-id be a list. The driver tries
>> the ids one by one and keeps the first one the firmware accepts. Older
>> kernels only read the first cell, so they behave exactly as they do
>> now. For stm32mp2 the list is <0xbc000000 0xb200005a>. Calling an id
>> that belongs to some other firmware service would be bad, so the
>> binding says the list may only hold ids known to be this watchdog.
>>
> 
> Would it possibly make sense to check keep a list of known IDs in the
> driver ? It already checks 0x82003D06, so it might as well check a 
> sequence.
I am unsure whether there are any standardized IDs, but yes, this would 
be good.

