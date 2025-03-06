Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816F1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9Sxi7UM96lJZzoWcrB8nkdiF4e8dZcfT3E9sdmD6oQ=; b=YPO2oYkA5DTKYx468E+YH1WqGy
	uSr7P298yY7KKvc0S78TBA/ZYNChLuPledjWZy5GBr/ATYNFrdeDmhjFY7bGsUQHGp7qzyAHJEkds
	17W+YSdKjRJiJO3EVmLMno6sWp0STh5pZ1sEZhFStFNwKoSppubOQjX05WbWNru3XzHQ0ehIEfdqe
	SXhP3IvF32iIU/zvS/BVRvz3lnpmBGBj1uWp6aZ7Rjg07FqZkmtfwDN9KtXPImwaMFvDNoTTofU2h
	hq/IZwiyV7SV5iSZyezSV0REJhbtlaqH57Dv6wsHqpaqojC+pzjGDyXaE7fEmvYoHL20L6a5UGJXP
	GBd4S1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7LE-0000000ASYJ-1rPd;
	Thu, 06 Mar 2025 09:16:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq78S-0000000AQWG-0iqq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 09:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T9Sxi7UM96lJZzoWcrB8nkdiF4e8dZcfT3E9sdmD6oQ=; b=OpRAjjTiGuqGB4XQNdGj3n/cTj
	wH8GTYsh2f/SxrLEFPzMbRt8u33/whASWc+/nkB4qxUOKeU8GBksKPbGsCMZdNxh8lZf+alGSarcq
	e7Qqi035EQfMklpZTY6ecmy0s631Q8Q16QXULmXvqSZpHPowd0Hqpmnv7nhmY8ChVC0Uqijs4lG8k
	X7NpjQOw31Ujbih5xe2kEIHH4cB4ndn8MzJUapJjWZDKFrZPaPqk+M0oFE8ifAhP9o2V/FtYkxj42
	QTdiuJtLpNVW1S0i06R6nhn61dYRKqQ0ZQN5yUkfqAyMIbHicZf8EB5T6gqZUCnJvgrV9UOyhzFx4
	I7ThPdPg==;
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq78O-00000000ytr-2JaL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:03:19 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 564422540103;
	Thu,  6 Mar 2025 04:03:10 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-09.internal (MEProxy); Thu, 06 Mar 2025 04:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741251790;
	 x=1741338190; bh=T9Sxi7UM96lJZzoWcrB8nkdiF4e8dZcfT3E9sdmD6oQ=; b=
	V15rHs2SARquaLYXZI2/eQHUlWmBI7MvlxhEk04PptPf9NqMUCW4haq5dDgTlTdo
	NuObg8qsLqYxGTW217FjBPp/Q+cPXlX/83mUlEO3YKRSD8mBPSOARxQBZiaIlxaR
	vswGotNjvNuSkLM87T5A2XelXPd9rgLC4+bGQvUuTAHkw3l3caPPUprVZYW2dBh2
	2/VBF3Gssj8nKy6KnmJjBRj756UpIOErqoJfCBctBw7BcRqm8qXlA96CVTqcGklK
	mSIam4WMAK1E8Wx/Ss1I/ijEMmg0/hOHIK+2tt+Blb8KIurFS3AW+fpU2gSys9+F
	Z1g40xdpoC+dLVBtz4Zymw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741251790; x=
	1741338190; bh=T9Sxi7UM96lJZzoWcrB8nkdiF4e8dZcfT3E9sdmD6oQ=; b=L
	o/U7vzv6zGcc6BHgsCcSMt1Ya/Tk9t5Vhg6md63Ac8LUor1/4PylT9wiI69+6YEx
	Eo+S0xgB2Q8DtQwSettvmJLMtCrQSiI2xQPHVUIqty0kD7ePV9xI5MIt0yzsUP/P
	WDmsUXUAqRkVImIWfiEyjfuZsnxwlShklyDOVLef/BbDrNCyYwM16kiylAt83P3F
	6P7c8qDtbB4SDGOuu8p0S0jL4zdHh1C585QidvAkckNEbCjBYO16gaX4KA18RWA8
	LCxN/ryw6FJYmK4XsSql9dCL7cOMn7+63hFHMMRaRLhuP1/L0R54dKDfsm0bQbIZ
	bLdaXOVGsLadii6qV27ig==
X-ME-Sender: <xms:zWTJZ22cS8InxrZX6ifTZXrwoCoUmsmXiV44cylar0MzvI4-3cwtlg>
    <xme:zWTJZ5GkLauUzoNB79u6ryP0t80t3ssMGe63KFqgLlF4YIqNZYXit0-J0RDpq981g
    fupqyeP2-BN_ZAj7w0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplh
    dprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:zWTJZ-6vVU_hwfA6CpYoqM2_KyGma8sbJjdhwmvqNDAhFx6yZsqcqQ>
    <xmx:zWTJZ30o15uhtICFaA1zmH6UUk05KKBmCcFupwZqcfu2imFlHTPWcQ>
    <xmx:zWTJZ5FPfJ4OcwRRQptLa4sFJGVOBoX7ftFAatrjyFrVEalF7tLKBw>
    <xmx:zWTJZw_D_MJfCB3fBjmoGY96PU-QRXIFco6eSW_JVTcISiHtJ5h0UA>
    <xmx:zmTJZ9h7ajJd_2rJtxZzCwtyFpi-AAHzFpfQAlj3kWwm95_Kiyd3bg75>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D60B82220072; Thu,  6 Mar 2025 04:03:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 10:02:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Gleixner" <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <1f599860-0276-47a2-89cb-e655e516cf23@app.fastmail.com>
In-Reply-To: <20250306084552.15894-1-brgl@bgdev.pl>
References: <20250306084552.15894-1-brgl@bgdev.pl>
Subject: Re: [PATCH] irqchip: davinci: remove leftover header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_090317_392582_72DEF19A 
X-CRM114-Status: UNSURE (   6.37  )
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

On Thu, Mar 6, 2025, at 09:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit fa8dede4d0a0 ("irqchip: remove davinci aintc driver") removed the
> davinci aintc driver but left behind the associated header. Remove it
> now.
>
> Fixes: fa8dede4d0a0 ("irqchip: remove davinci aintc driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

