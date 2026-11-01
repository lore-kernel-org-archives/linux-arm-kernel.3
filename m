Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9933F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wdYQ55D1;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Aj02QdpK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3un5P10sk8oK9XNXAXKYVD1iFuz81kb645oZObRJaFk=; b=wdYQ55D1mOoxSG
	SA22Q97951Bx4sq0+JAm6IAM1n54soF+sQpuc/IZA1gC5iegrmapEx+YPvqCiYr8O7Aip7mpytkI/
	t+RjtiWB6a+CoYVqyVovxY68J5cAp2CitcFQW8snw8E9TLQP0XWfSV0wzDfHso4mIGiOUrCNlz6dn
	Z9naxWtT3CzM/wQ5tw8+9UQLB/FlApwAHHWkSM8U8usdIN4oPZF+ZVHO91u8gCz1uWlINztD7njnP
	9BPtDzGnnJCG9ROBL90arxp5OmiqvwHTcaX4dZ+cdQzaN6e76cWuiy/ARiYbL/lBmpbUQsb8w5r8Y
	z9vaSFvkF2gI9NaYt+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNOIK-0000000DuAd-3B5O;
	Sun, 01 Nov 2026 05:39:52 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNOII-0000000DuAI-11ty
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 05:39:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F216FFABF;
	Sun, 01 Nov 2026 06:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793511583;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3un5P10sk8oK9XNXAXKYVD1iFuz81kb645oZObRJaFk=;
	b=Aj02QdpK3pB0SUgQXrZjdhCvnMas32aLG8WPYEZPq2FW2yz1nj0HIVs5QrIjXzk7RJa3i3
	zhcaZKDqFVpF4eslHEYaoSREa+Zij4XxxgrxxlIlMbbhJor0J+SWRgce7eFOU6OyPrqUPT
	rKlTjzVOQ0J6a9jUlhJkbtZXLZXg+Z+4wnWNRz89W6nsp/NCQLeXOyKU/d6G4e8ekxOJ3j
	o9pRG48ScVy/2jfji9i8gVsSgjUBzVUum84T/eXVKFhWlrnw0tajmbnegiV1a8WXW+fqXk
	tAKiClc9d5jpym3WeA6KMNEEjEs84oZjmS0ri4GUDzXqnx1dYrCcJsZKGclhhg==
Message-ID: <3237f9e2-6c80-4adf-ae4f-65f8998ef4eb@nabladev.com>
Date: Sun, 1 Nov 2026 05:47:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
To: mateusz.nowicki@posteo.net
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas BOURGOIN <thomas.bourgoin@st.com>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Fabrice GASNIER <fabrice.gasnier@foss.st.com>,
 Stefano Babic <sbabic@nabladev.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
 <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
 <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
 <799394b5ac7067cd2bb2e06117e53ec3@posteo.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <799394b5ac7067cd2bb2e06117e53ec3@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_223950_512655_8AF279A5 
X-CRM114-Status: GOOD (  16.46  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/31/26 9:59 PM, mateusz.nowicki@posteo.net wrote:

Hello Mateusz,

>> But maybe there is some way to probe for the correct ARM SMC WDT ID ?
> 
> I agree, the ID is not discoverable. A revert or a board override
> would not help firmware built with a custom CFG_WDT_SM_HANDLER_ID
> either. Sorry for the trouble on your board.
> 
> I like the fallback idea. My suggestion:
> 
> - arm,smc-id becomes a list of IDs.
> - The driver tries them in order until SMCWD_INIT succeeds.
> - The SoC dtsi lists <0xbc000000 0xb200005a>.
> - Boards with a custom ID override the list.
> - Older kernels read only the first cell, so nothing breaks there.

Yes, that sound good.

> Trying a wrong ID is harmless.

That is not exactly accurate. The wrong ID might be populated by some 
other service, and invoking that might have unexpected consequences. But 
I do admit that such a thing is unlikely.

> Old and new firmware both just return
> an error for an ID they do not know, as your two cases and my DK show.
> 
> One catch: OP-TEE answers an unknown call with 0xFFFFFFFF in w0, and
> smcwd_call() compares a0 with PSCI_RET_NOT_SUPPORTED as a 64-bit
> value. The driver gets -EIO, not -ENODEV, so the fallback should move
> to the next ID on any error.
> 
> If you and the watchdog maintainers are fine with this, I can send
> the binding and driver patches.
It sounds nice to me, thank you !

