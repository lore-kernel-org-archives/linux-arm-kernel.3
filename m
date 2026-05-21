Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD1ACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM0uYMBqL1kxJwKhFF/O6VzT58qrsZXQs8dD4plhhVo=; b=YZ1Ae5ukmeBVL0eTDm8uAw4mQB
	im0lOrRoCdUBt/THLkjTLPmzgYRff02f61/CNattQa447jfASQGcfCPxDub+gn+yKO512BBmRQboZ
	9bp1K0PWwxlZp5psGUO9g40kTztpbWy1UpofuY2RU2sRnsCjTqZixp990vWchLubwRg0QmV5W3DwC
	SwUqbvVFhhCdR7/Svec3OVKvLrdkoubvgGtlaBsw6QvGvIyps4wViaI/SVAsiiLoya2rg1M1KjO9C
	Fg9QhkuSBnN6buLedkFlWSE9swPpo4vz5ayVYAvUPPXLbjREDAiVaP/unCON0A5+il8a5lzKrDPhA
	G76/y18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5bo-00000008ODO-3lEG;
	Thu, 21 May 2026 15:46:52 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5bm-00000008OCY-0yXz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:46:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5D4767A012B;
	Thu, 21 May 2026 11:46:49 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 21 May 2026 11:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779378409;
	 x=1779464809; bh=oM0uYMBqL1kxJwKhFF/O6VzT58qrsZXQs8dD4plhhVo=; b=
	VvgeX/p6c5bqNIozg2znabdmwjWeWY7DLzR0KOGkVetIPczND8cZJejWoZTXOl6y
	Kpp0nM7wrx1gWjaTvD2iw1Q2kOLxieBBIJQKzn28fH/Lm2P0r5KnqFplQlyx4uCg
	ifEwxJjuShqjj7L+TxqXM61qM8XsfSFlksrlrDyKv5KQ7HXtvtfvYHXQI0ZdwvXu
	iZH1YjYN5UqQCNTyrrGeb2ht4vUQxWWOQaN4Az1NSiBbgHb4WmnpA1qtFYqXkpZ7
	bDt1/i6rArVJdmVRCPXd7hI0Pr/td3IZ1k84z8wJGOYTn9/2sTYthMa7udN7gqJS
	TSJPYIU6gI9FQPBUSHwUFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779378409; x=
	1779464809; bh=oM0uYMBqL1kxJwKhFF/O6VzT58qrsZXQs8dD4plhhVo=; b=q
	z7TaqTTUSZkiat5yWP6wO58i693rqyXDIM7IhjkHWsDyd2OECsnrZeXyk0g2bVf0
	VC9pdxw29G38HBJYMO3ytJVZNKv/5uTDJA8vsJKplQpd6OFqoOpgFeds5QcGbT6d
	9DCZMCZ1gCVmTL9/Sdl1KHgI1K7JicBTEw3sQFNeJkDTX3T4ntL+VMlMc0sQ8QUZ
	DfOm5PvwhzpqXQQPopvRL5dK2W6YRhVsrc+0TPAQuhfVNxFezXuQEIJwbZWbj50b
	/7jjuYo1zQA9td+U8oSm4MAukQMZwUcI9aoWyEBQ3gHy5kWbNjDpi40ak+EDU2E4
	XYn0lr9YDwD7nohKsxxDw==
X-ME-Sender: <xms:6SgParzEIo7F_xfL0SP0Pb6inzV2PKYiQPtY5XjmSTUDAOSEQ2GnDQ>
    <xme:6SgPauF_bQL6n-9Eeb_DAKxxfGgXuenM8qdCme4qvPC4t6PfH6s-Znjct54iiVuom
    O1pL3LBuy5RhQ4YFUCQo5iuuQodq1F1WwSPOiHhYd_-FeUFzx_3xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeejleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurh
    gvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrhdr
    tghhvghnsegtihigthgvtghhrdgtohhmpdhrtghpthhtohepfhhushhtihhniheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehkrhiihihsii
    htohhfrdhkohiilhhofihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6SgPanQEwpry4SeBa_xwiv8q6FriiQeSV9nZCQE_1QPU4ZHtqBZ8wg>
    <xmx:6SgPar0eARjFtfSr0d73vTNOsNEEqVWcaZSEU-72HcvCResnguWiLA>
    <xmx:6SgPane8cdIXxuzfWBu_P7uVEcHchYTSNZ7U9-Wi8V29xNifVX7CPQ>
    <xmx:6SgPajOgdpKHNizyeqWodYcfBQ1YL2q1QCSBwflV4zqetCf9VQ_1bw>
    <xmx:6SgPapib3aa6OZ7RJysosAjQjMNG7Gi3-QgTpUKd7Tu2cWXq0wdkRyB5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EDA41182007A; Thu, 21 May 2026 11:46:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXrWoYt_z6Rs
Date: Thu, 21 May 2026 17:46:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: "Peter Chen" <peter.chen@cixtech.com>
Message-Id: <9db39c38-2c79-4187-a23f-190d72f6545d@app.fastmail.com>
In-Reply-To: <20260521153003.429610-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260521153003.429610-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: defconfig: Fixup duplicated PCI_SKY1_HOST
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_084650_313514_8E279DD4 
X-CRM114-Status: UNSURE (   7.94  )
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

On Thu, May 21, 2026, at 17:30, Krzysztof Kozlowski wrote:
> Commit 246e37739f24 ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe
> host, and Cadence GPIO") placed PCI_SKY1_HOST in wrong spot, thus it got
> duplicated when merging with  commit f54f7979ff88 ("arm64: defconfig:
> Move entries to match savedefconfig").
>
> Cc: Peter Chen <peter.chen@cixtech.com>
> Fixes: 1440d446ad5d ("Merge tag 'cix-defconfig-v7.2-rc1' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into 
> soc/defconfig")
> Signed-off-by: Krzysztof Kozlowski 
> <krzysztof.kozlowski@oss.qualcomm.com>
>

I've redone the merge and folded this in.

      Arnd

