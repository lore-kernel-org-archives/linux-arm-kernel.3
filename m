Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356C2CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxIYglHeako2DertCJk16Idv4XjQ26oHrH/sKZh5Thg=; b=o60GvJccddeVV2iLepABhaQU8a
	yq5Yq+l63VK3mu7PRn3oo5/k8xe6sm+LdVrFOUalQJ1uR0x973u/dPSyKBlLyL9zBorFpgflJVNBm
	nqKxdXg0BX2u06O9Q6jnLBM3teh+5up6XGrmIwKQhciYJukPd/Rdn6Kf2+PuAtTAnHAV0CxKhIeKN
	8pCcXPrF1AuCCH6H1VbvXzUJll6eRdoEZlxCsFnpMaaguVzV+LMtyBslTr/gkJhhVOJb7UXr0ASNJ
	6i9kqg6osybfC4ueqYQyrHn2kj2MGX6XFGCEEOVaBQFPN1lwSAFdoCglHiCiYgrq6/CeKTlWGZVZ/
	FOiLqsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4Av-0000000DHVD-1AzS;
	Sat, 15 Nov 2025 00:29:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4At-0000000DHUK-1jrt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 00:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FB0143E86;
	Sat, 15 Nov 2025 00:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC31C113D0;
	Sat, 15 Nov 2025 00:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763166594;
	bh=e9NLv0KhLEFdWRUZrMQNfpFyoR5NzFBMcL2BU/txkvI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tjbGuUViIgE8DbMZEqvvASWk22Ni8F2yyswXkq6ljN6JvxrW3LFA/cXgdKIhjshwv
	 5/9jA/0uwS2ugAqIxC2BaJDM2tO0CiEmXz2mcy8jnmS6X0mmaG1nDcHzqUrLVNzakx
	 BgvHlPs92olV5IsIPCCaNWqu4BPLPQBD6PsM0s7FpPgyPeTZGPiudKEe5uzsKYV5XI
	 G/dxssAg1GP1k3M3mFYQF+YHp4XRS2uczH5SFdZ10lvHLqUWaaxkYbqrAkLE2/OLHg
	 xv0VGimI/uOfyV9+JEyvBH2GjHu6v5E/SMVQCilSpA5PNVN8y9cOaJu5c9lOyDxCkB
	 p4wIy2YL1Sgrw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 20E59F4007C;
	Fri, 14 Nov 2025 19:29:52 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 14 Nov 2025 19:29:52 -0500
X-ME-Sender: <xms:f8kXaYP_QFfIS1oOUOKZZl5jFHrPEcMk6RblzeoOcC2iEVuq3WeuhQ>
    <xme:f8kXaZxQj47DKupgm51V26LsD93iRUKgXXFU3lyHHR4mps6LrHRMzy6DcQoYOOMmj
    bJHCpDSv2hVfdh8z8WXIWBymfLTwSeaqxLXuFfEZ0taW3jWjhuJUw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudduvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepkefhieejfedvueejheehiefgvdfhjeefjeelvdfghfelgeejudevleej
    uddvvefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudekheei
    fedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrd
    hluhhtohdruhhspdhnsggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopegsphesrg
    hlihgvnhekrdguvgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthht
    ohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrghthhhivg
    hurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehurhgviihkihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhr
    tghpthhtohepjhgrnhhnhhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:gMkXabdoCbTfms0FoEg_GJgl6FgXa5xQx_ty6BJZoh6HyeHV5zrznA>
    <xmx:gMkXaZmIJ1z3KZvXB3KL6adMbSKrCf3nXuKgoqv8kqEf-6skVjaHFQ>
    <xmx:gMkXaezk0f0oemBqCDivfz47Om-NPp3ENuY_X0n1HwPUOft4614Pww>
    <xmx:gMkXaRiKeW_eNhYM6aVpR3mABUUm9mTwMaFvY-zCwmH8IiYGX7h-JQ>
    <xmx:gMkXaVDb-JyrtuYINK607hAYSCZPkXpuh5uYtLwpret1M2npo3x_xlzw>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D1DF5700063; Fri, 14 Nov 2025 19:29:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ATddxb8eqn9V
