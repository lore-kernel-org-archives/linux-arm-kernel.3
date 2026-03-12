Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3DDFED2E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NwCelfylXBUrlrL8vHHXvxxzk8E5c//2AgbNgxhYXg=; b=JnthGe427fatH0FerqxYvGxYBi
	t0IfAeZL2v2HixrwOPCjebRmc3uEMxU1UMwzD+bJ1qRJBAbDV0mdaaYwxxFEVZ/k1/fMjP7+CLp+X
	NChB3skGmNV2sCOIzAGUf2b2Ys7sFw8oIG4AU3q9N5qpdztjGyg0GUzvRxOfMhIoq3X99201yOwCc
	F++Gz48zEwmpxhpjOIALW65S2pT4u8dy+d+aD+d8rwVTqmc5gyC5qPgdYd83lNqzIdOfCLYTl9ahp
	BncUH46/Wc1BZRvTRW2SUYs8jSMIJk05GPgg3sjar00jUyvwdhucFJkkr9JdnNxdqktmeIBrIitpp
	uOR1dQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aeu-0000000DYOh-0Alj;
	Thu, 12 Mar 2026 07:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aeq-0000000DYOW-32GK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 07:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 561FE60141;
	Thu, 12 Mar 2026 07:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83749C116C6;
	Thu, 12 Mar 2026 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773301235;
	bh=MPH+Wlcdqc/nXSFAck1cj/Cl/jlNamCFfr2noDau+VU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZTF5RPLb5oYXaljC6stXuDnfEDg012srvcTSKhS7ELqtq3fuwIGI+KbsFIN86m2na
	 ueLCmJ3SpRzSyoPkhUVCpBKL5rX9w3CYk5WRtRUA2Cp4JHOSENkcTbOqApWLWA0MwO
	 /pRVLcy7cXho1C97sdmUBsbmTDinpMXasOc5l6awPUnxqkYTKKxQPgWsFanCvmRebu
	 Z004tXqLFajxJH2ltQ3DtFcPbGmih93wTSBijizYX6KOGUL0LOSZEsCTIPZAk+xAet
	 rVSq6p55Ohz6iFm1+D/lEcJV+5iLHnzg+o+fccAqmmSCI0dgcfCIiHD1qS5Kyn6EZ4
	 3tExA97IQP2qA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 54F96F40068;
	Thu, 12 Mar 2026 03:40:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 12 Mar 2026 03:40:32 -0400
X-ME-Sender: <xms:8G2yaRYFFTYuhqShcfT0FtYjVE549HFV5Xiy2QcdT8VyvTWsUkciEA>
    <xme:8G2yaTPCW4nFahGxqqJADEDX42Jo_x99agIt0TFYQ8-Ob9AvhVOcAY-RvZLyJ1IFA
    CNDk67ZpqlBjAuLtco0om5BAqN0-kvFhWd0CnbXJ1pPNvTm7MFU23c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeeivddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    geejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggrrhhonhesrghkrghmrg
    hirdgtohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepuggr
    vhhiugdrkhgrphhlrghnsegrmhgurdgtohhmpdhrtghpthhtohepkhgvrhhnvghlqdhtvg
    grmhesrghnughrohhiugdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhn
    rghssegrrhhmrdgtohhmpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgrnhhnse
    grrhhmrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrmhhorhhsvgesrghrmhdrtghomhdp
    rhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhope
    hmrghthhhivghurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomh
X-ME-Proxy: <xmx:8G2yaTgS_ddwOWPCAdSFy6-Y1mZdZ_iyvDw28nxREK10cmBDy1coXA>
    <xmx:8G2yaRguhnLKGcSdzAq9u1dc6XPUD9ZnyyTFoVCMZ8rp3WcW3SRxVQ>
    <xmx:8G2yabu-w1NWjXSEznGAtHVpjOTph5gIPqcPdmTEYE__Cibtihb3RA>
    <xmx:8G2yaSRKccsFYKU-tCk3MMA7iQG1AfH0GFwUGjJ1sKPR9B-SCOrRww>
    <xmx:8G2yaUEjiUDcY9_u-yuXIZDKbwLT_c8AH_z2rsE4bAPYd-iqA1IkwZtj>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 18126700065; Thu, 12 Mar 2026 03:40:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AZoFCyIUcobR
