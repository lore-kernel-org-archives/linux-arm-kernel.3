Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB0CF58C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIyLAB0m94L7IhoKbo7mDzv/544NvmA6xZIxPaVJ+q8=; b=Z4dttL4OgNldzLRFLxz/FS6t6w
	ktPf8+AfQT2mwaJiCS3v4mwT4KTtYF/G0X9WpND2SoIgEDiVNMlDMHvBGlJz8ZUm3exoBE34ZRAED
	5r0/oTaHodgasPTwnOCQ9KlpsI0smiTIMJmyxMnKbqJbdc/sD9n4oU9PLmOeDITPnogvkt5svr1VJ
	6szFsAz0UPDltI4ZkI0JWtk3U/ggY44mPvoSoOCLdlkwg62B1pp4rGFn2Vo5zvKKMYPRXkgFw7D2m
	amHQlnDy69dLWZR4pC+mseqOSu2P5hYD+BM/6XgJYoZn/itg0J8xZ+D8sk/Am3yxrKrR0cGLxi0tj
	m9p9iD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn0C-00000004dDs-1u07;
	Wed, 19 Nov 2025 18:34:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn0B-00000004dDf-1Xv0;
	Wed, 19 Nov 2025 18:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53E626019F;
	Wed, 19 Nov 2025 18:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AEEC4CEF5;
	Wed, 19 Nov 2025 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763577238;
	bh=isuSe0vHAL4pBqh4kPYeDqNJgvukP3SkbC0ClCMHi/U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Oj6dh3QF2+yqHgZl00hjnXzhiNz+Kd5gYv4Mj4vHnoLuipqptSvCQU/ENuPdlJrkM
	 QCZqRhvmmZXjGd/NFfGhOlECLddt5EAF6gsnDbdre02U3ZehF2T2bdHQYrvGRRjZRI
	 KIUnyGtdsfnJYxILq0DcK0YYT7H1xJuQ214CUgOUoDfVAz3tSQPe6BZ8jeuzAcBm1p
	 wXft2yGvOtlxxVS/f2uFljuXnVnBuAEiQdQEuRS49EJQ/cQJ3m8lwZTWNnHhaozgGs
	 apJhTg7BHqj7YbEppl1GoT03u3M/p2wK2rr8z7Rl1f58PwIPr+i0ClaOfchr52lQVa
	 yxyq/528F3qvw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8AE21F40084;
	Wed, 19 Nov 2025 13:33:55 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 19 Nov 2025 13:33:55 -0500
X-ME-Sender: <xms:kw0eaXtHW_hPzTjGGcVhcydgSpeOMQsuqt-CDQ2ce8lXwh_2XkBDew>
    <xme:kw0eaTTFCCwjUA8kF8nkRRywEr7igPyQ-OlA6aLIu76kha6OTU-uEILXGlFKbpWmH
    l1XsdpwdhUBo5Q6bK0a2g_fD9owfX20pc_Ddgru3Du8XugMOTSVRBE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdegledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepjeejvddvtdehffdtgfejjeefgefgjeeggfeuteeiuedvtefgfffhvdej
    iefguedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudekheei
    fedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrd
    hluhhtohdruhhspdhnsggprhgtphhtthhopeegledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopegsphesrg
    hlihgvnhekrdguvgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthht
    ohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrghthhhivg
    hurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehurhgviihkihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhr
    tghpthhtohepjhgrnhhnhhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:kw0eaUKcvBX6ZqDb2Zfz2lS6ZTPn-nXSDUpeDQirQ9WsFITs37m1FA>
    <xmx:kw0eadq2-jmwILaPpoRuPfN2N1yM3Y8zfKpCUT6xaUllbcz1l4r_ww>
    <xmx:kw0eaY_jsr-_Ab2g_NL1wFjttUgbqyW25dTE8Gwsk4BL2Ms0a7Nw1g>
    <xmx:kw0eaY-o7o-_VANLMjD5K5xLI3aUCtOQ36zJ9mu52nOwG5c_vbE8HA>
    <xmx:kw0eaT6PvxdLshew8G6EsocVLck8YE1dY0HQ7jptKjjUdBShZ13KNOpC>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4771A700054; Wed, 19 Nov 2025 13:33:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1wO5D87xXUg
Date: Wed, 19 Nov 2025 10:33:35 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Dave Hansen" <dave.hansen@intel.com>,
 "Valentin Schneider" <vschneid@redhat.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, rcu@vger.kernel.org,
 "the arch/x86 maintainers" <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
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
Message-Id: <292ebf6a-4a7a-43b2-a670-ea53728f2c06@app.fastmail.com>
In-Reply-To: <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
Subject: Re: [RFC PATCH v7 30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush IPIs under
 CONFIG_COALESCE_TLBI=y
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Wed, Nov 19, 2025, at 10:31 AM, Dave Hansen wrote:
> On 11/14/25 07:14, Valentin Schneider wrote:
>> +static bool flush_tlb_kernel_cond(int cpu, void *info)
>> +{
>> +	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
>> +	       per_cpu(kernel_cr3_loaded, cpu);
>> +}
>
> Is it OK that 'kernel_cr3_loaded' can be be stale? Since it's not part
> of the instruction that actually sets CR3, there's a window between wh=
en
> 'kernel_cr3_loaded' is set (or cleared) and CR3 is actually written.
>
> Is that OK?
>
> It seems like it could lead to both unnecessary IPIs being sent and for
> IPIs to be missed.

I read the code earlier today and I *think* it=E2=80=99s maybe okay. It=E2=
=80=99s quite confusing that this thing is split among multiple patches,=
 and the memory ordering issues need comments.

The fact that the big flush is basically unconditional at this point hel=
ps. The fact that it=E2=80=99s tangled up with CR3 even though the curre=
nt implementation has nothing to do with CR3 does not help.

I=E2=80=99m kind of with dhansen though =E2=80=94 the fact that the impl=
ementation is so nasty coupled with the fact that modern CPUs can do thi=
s in hardware makes the whole thing kind of unpalatable.

>
> I still _really_ wish folks would be willing to get newer CPUs to get
> this behavior rather than going through all this complexity. RAR in
> particular was *specifically* designed to keep TLB flushing IPIs from
> blipping userspace for too long.

