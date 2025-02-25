Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C0EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PufcynWLHAQL7nfZkwNHzYK/u+t+8/ROjdTdXqjkv5s=; b=cx/5czD3ePmYygFcNLeOjql6Kz
	HaivnB3WUx3TVAzq6Iu/BjuQ5Oa2ORwhNSSs7dM4OedFLMPXTBnExPllav7glh6Pj4NnZPGKq12RT
	hU/Ws0d5A0Ir5jqO4u3hoSfTJLd9lwOAXcMqq7yD2Lhvdtyv2mbFqF9+gF30haPKpxVzOPlSMB1TB
	HZyKm4qVXkKnkDuLeQUBG6a4NRANISYUJWTFrP2W8GWdmw9dlFIU2b2nkzAAPUP6/ZmXOe8ZaY4dy
	WUY1p90NWs60FxIueR/77vH4KDmB2DfzgEQH+2EDukF2Jwv6SoAuT3ta2BCUoKaEfWNjb4ZE7kyzH
	EQOEyGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn01y-000000012Rq-01OH;
	Tue, 25 Feb 2025 18:51:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzlK-00000000xbj-2bN6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 029AE5C66C0;
	Tue, 25 Feb 2025 18:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE67C4CEDD;
	Tue, 25 Feb 2025 18:34:31 +0000 (UTC)
Date: Tue, 25 Feb 2025 13:35:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] scripts/sorttable: ftrace: Fix some bugs with
 sorttable and ARM 64
Message-ID: <20250225133510.34d13366@gandalf.local.home>
In-Reply-To: <20250225182004.473875894@goodmis.org>
References: <20250225182004.473875894@goodmis.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_103434_733042_92671B26 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue, 25 Feb 2025 13:20:04 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Steven Rostedt (4):
>       ftrace: Test mcount_loc addr before calling ftrace_call_addr()
>       ftrace: Check against is_kernel_text() instead of kaslr_offset()
>       scripts/sorttable: Use normal sort if there's no relocs in the mcount section
>       scripts/sorttable: Allow matches to functions before function entry

I just kicked off my test suite to test these patches. If they all pass,
I'll push them to linux-next tonight, so hopefully this doesn't cause
issues for others testing linux-next.

-- Steve