Date: Fri, 14 Nov 2025 16:29:31 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Valentin Schneider" <vschneid@redhat.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, rcu@vger.kernel.org,
 "the arch/x86 maintainers" <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Jason Baron" <jbaron@akamai.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Josh Triplett" <josh@joshtriplett.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Uladzislau Rezki" <urezki@gmail.com>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Mel Gorman" <mgorman@suse.de>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Han Shen" <shenhan@google.com>, "Rik van Riel" <riel@surriel.com>,
 "Jann Horn" <jannh@google.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Oleg Nesterov" <oleg@redhat.com>, "Juri Lelli" <juri.lelli@redhat.com>,
 "Clark Williams" <williams@redhat.com>,
 "Yair Podemsky" <ypodemsk@redhat.com>,
 "Marcelo Tosatti" <mtosatti@redhat.com>,
 "Daniel Wagner" <dwagner@suse.de>, "Petr Tesarik" <ptesarik@suse.com>,
 "Shrikanth Hegde" <sshegde@linux.ibm.com>
Message-Id: <4f1a7b15-cfdc-478e-8e43-98750608866c@app.fastmail.com>
In-Reply-To: <b3472cb3-86fa-4687-bfce-3b9a1bf4ff36@paulmck-laptop>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <c4768cf3-f131-44e6-9b25-ebeb633f32ee@app.fastmail.com>
 <beb46a02-b902-438b-8b6d-b5f0d7ad0ae6@app.fastmail.com>
 <89398bdf-4dad-4976-8eb9-1e86032c8794@paulmck-laptop>
 <1a911310-4ca5-45a4-b9bf-5f37c6ab238e@app.fastmail.com>
 <b3472cb3-86fa-4687-bfce-3b9a1bf4ff36@paulmck-laptop>
Subject: Re: [PATCH v7 00/31] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_162955_486188_0E62DF25 
X-CRM114-Status: GOOD (  47.54  )
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



On Fri, Nov 14, 2025, at 12:03 PM, Paul E. McKenney wrote:
> On Fri, Nov 14, 2025 at 10:45:08AM -0800, Andy Lutomirski wrote:
>> 
>> 
>> On Fri, Nov 14, 2025, at 10:14 AM, Paul E. McKenney wrote:
>> > On Fri, Nov 14, 2025 at 09:22:35AM -0800, Andy Lutomirski wrote:
>> >> 
>> 
>> >> > Oh, any another primitive would be possible: one CPU could plausibly 
>> >> > execute another CPU's interrupts or soft-irqs or whatever by taking a 
>> >> > special lock that would effectively pin the remote CPU in user mode -- 
>> >> > you'd set a flag in the target cpu_flags saying "pin in USER mode" and 
>> >> > the transition on that CPU to kernel mode would then spin on entry to 
>> >> > kernel mode and wait for the lock to be released.  This could plausibly 
>> >> > get a lot of the on_each_cpu callers to switch over in one fell swoop: 
>> >> > anything that needs to synchronize to the remote CPU but does not need 
>> >> > to poke its actual architectural state could be executed locally while 
>> >> > the remote CPU is pinned.
>> >
>> > It would be necessary to arrange for the remote CPU to remain pinned
>> > while the local CPU executed on its behalf.  Does the above approach
>> > make that happen without re-introducing our current context-tracking
>> > overhead and complexity?
>> 
>> Using the pseudo-implementation farther down, I think this would be like:
>> 
>> if (my_state->status == INDETERMINATE) {
>>    // we were lazy and we never promised to do work atomically.
>>    atomic_set(&my_state->status, KERNEL);
>>    this_entry_work = 0;
>>    /* we are definitely not pinned in this path */
>> } else {
>>    // we were not lazy and we promised we would do work atomically
>>    atomic exchange the entire state to { .work = 0, .status = KERNEL }
>>    this_entry_work = (whatever we just read);
>>    if (this_entry_work & PINNED) {
>>      u32 this_cpu_pin_count = this_cpu_ptr(pin_count);
>>      while (atomic_read(&this_cpu_pin_count)) {
>>        cpu_relax();
>>      }
>>    }
>>  }
>> 
>> and we'd have something like:
>> 
>> bool try_pin_remote_cpu(int cpu)
>> {
>>     u32 *remote_pin_count = ...;
>>     struct fancy_cpu_state *remote_state = ...;
>>     atomic_inc(remote_pin_count);  // optimistic
>> 
>>     // Hmm, we do not want that read to get reordered with the inc, so we probably
>>     // need a full barrier or seq_cst.  How does Linux spell that?  C++ has atomic::load
>>     // with seq_cst and maybe the optimizer can do the right thing.  Maybe it's:
>>     smp_mb__after_atomic();
>> 
>>     if (atomic_read(&remote_state->status) == USER) {
>>       // Okay, it's genuinely pinned.
>>       return true;
>> 
>>       // egads, if this is some arch with very weak ordering,
>>       // do we need to be concerned that we just took a lock but we
>>       // just did a relaxed read and therefore a subsequent access
>>       // that thinks it's locked might appear to precede the load and therefore
>>       // somehow get surprisingly seen out of order by the target cpu?
>>       // maybe we wanted atomic_read_acquire above instead?
>>     } else {
>>       // We might not have successfully pinned it
>>       atomic_dec(remote_pin_count);
>>     }
>> }
>> 
>> void unpin_remote_cpu(int cpu)
>> {
>>     atomic_dec(remote_pin_count();
>> }
>> 
>> and we'd use it like:
>> 
>> if (try_pin_remote_cpu(cpu)) {
>>   // do something useful
>> } else {
>>   send IPI;
>> }
>> 
>> but we'd really accumulate the set of CPUs that need the IPIs and do them all at once.
>> 
>> I ran the theorem prover that lives inside my head on this code using the assumption that the machine is a well-behaved x86 system and it said "yeah, looks like it might be correct".  I trust an actual formalized system or someone like you who is genuinely very good at this stuff much more than I trust my initial impression :)
>
> Let's start with requirements, non-traditional though that might be. ;-)

