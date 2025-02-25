Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF8DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gqp7mwTK3YSjBq7qHLLUEIE1pbJAxEZRfdzmirETXMQ=; b=d79mul33MzXMfEYkxQvyAcmzu8
	PiC/kxbFAplZmKBAq6/CWLjrMb/53bSURoKqXjAOJ/LrhClj+10y4X3FmISW/dNDiJp5cFPpWAYSt
	S8WottqQHKS0sfYT72xsKOMXIJgawab0W7v8UOrBvNkwLA4DukJ45lLXJpo7qg+fEPZjs4gzQoSjA
	xqRm7iGafVfgu4WVvJ0P3F0vF7I79axKLAZcWafF0SitasXNMmer2Z8tgcEWyL+ybfGlrRqBVayJY
	repSNCXmqan5InzblH85oV+uIslzRJXfu3LC6Vx1Yl+kgEPf1nUdV20I/x7r57ReMmscCtyiSWVkJ
	Bx3OJH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqbZ-0000000GRvy-3UVq;
	Tue, 25 Feb 2025 08:47:53 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqa1-0000000GRdD-19WM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:46:19 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 161DC2540135;
	Tue, 25 Feb 2025 03:46:15 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 03:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740473174;
	 x=1740559574; bh=Gqp7mwTK3YSjBq7qHLLUEIE1pbJAxEZRfdzmirETXMQ=; b=
	qWtF1OwcrUhy36iN8BURe8nP0cFg0cmcOc+vnGmUH2pt6lcZGpNPG5PNgWqdtV5A
	4JiNgqgMQ2SA4myTu3CjD2Lbgiay3Iv/8GxZopX9dP2FOEYqLwt7dphddTK+/2aO
	IhFK/eBxu1q7sncbOudX6HA1+cKTQjtp1LwB75tgQlLa8TZOVg6MuRgtlwMQ8WDT
	Q2qLEfsrTJU0iibiOSFbEfQFlm3Cda4rZeKTzKyGi6hl/RG38nWCZKmkr7TMQk86
	hmO0Bb5w2ZZdXY4DP6aj9jgChinTO+TzI+8QxOTA1T+Kyj+xy5ejmL1gCkLnLw4U
	upz/YsnU/nqvopd8ioKP8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740473174; x=
	1740559574; bh=Gqp7mwTK3YSjBq7qHLLUEIE1pbJAxEZRfdzmirETXMQ=; b=g
	8sSRzPqIkkcW3d2sMheE8RXiIv/hxa0fkAnUND/YHkYPIV1r+LIH9hzpTA2VLCZs
	E3c/LteZGrF7J2MYrblMxg/NnRFI9rQxdrT1sHtKfozEHrWoW5oppH0V0VNUhLrC
	jzwdjSRwfPUx+RPDAXFurpYPSQFXu3IYRanimyL6jos7OIiziugOCA+lebW/BaX7
	bS0SVvl2lvHjCGcVIejv7ZbczP0BI7b6HRWVFwgruklhSCJLecnwFIadutjk9DTs
	vyIoTUIfpW+Ejgg3Hzu/PElCZPWBKIP8XEnce6pE7XMmC4apV+S8/mqiAE6vOZS4
	A62M35zMy5CMFA1vnfncg==
X-ME-Sender: <xms:VYO9Z7ZjzSGQBkl_bdQAkvw7RJJKpmBsMHVKTFY2RIiqGv57dtOovQ>
    <xme:VYO9Z6YUx_PJ_13sTiAv8-8ZCAS_Xv9dHzddPFWcgmFqXFk-ydg9u4vTO9ypS1Sei
    tb_GoxcBIQCmoOzbQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopehmrghrthhinhdrkhgvlhhlhiestghrohifughsthhrihhkvg
    drtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhu
    phdrvghupdhrtghpthhtohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitg
    hiohhsrdgtohhmpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrdgvuhdprhgt
    phhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepiihhvg
    hnghihvghjihgrnhdusehhuhgrfigvihdrtghomhdprhgtphhtthhopehpvghtvghriies
    ihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:VYO9Z99GuZzh6mTJ2hh1DqhImZMJTUwR9ybvHkkLGvmfhkFBjtpcNw>
    <xmx:VYO9ZxrzBi1aI77BwZu-YSr_bsDL0SzuIuIq7uZ2I0sQ--QrrCJSYg>
    <xmx:VYO9Z2qimk4q1oG6TtJqdD8ayoJVMeQ_QFFum5C-vnfOJ1yQB2yU6Q>
    <xmx:VYO9Z3T_YIynT8x-I6JrB-PKgBsjBTzNNam7Kn-Nn_ZS2KLkTWU2Pw>
    <xmx:VoO9Z4YEQE10Manbd5j1XgNtt-qqvPhkwEGTYhWC2WCwzIcHyl7INc-u>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ED1BC2220072; Tue, 25 Feb 2025 03:46:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 09:45:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Zheng Yejian" <zhengyejian1@huawei.com>,
 "Martin Kelly" <martin.kelly@crowdstrike.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Josh Poimboeuf" <jpoimboe@redhat.com>, "Heiko Carstens" <hca@linux.ibm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>