Date: Thu, 12 Mar 2026 08:40:11 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Carlos Llamas" <cmllamas@google.com>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: "Sami Tolvanen" <samitolvanen@google.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Jason Baron" <jbaron@akamai.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Steven Rostedt" <rostedt@goodmis.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Ian Rogers" <irogers@google.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "James Clark" <james.clark@linaro.org>,
 "Juri Lelli" <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Dietmar Eggemann" <dietmar.eggemann@arm.com>,
 "Ben Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>,
 "Valentin Schneider" <vschneid@redhat.com>,
 "Kees Cook" <kees@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>,
 "Jens Remus" <jremus@linux.ibm.com>, "Juergen Gross" <jgross@suse.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 "David Kaplan" <david.kaplan@amd.com>,
 "Lukas Bulwahn" <lukas.bulwahn@redhat.com>,
 "Jinjie Ruan" <ruanjinjie@huawei.com>,
 "James Morse" <james.morse@arm.com>, "Thomas Huth" <thuth@redhat.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, "Will McVicker" <willmcvicker@google.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM"
 <linux-perf-users@vger.kernel.org>
Message-Id: <742d77a8-3c53-4814-9dd6-81e8317cd829@app.fastmail.com>
In-Reply-To: <abIFwSF1RqhC96C2@google.com>
References: <20260309223156.GA73501@google.com>
 <20260311225822.1565895-1-cmllamas@google.com>
 <20260311231406.GZ606826@noisy.programming.kicks-ass.net>
 <abIFwSF1RqhC96C2@google.com>
Subject: Re: [PATCH] static_call: use CFI-compliant return0 stubs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Carlos,

You've cc'ed around 50 people on this patch, which is a bit excessive. Better to take get_maintainer.pl with a grain of salt if it proposes a cc list like that.

On Thu, 12 Mar 2026, at 01:16, Carlos Llamas wrote:
> On Thu, Mar 12, 2026 at 12:14:06AM +0100, Peter Zijlstra wrote:
>> On Wed, Mar 11, 2026 at 10:57:40PM +0000, Carlos Llamas wrote:
>> > Architectures with !HAVE_STATIC_CALL (such as arm64) rely on the generic
>> > static_call implementation via indirect calls. In particular, users of
>> > DEFINE_STATIC_CALL_RET0, default to the generic __static_call_return0
>> > stub to optimize the unset path.
>> > 
>> > However, __static_call_return0 has a fixed signature of "long (*)(void)"
>> > which may not match the expected prototype at callsites. This triggers
>> > CFI failures when CONFIG_CFI is enabled. A trivial linux-perf command
>> > does it:
>> 
>> *sigh*...
>> 
>> And ARM64 can't really do the inline thing because its immediate range
>> is too small and it all turns into a mess constructing the address in a
>> register and doing an indirect call anyway, right?
>> 
>
> Right, the range for the jump is very limited. I _think_ tracepoints
> have managed to implement the trampoline work-around:
>   arch/arm64/kernel/ftrace.c
>
> So it looks do-able I think but a much complex route.
>

So far, we have managed to avoid the blessings of objtool on arm64, and the complexity associated with the inline patching is not really justified, given that on arm64, there is not really a need to avoid indirect calls (and as Peter says, we might end up with them anyway)

A while ago, I had a stab at implementing the out-of-line variety [0], but nobody cared enough to even respond. It is rather concise, and localised to arm64, so it is something we might consider for CONFIG_CFI builds. It is essentially the same sequence that arm64 uses for trampolines between modules and the kernel if they are out of direct branching range, with some .rodata patching to change the target. (arm64 basically only permits code patching without stopping the machine when it involves patching branch opcodes into NOPS or vice versa).

Doing so for only CONFIG_CFI makes sense because it removes the CFI overhead for all static calls, although it adds back some overhead for the trampoline. But there is currently no need to do this unconditionally.




[0] https://lore.kernel.org/linux-arm-kernel/20201120082103.4840-1-ardb@kernel.org/