That's ridiculous! :-)

>
> An "RCU idle" CPU is either in deep idle or executing in nohz_full
> userspace.
>
> 1.	If the RCU grace-period kthread sees an RCU-idle CPU, then:
>
> 	a.	Everything that this CPU did before entering RCU-idle
> 		state must be visible to sufficiently later code executed
> 		by the grace-period kthread, and:
>
> 	b.	Everything that the CPU will do after exiting RCU-idle
> 		state must *not* have been visible to the grace-period
> 		kthread sufficiently prior to having sampled this
> 		CPU's state.
>
> 2.	If the RCU grace-period kthread sees an RCU-nonidle CPU, then
> 	it depends on whether this is the same nonidle sojourn as was
> 	initially seen.  (If the kthread initially saw the CPU in an
> 	RCU-idle state, it would not have bothered resampling.)
>
> 	a.	If this is the same nonidle sojourn, then there are no
> 		ordering requirements.	RCU must continue to wait on
> 		this CPU.
>
> 	b.	Otherwise, everything that this CPU did before entering
> 		its last RCU-idle state must be visible to sufficiently
> 		later code executed by the grace-period kthread.
> 		Similar to (1a) above.
>
> 3.	If a given CPU quickly switches into and out of RCU-idle
> 	state, and it is always in RCU-nonidle state whenever the RCU
> 	grace-period kthread looks, RCU must still realize that this
> 	CPU has passed through at least one quiescent state.
>
> 	This is why we have a counter for RCU rather than just a
> 	simple state.

...

> I am not seeing how the third requirement above is met, though.  I have
> not verified the sampling code that the RCU grace-period kthread is
> supposed to use because I am not seeing it right off-hand.

This is ct_rcu_watching_cpu_acquire, right?  Lemme think.  Maybe there's even a way to do everything I'm suggesting without changing that interface.


>> It wouldn't be outrageous to have real-time imply the full USER transition.
>
> We could have special code for RT, but this of course increases the
> complexity.  Which might be justified by sufficient speedup.

I'm thinking that the code would be arranged so that going to user mode in the USER or the INTERMEDIATE state would be fully valid and would just have different performance characteristics.  So the only extra complexity here would be the actual logic to choose which state to go to. and...
>
> And yes, many distros enable NO_HZ_FULL by default.  I will refrain from
> suggesting additional static branches.  ;-)

I'm not even suggesting a static branch.  I think the potential performance wins are big enough to justify a bona fide ordinary if statement or two :)  I'm also contemplating whether it could make sense to make this whole thing be unconditionally configured in if the performance in the case where no one uses it (i.e. everything is INTERMEDIATE instead of USER) is good enough.

I will ponder.

