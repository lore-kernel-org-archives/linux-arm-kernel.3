Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3A2CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Txa73AibBOUFGnqEUgy9UQjLyox1mglOmNld2kHTL9M=; b=Yi8FShS9CM1cJp5I7Jh/z+K97x
	qjvdqE9LbBjls7aUSu4taaMELYLEtqP4I9a3DQNCTWxQbZofabjTqigGNP/KnIZRjsTWWMHHFlWaO
	cF/R1zsdMwPul3bMzu4fRpkTnro2fmNkQqbAC8cBtoc91iRVqe369Qkznzwc5n7ZiWGxkddqp+EqQ
	6ohpADtaj8CCwytNrjAPGkC5WiCCjCmTgmXU1ya8Gm3k9wEdX5Q0a08TQlVdUPcDOTdOIKT7J6XIk
	M2Pl92IZmE9dMyjYdV7wHSoePDOgFRQ02MDZTH19Ud9HyqQedpZw5juJtI+pQkJZg7ksERPcYNWxy
	iL2UHKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFo0-000000093H9-02r6;
	Thu, 01 Oct 2026 12:22:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFny-000000093Gp-128m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:22:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 742CD60A55;
	Thu,  1 Oct 2026 12:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD5A1F000FF;
	Thu,  1 Oct 2026 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857349;
	bh=Txa73AibBOUFGnqEUgy9UQjLyox1mglOmNld2kHTL9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsDC78qXzYYpOMV8w2qnZYpSaYWdLT0/j8SDEUXDrzzRv4m2sGvsn5I3S7axzVQkd
	 MXhGhUQF5O2FHw65Y/RfvXbClKioHk9k9eLHpevJ7Qh4EoscWZxHKofpvamiyEgTAR
	 kC6SnMxGtHpS75EXpkgGcxFeyMzwIJZnl7fwK9ZKIVa6iDKf0BMGeGdS4+veMrLS/q
	 P+xWeMoFzLN9pQvAGzZrHSysUggRx3NJVmyYHE0iYJGT+I/XUWV0elNjJiZbG241SX
	 jczOnsKZLGyLruNNPDKnvy6dznYp3V7ZbDK+5e1bS3+k4eKAWauhf7Jnp58o8HmGoD
	 byUMtBnr58qqg==
Date: Thu, 1 Oct 2026 14:22:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: SoC Team <soc@lists.linux.dev>, arm-scmi@vger.kernel.org, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v7.4
Message-ID: <20261001-crafty-attractive-kangaroo-d20f0f@quoll>
References: <20260928065112.2492223-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928065112.2492223-1-sudeep.holla@kernel.org>
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

On Mon, Sep 28, 2026 at 07:51:11AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> The following changes since commit 8544e0da1a04c77b98e2e313a423a5c72e48ea32:
> 
>   Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-09-08 21:04:42 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.4
> 
> for you to fetch changes up to aac4e67d6eb93118cfa70c6562b5f9c81a7042ef:
> 
>   firmware: arm_scmi: Always create devices for standard protocols (2026-09-24 09:10:43 +0100)
> 

Thanks, applied

Best regards,
Krzysztof


