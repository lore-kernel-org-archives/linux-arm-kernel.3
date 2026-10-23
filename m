Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4c7qcNy;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MLxDf9HX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5jkvtV8P/+s5qJ2kbqgOKMQCk58hvpuAEYMAliw2L+E=; b=b4c7qcNy9GAOoB13kUG8xLf4V+
	yrmwZ2xlz9tzo8IHDgDM5c3dIjqJym1hbtKqeAt6o0sTPA9GJjViYPRbplSepUFZak8qm//fDNgKU
	L9k9MoWqly3zz4HrYIvsvUdEsJF90+FlI1b3f462Vnm6bbDThdRy+aRXcuk4ZZFOICDGxyrgTL9pJ
	3yEowt5RvOQ9GYvXbnzgFqjjHX1hMRJEPCN9c/A/Al3110EDohHzhmHI2ZcPUr8qe5kCCwR1JztBi
	xtMn+e1h5RzCmL8wRyN1P5DNy3ctBSNg5jGgYopHx63W+wPmXm5pLQjSSiJ5gA7B0t5yEnrhhBI+V
	iA06ldUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKABf-0000000Fq7J-1qA0;
	Fri, 23 Oct 2026 07:59:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKABc-0000000Fq6N-4C78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:59:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a210470b49so4515195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792742374; x=1793347174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5jkvtV8P/+s5qJ2kbqgOKMQCk58hvpuAEYMAliw2L+E=;
        b=MLxDf9HXJzf9lcOR4uXcfia9P6nVrHYXeTh5t2tzeCBIvs9CvdDfUPxipHYt1W+AZQ
         q6xvV+urZ+xPCt3oFZ27Jt+xCHCtj5bitwo7h0RrLi0tV5GTjQVZiA/NSV8HmX5nXIxL
         K/DP8OuAA70WCQcowEGD2U1+V4ar/6RLNgQb+F5U5/5xd+cnkAF4j0SrmIjEp17l80B6
         g9wNZif1OPMioqqu8l5qYQzcdOnWsE+hcLGjnrpkNVmW7wn0dI+nAjxrVty8W418Chei
         Sx6Tz6d3ggGbPM4iO+EK7JWBkl0OQxQCmVHrAODCSCCqJ5DhiAMjV+UyEtSZXvgMJia9
         6zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742374; x=1793347174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jkvtV8P/+s5qJ2kbqgOKMQCk58hvpuAEYMAliw2L+E=;
        b=Me0hxlM4ZN6gOssIMVdcnJmD5+QAZxMljiRVPItAeBbNZoNnfgQixsLXQUwRf9oTUh
         7HSVOclHl098KvwxUZcgb4PvuIk73cQHkia8EiIIIsAd4jrQJt/A9qTZEcit6qi72R8r
         W+W5kNB+VidRomkhsGVSw//rCzTmj8vphx5EfFQtZYGDYOkQ8WeKFJiY33prS7970XCW
         kbEcQVGVSnlwpYOg4IEwbhIs9CMG4zhRiRAMTHK0po6ptxjdJUmDhm2Xpm/Blkpai2vO
         fCJ6PIiwfahl2vR55acCvcAqeyCxq57pXiLguUr+kxloK+551bthfkBSPqJaCGphfaps
         Ltcg==
X-Forwarded-Encrypted: i=1; AKwUvBzXSyLaNQ55H9tJ0WcDPX2pEUTmDgsuXVmhIaZMi/msEzYGb8/s+hCVplY1c2kTzDsrNBbYeNh05nxI0mg1cq/J@lists.infradead.org
X-Gm-Message-State: AFq9FYJoTw7alGjWQqq0vXGpAFC6NsJIMkwFWAYSKiEBDLk0dIB4XupL
	M2QLVxD9NdnQzlQZt9eHCc0epaFgLxkbPzfCfm4GzhSIgFj/lBYUhZSQXnNV6T3sITL/K+XnJLT
	kfUMOZA==
