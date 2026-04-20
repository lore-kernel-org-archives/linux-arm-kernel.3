Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315BF588E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG64U7O4YHnHzzDsRKT6WiX+Di0okWd+p5FmNql78I0=; b=hP9EyxW1lPZj9maTKY+ZkiyfgY
	cCs2X8l51UTqpfG5vvZZ94AEISEP1cHVLQXc6LFpM6//VF7z5xP2RwaWfrYQ4v9kl5OkJBumswrrG
	8xwzZvGWeE64OsXZjepF3g6WQdhu2EARxbWYqfYNalNvecuZv8YyLBb2XngTOopQ2Llj0i5zob0T8
	WkUOmf/aIh9nFL1MiDtj/k88hzJp5sh3GYu1O1rC6vlHVYQMculCCF8QB2O17WFZRBJ8BfVOzHVS6
	PvmDOAqmD45RPQ8ytnuRMOq13LMFlCZ9sWqBWzInGcIvIOzVEJIGabU141jwk8oUKhkryUtqNi4fk
	oSVdPxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqW1-00000007HKa-0Faa;
	Mon, 20 Apr 2026 15:26:25 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqVx-00000007HJp-3Nju;
	Mon, 20 Apr 2026 15:26:23 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 342427A01E5;
	Mon, 20 Apr 2026 11:26:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 20 Apr 2026 11:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776698777;
	 x=1776785177; bh=WG64U7O4YHnHzzDsRKT6WiX+Di0okWd+p5FmNql78I0=; b=
	LHjUKDh/6YwZF3oR9vdJzD7M+fPjphxXhkKb85uaGq3pWD8ExNg8B1luJVGGMOI2
	7WI6xGWIHq9OQ8cGfQqqBcmEv/yf4lecltsC2rNl/f0zmkV6c9PEgELfois8hZ99
	BtXqQGEWdnESMSHmrgZmP3hMC5OLByiGc4diR83Y86kF8HsKK7k29GSTgmXiiX53
	jhT0uiG0hxWiKMFb3VnigvbVbqAhNvzLTWtfimzZq7c2p4szelmaK6F62XUJ1ErZ
	KYjtUXmKZQatOkab2UOeIsbpxTPvMPRfnNHz+FWphXbz8LpMHly/RX4j8eYWKjZI
	cRLNuHpPzd5xzq29/PG2gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776698777; x=
	1776785177; bh=WG64U7O4YHnHzzDsRKT6WiX+Di0okWd+p5FmNql78I0=; b=K
	smxS2RbBcLv7q2JTz1AAVmSmISofcDDnT2njoy5/HEfYyKUMZ9GuWxmibJ3ip6b9
	eSqN6nH+XkFJzCGvezLULhI3DPpDV88lh2u+iAfJslBZ6NysYyxYGftIHi86Chdz
	ixADTgAMPEA+fuTnAfo8rpWXmytfIihFq5EczfxSdn6PFENT49T9vu9aMckKvo9y
	eCvoCl8ZSG8EUjW6Pf7MNNhhVIaclsr0ATq1LSpjJxq8+R7U250Ov6GZQcyeKRvK
	KcvvcH++NVriD+IHKgDx79h8Nyd9m8UihPJJ18/euZcFMHg15iP1BHXEtYQBb0Ss
	3BHqqW9K3dNcSZWodghnA==
X-ME-Sender: <xms:mUXmaSFUTEo7pwNymPfKyfYUBF1BAWM0CH3SWYJo4ixhNhfXKKFNbw>
    <xme:mUXmaeJLED6ij-xV1uBjXY46d8TOtWdW44evD9TXpezhIv-nF2CBUF5tf5MHCO9gC
    2oubllKoxyZ_lRemwbtAvCCghSi5C6C1CcVNSH0-64sEN_b2Azpqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrmhhlohhgihgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhg
X-ME-Proxy: <xmx:mUXmaYlrZISYGLMpg2tCTD4mcOvQ63FQ1yFF-qMIGpMjIMnHITiHbw>
    <xmx:mUXmaSz-2hYVnXVwMWREH-DEkqCUjYIARuANc7cjkca_vtPzHgwX4g>
    <xmx:mUXmaVo3MgJmfQ_qgQ9FDgNgTQQjc1mcFA1jjUFFU7QKnBoq8aPyzA>
    <xmx:mUXmaZ5x4h698xrBFcGfH96fEkUJ-FrLGqwwhn7GDoSDEMziPrqObA>
    <xmx:mUXmaTyiqtym4SNWIFGkCfNlIjwal5buTf_nRL7lnleVoYpdAKyESemw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2391700065; Mon, 20 Apr 2026 11:26:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AvG_jmLX_3YV
Date: Mon, 20 Apr 2026 17:25:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
In-Reply-To: <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_082622_261202_5EC5105E 
X-CRM114-Status: GOOD (  21.75  )
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

On Mon, Apr 13, 2026, at 09:30, Krzysztof Kozlowski wrote:
> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>>>
>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>> released this weekend.
>>>
>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>> patches bindings checks and none is critical since it mainly touches
>> 
>> You sent your pull very late, just before v7.1, and skipping late
>> posting is not a new rule. It was always going late pulls, which might
>> make it or might not make it.
>> 
>>> new platforms and the incriminated commit is a low priority fix for
>>> 10y old development boards...
>> 
>> I did not check which commit was not in next. You can provide feedback
>> to my reply with actual argument, because such explanation was missing
>> in tag. Instead you decided to be surprised that patches needs to be in
>> next...
>>
>
> And to clarify, I did not say that pull will not make it. Considering
> the timeline:
> 1. You sent the pull on 10th April, Friday
> 2. v7.1 is released on 13th April, Sunday
>
> and that people are allowed to take weekends off, then there is simply
> almost no way that pull can be merged before v7.1 is released, so by
> definition it is a *late pull*. The policy for late pulls, like that,
> did not change.
>
> Lack of exposure of a few commits to linux-next is only the explanation
> why I did not pull it while doing last round of pulls.

I'm looking through the backlog for any missing fixes that should
still make it into -rc1 or -rc2. Just a few more points to add
from my end:

- I had in the past always trusted platform maintainers to only
  send pull requests when they felt the contents had spent enough
  time in linux-next already, but I did not have any scripting
  to ensure this was done correctly.

- I see that only a few of the patches in the branch got applied
  during the fineal days before the merge window, while the rest
  had been part of next-20260330 or earlier. Aside from just
  sending the bulk of the contents earlier, I think the best
  solution on Neil's side would have been to send two separate
  pull requests, for the earlier and the later contents
  respectively, even if sending them on the same day

- I see that some of the late commits are clear bugfixes that
  we should still merge as soon as possible. Neil, can you go
  through the branch and send another PR for anything that
  qualifies as a bugfix? While by now it's clearly too late
  for any of the new features, there is no need to delay those
  any further.

      Arnd

