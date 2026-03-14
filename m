Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0AA10706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm6QCg8+KO8JsPRz+1xGDXZhvstkIPL3wZgnDNeK6LY=; b=UTgc5bn7rQ0HnMsvXNXGKYXbwY
	t2E26BsSSMPq+0RmRv17SNSsjn4tUCnTbYoBG5dmdLK7zQ5knl153MA0AyWt6XaeRHB735uNqZrSj
	Tr/uT4186pUivuM6pAyqbhHjglN6yKvp3jXYb5j1NdAN5oh1PxEQyTWzRrvFlFyYUfURP+3yWFflr
	nggty8dfNsl9lOWLbw1Ycpnak0BrrkCog0at9YJoaY1jwa0PvDkyEbXPBH+tI7J2ED8v65Z5G47cb
	SmM+qOwUMbpidOUFftsMSayQvFKkDoec/xIZ+u3FAxbZzJdCrWGvLFnIkTEVD1/YF3M4SMAO4iTq/
	bGgvS0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1N1g-00000001mSU-2diD;
	Sat, 14 Mar 2026 11:19:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1N1e-00000001mS8-1FMg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 11:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A980743CED;
	Sat, 14 Mar 2026 11:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF4DC116C6;
	Sat, 14 Mar 2026 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773487161;
	bh=dikWE6HNN6Di+3MQ32RIVivnTwpdoq5R2GHeIxhEZYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZs3lXwJKIV4tm+5E94URl5p7F2TmnEZg57gELtDtVsPsnFfe1GBnhoF1j8gX6g1i
	 EIAIhTcatfalTEyYEQk5d4v30Vejup5QkTmQwnSF4+0rr/wZBSG+r7LaWvNzpUZG3f
	 ApwvBvuUgxTNZqNE6uDFANqF57+J/b3myoTfvN79prKBWOff8FAVdH+ER3ZfoXn9Kr
	 xhnjxYzocBCZvLPOmkuH1uv5FNghxUPi6HBKkZ+hJcK/fO4/s5GDzAcVqayNTvgBpt
	 H8d1/L7GwFgx2Bdjg8e2VmvVTo5/Vxt3Re/+yFY25AT1P4oOMRg+howux7B5fMV5SD
	 sJ7yAl/zlXhWg==
Date: Sat, 14 Mar 2026 12:19:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Message-ID: <20260314-laughing-vigilant-cricket-6a918e@quoll>
References: <87sea3680w.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sea3680w.fsf@BLaptop.bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_041922_361187_8ECF2148 
X-CRM114-Status: GOOD (  13.63  )
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

On Fri, Mar 13, 2026 at 04:53:03PM +0100, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v7.0.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-7.0-1
> 
> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
> 
>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)
> 
> ----------------------------------------------------------------
> mvebu fixes for 7.0 (part 1)
> 
> - Add bindings to validate the device tree that has already been merged.

This has 0 days in next:

Days in linux-next:
----------------------------------------
 0 | + (1)

Commits with 0 days in linux-next (1 of 1: 100.0%):

So it will wait. Please send pull requests with code which was in the
next for minimum one next release for fixes and few (5-10) for
development.

Best regards,
Krzysztof


