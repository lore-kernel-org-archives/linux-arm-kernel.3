Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C701F99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zse0tqAGU0NkTFFqYUKaHhgGHLCw4n0ITFBK6lJpa34=; b=PLugHE2shOIEfoDmerKRASDTni
	XT7USnBzv5GPaheAaLJqy9Ly1HJ9k2jOiCWM3c1LIUWUieH/Bn6HsHcBsJh8RcKWAh/EbXSvkB4CJ
	gFBq+TbXMz5uwhj+bY3mAxa8Ncd/ns0lMWUrBAayr6ul792Fm8eMjE8IG/V/fYI/2+aeB907KSJ//
	sCoWP8mtYEAr9GhNZIhETOxXYDTtqlgdjVEHhV9AsgeTrpYwHR7RjaotcqYV3mQbBmGHQHl/pB5jf
	0IbXRT6M7Y/ESqdVDZZKIKvqvjH3HPgIJyCpmfIUWW92FbOx6P2VYemindiqH4ckbisyxx+uaUCVs
	XiZelQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFonw-0000000BBNx-0wqJ;
	Thu, 23 Apr 2026 07:48:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFonu-0000000BBNN-0hQz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D22BF42E2A;
	Thu, 23 Apr 2026 07:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F32C2BCB7;
	Thu, 23 Apr 2026 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776930533;
	bh=pM1U/TIp/4xP17MhqKRuK/qJFURaPZPJN/CFUj8IK5o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AKLExXM7iSxDyqDIse04r9eC1GBKwHU4YoWVNKtqiWGVqkIzaaXQnwCyqU7yRclGN
	 i9rR53kpu5D3klCX2znOArrpKxCY2fB/2OyfAy16Yrj2crQGqKZG+84NC1M8NvRz2O
	 3EsdGgdLNPy001xKnMB7mHj629eeugYQ0OVf3EZWRtn06Hqq3CYDq5K61HQs2c5r/g
	 Jv+wVXgKAqExjt/gvt5VrVwPVy1t0ERpp+Mh866cSqSXgSPGRjaSmf6voIscMPfoPa
	 ud6vZfoLYCne1Iv0YgdHVba945ZcA4R1K+Z9fxcsosTf6xGxRpDfAECp3az+fZT2iO
	 e8WgT0EQEXmFg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6ABA8F40068;
	Thu, 23 Apr 2026 03:48:52 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 23 Apr 2026 03:48:52 -0400
X-ME-Sender: <xms:5M7paY8w2PdmadT7w5PBl02nDRu8zzOUvZj9MpahQRv34lbDpMWxjA>
    <xme:5M7pabj6D2SOaWz4b8yAa_E7HXtUPPvMN07t4DY-j0cz2STAFlY5NY29mnbPtEw4c
    gGhXPM9qtUBdGVM_SoRR-4DruOy7EdZsaolO5bjA7C9xTar8ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiieehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrrhhnug
    esrghrnhgusgdruggvpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtoheplhhinhhugidqtg
    hrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rhgrihgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5M7pacahhlBqbOO8ewH291OJONmi1TX0zwKmSoDddIp0d5iRe0UcxQ>
    <xmx:5M7pacV6vyKc1i9kSvgBukeRCn1B7v6Oas5rJIOxz8iaQY1XgsiYVg>
    <xmx:5M7pabNz8Fjr2q4D7Bqb7b1u5mlgNqmhxdPssp0y0kyW-igoNe3tvQ>
    <xmx:5M7paWbL-do6E1aG6HVM2aB5VC1gw8KYxryveD-IhtdnAZO867_Drg>
    <xmx:5M7paa86KGgPWpQUqoGe5fjzbvMjnMyzpgIm1A9w8jh9T4xgd3KsiGGO>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4B76C700069; Thu, 23 Apr 2026 03:48:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 09:48:31 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Christoph Hellwig" <hch@lst.de>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>, "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <ca8d1000-63ad-42a7-9990-cabcbecfe6b6@app.fastmail.com>
In-Reply-To: <20260423074614.GB31018@lst.de>
References: <20260422171655.3437334-10-ardb+git@google.com>
 <20260422171655.3437334-13-ardb+git@google.com>
 <20260423074614.GB31018@lst.de>
Subject: Re: [PATCH 3/8] xor/arm64: Use shared NEON intrinsics implementation from
 32-bit ARM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_004854_270139_279DEB3A 
X-CRM114-Status: UNSURE (   6.65  )
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



On Thu, 23 Apr 2026, at 09:46, Christoph Hellwig wrote:
>> +extern void __xor_eor3_2(unsigned long bytes, unsigned long * __restrict p1,
>> +		const unsigned long * __restrict p2);
>
> Does the alias magic prevent this from being in a header?


Yes, it emits the ELF symbol for the alias, and this is only permitted
in the compilation unit that defines the original.

> If so a comment
> would be nice, otherwise moving it to a header would be even better.

Ack.

