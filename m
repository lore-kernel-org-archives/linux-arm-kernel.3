Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31B0D46BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqIsocrvZOanK6tAD5XkOUINS0CSx1kBwU4tnk5UATU=; b=F67ogWzygQPziI/KcydJOX2UaY
	YeECy658jvsddWP45WXQEBa8YHCx1zQDAuMRH7ArTwE9AjOl3zytXjz/0ncsh4oUA4BwelYqrUHkg
	1UPpSWfX2z6sM/Z1YnPQFKvdVMvdhv3F9KKDU2sDk4Ay7AwkjrPyZdPQB0qqqp7cAxQ2rO6qawQPw
	XbvmHMyiZtstSxhBWlN/wktfdAuptzoaxhpJ6kNfvhHqxHV3Zonww8S86hwvLnS0jU2xMuQwjq5an
	H21GZHZCuE4hWXtGAZEobUMchrsg91K4YUmR5FbLpzKd/vQuGGLiIx8Leb5vGpT2rFlzc+a/xWzFj
	RQXDDEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGix-0000000H3CB-0Nul;
	Thu, 29 Jan 2026 01:21:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGiu-0000000H3C1-2EOo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E85116001A;
	Thu, 29 Jan 2026 01:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42819C116C6;
	Thu, 29 Jan 2026 01:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769649687;
	bh=T131svMu2T3ISOZCqIcwsEXJug1tYGuujwIwl9rBKfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ao8jMlciFjG/h68WfinfE4v/z5xPoxsTvbDrKSu69RUh4ufknA8/TMKu1dOPPD9Rn
	 90oj8KngFyQQWlnwJi4Cg/StF5Ri6meN/nUzeC2w3qSwEANpE1LWow3G2e/GI+TiIO
	 rPwFhPtTU3YAjLshLOX/4LejkKHv1VQNTHhVpK8AmSsvXFoslfOsmnLhRAyispehJ0
	 VFSk7tRWvPvHI9tc0WlN/aaij+bBYaZ5WZ3YCLblYaIemSQ8IWKoXWJMBLM5P8wsdK
	 2AdMSjzruOlwhU9Hw24BHx06O7iHSzkBJwFOX0aJRYWO4hNKj4v+LeFCOI9N9yShhJ
	 YGzE64w5KbIkg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 56B0FF40068;
	Wed, 28 Jan 2026 20:21:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 28 Jan 2026 20:21:26 -0500
X-ME-Sender: <xms:FrZ6aQuq_7z7EACVqdZX3ci0zIAyJtueFzEcJKkVNsKWNUxe3NMbSQ>
    <xme:FrZ6ad67b6sAjh6ruihHg7guj8rC0GQA_rpts3DEJKyS20U9H_Iw7doXjrGYnPyzq
    jy6UkjmRDN2HsVH3v0uWPXIRbiXcYb_npdNZX8nAEkLrFAElHjB>
X-ME-Received: <xmr:FrZ6abjh53bP0vL0DOCI0yIXtYoRe1Lhmtsp1TjbcQ9mCK34NteY2In7CdI9YMx77BNXtDz0IHXLt15JecSXq34TZ4I8Vseg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieegkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvghl
    vhgvrhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinh
    huthhrohhnihigrdguvgdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtth
    hopegsvhgrnhgrshhstghhvgesrggtmhdrohhrghdprhgtphhtthhopehllhhvmheslhhi
    shhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:FrZ6afk6uPE3iywxH1zEpW-gAS1TiDOWABsqlS2c4e0eB4ol6DjlDQ>
    <xmx:FrZ6aavco9ZAoi9BFqVkBJwmFp52-zuLoATMaWzouqnhglAENcVomA>
    <xmx:FrZ6aVD2XQeDR9BA5MORIA-7KYHkUX4L2pjQCBlboQxLQWqEpRF_hA>
    <xmx:FrZ6afVHXxQ7onPhStf0o7jz2oQXqB5leodNkPhnklACBUkSjeSfaA>
    <xmx:FrZ6aWH_mfLUh04kv8p9nTDrvfa2t2B0iEg1Pl3mz0ol8hS9g7yCkf5D>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 20:21:25 -0500 (EST)
Date: Wed, 28 Jan 2026 17:21:24 -0800
From: Boqun Feng <boqun@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: Fix non-atomic __READ_ONCE() with
 CONFIG_LTO=y
Message-ID: <aXq2FOa1va0P_zu8@tardis.local>
References: <20260129005645.747680-1-elver@google.com>
 <20260129005645.747680-2-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129005645.747680-2-elver@google.com>
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

On Thu, Jan 29, 2026 at 01:52:32AM +0100, Marco Elver wrote:
> The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
> qualified the fallback "once" access for types larger than 8 bytes,
> which are not atomic but should still happen "once" and suppress common
> compiler optimizations.
> 
> The cast `volatile typeof(__x)` applied the volatile qualifier to the
> pointer type itself rather than the pointee. This created a volatile
> pointer to a non-volatile type, which violated __READ_ONCE() semantics.
> 
> Fix this by casting to `volatile typeof(*__x) *`.

I guess a `volatile typeof(x) *` also works. Either way, good catch!

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> 
> With a defconfig + LTO + debug options build, we see the following
> functions to be affected:
> 
> 	xen_manage_runstate_time (884 -> 944 bytes)
> 	xen_steal_clock (248 -> 340 bytes)
> 	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs
> 
> Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/arm64/include/asm/rwonce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 78beceec10cd..fc0fb42b0b64 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -58,7 +58,7 @@
>  	default:							\
>  		atomic = 0;						\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> +	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
>  })
>  
>  #endif	/* !BUILD_VDSO */
> -- 
> 2.53.0.rc1.217.geba53bf80e-goog
> 

