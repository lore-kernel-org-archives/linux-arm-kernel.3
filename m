Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC77DCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iY3PzyT2bvhJB8GQoyEuL/cVwNdncZTwIKXWvjCy5sc=; b=ed3MILbNDt0dm1BWgktvzV7Sjm
	3prCdOYI6YbkqzCjgr3jTKuA0JNcdaI5wobFwTfQdVl4ITYFLYvVMfmJlLa6SMHPq0ZY8OJ0uc3DI
	lsOfVZi163oTkCxJl/r73v5IQMXppCDxOn7B9zRctYlyMfdMyhPoworSyK87JhIqPczrEm6yjNhIP
	JmB6657ORHUYoEcpaL5yGatU+Sr31kknfzGhk+EBP0lfhJyWQefBPA+WLzCPhHL1YVg+x4oiKCDQj
	O2r+FjconU+FdurIfS2Gv8xtqtNQLJ0mokybXowQSQifIMuJ/tc0SHlAPHaqIw6wga2yWjN3mcQiH
	5jaOHoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaID-00000002a8G-0zrD;
	Fri, 19 Jun 2026 14:34:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaIC-00000002a86-2644
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:34:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4F1C42A3E;
	Fri, 19 Jun 2026 14:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803D01F000E9;
	Fri, 19 Jun 2026 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781879639;
	bh=iY3PzyT2bvhJB8GQoyEuL/cVwNdncZTwIKXWvjCy5sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qt2UYjxNkeCMkAztbuSIJV++ogincDirPM4tLxFDX44bRbSEbSpl0eTa/0WH0fiOC
	 gbehVeWbaBxkniTtKNZ88i4Ol9SeEKxK9Q8wju3zkrj/5sCaMEUxjBXykncMZugJl3
	 XmCtNx36Mfu/0LIaA+FDqhJayEktKLas8PgHocAlgiX2NT8B2mczkW8RQUF8Zw0+MK
	 7lh2FGD7c839RXq880flX2H7sW6f2pbuWnN0HP8QtFehLCcfxIIRnHoeZ+XJtboXg1
	 1dPrlLW4S4vRyxFjurpsO4xXlfoKCf5bVcIW6gV7syMJ+1Pq3kXvrZd6mnnMeb2xEE
	 IkKgpfPpGwxtg==
Date: Fri, 19 Jun 2026 15:33:55 +0100
From: Will Deacon <will@kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
Message-ID: <ajVTU7OsCInkAzoq@willie-the-truck>
References: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
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

On Thu, Jun 04, 2026 at 04:08:39PM +0200, Rasmus Villemoes wrote:
> When trying to figure out where to place and call an arm64 Image in
> memory, reading booting.rst should provide the answer. However, it
> requires quite some digging to figure out that text_offset is set via
> ".quad 0" in head.S and is thus actually always 0 since v5.10.
> 
> Update the documentation and make that explicit. Reword the 2MB
> requirement accordingly, and remove the paragraphs that only apply to
> the ancient versions where text_offset could be non-zero, as they only
> confuse a current reader.

Doesn't this needlessly prevent us from having a non-zero offset in future,
if we wanted that for some reason?

Will

