Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C36606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DsY3iIKN;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=OF6qrx+w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9WkmYf7R4SGzBZAROx5aLx/oJoqChBMmnepUumVTYnk=; b=DsY3iIKNebWGW0
	uFHIKDblyzD0MOfjfmBiTAAE8HPsFOTddv7A2Uxou8Nef/Bhia47TLNRZiNneVvu0Wqm9kKOQEqaB
	AMIv6NPzz2caZr2QdcoFiWEjEnbidqfcXSZ68MbKLPj6CmI0AOliLntmlMzDoLKtysfo9uQoKwGrI
	z0qXlDkq2Opl4bNVKwm0YmtHGlNjVmD6+j/6A0WRhfNFQ/Nk7i8HASkFaHqzyFsE45rO05ZZEV+iC
	e+4de1Ro+z2wuDF8eLViHPPGrC4eAg2HotzN3S1DgA1zMnjQhLJTyNzbknvEoiCn34a2WSiRTq/DA
	88Oy+ZP/EAac5NjJGbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfRe-00000006MS9-3B2R;
	Wed, 04 Nov 2026 18:10:46 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfRZ-00000006MQG-2sx0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:10:45 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 90B1324010D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 19:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793815838;
	bh=9WkmYf7R4SGzBZAROx5aLx/oJoqChBMmnepUumVTYnk=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OF6qrx+wODiEsY1kg24OzHlmcY2J44GmixT/URw+Uy5VIKGWpJNE4lPIzbf2cFLm/
	 Z+1wptDWDG9bE6XRM249mIGrFXML9cOMdFAAx0AXXY3XxqgOP1RIdYu+Bc5tlrkLA+
	 cRcIOgaXaKt6PIet5xGHw6S85D+Krwh7O8KvduIrzB6LTDDrt2XtN/QuAul5MHtMNy
	 aJKd/8671w5XeTM4zQ2/wbHVuivELjBqUK3IrFHClTuHTPGiN9sicwsomGJsD3tJz3
	 CwVYHTFXWzPaQ8KTarQkS8fEPViApMpgRdRNyCpZsGqJthE9UZzGc5oANGK5WpeHGb
	 au9fPBHkeuUMA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKYQN2xfgz9rxN;
	Wed,  4 Nov 2026 19:10:36 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:10:37 +0000
From: mateusz.nowicki@posteo.net
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Evan
 Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] watchdog: =?UTF-8?Q?arm=5Fsmc=5Fwdt=3A=20allo?=
 =?UTF-8?Q?w=20a=20list=20of=20SMC=20function=20ids?=
In-Reply-To: <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
Message-ID: <37f9e5e73070972f224583bc1581e400@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_101042_927580_9EF06470 
X-CRM114-Status: GOOD (  21.51  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 Guenter Roeck wrote:
> On 11/4/26 08:16, Mateusz Nowicki wrote:
>> My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
>> of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. 
>> That
>> made the watchdog work with current OP-TEE, but it broke boards that 
>> run
>> the older firmware. So today 6.18.y uses one id and 7.4 the other. 
>> When
>> the kernel and the firmware disagree, nobody pets the watchdog that 
>> the
>> bootloader started, and the board resets after 32 seconds. Marek hit
>> this even with a recovery kernel, which is about the worst place for 
>> it.
>> 
> 
> So the DT on the board is updated to use the new ID but the firmware 
> itself
> isn't ? That seems a bit odd; I would have assumed that the DT on a 
> board
> is kept in sync with its firmware. Is that not the case here ?

Not necessarily. On these boards the DTB is built from the kernel tree
and installed with the kernel, U-Boot just loads it from the boot
partition. TF-A and OP-TEE sit in the FIP and are updated separately, so
updating the kernel alone changes the ID. That's how Marek got hit: he
updated OP-TEE, but his recovery kernel still had the old DTB.

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

Fine with me, and it avoids the binding issue. I'd just rather not try
the ST IDs on every platform, so how about making the list per
compatible:

   compatible = "st,stm32mp25-smc-wdt", "arm,smc-wdt";

with { 0xbc000000, 0xb200005a } as match data for it. arm,smc-id stays a
single u32 and, if present, is tried first. Older kernels just match
"arm,smc-wdt" and behave as today.

If that works for you and the DT folks, I'll send v2.

Thanks,
Mateusz


