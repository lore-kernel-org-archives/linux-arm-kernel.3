Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14018CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq4rnNBZYX8eaz0VGkSottSfzuYJsU//WpjHmgWk5Y8=; b=egpLxUQQluw5PAsnzeoXQIMTD+
	p2BmeYWpC3AD1uOPcMtl8FuiCw7+u2QhlpZGB1s1vaKxSe9Jb434gzeEjkcj+1uk2TTHMtVEHpLau
	4ktkt1U15/U/6+lhJsEQB77zvClGRT6oryTlZmQwWgQyVRWuS50pmkhdlO8kut5OYCSRa1zWldxXx
	NTQGkUPNoSzJlXU/5fXOCEyww3gzvp5dBr3KlRU2G/Oxnnimdnmf8ed+ZPQ6PatrlqZ3xLjRtEdwW
	e4YPdTWiu1BmufLrWIgS1iSGq8xv3CrnSCDfNTKT1c6/u07ADHDBGMyGcue1GxGHrW1ooJMgbYtis
	PTMY7Abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdh8-00000001Cnw-3q2o;
	Wed, 06 May 2026 14:57:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdh7-00000001Cnk-3E6w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07F8260103;
	Wed,  6 May 2026 14:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBFBC2BCB0;
	Wed,  6 May 2026 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079468;
	bh=8si24IOti1/iGS8Ii+rD9oCJOsgxix/eRYlFpzIWYuI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lQnqq4MRZCzlWelxIgit2yM3HH4EOKJSumvuI3HQjVtEG+0doLGq2jGnpgVSB7+o3
	 YfqiifCEKZWvIZahx7FybsNrPwPyVqBKSp1bMxcBSbuweHLYfxYHemhRs1QQdLwWMe
	 hAs6YjV4pJpabCN9W/8x4pJ0fvzOfpJmK15/8c7hpjvsQFIbbE2KJvU898al6C+v5B
	 mtU9tL0BkU4OjJdS/wrEqYPBXieZ4/jB3tTMW7jgwMoN7TXkv3VS/v+ZFbl16IBihR
	 yhll48547hyJrCYB0GMa7d0s18ykDZMNNrIF27lHOh4GXK6JSiq/WnyHcOUS6bsqTF
	 Hhz3kEKxPaEqw==
Date: Wed, 6 May 2026 15:57:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Angelo Dureghello" <angelo@kernel-space.org>, "Greg Ungerer"
 <gerg@linux-m68k.org>, "Geert Uytterhoeven" <geert@linux-m68k.org>, "Steven
 King" <sfking@fdwdc.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "David Lechner"
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, "Greg Ungerer" <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, "Angelo
 Dureghello" <adureghello@baylibre.com>
Subject: Re: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <20260506155737.6cd625a5@jic23-huawei>
In-Reply-To: <ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	<20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
	<ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 04 May 2026 19:28:28 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
> > @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {  
> ...
> > +static struct resource dspi_dac1_resource[] = {
> > +	[0] = {  
> 
> This looks like the name has a copy-paste error: this is not
> related to the 'dspi' controller at all but is just the dac, right?
> 
>       Arnd
> 

https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com
Has noted some more alongside this one.
Seems unlikely a DAC has a bus number.

Jonathan

