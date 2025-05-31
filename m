Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F141C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 19:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGyxiWQu246vWq6BDCxMPVmSxDCFx4n0GPMaz0otyRM=; b=P2QeAQ9iCqq9F0GwTojKzTqFYb
	/3dLxRhkl4lNrCiw+oAh7pK9xGr2dO767IOjqL3dQq7tzOkWmxSxxlQthtDKepEdAq2jf5aiy+DSe
	L6I1csvczCRN7VQmbbHngCZ74SejTK3iU/mmGskN0UWwD17szVtzyHur5g769CCTATmgBlKDvRsii
	Fxscs5Uu6BCy808FAjBLw3pHuTbEDipXC6VBoG8baGtA4knb//cJBu9IkMDUrdBH5a/x1ayyablA+
	6TG5aihqJPQAEYd3jKqDzpQ95IJ3ofRxJp4ve0nlX2SvF2hRN6/J5/x8R/12c06to95phizEXXsWO
	DXYnpeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLS7I-00000004BqE-3Exx;
	Sat, 31 May 2025 19:43:40 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLS5A-00000004Beh-182n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 19:41:29 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E310111400E8;
	Sat, 31 May 2025 15:41:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 15:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748720485;
	 x=1748806885; bh=lGyxiWQu246vWq6BDCxMPVmSxDCFx4n0GPMaz0otyRM=; b=
	gBEYy4N5RrRnL55M+SEhI8sgMTbEwGw2Mp8z3wyb003JS/4a2OtDNuQTGfTH2H4d
	+ynBrm3uUjTVRUKofXZQSxp/KSTenAqLGwIkufGrRwl9t4L03t2VuzopJZ5s9Ysz
	ZXgi6V4fHTiw9dbd3jEHo0q75wgxMmsGvrx1mw75DdMZ+fdzkNq5dHJTAHId1UA3
	b7e2Z2ez3Z2ZfQnDG0omdQRAw3w1/LBtV/F0htxCNR6Y7lfu23a7ghq5luKgo8hv
	NqVaECm6Pd73yGoWsjk/mI0DhAEvlfDs2XLvXnC5E65rNB8QHS8caRkS5oK0YC5O
	Q9dGiR/osUlWCtWlZKz4Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748720485; x=
	1748806885; bh=lGyxiWQu246vWq6BDCxMPVmSxDCFx4n0GPMaz0otyRM=; b=l
	EkohKbfTe4PhtyMv152UftnIuF/lvYa+EqBTmz27UO1JT2Xj8SLeFXWNhXU2sUAB
	uIjKwbJkntGC6lujkGJQnBHcfCb9iTGt5afydayP4SF926luB5/DGhkPCYwCuZNc
	wVxc5tO1CtI8EIdunFhFG+szfR4Axf7sBflfBilNhpWAWPbVuCK4VksoZSLgcB5Z
	wxpAXrThLxBK4RTEVmu+6xp7wGzZ0agYEMzWftScV3m0tNtK+vliDMonfHOJ0FXX
	brFDFIO/XThUzGsAY0L0I3nLDNcFKk92UZVWp6oDfgwWTCb5bU3H/LtaQ8MKfn94
	lGfZpAfgi/FyvpcdfIOnA==
X-ME-Sender: <xms:ZVs7aLFi20kOcjITXYO6R76E1m9ZZijnFa-anCtS9jqQeUGXLkEnew>
    <xme:ZVs7aIUnNk5xrYGQyzIYbmJW8DI94DW-tieVVgGyeC5ckKCY2UwYnlGPX7HxSouDU
    3fAedPdkvXFIfznbF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefvdejjeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeeh
    udekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
    pdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtoh
    hrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZVs7aNKpjLDa1aeJbB-w18mBxHQKnqxXdd1LsuTluYlYkW1g1Ylzmg>
    <xmx:ZVs7aJFm8nqNo55ni2jyl5kRid-cS5FNhgKC61FeeZPlIKdRy4r-FQ>
    <xmx:ZVs7aBW2S6l8i2NkWn5x-Zs7w9AiQEEHtwZesoM9nBUx3tUovY2vFA>
    <xmx:ZVs7aEMBFq2gN0M6rey7SzWHDVrGW756B6ciXOxKF_XwY1ASDCoaDQ>
    <xmx:ZVs7aLv9tRsBXX6fPBFYDezR00vfJlBvbAGhDlLT7eHv7FsWAo_HQ4BR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4AA27700060; Sat, 31 May 2025 15:41:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td417e939653861c2
Date: Sat, 31 May 2025 21:41:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <8b69d0ec-448c-4552-b445-a5f387bef459@app.fastmail.com>
In-Reply-To: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
 <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
 <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_124128_892474_00A40F20 
X-CRM114-Status: UNSURE (   8.89  )
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

On Sat, May 31, 2025, at 17:14, Linus Torvalds wrote:
> On Sat, 31 May 2025 at 02:07, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> There are 11 newly supported SoCs [...]
>
> .. and then you go on to list ten of them. Or 12 if you count Amlogic
> S6/S7/S7D individually.
>
> Just checking that I'm awake?

I'll pretend that this was intentional and the number included
the extra SoC from [GIT PULL 5/5]...

     Arnd