Message-Id: <91523154-072b-437b-bbdc-0b70e9783fd0@app.fastmail.com>
In-Reply-To: <20250224211102.33e264fc@gandalf.local.home>
References: <20250218195918.255228630@goodmis.org>
 <20250218200022.538888594@goodmis.org>
 <893cd8f1-8585-4d25-bf0f-4197bf872465@app.fastmail.com>
 <20250224172147.1de3fda5@gandalf.local.home>
 <20250224211102.33e264fc@gandalf.local.home>
Subject: Re: [PATCH v5 2/6] scripts/sorttable: Have mcount rela sort use direct values
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_004618_162325_79A7B297 
X-CRM114-Status: GOOD (  13.36  )
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

On Tue, Feb 25, 2025, at 03:11, Steven Rostedt wrote:
> On Mon, 24 Feb 2025 17:21:47 -0500
>> 
>
> Nevermind, Masami told me all I need to do is add LLVM=1 and clang can
> handle the cross compiling.
>
> I looked, and sure enough clang on arm64 does it the same way x86 does. So
> using the rela items to sort is a gcc thing :-p
>
> Can you try this patch?

It fixes the build issue for me. I tried booting as well, but ran
into a BUG() when I enable ftrace. I assume this is an unrelated
issue, but you can find the output for reference in case this is
relevant.

     Arnd

----
[    0.000000] ftrace section at ffffc44698ef67c8 sorted properly
[    0.000000] Unable to handle kernel paging request at virtual address 0000444617800008
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x0000000096000004
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000]   FSC = 0x04: level 0 translation fault
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.000000] [0000444617800008] user address but active_mm is swapper
[    0.000000] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.14.0-rc4-next-20250225-00565-g6c6895f38d76 #15305
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : ftrace_call_adjust+0x44/0xd0
[    0.000000] lr : ftrace_process_locs+0x220/0x5e0
[    0.000000] sp : ffffc44698fb3da0
[    0.000000] x29: ffffc44698fb3da0 x28: ffffc4469929f000 x27: ffffc4469929f000
[    0.000000] x26: 0000444617800000 x25: ffffc44698ef67d0 x24: ffff57b2c2008000
[    0.000000] x23: ffffc44698f59de0 x22: ffff57b2c2008000 x21: 0000000000000000
[    0.000000] x20: 0000000000001000 x19: 0000444617800000 x18: 0000000000000068
[    0.000000] x17: 0000000000000001 x16: 00000000ffffffff x15: ffffc44698fc5f80
[    0.000000] x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
[    0.000000] x11: 0000000000000000 x10: 0000000000000000 x9 : 00007fff80000000
[    0.000000] x8 : 000000000000201f x7 : 0000000000000000 x6 : 302e30202020205b
[    0.000000] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
[    0.000000] x2 : 0000000000000004 x1 : 0000000000000040 x0 : 0000444617800000
[    0.000000] Call trace:
[    0.000000]  ftrace_call_adjust+0x44/0xd0 (P)
[    0.000000]  ftrace_process_locs+0x220/0x5e0
[    0.000000]  ftrace_init+0x98/0xe8
[    0.000000]  start_kernel+0x16c/0x3d0
[    0.000000]  __primary_switched+0x88/0x98
[    0.000000] Code: aa1f03e0 14000014 aa0003f3 528403e8 (b8408e74) 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

