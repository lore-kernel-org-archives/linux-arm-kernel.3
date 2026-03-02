Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AE8EA4E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaqHtqWmOF9hRZG8kYmHF7cvCHh3pX6/QOes+yZLGGA=; b=ltDymN92wxUpOzBiJZYH3e1d4p
	r9ZRApD6L2uOA2eizkl96z3Y0HnroVZzDKqcL55KfcAVqjpg+avr8bcal1H6I+H86gXXlCRThfKAi
	/x75s56OJWdNvs3jtZUwUcCNqt07mj5MhyZIlPpEISFxW3ZC62y5sWtsgY7iClS1Lv7jvBUtPDDjl
	7QdNezR4XLS/+T9fS56FXzpHcumvQE43lnT3idEo68M1sBwTunXpIDmePaHVMkwChQWn3EdeM2hHJ
	dorrNmTloQL+sJMoOmOmxY48OXwL//PWbWBSWkWI9WDRr6RYrjMdMErH5Um5A/sQ9HvAvsew/iQK5
	7wcjnOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3gu-0000000DAB6-2Dnt;
	Mon, 02 Mar 2026 13:52:08 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3gs-0000000DAAr-258l;
	Mon, 02 Mar 2026 13:52:06 +0000
Date: Mon, 2 Mar 2026 05:52:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 1/2] arm64: lib: xor-neon: remove redundant filename
 comment
Message-ID: <aaWWBned-T74lsXl@infradead.org>
References: <20260301152820.2589291-1-objecting@objecting.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301152820.2589291-1-objecting@objecting.org>
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

On Sun, Mar 01, 2026 at 03:28:19PM +0000, Josh Law wrote:
> The filename in the header comment is redundant and not recommended by Linux kernel coding style.

I have a pretty big series pending that changes this file in
meaninful ways.  But even without that please never send standalone
patches for trivial cleanups like this, only do them if you have to
touch the code for another reason anyway.


