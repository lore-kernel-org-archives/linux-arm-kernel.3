Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D18606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y2iPV+h7;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BrYnDSbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MMnUGkHRy+otlfLzxjS9F1trRkrtSmw/Pufvv+pTUZY=; b=y2iPV+h79qYQcBDTZjYzWebNM9
	0UFSPGm92pM/aaX+UQsFSn/cyAKDStRadfVduH/eB0OYUh+wiJXb/OHP4NBwhMU/koPAKgaLGfQCj
	7zmS5v8anGysNuhKTMJ8zrI+LDr0pWWBytYGt2cPQ/QOxlpZdU34UdsYxcc7PgjiGvYyixM/Hb244
	ok/E+tUwHlLzjZAkgdQpZnCLvoROkkpS5CoA2ECWpDLt/Zcoq6WMydC/XWj/VS04ZY0/NxCs+YZ1A
	TDN3Ry2t/sMU1wvYI72d33pBO/GdAu/rLkgXhQncjkhXFsB/AQzK+B/s7q/viUxhJeNqlhgcQuIk0
	b9xcay1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFTJ-00000002iWH-1cpG;
	Tue, 03 Nov 2026 14:26:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFTG-00000002iVZ-1Bwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:26:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso42765465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793715999; x=1794320799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMnUGkHRy+otlfLzxjS9F1trRkrtSmw/Pufvv+pTUZY=;
        b=BrYnDSbHKgQjZDqaVZ2RY8WZjml6WuPX+oCp2Wy9VGopO/kpBElsC6A5wNPYQWiYQ6
         ZKna3+hO1BgLzrOq0t7Vr7a80ORo/Ei9wGqv3CPB1VAwmuiFA1SUjwrsNzs7e28pYKL/
         T/0CWoGXKhjPO2xylD1KRBu+QBY2UPk6bipzEdgzklKQpbhcEjCWD4Ki4MADRh7m00Hn
         5uuVwnbmgfRkZRjtZ+MYZsBC+KZgLEgsHyzaFASeZ4zpAp7eENhdGrAWb2Xy9YVWfbzd
         AkRQRrMnFyq6+gxwDJRvjwBYsUhg7KijYPOK6MpwxnTEhCJYDDtvgVahi7ZHQvJQCX7e
         nlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715999; x=1794320799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMnUGkHRy+otlfLzxjS9F1trRkrtSmw/Pufvv+pTUZY=;
        b=D4uxRzbq2OfM/XAvU1Q2xc4pwzdPHxmlmi1HksgsDIqfYaLVPzYCDIgFOBkouRNFs3
         BlSsm4WVvN8JKNoVxSyVH/JpzacaCNV144v4QjGD8nxaYMA+/MbL8nD2frjk5hFfSKEo
         MmqWz/icg7UGQib3x4I8K9y4Fsqjut3SBZS7jvN5ZmXAKjKstp6VgcpzuRrS/HaSrqGA
         TvM6KRcJNcGBNhMDRfQSIYf4mF/vAJHVSzOVIs9spVK+66Yo5Yau7K7Cl2JVXPyTq3XR
         RY3tsn+olUQHHvdNKGRM6aQBM7cmH1ZjVUKCo1/II/Z3sq0uQq4IEMHD8rXCg3IOYTL0
         N67Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBVDgIwaxlmZeAI4NpSgkZ9+4wBO2Mk9dxyyjgaInshi6TPFAud0gx0qMf70UDEVtluI+uLS7FQS4r4Qp8kttS@lists.infradead.org
X-Gm-Message-State: APuU4Z/IsREfLHLBAkHuM5yTCsXqpjRqaNmSKb+jEqe7Jx01gLmjuRFd
	pa0EUjLRxvZsmVbtCBvLYhWOBv9ss/69WZSMfD1hT2fltcHRcXE2aQiWweV2iM63SQ==
