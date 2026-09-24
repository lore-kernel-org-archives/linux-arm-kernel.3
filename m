Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348A3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVufKMPB9vejpNzxTLukLIifCoBhEi//kGkahD5KaUo=; b=Uk7Gd/XfCvDe/VzrMwyIDnaH2p
	CIydYSto7Ebr8JYD1JyS6w3vdbD2Kwt+VHfwIYFWrbAHxOPPZrsNYOllAgB2cIbIBvCl/QGWgoF38
	j5P48rb9hyXcSYIwDBmNKhyhbqEsLnFntWMDt4E9u0ZSOmovGoWseiN+XC01EURWUvAtmxj7+P9eo
	dna6Re2Y9U/Rxq86aucQ+rMpgnX2/WGaz4cCboiK+Y1V9+VmALR3bdUPXHnQ1HWBpWrsfcOUo/iv1
	cXM7eOM6eaRj+on37+a7PrgXN/RljC4t6siNK4SNe4J9yIEVXIYnc/tGcWSCIwPAlvsr+x7zQPy+2
	rpm1YRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9foB-0000000AaE6-0L94;
	Thu, 24 Sep 2026 09:32:03 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fo7-0000000AaC9-0ZTR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:32:01 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f705536so341135566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790242317; x=1790847117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVufKMPB9vejpNzxTLukLIifCoBhEi//kGkahD5KaUo=;
        b=AsjJrYAFpciivmM73Ht42PBMWAFy8HKUqf/lXj7NMcdLVLz9jRCOUAhULAzFSWn4D8
         YZh03111vi4UhArcndw867yS6UmneGmiqXZBFiAGijU+r7lDxyddUT6CgZw+jK8SrbpG
         55Froc2FCRdiFpeTyrjtkhTQpzznHTssCP5ixxhoC4y086NsJn+PfCrpCE4kjA0NIcna
         z2QnMQnHlH+94871CN1l6Lu1z0PFkXWr4WKrctTcQecHFXtmiKuIHDGQi9Ib0QXk95nW
         dWIHjAEucvTTmcitXhUT2+mg9T/qbdsthS4rZoljs87sXZJEvZWJbcbCHPooxFFGiJCG
         W4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242317; x=1790847117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVufKMPB9vejpNzxTLukLIifCoBhEi//kGkahD5KaUo=;
        b=uU6MY9n9dRmi5bl7FVe/5EEL1bhpTNzdOpCMQvBBL4I8qlYGFgLgTWumTGU8An1wcp
         UK+w5sSIn+iBCwkKrVkGiyKUq2gMmOf52r8+ZwSs1vwP5vSOq8jU3e2k64r00ranrSk4
         S628vttCP18lj2tJ2V5UvrFpdoc5RKkNJOgLf1lqSDPdYpbl80/go13IMErk4b/P1QPV
         N8ftGsvZOyql7donyT1qS3LiS/DuZqV+voQhrxy3fUSpoDbaIqgakfBdy0DDqkjz2dXq
         1Q3M/fqBystW7NaW6bU9vIZVhWeWLEvRytiopr8CktnOZvdv/EzHL8j/M10Zv5d+ycbw
         MwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8kHtQ5Gvsmp1jxs+kBq1CaKcFouX/sk9QMuLvPPb5USxXggrv7a0lmJXu+XustV7ltKufC8TcDGm10jZjcCfr@lists.infradead.org
X-Gm-Message-State: AFuF++mtxIXPpHOyF96qI6vTspU8xtVdUm+P+dd49W7USdSfZsbJZeSE
	EWM5ZzCkEUM7aIAWnqWfhgWHbhHI/MdYdkdlesp0keeZIvY0CDF4QMiq