X-Gm-Gg: AYBFou1819lkgiGDnvXy7ZUXgsuu8xE0DlzQjnZrAzBPoD2Fhx9GFKc69tyE5zIFUU8
	DBbBE6/9IjiIrkvnZ+cpxp8+HuUpIsJvRUeNQ56lCFc9KouugvkBq3J6GwxHjW0Ja8G7E7OxdV/
	+9qpOUktYD4pZdoNUQqDEFYBwh58dfbvoORm2CJ11PqES5XFYXEvedZZyFL2YlKmzPTRvQC7b/v
	KDU57091tTM120SK53S/9rxTVg7l8xf/V3RlQ5yuU9GHS+AVZrCJMRUsJKqaV1pm05gwc3ZLVHh
	VupMM35Up2PvgT0PuJ+gGLAQXmInK7cVenRnlsIhuv/8oP7wcLyXoP0cv6CQ7oStwjBAgMb5MOS
	jil/+QSOehI5CCz9ysLuavmP5a0Sghyobr5K76sVKoeAm81ZcJhSN6zauDmcQdhn++w8M2DaG5a
	nQbzAWrejF01qkqUmbcqutygTHYtdHDWhRhZwaTpxbW2g/d9Yam+fW6gxamJlJemAW9wcvqQ9E9
	E9n137KlTNO6pQM5uyze7mSu6WhApA6I1E66JZe7qFMDR7Ub9F/byNQL6bUD/a9VupdtqBDWMOh
	SgkSPvdIuRcXVzbr3aiENgn1
X-Received: by 2002:a05:600c:a04:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a211c7facemr22799255e9.2.1792742373535;
        Fri, 23 Oct 2026 00:59:33 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210473567sm56280825e9.12.2026.10.23.00.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:59:32 -0700 (PDT)
Date: Fri, 23 Oct 2026 08:59:29 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	tabba@google.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
Message-ID: <atsT4c-JLRSxSreo@google.com>
References: <20261022140048.2522787-1-vdonnefort@google.com>
 <20261022140048.2522787-3-vdonnefort@google.com>
 <20261022173604.3710390-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022173604.3710390-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005937_083374_378C356B 
X-CRM114-Status: GOOD (  30.46  )
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 06:36:04PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Thu, 22 Oct 2026 15:00:46 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > The vGIC LRs are architecturally UNKNOWN when the CPU boots or resumes.
> > However, in protected mode, only the used ones are reset, because the
> > HVC __vgic_v3_init_lrs() is never called:
> 
> Could you say here what happens to a guest when an LR isn't reset, as I
> asked on v1? Without this series, on QEMU changed to leave a pending
> vINTID 100 in the top LR at CPU reset, the guest warns "Unexpected
> interrupt (irqnr 100)". With only the EOI bit set there, the npVM
> doesn't print anything in 150 seconds, since the maintenance interrupt
> is asserted on every entry. With that in the message, could you also
> bring back the Cc: stable you had on v1?

Sorry I missed that.

Actually I don't know if this should be backported. I believe it was working
until now because all SoCs do reset their LRs even though they don't have to do
it.

-- 
Vincent

> 
> [...]
> > Then, cpu_hyp_init() is only called from init_subsystems and
> > kvm_arch_enable_virtualization_cpu(). Remove the kvm_hyp_initialized
> > gate: when pKVM is enabled, the cpu_hyp_reset() will just return an
> > error while for other modes, we already know kvm_hyp_initialized is
> > false at this point.
> 
> In init_subsystems(), only the CPU that ran do_pkvm_init() returns an
> error here. The others are still on the hyp stub, which returns 0 for
> HVC_RESET_VECTORS, so they go through the full init. Could you reword
> this part?
> 
> [...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
> >  static void cpu_hyp_reinit(void)
> >  {
> > -        cpu_hyp_reset();
> > -        cpu_hyp_init_context();
> > -        cpu_hyp_init_features();
> > +        if (!cpu_hyp_reset()) {
> > +                cpu_hyp_init_context();
> > +                cpu_hyp_init_features();
> > +        } else {
> > +                if (WARN_ON(!__this_cpu_read(kvm_hyp_initialized)))
> > +                        return;
> > +        }
> 
> Could you make this "} else if (WARN_ON(...)) {", as elsewhere in
> arm.c?
> 
> > +
> > +        /*
> > +         * Even if the hypervisor didn't allow resetting the vectors we can
> > +         * reset what we have access to.
> > +         */
> 
> nit: "what we have access to" is the LRs, so I'd name them.
> 
> With the above addressed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