X-Gm-Gg: AYBFou1w72N+qB00gjM0zVBOaaXavV21qUzWnEOvn8gVH5Ul1tSY+pwUqf9V+tUv7V2
	2NArW1G2dw0zjqEt3ZBon+21DL1x4b2t4/wWkJOp3+il57ZYRTZ0cS9uofTd1O3jhrWJSeaWExU
	HweUxLEjImIYdSNjvcE+EDPgdWK4h7gBRMy8teDrgxUNMLla0Fs8mpi3pWYVfv2Jw3ufihu6r5A
	P4a3GG8jdEC0RTIIRwXCJD3Gza4kY025YziIvkdsCYmyd/BpTB7BC+fO0i5H3u2VD597Hgjt9Fg
	6UdRAhck4JkVuky8k+CI5bZauFhOH7AKg9Dl69cwNeU8GIrIJOpBbCaD/boe1mx+AdJCg2uwMab
	G6gAqSnQLDxkLnU2LemG1sPvo1FfhCYmRhxtmRxtQKUEt42wRcLhlVpsDwielF8UYJfdKk+ZMiS
	sCtJqZv6IKvlhj703LTpcuXlhyZx0uK6PH2tAf4whJ6SaBqOoAJ8lusYvOLSFhwpEWzW234Peyd
	xzMvTom5kdMydR6I6ZdBGllXtG2tu366vfttA1GhfcZQEJFweK6asR6alMXUplSVlYo5oM/CIFe
	l8zabTXiwzLQZ4Bk+6HArygEgi9U+oN9MV4M8rIcsQpBuwHRejFvzsrSZUbOxVdtug==
X-Received: by 2002:a05:600c:4e48:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4ac183d16eemr287425385e9.23.1793715998361;
        Tue, 03 Nov 2026 06:26:38 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm204541635e9.3.2026.11.03.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:26:37 -0800 (PST)
Date: Tue, 3 Nov 2026 14:26:33 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, ljs@kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH v1] KVM: arm64: Fast path transparent_hugepage_adjust()
 for non-PMD folios
Message-ID: <aunvGQb--3Lp6kQp@google.com>
References: <20261102211900.504192-1-vdonnefort@google.com>
 <867biu2ujs.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867biu2ujs.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_062642_369548_E26422BF 
X-CRM114-Status: GOOD (  26.36  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 08:22:47AM +0000, Marc Zyngier wrote:
> On Mon, 02 Nov 2026 21:19:00 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > transparent_hugepage_adjust() must walk the userspace stage-1 to detect
> > if a PMD-level mapping is installed. If it is, then a stage-2 block
> > mapping can be installed. Even though this stage-1 walk is most likely
> > cache hot (in most cases, the mapping has just been installed), walking
> > a page-table is still costly. This walks accounts for ~5% of the
> > user_mem_abort() execution time on an Apple M2 big core. This makes a
> > fast path interesting.
> 
> This raises a few questions:
> 
> - Isn't this a "fast fail" rather than a fast path? You don't make the
>   S1 walk faster, but you instead avoid cases where it would have
>   returned an level-3 size.
> 
>   If anything, you make transparent_hugepage_adjust() slower for the
>   case that succeeds. I don't think this invalidates the approach, but
>   it feels that the commit message is just wrong.

Yes, "fast fail" would be a far better description.

> 
> - How do you measure this? 5% feels like a huge amount for something
>   that should be 3 loads. Isn't this more an indication that the page
>   table walker is overly complicated because it was designed for
>   something else? In any case, It'd be good to verify your findings,
>   so please provide a minimal reproducer.

I have booted with qemu a L1 guest. Pinned to the biggest CPUs of the Mac M2 and
set the performance governor.

Then in the L1 guest, I disabled completely THPs and enabled the tracing
function_graph to measure user_mem_abort() and get_user_mapping_size(), before
booting a L2 guest with a single vCPU.

That gave me something like ...

 0)               |  user_mem_abort() {
 0)   0.208 us    |    get_user_mapping_size();
 0)   5.958 us    |  }

I have skipped the outliers (the function_graph prefix them with '+', '$' ...)
which I believe are most likely related to interrupts.

Then for each pair, I got the percentage get_user_mapping_size() represents in
the user_mem_abort() execution time.

Now looking again at the results I have, I realised I gave the mean (5%) but
perhaps the median which is 2.7% is a better representation of the overall
improvement and is slightly less impressive.

-- 
Vincent

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

