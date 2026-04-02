Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62C8CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdJ9yof501WddbXp/A3xPN2DLmxQY8ihyJXdfoHTQNA=; b=B303xUoFl+mvqceCDoy/I8cbAe
	YFisVvzT1cuicA3I7+lwRh3E0U5RR8Ex6zqCg2rrUIzHGeBBwgq1L/72kVj2p3rFzR/jCzJ3bBBb/
	Uc4RE/GjJ3LAGEDVGmMc13du5X3dIotIWsQNesHhzoug6brYTHWWy3XUbCQmOvsfG8zoGTrbUuY2v
	qfzG2EXYkhTbWqORsD9tiA0Ps4FeeH1yhAx8W+M8oIKIjDyFSp9McgAVl3193+4DsstPeGJZjwPgA
	a+TXwrVGpThkLLkrkeHV6VjTXaLZ+U3M1/hEAhcPmcYnI2Budi5vie8j5f/9LICkV0UGFV+CVaOv/
	UR+8axCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dn7-0000000HD2v-21w9;
	Thu, 02 Apr 2026 08:52:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dn6-0000000HD2p-3d7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C778861863
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 08:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662F7C19423
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775119959;
	bh=aFk5VIQZLPLBAhuZ3QT5cJKl7kQu65ln885pZk6irZw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dlgXU84YMpPtmX8D0M3SxY1GpJzaY0VW0KSI4sQMyjwSDWvpV7321hiG3SNCa3l0n
	 pANn2ztGup9LuOUV5j1y/SZsE9/gcX19TxFi1yLiYIOYR8KK6CkcnH6iR4CfzYNfxN
	 w+NG884KJioS3bdaDJdalUUdkPUggf2KG60syQ6Ol/b37GA4wq1WC3iMFIqvNnt5zZ
	 8KtidtbV+81Iq8OgW2b/7ZuP72rkOIlpgTXxnpdQzQhBOMxCQzysiKjrIIkq3Z2eu1
	 +Dp8IEbfGG7cZp5RRYmR1++/bFVdy+yeonLfibLs4QprdkToVJNUNA9H+oucs6SYj/
	 phMb9GjvuMkJQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 57641F40068;
	Thu,  2 Apr 2026 04:52:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 02 Apr 2026 04:52:38 -0400
X-ME-Sender: <xms:Vi7OaXUOX3OR_q7wadGFI1HLHaJzOwizJRERy8ZkEJL_2TNjGlXewg>
    <xme:Vi7OaaYZ4SvwBB4T22fbmuWMtzBO5fUcBUCJeGDOq2Jh_1ROdxeJRW0vewYyipr0F
    yXII37AoYXxY4XoF7_C7EjlI-D9lNscukdwZnM6aqswFTiyjlNncF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peguvghmhigrnhhshhesghhmrghilhdrtghomhdprhgtphhtthhopegvsghighhgvghrsh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtg
    hrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Vi7OaUe3WJ63jWQWN4NFvDE7BXPfsjmVn4PoZK8oD2Ad3k5S1_6dCQ>
    <xmx:Vi7OaRohevZo5IBjUi_wRhdj-MyfLQLXeniIqLsZ_rhTaaHwmuUWIA>
    <xmx:Vi7OaZCHoEPwDm8x9wTlSoL_EhdC1AV9GpZg3JTm_qjhqRzW2SROsg>
    <xmx:Vi7Oaeb-Efn41mnbbupW8mznN12y6zWqXFAVBk9XwlxM2Wre8q1lOg>
    <xmx:Vi7Oac6-xkrIjQhSXf-JxgEz6ixwwTBrg-ldLiSRH2MkcQDyMUxT8QuV>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 33D0D700065; Thu,  2 Apr 2026 04:52:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AfnkVD7BdAFw
Date: Thu, 02 Apr 2026 10:52:17 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Demian Shulhan" <demyansh@gmail.com>
Message-Id: <dc424b4a-11b5-475f-a53a-987b5813bac5@app.fastmail.com>
In-Reply-To: <20260401195943.GA2466@quark>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260401195943.GA2466@quark>
Subject: Re: [PATCH 0/5] crc64: Tweak intrinsics code and enable it for ARM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Wed, 1 Apr 2026, at 21:59, Eric Biggers wrote:
> On Mon, Mar 30, 2026 at 04:46:31PM +0200, Ard Biesheuvel wrote:
>> Apply some tweaks to the new arm64 crc64 NEON intrinsics code, and wire
>> it up for the 32-bit ARM build. Note that true 32-bit ARM CPUs usually
>> don't implement the prerequisite 64x64 PMULL instructions, but 32-bit
>> kernels are commonly used on 64-bit capable hardware too, which do
>> implement the 32-bit versions of the crypto instructions if they are
>> implemented for the 64-bit ISA (as per the architecture).
>> 
>> Cc: Demian Shulhan <demyansh@gmail.com>
>> Cc: Eric Biggers <ebiggers@kernel.org>
>> 
>> Ard Biesheuvel (5):
>>   lib/crc: arm64: Drop unnecessary chunking logic from crc64
>>   lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
>>   ARM: Add a neon-intrinsics.h header like on arm64
>>   lib/crc: arm64: Simplify intrinsics implementation
>>   lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
>
> I think patches 3 and 4 should be swapped, so it's cleanups first (which
> make sense regardless of the 32-bit ARM support) and then the 32-bit ARM
> support.
>

Ok.

> I do think we should be aware that even with the code mostly shared
> using the NEON intrinsics, the 32-bit ARM support (which works only on
> CPUs that support PMULL, i.e. are also 64-bit capable) doesn't come for
> free.  We should expect to deal with occasional issues related to the
> intrinsics with certain compiler versions, compiler flags, etc.
>
> I assume that "32-bit kernels on ARMv8 CPUs" is currently still a big
> enough niche to bother with this, despite that niche getting smaller
> over time.

Running a 32-bit kernel on 64-bit capable hardware is usually done to reduce the RAM footprint, and that problem hasn't gotten any smaller lately. And 20x speedup is rather significant.

>  But as I mentioned I do think we should try to simplify it
> as much as possible, e.g. by supporting little-endian only and avoiding
> #ifdefs based on things like the compiler whenever possible.
>

Sure. The only reason I think this is worth the effort is because the same code can be used on ARM and arm64, so once this is no longer the case, I don't think we should bother.

So it makes sense to apply this reasoning to little endian as well - arm64 supports it so we can support in on ARM too.



