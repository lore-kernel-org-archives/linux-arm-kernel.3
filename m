Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEDA105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NourYiljIab2CcCKGK5HPDHBcdheENTz2uXh7vtjdk=; b=egz6YTmZl7fLkNWJXiMbkNfqDY
	oNMMBhJPuOMd7agLKZ6RwktDXbUuvq4ol01iOJGFCXZAoNlY5Zn9r2nGBszEXKF9oPbXU12sm3l44
	UgTqGRsUKP5/LB9EHy+CEsDtWdbZ7rHzk4dFDqbh6T7zdU/54oJUca6nIp9KflwUiouidNpzc6hPh
	SuPcdAl2+KZypbkKKCSmIwy53ESWnA0w/rUSmE8tsrzi248NFJHaw5a9TQkH0d0Uu489BVeLuWvtc
	Nm+GQ3IHTCbERRZxl+VWqJYOF6FXg3LUdLQge0lP9jX2AxUB+yfCe4LQqIGY2ZWjWm3ccynMEqyFj
	YSiXXNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12XJ-00000000E7z-1IIq;
	Fri, 13 Mar 2026 13:26:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12XH-00000000E7V-0VE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1F4F4453C;
	Fri, 13 Mar 2026 13:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653FCC2BC87;
	Fri, 13 Mar 2026 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408398;
	bh=6+2pNEqlkzPRnDr3BEkIgG1nxwqKeOZVrnLRAtULRU8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WxdhvjJMjd4amZvQrKCl2agka//pWX8+zKA+382Ygf2qUnNxdQ6b6GYsf7GqCEe3o
	 127/IIZj0ZtU4BDAq3gIhpHybdQWrEtHKRkOhIzAEyhedI4Bp9Aot8h1DXp4urMbal
	 K4wC3mGzU44Ya1timo3ALjHw8LnpwEvZJjy+QClDxQ/vLbzcnZcvYQC0bQEPXyBZL6
	 e0LWnEGF+mUwgdwGJgK1pvzannyAlM4+ZEVbTegTIGfZ3Usk+ntuYjuCV45NMmJA5K
	 yUwFTpncZaY+b99+jHFJR14yqDmd6f/EuLJTS6rmnJ2TZTIn2UrFnB1T6ysvi/AFoj
	 bogzb9cQBswVw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3F84BF40068;
	Fri, 13 Mar 2026 09:26:37 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 13 Mar 2026 09:26:37 -0400
X-ME-Sender: <xms:jRC0aVdBb73GL2yZo1TWm4_PUDhFtLDcvslFMQcpnd0p5leIcNEx1g>
    <xme:jRC0aeDP1SbIhGu_p9aLxn7P3JfaDxLOVCtGnAZhkgP1dkcF7WlCMRJ_nG13Y2j3i
    ZzuN2TZPAQcpjoNViAM-5IdL9vOjIS09lEsBIZSCFmIGiNtYnVHyNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeeljeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepmh
    grrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepshgrmhhithholhhv
    rghnvghnsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:jRC0aYCywX9ClUiDmEZk6xoGIFWbW4tr_QJCD5A0gBDEoJ40I6kq9g>
    <xmx:jRC0acAqeX8AEa4FlUAXS_b95brATkdjrEuSydCn5NS-22TMkiItjQ>
    <xmx:jRC0abpwFUEGYvqnV-Uio9QqZVdQ6Q-Wi4ebuyD4Ol0B3WXJXBva7Q>
    <xmx:jRC0ael03DSAMysRv2PKqY85LMeawHJs_aUT7dMLIagX5eURqR6hjw>
    <xmx:jRC0aTxl7L0WUC97zTUs1HxLdFMUsNpRf7G4ap9AluCKfs9wVVVa8U9w>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1D568700065; Fri, 13 Mar 2026 09:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AAcvUmYsUZJJ
Date: Fri, 13 Mar 2026 14:26:16 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Sami Tolvanen" <samitolvanen@google.com>
Message-Id: <7b4debe3-d76c-4abe-8f7b-b2f3856f170f@app.fastmail.com>
In-Reply-To: <20260313123220.29878-1-will@kernel.org>
References: <20260313123220.29878-1-will@kernel.org>
Subject: Re: [PATCH] arm64: scs: Remove redundant save/restore of SCS SP on entry
 to/from EL0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062639_206977_BFC54E67 
X-CRM114-Status: GOOD (  11.95  )
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



On Fri, 13 Mar 2026, at 13:32, Will Deacon wrote:
> When returning to userspace, the SCS is empty and so the SCS SP just
> points to the base address of the SCS page.
>
> Rather than saving and restoring this address in the current task, we
> can simply restore the SCS SP to point at the base of the stack on entry
> to EL1 from EL0.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/scs.h | 8 ++++++++
>  arch/arm64/kernel/entry.S    | 4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


