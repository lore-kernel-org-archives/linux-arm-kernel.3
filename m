Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFCFF99340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ManUlrjOATanCNBLil3mYiOJaQsx0qPFa33vxr+zbfg=; b=Yn1Yr73RtExP+93Bv0eM61I99a
	WB9qAFLiPvKLs9qlURUTbwppmcP31FZx9SMIuPmGdS7fNRo7eh4AWzclgxrBmp3KZVjsc2CA0rb7Q
	MG4VcKs38wOrqYDKPv57NGeroOzI/m5YZnrskgLm7px73YleNuJWl0lTpWvoikyF+MNsvdEAVcZkx
	EaQ6Fpk1vYYbVkoIwNzQZSfgIdRKPYSzsC12OdMOfUb9BQzD5UuOVfJL2upl5cnV93UX/eEiQgDKS
	hRa33yXWcW8PrCC4adsGW+j7uAwv/JVCBiooGsLa2bVVo0aZPr4cQHWurnwS7Y37DqeduRLNfTd3N
	GW24EozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFojX-0000000BAmg-2EDa;
	Thu, 23 Apr 2026 07:44:23 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFojU-0000000BAkc-3t0B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:44:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B599E68C4E; Thu, 23 Apr 2026 09:44:11 +0200 (CEST)
Date: Thu, 23 Apr 2026 09:44:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 2/8] xor/arm: Replace vectorized implementation with
 arm64's intrinsics
Message-ID: <20260423074411.GA31018@lst.de>
References: <20260422171655.3437334-10-ardb+git@google.com> <20260422171655.3437334-12-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422171655.3437334-12-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_004421_107035_77F17B86 
X-CRM114-Status: UNSURE (   7.75  )
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

Nice!

Acked-by: Christoph Hellwig <hch@lst.de>


