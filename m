Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030B606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1aG18sHs;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bjyvkKfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YpJoqFudutFLGEsXKoFfWlOWQ18XnvPfGoZCVowy++8=; b=1aG18sHsHsQ9KmiPlmv+/3AMQ1
	+nvahQz3YuIBBeyfAZwfFXlFSF7mxPuKKZ5KPBqT9kSdj7idjY/AIXVktUCCy99xw04jXc0FO6kUI
	JvZ1a440np2nRLE7YZkonIs3Pq0AuUqVC4ypl2hRFFZMe7oINBKJRnLdbyyyQcoaiqfUE6u0Tw7le
	64uVN22eF6xa5vbIfqys3mbjzLCFBB8lA0INBBQ1wbvExCgKQjv7hN3RQIZMe1f29O3iDukRuZQmT
	N1wylVtF4Ja8WCxfUturQW8y0ObAGh0cI/LZZ/m/tEVZICKWaO8nBDKyuR7GZM0Z80e93teINELac
	EC1Z8OYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEP5-0000000GIL9-1Z7G;
	Fri, 23 Oct 2026 12:29:47 +0000
Received: from out-140.mta0.migadu.com ([2001:41d0:1004:224b::8c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEP2-0000000GIKj-0EmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:29:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YpJoqFudutFLGEsXKoFfWlOWQ18XnvPfGoZCVowy++8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792758581; v=1; x=1793363381;
 b=bjyvkKfaNQmmaR7VbdPgJGbH4tyFQzLtGd0gCfAMvLu8phf5zLp1iP3t/ZR4R0mb/u6mOPgy
 zDiUxCyyGmabEvkmV/Tf98c50h4ol9C3A1wtVJaa40C7p85riBAN+Yhe6Nwgv49WAFZmc0kM6Mc
 5vWvdmcMiy61xEFLRZ260R88=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 70421d8de1760590;
	Fri, 23 Oct 2026 12:29:41 +0000
X-Mizu-Trace-ID: 70421d8de1760590
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so5915e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:29:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmJCjr84vOZg8sggIprGYEVPoe+1QhMyDwVQsgX4wIL7w9HK6UOZBCpFhG71giy3NgPylLtCQNIcXzIhPqxPZT@lists.infradead.org
X-Gm-Message-State: AFq9FYLFVLpHXvxYfkOi8aixdbOUbpLGD1huhi8/iBBJHsPpBK2T3F2e
	99/b2SxoXnGtEKvkcOw6c3FMKq/epU1zkYptIOK/1FEvv7gQT8M2XE/z8zVrvFu2ZZsJW14LXf2
	S+2uWOZgLdZSRcgiXaHfct7V5VKTZ7f0GiwpnzUeX
X-Received: by 2002:a05:6512:124d:b0:5be:b32e:c309 with SMTP id
 2adb3069b0e04-5bfb06c344amr122219e87.13.1792758580452; Fri, 23 Oct 2026
 05:29:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023092007.3918848-1-vdonnefort@google.com>
In-Reply-To: <20261023092007.3918848-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 13:29:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwNOJCphq8YNxK4nUZFj0Xrw31Okx1fiFAS=sHY1Z3cnA@mail.gmail.com>
X-Gm-Features: AclHuK-K2YjKCXeXFgvD-ClRx7h0B7uTh_qx33F7Uf1HBgI4b2DbgsZxKFDYIow
Message-ID: <CA+EHjTwNOJCphq8YNxK4nUZFj0Xrw31Okx1fiFAS=sHY1Z3cnA@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: Use the host kvm_host_data for nr_event_counters
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_052944_376463_FEA3CDBD 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Fri, 23 Oct 2026 10:20:07 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> So kvm_init_host_debug_data() initialises nr_event_counters in the
> hypervisor's kvm_host_data, while kvm_arm_setup_mdcr_el2() reads the
> host copy which is 0. With a HPMN of 0, this stops programmable event
> counters from counting a non-protected guest.

I tested this in pKVM with a non-protected guest counting with
perf_event_open(). On its own the patch doesn't change what the guest
sees: every counter, the cycle counter included, still reads 0. That's
a separate bug: flush_hyp_vcpu() never copies vcpu->arch.pmu.events to
the hyp vCPU, so the guest's events are never enabled on entry. I'll
send a fix for that shortly.

With that fix applied, the cycle counter counts without your patch but
a programmable counter still reads 0, and with your patch both count.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

