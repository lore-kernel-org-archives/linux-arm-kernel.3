Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD978606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3/X963UB;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YY35XLVt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YZLYsLs1zDQz5M0rn0ZPlb3pIBZFLCQPnvXndpW+/w=; b=3/X963UBDd6QqWK31912Vr67ge
	vEdxmVZe8JLXURWKYyivtinw9eN41YJYnl4XvlRhlMPrZnj4D1sCANj2lhSjz+5ysGI0/2xCCL8Pk
	LfJBme3TGVwlj6MNtwRpCFY8OfFmzXRkIydmolIgzuBevRHHG1oidQ96jX4E7gSLocbiLzpmXlT8e
	y9HwJkPUA81R/L25p9IjKb08gzZccJO0i6lHFnqZtc51naEOLYDfz3crDjc2MwWSgeH9oerSEvEAl
	BC3+/jsDO7gCa9l7FvmLEDsq5oCoctm/pDnwx15N32G8vtwQBHEIGnNGtWEzr6q4IDclj19yXThQc
	5JvzFPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY1P-0000000CDiw-29FI;
	Wed, 21 Oct 2026 15:14:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY1N-0000000CDi9-13SG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:14:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so10061945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792595667; x=1793200467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YZLYsLs1zDQz5M0rn0ZPlb3pIBZFLCQPnvXndpW+/w=;
        b=YY35XLVtC0p9Mctk6/oTXia0YgFvS/iukTc8D9ZmkH/bALliL5OJSyWk7mMZWSplJz
         hHx+0NMozFc/3A57QEvJXM4J55ArcBXQ27BdGMe7G06l4CpF08c632p97hYxm5ysgy0I
         V30Q6oLATPH1VngU/NmaDcBFqv8m5IG1xloVTjeFqXYVyw7S0xDW8NO2vFDZadBi7/Q6
         rThuhT/JbQicRfdlIuq62dB7KHc6zl6FeUHS+G+SN+isns+5B87FAYqYawrouojG7LQN
         ABYicEzzN6QOeGeL/AlnwbsD+ZipnRsgXcB1xenikP9sfF5o3n6sbOz3G2+tVKnfG3Cl
         WsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595667; x=1793200467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YZLYsLs1zDQz5M0rn0ZPlb3pIBZFLCQPnvXndpW+/w=;
        b=zEXTCx8xvFWEZKyazktLPt9yjufzmFY2En2KvcLRH5dFoxl/N5jhempXkzYxWkFEFI
         7uku7PZcLKPMu7w/zYgoyaj71alZKqeQNU7czIJotB5ulaLHZg9DLf0GUfxIQ+rX67ut
         gJTBQRtEIC63GJhHtFEf5uxlfYuaKqx2SoHQIMdTTjFSiJ5HA0RDkSloy6wNjrJePgrN
         qrneGcouZzs959dhQwOTUJZn87p8om7Jis3rP4BsBk8sP2UPa1QSeaUhFUrqrkhiDPmn
         zv7GIvu5rDXATK9kIGOENZ99vKxz4xMDAFBpTaPVvX0IY1rIUHCokwxnJ40bTsrdykAq
         K9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBx+RiYL0cbW2CU/qYhKILBnf35nuN5G0iSfNfMWU3LmbMBtSXI/ge7sr00LBhbfYM3WjlV6HboxrCsj8r163emU@lists.infradead.org
X-Gm-Message-State: AFq9FYLnLDbAwbwobt3/7RwoTcYSQqRI7xQIlPoAWOehEW8qv2XBoXBb
	oVeX4rGEX9Yj3jYRXSaSsP/EeeWptIG2wdFfXGol0fuCkHkfxEXw9rU2OvdgmDexUQ==
