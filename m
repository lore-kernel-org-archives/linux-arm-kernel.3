Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BB6CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rayKXcpPRog2YFx+3rxvhNdVb1dz4Ieajk7ux9Sjvvg=; b=uRXgB+0skEf0tTKQEIAmR9LCq6
	pSP5J0kxPZE9Y64oj/tr43AhIztgH8HohRCLRQZwU5B3XEiBPvILBqkFhtyzilEhkQ5f0SsmIAqEB
	SCycK+fnKtxMxKh2KwDrw/d47AxHsBf8K5caipe4n+w6RXXUa6N3HdsKnf6W16UJwdBuH4KLiGS1r
	vTH46A+P7PRMDovwvBsNkQfiMEk2Sjuelm0yWM9XWGTNlsHxRUq1jvF2XZnLLUmUXeK8g0bCXsDxQ
	Ess86ORRSEccBRY6c8+cNBQym97nNh2N872Xb6I4LyYzKzzZjtgJCWHlzTFpWMoQexEoiyFOiXwTv
	lnhQKnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUN1M-0000000CrA5-2R9f;
	Tue, 02 Jun 2026 11:10:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUN1L-0000000Cr9y-2vq7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBFCA60126;
	Tue,  2 Jun 2026 11:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A8D1F00898;
	Tue,  2 Jun 2026 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780398654;
	bh=rayKXcpPRog2YFx+3rxvhNdVb1dz4Ieajk7ux9Sjvvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ekFNM2eMRGlfqnksEAOzBZaNFPrpWrG+MD0EFGEHGVFhA9P6PuZqtE8+Ua7oeO20w
	 n0EN+EqcUTOx+eX5JqX/5JdBAY9gEIZOGhRnU2em41ctk9Pxf8CnDMaEu4b4zQt9qm
	 ZdoFBbL6jKQFnm2YaTJwf21WKsamcEfwBDCjqZBSYob77mLtoIoWBD1R0KVupl6CJH
	 RepVBjFEeMrPWd6C0Tp4FPF9iXOLAIU8t2NZYbReZsGKI2CxyEyTvrTdYGMIBtWljp
	 yrZtaNQ5LfG4+Vf6c4tJX+vTPcjWxAnmDrF8bZWomBFR4k6LdtJn2t/tAD+jIHb9qd
	 RDDIhLHSKGexg==
Date: Tue, 2 Jun 2026 12:10:50 +0100
From: Will Deacon <will@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM64: remove unnecessary architecture-specific
 <asm/device.h>
Message-ID: <ah66OiJinzU-8pNF@willie-the-truck>
References: <20260517025348.96906-1-enelsonmoore@gmail.com>
 <agxToDJ6y_ciI1Oj@willie-the-truck>
 <CADkSEUgoQvEHak-wxp0mJok_6_PgraxqZcDL4aut_MHhpYXoVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUgoQvEHak-wxp0mJok_6_PgraxqZcDL4aut_MHhpYXoVw@mail.gmail.com>
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

On Tue, May 19, 2026 at 09:03:06PM -0700, Ethan Nelson-Moore wrote:
> On Tue, May 19, 2026 at 5:12 AM Will Deacon <will@kernel.org> wrote:
> > Do we need to add a generic-y entry to arch/arm64/include/asm/Kbuild
> > so that we pick up the asm-generic variant?
> 
> No, we don't, because device.h is in the list of mandatory headers in
> include/asm-generic/Kbuild, which means a header including the generic
> version will automatically be generated if an architecture-specific
> version does not exist.

Great, thanks for the explanation. I'll pick this up.

Will

