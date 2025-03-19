Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226AAC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 21:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIV1jl6V2fZlix63bFp4nlCTMLgC0hAJC1UlPpspvig=; b=dFEBL2kM89hoCCm4GKke2fnNrt
	aAPnLHMVD81Ay7qe02fXi04F9KSXuk9e+MAdBRUZDcco18eZR73llKKf+8uc2DJ9dXMzJpX85S3gg
	+qinZAHs64s0HApXyZNP3NeiV3lSXSNipy4FAveRgXBsMjVgOlKO9pftbSRY+ryttgzU7cpWZLOQW
	rwSsQMcO4ICEuMt3WfQcoCsfBn6zo7qGCLfliYJ4EZmwhWeWbeik2mJLmMQDg7oAyoBxDn+KFO0nS
	4IPN0PdCOYi1zGL/+iEtT/vQq3GsNlU/k5uwY3+56fpZCOf7Mqn3N5aD/VNczjdIPuLyJygS1i2HJ
	UNaSrAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Ox-0000000ADX9-1z5J;
	Wed, 19 Mar 2025 21:56:39 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Ex-0000000ABcW-3IS2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:46:21 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5824925401B2;
	Wed, 19 Mar 2025 17:46:18 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 17:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742420778;
	 x=1742507178; bh=NIV1jl6V2fZlix63bFp4nlCTMLgC0hAJC1UlPpspvig=; b=
	eAKQXDztmvO28zcR3zDMxe9omF5+kZdnh93neULpzO3AOzG2tkCkjMc9fsTMWfDs
	4qRxP17m9ImvKjz+4bDDLnHeh2cVuNev80WAr1y8TGNedm4BJ10w59tgbVf0YC3k
	ZyGCOPjEHGv7o93B1v87wkYSoXULyKy4qHf6lnIMPC6i9HjEILdE7el4ubUZgXSG
	3xN/VpEM1MT15my+nwJprokD6Fk8B/fUIqBWSQDusZBp6xEZCw1mOmGItAGGHbmP
	3Tpx/5Bp8HHOoifKhzk+DOrWubK7MxNdpOCZNbUsXPihehy3/Y7cSf6MpTGDfpVG
	YNuFgzeijoqkZ21+XWl6Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742420778; x=
	1742507178; bh=NIV1jl6V2fZlix63bFp4nlCTMLgC0hAJC1UlPpspvig=; b=y
	yGiBfHms1axUwQxMcMRsZYFpYxCvenPcokpYVW5oOV0yvA73QmKaC8BuurTy4e9a
	5TRxA2kQ3dSPAWDy3wLb/hh7w4d5/sQLm8d3Wq3UwmxLIJQ/00Apd4ptdzwrXvCV
	ZxUcPENBezQRn6xy7FihnmHz8841B8D4POG8kh9s4idXyUG6zB4QhCegGBwpz2vU
	Sxkb//wwEYf9E6ZyEW1li+ntKNxM6RqBWxzFNGxUJ1avyshVdqu3Ogy/V1vrvecF
	nhxkbFWLIqkl5+CYEJmOb6UaIl2/Y5hExN3bVZe3b6YKkxuRKaA15oDqAdPqpDD2
	3LzZDBYxTlr6yuY5BvMkQ==
X-ME-Sender: <xms:KTvbZ_FP79bCtSPAr5O0UKHiysXybUM1bmwMjjMOgPAIJPgVj86Xzw>
    <xme:KTvbZ8Wr2X0hYkerR8U2xHYOYyJdJjJvVO-bXfIQyv524RvJUAkIdo790-HrfZlE3
    zp9jemQvxkik3Fnt8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeigeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhlrghrohhquhgvsegsrgihlh
    hisghrvgdrtghomhdprhgtphhtthhopehkrhhishhtoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepnhhm
    sehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:KTvbZxJ5_UxHkfnazQSQz6Im7JqvN3lyZjge0OIHfn5R0pgqqxCQow>
    <xmx:KTvbZ9EkLgDyA7IG31TjHc-KqiNUgFu77yb4bH8Poc_2yVEM6hjSCg>
    <xmx:KTvbZ1U3qfMhl4t4LYzBiQkX6oL19nVdQ_pfuFtsl77iK9wfaQzGUQ>
    <xmx:KTvbZ4OJBQDTW_q8jEgr8trulU3oqVsvIE_AgWUUZJkdiiaCk84u-w>
    <xmx:KjvbZzdNDkZpcl3g21IIa6UX_Sz61HSXPFaqrTe7R6PShid2Y1QcFxgF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CFC152220073; Wed, 19 Mar 2025 17:46:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Te367c4c16dcaf1bf
Date: Wed, 19 Mar 2025 22:45:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guillaume La Roque" <glaroque@baylibre.com>,
 "Nishanth Menon" <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>
Cc: "Andrew Davis" <afd@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <c506a805-9221-4afe-8d98-af0ca97a1fd2@app.fastmail.com>
In-Reply-To: <20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com>
References: <20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com>
Subject: Re: [PATCH v2] firmware: config: ti-sci: Default set to ARCH_K3 for the ti sci
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_144619_885370_9EB6FF33 
X-CRM114-Status: GOOD (  14.40  )
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

On Thu, Feb 20, 2025, at 14:31, Guillaume La Roque wrote:
> With ARCH_K3=y we cannot enable TI_SCI_PROTOCOL=m because
> ARCH_K3 selects TI_SCI_PROTOCOL.
>
> Modify the logic to enable TI_SCI_PROTOCOL by default when ARCH_K3=y
> allowing us to submit a future patch to remove select on ARCH_K3 without
> breaking existing users.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Link to comment done on last serie [1] we come back on first version of
> series[2] to not use imply but set deps on ARCH_K3 in driver directly.
> An other patch will be sent to update Kconfig.platform when this patch
> is merged.

I just merged the patch and hadn't seen the earlier discussion,
just two small notes from me:

- thanks for doing it this way instead of the backwards 'imply'
- there is really no need to split it into two steps, since the
  change to the Kconfig.platforms file logically goes with this
  one and I would merge both through the SoC tree, having it
  as a single patch would make sense.

        Arnd

