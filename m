Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EA7F54AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nsFdToyntePBoXlyyG2xfzskpRJisEXojHx4jRWnz8=; b=hBKmTVKyVTx7BdDhid4G11NqZn
	uv1BYfn1Ye5boSdm8j+we03SpnNEQceRe+LaSEc+mma5k4FED7dc2iKfIvErw//P2gIo1BFRrPQSK
	409H0jZkRuYkQLkuC6LAICZsKhXNk23SCUwzcBK5QYMl4QgIP+doNp/rmlHJFTUEy2KdghopXCxWA
	BaUSoJVk2m5MaekmPFmYQAn01+grCHTjaFxg/5bJjslzr/o4j8hO1Fnc5aUCaSqny/VVBuNsLcrJU
	Ww4p4MCwLI3YLlnRVtYcoBCg/CYmiHNoILRsl2QOCVIYLSqoaydgaMHDfdskOiCF1SmuM6GJs9oEC
	3tN/NX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w523I-00000001ZAo-3Lmm;
	Tue, 24 Mar 2026 13:44:12 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5238-00000001Z9B-0mbd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=1nsFdToyntePBoXlyyG2xfzskpRJisEXojHx4jRWnz8=; b=Oakj5iUiFGgUpGZSd1N2SKIy/K
	wzJiSQ3bG4jSK+eV2+AeFtdAFAzGoq50NK28ur8yKcNO5ore/HfN80CisAppeWv0r30CDvEGyub5o
	Ps+fa0qlXRZ8nhuIwgrvAQoKsI7SpKNF5RhjupJFjZX9x1kzqsqy+x7LsiEXSezD4Wj6hvObsy4a5
	xC+0LKhtXzXq2+qcvSzWo7pc0ydJN4hCx7ddB1QQ8vpzDO5JY48PTpp2JodnaFQ3QFq7iM4a+Dri6
	8rvYUZVwkyx9K7egysaT7BfqM1vsseAnzHdYVeZqqk1m9q4GFvnUuNlPu2THed+HhU4JSLktpk6vI
	NRoaVmUQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w5231-008LNb-4V; Tue, 24 Mar 2026 13:43:54 +0000
Date: Tue, 24 Mar 2026 06:43:48 -0700
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: oss@malat.biz, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, paulmck@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-ID: <acKJn-x__694pYyR@gmail.com>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
 <20251113133403.308046d2df1c97ba7dcd2388@kernel.org>
 <wqzhgeu5vlkeuomajvy7vf3x4gf3fsnzmczmkswvjo7xdyzzbo@6uqjqftbzgot>
 <abwTJBj80oX_T8xt@gmail.com>
 <20260320130316.5be6fc45f7860d5ac44c4de1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320130316.5be6fc45f7860d5ac44c4de1@kernel.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064402_261592_91194253 
X-CRM114-Status: GOOD (  19.43  )
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

Hello Masami,

On Fri, Mar 20, 2026 at 01:03:16PM +0900, Masami Hiramatsu wrote:
> On Thu, 19 Mar 2026 08:20:27 -0700> Breno Leitao <leitao@debian.org> wrote:
> > On Thu, Nov 13, 2025 at 02:37:22AM -0800, Breno Leitao wrote:
> > > On Thu, Nov 13, 2025 at 01:34:03PM +0900, Masami Hiramatsu wrote:
> > >
> > > Another possible solution would be to load bootconfig earlier in the
> > > boot process so that early parameters can be defined within bootconfig.
> > > Petr suggested this approach some time back, but it doesn't appear to
> > > have made it upstream.
> > >
> > > https://lore.kernel.org/all/20231123194106.08f5832f558fe806b1fd8098@kernel.org/
> > >
> > > I'm not fully up to speed on the details of this change, so I want to
> > > ask directly: Would Petr's approach—allowing early parameters to be set
> > > via bootconfig make sense from a bootconfig design perspective?
> >
> > Would it be worthwhile for me to take Petr's patch, update it to the
> > current codebase, address any issues, and verify that it resolves the
> > problem described above? If so, would you be open to reviewing and
> > potentially accepting such a patch?
>
> Hmm, let me recheck it. But the thread seems suspended.
> Can you or Petr continue to work on this?

Thank you for the feedback.

I reviewed Petr's patch and decided to take a more focused approach that
specifically addresses the early parameter issue, which is currently
biting me.

I'd appreciate your thoughts on whether this direction properly solves
the problem, and we can continue the discussion there.

https://lore.kernel.org/all/20260324-early_bootconfig-v1-1-1c0e625aff06@debian.org/

