Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16497C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bv1lKTHFFm3DfIi/TgcdlSfHSAO2gJzBqq986gjNAXc=; b=J7pQnLxx3VfRw9uvXdlyuaReQ0
	ITsMIa1+jcFnfiWfZ8+GM2FsF1JDqlsobxT9etgSAp9+2QIzgsepcf4mRvCLWZUsXGAWbcbooEbSs
	xQw1NdBiFEGnaeUB5DyFyhxutz2FFTdZJyo20L6NHdv/C4uIqPTOTFo/VC6cVYJnUxBTS+mveb8x6
	wXsvVOR1Z8OOc8A/OF9LhGZGdUxUykwXt5UhSOvI2WmpgVanafwW8L9XT+pfuIBucJcBTYtvIcRyI
	RqONGYsQaco9NWn/oku542yoX9esHHLN4nKln6IWJnFGlBETO3ib1CyQe8gjJhLAgNYZnLZoqNkDj
	UdjxlWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2px-00000005ayN-1mGB;
	Tue, 24 Jun 2025 12:33:17 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2lo-00000005Zzy-0TWx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:29:01 +0000
Received: from [141.14.12.217] (g217.RadioFreeInternet.molgen.mpg.de [141.14.12.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B1C1E61E647A8;
	Tue, 24 Jun 2025 14:27:53 +0200 (CEST)
Message-ID: <7b1f0f17-197d-4c57-b1d2-a9d8ec6ff398@molgen.mpg.de>
Date: Tue, 24 Jun 2025 14:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] i2c: aspeed: change debug level in irq
 handler
To: Zhang Jian <zhangjian.3032@bytedance.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
 <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
 <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052900_303504_87052B88 
X-CRM114-Status: GOOD (  11.70  )
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

Dear Jian,


Am 24.06.25 um 12:32 schrieb Zhang Jian:

> Thanks for your reply and sorry for the late reply, I was trying to
> figure out why this log occurred, it's quite hard to reproduce.

Thank you for your reply. So few days and over the weekend classifies as 
instant reply. ;-)

Were you able to find a reproducer, or just rebooting?

> I traced all the master and slave states, and eventually found that 
> the behavior matches the description in commit b4cc1cbba519. The
> issue has already been fixed in that commit it was caused by a state
> machine bug that led to the interrupt not being handled correctly.
> 
> see: https://github.com/torvalds/linux/commit/b4cc1cbba519

The commit you found is present in Linux since v6.7-rc7.

> (The state transitions between the master and slave here rely on
> interrupts. When the signal waveform is incomplete (such as during
> power off/on), it may cause state errors or brief unresponsiveness,
> resulting in some log prints.)

Thank you for getting to the bottom of this.

Now that you ran into this, and have a suggestion, how the logging or 
log messages could be improved, please share.


Kind regards,

Paul