X-Gm-Gg: AYBFou1eoZn3ZTi7cIpWLIBdzovOqENa2hZiS2EtRDMwxdZWfXI4M7SjOQBQhql5Nf+
	/XPhJiSnMmgAtnlQgjgGeiThDUW9lLYlbM8Xf5fkRmQWQ0quvr9VE2/k4HYIJzFsvv1065mb1cx
	4aev3n3H+U7PvHIoxmO7CdJCq2YH++SHLKiLnTg/Saathhi5aacxZljGfIeOAxGz09/SKkZObK6
	94lsWUw1IXE3GLf13P57txmL67Aetqg0c3PLgHC3olpXv5s/dzl0yuuSOcDwdWJMl5CYGKmFOWX
	fDIXig0cAjKmBWs7/Dr9RYp812+uV2XEoJop31WXIJt6xmmWgUpn2IvkKHJcLwHnH1XUwQ+qS0s
	fTkSqbivniYIbMlsG8KQ6YbZK4PXRnValTqQpigJjatKnizL+j+3xGsoka4b+/mBokVjZv9Mp/A
	skRa3QCfbOyVF09OQBRW6fsiaRoILKxdTKC2xW7T2riUAKQeuiS9ul7FxpxkZvEkfGpNNjebSHj
	y3m6oXAoXiHZOIoHhhnlx84zGEVeDLXXjfbxLLfwfpBKXDGXWGZp9qUgxB7Qvv9d/M+ofHg38w1
	AUy5
X-Received: by 2002:a17:907:9812:b0:c26:1648:a06e with SMTP id a640c23a62f3a-c2ac253f94cmr137512666b.41.1790242317135;
        Thu, 24 Sep 2026 02:31:57 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae675d59sm270080366b.42.2026.09.24.02.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:31:55 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:31:50 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kprobes: Make optprobe optimizer multi-generational and
 asynchronous
Message-ID: <arTuBodyGqQ0mErI@andreayoga.localdomain>
References: <20260923164510.f3bbddefea4423f8f1bfecb8@kernel.org>
 <179017148080.466588.9116221556625712980.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179017148080.466588.9116221556625712980.stgit@devnote2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_023159_198932_20C49849 
X-CRM114-Status: GOOD (  17.35  )
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

Hi Masami,

> -	/* Step 5: Kick optimizer again if needed. But if there is a flush requested, */
> -	if (completion_done(&optimizer_completion))
> -		complete(&optimizer_completion);
> +	/* Step 2: Dispatch waiting room generation if allowed */
> +	optprobe_dispatch_generation();
>  
> -	if (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list))
> -		kick_kprobe_optimizer();	/*normal kick*/
> +	/* Step 3: Check completion if flush was requested */
> +	if (!optprobe_optimizer_busy()) {
> +		if (optprobe_flush_requested) {
> +			optprobe_flush_requested = false;
> +			complete_all(&optimizer_completion);
> +		}

Removing the completion_done() check also fixes a hang in the current
code: completion_done() is only true once the completion has been
completed, so complete() is never called while a flusher waits.  For
example, "echo 0 > /proc/sys/debug/kprobes-optimization" with an
optimized kprobe never returns.  I posted a fix for that separately [1].

[...]


> -	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
> +	while (optprobe_optimizer_busy()) {
>  		init_completion(&optimizer_completion);

This part is still racy, though.  The flusher drops kprobe_mutex while
it sleeps, and the sysctl handler and the debugfs "enabled" file do not
otherwise serialize against each other.  A second flusher can then run
init_completion() on the wait queue the first one is sleeping on: the
first waiter is dropped from the queue, and complete_all() wakes only
the second one.

With this patch the window is wider, since kprobe_mutex is released
while the Tasks RCU grace period runs and optprobe_optimizer_busy()
stays true until the generation is finalized.

The fix in [1] replaces the completion with a counter of optimizer
passes, bumped at the end of each pass and signalled with
wake_up_var_locked(), both under kprobe_mutex; the flusher samples the
count and waits with wait_var_event_mutex() until it changes.
Something similar should fit here, with the counter bumped at the end
of each kprobe_optimizer() call and the flusher re-checking
optprobe_optimizer_busy() under kprobe_mutex as it does now.

[1] https://lore.kernel.org/all/20260924092142.199198-1-parri.andrea@gmail.com/

Thanks,
  Andrea