X-Gm-Gg: AYBFou3+gfmnt7iPq4XYRlJPlq9APyZqOfMkMpnkqW7TQYfrmWMzgjkV5dLVHq4oqAQ
	YPv5v4myEtjV2IJ5VZVcl0XRwb98E6Hy3mVIEeZ8wBSAY7TOi2QTSvqNQpbqIb1t5sp87WBmoxB
	15VuOyD92mmzW+SSPnov5X9e9d1XugkhAtXW/31R8Sc0ayU5VAmlM5O1A8FmrBpGP9AXxtMnfh4
	GHiy23ocg9BspHDo6oip26jSJZPj+4l4WjJLbXfzY/RQgWJi5wTIAj3h4GmER7H+Em5thA5UFOY
	Pln4hXxzUQWhdB9RlFi7lsYqjkIskuc97f+bhymI6Wjlz0KEibWGkJX+cWgvyOdAFnSYlsefB8n
	AtMR62Pjxhhc3My2jmVl8mCbVVqEhUkE8dpMgKRiNKL8t0z7/TItL1VfwY8Ivol8I7ORDYuDugI
	7cWAI2P6D0R6C+9V0AQs0JnAQTa3+EiV/r5VXTKgY7JHKc3v7Cr6jVA2LXKIn0sYjQHMIkH6/7a
	1T/4B460yupBaKS9vQo6TSNToNZt2M2LI4hg2xFHLbFYcH5n4pMbpwnxznm2xRt08cbozofAoCK
	s4Ob4Xwxtw4htn9N6skQHbsT
X-Received: by 2002:a05:600c:3e83:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1fdb078camr50365605e9.17.1792595666559;
        Wed, 21 Oct 2026 08:14:26 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm58540435e9.1.2026.10.21.08.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:14:25 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:14:21 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v1] KVM: arm64: pkvm: Clear GICv3 LRs in the hypervisor
Message-ID: <atjWzRABsApbZ8CC@google.com>
References: <20261021110000.508827-1-vdonnefort@google.com>
 <86qzhjz1iz.wl-maz@kernel.org>
 <ati1DrtmMd-63bIN@google.com>
 <86pkx3yylb.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86pkx3yylb.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081429_329185_8D6537FA 
X-CRM114-Status: GOOD (  27.77  )
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 02:25:52PM +0100, Marc Zyngier wrote:
> On Wed, 21 Oct 2026 13:50:22 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > On Wed, Oct 21, 2026 at 01:22:28PM +0100, Marc Zyngier wrote:
> > > On Wed, 21 Oct 2026 12:00:00 +0100,
> > > Vincent Donnefort <vdonnefort@google.com> wrote:
> > > > 
> > > > The LR registers are architecturally UNKNOWN when the CPU boots or
> > > > resumes. However, in protected mode, only the used ones are reset.
> > > > During boot the HVC __vgic_v3_init_lrs() is never called because
> > > > vgic_present is only set in init_subsystems(), after cpu_hyp_init() was
> > > > called.
> > > 
> > > Why don't you fix this rather than making the init even more
> > > different?
> > 
> > Ack, I'll make a patch to fix that first.
> > 
> > > 
> > > > Also, the PM notifier isn't registered for pKVM and the HVC
> > > > becomes unavailable after the host is deprivileged.
> > > 
> > > Sanitising the LRs on PSCI_ON is probably the right thing to do, but I
> > > don't understand why resetting the LRs is out of reach from the host,
> > > given that the host is fully in charge of the interrupt injection, and
> > > therefore controls the LRs.
> > 
> > I suppose I could reinstantiate the pm callbacks for pkvm to at least reset the
> > LRs?
> 
> I think there are two different things:
> 
> - pKVM must not rely on the host resetting the LRs once it is
>   deprivileged (that's the PSCI_ON case)

Definitely not a hot path, but if we keep this one ^, isn't a shame of making
the host issue HVCs on CPU resume to reset the LRs if we know the hypervisor did
it anyway?

-- 
Vincent

> 
> - pKVM must not prevent the host from resetting the LRs (that's the
>   "mind your own business" case).
> 
> Both need addressing. If that means the LRs get reset twice because
> pKVM inherits the PM callbacks, so be it.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

