Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C7109B489
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvYJMv6jCryhNn7Soq6PFp6s/tK+JHRyrI6npMZTO5E=; b=lhDwDh1ZdHiJhorVXCVy0WXP8b
	UvTmOt0G+8zvvFYEiG5NmCoSZM2O6wW7Kum9NDLkEGufvlU0YTaHL9wDFSiWpfpEj4YzeitNnisgm
	EqmKnuf4zyfnLT3LAR07cbB2mMxdh7oFfnQb6HnGFefH+dqD02bWQDhcJbqMJDmyFnxwHjSbNSBND
	w4lpNdtF1c5eRv/2RWG+tL3uOsYT/ogNPCc4fqcJUZGJ1Zrfw45t3taSqG03+m5OzuF70R/H0EcTF
	skwJB5X8z+iRiun/4AbDcP3hE8ukdfJxPp309G48ziaFLhFttBJ0xkJDJltnt43MP2SV4fUj+nqWr
	tRFihXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7apy-0000000DA0L-3SDq;
	Tue, 31 Mar 2026 15:17:02 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7apv-0000000D9zU-2Qtp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:17:01 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0BF1B68BFE; Tue, 31 Mar 2026 17:16:54 +0200 (CEST)
Date: Tue, 31 Mar 2026 17:16:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 0/5] xor/arm: Replace vectorized version with
 intrinsics
Message-ID: <20260331151653.GA8011@lst.de>
References: <20260331074940.55502-7-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331074940.55502-7-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_081659_759331_F8B059C9 
X-CRM114-Status: GOOD (  11.06  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

I think some of the intrinsics patches were also in your crc64 series,
so I'm not sure how to be merge this.


