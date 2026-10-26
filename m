Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KKR+2ZPD;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=IwQB1b/0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0Lq4a/V8mDm6FCGgdk05nU9bT6DX1rNy3nB4AjBmimk=; b=KKR+2ZPDMVXLNN+fh/O+hD/+P1
	hE3PpAG/W3NauX1tpFGAawEycaU1U3I2II8xbuKrtyMA9JiiWY1E/789Ifjv5BaSoSUR5BAQDS32X
	otseaRMceKvVDozm/w48fvd1OJnst3+PMQPgmFH5ouKcVZiUGa6ml9mR7P6v6ZRRQCT9+y+OOr2Sn
	mkTsbFsIEWZJd5lPjU0i7RzRPAEC4XTKipZYC5btwDBT2u1UFhiBDeBXDGhSmOUA1P2EEdd/gcnIp
	cdZXlefiLEXWoEv0g/Ibe+OkFDVgw/E+JkxUNZ3XTBfBXOqMmOZ9Ryh8GZXxvyWTCyNcAFpAIKSiX
	ROt3NC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSTP-00000003JDQ-3KGJ;
	Mon, 26 Oct 2026 21:43:19 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSTM-00000003JC4-28VW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793050996; x=1824586996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K8Tw0xjvYKK5C3EMr77Wx4LoUSWiFby6WDQXp/hFglg=;
  b=IwQB1b/0GFNgXW4mhf3fDBrzIooHtWhOgx0ZloyDdmQeN/ugzNS1tTjx
   AsktUWmOzZpLHBa7WUC6sy5E5UCNQxZ9Vt2cnLKmv9C5ySZO2UD06HVM9
   peYnhmLbzqMsM3lJW5ln9Ljq4jwx8/g0u6VRVyQxkmN7U5GQMUyp7qf6m
   oD5DI6qSjeGM9NC9wKHXIlWdtrEw5yeDNkBsdDpDrdH1KEfYO8CT7ojZo
   5nQl8jQcI2M0KxFXNEoZE5cwgy3qGSMR62SBAcN/c+noCItmGJilCieOl
   UUW+84tgPsUX3Nfmr7wSkucIH32Kn0RoukTTTAXjdTwrze9CX0+PzMfcb
   Q==;
X-CSE-ConnectionGUID: OeuHI5TqQxGNbqPskXWE7w==
X-CSE-MsgGUID: yPpBQb7jSGud2mnBNk+1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="247469203"
X-IronPort-AV: E=Sophos;i="6.27,180,1786978800"; 
   d="scan'208";a="247469203"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:43:13 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A45D01002B9B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 21:43:13 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5A53C8D65FA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 21:43:13 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 36B3A405E32;
	Mon, 26 Oct 2026 21:43:07 +0000 (UTC)
Date: Tue, 27 Oct 2026 06:43:05 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3] KVM: arm64: selftests: Test VNCR translation
 invalidation
Message-ID: <at_JaV29gVqxueSK@sm-arm-grace07>
References: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
 <861p9czwxc.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861p9czwxc.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144317_070983_BAB0DBFB 
X-CRM114-Status: GOOD (  17.57  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 08:30:07AM +0000, Marc Zyngier wrote:
> On Mon, 26 Oct 2026 03:10:10 +0000,
> Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > 
> > Add a standalone KVM selftest that checks VNCR accesses after L1
> > updates its stage-1 mapping and issues a TLBI. This guards against
> > stale VNCR translations, as KVM caches L1's translation of
> > VNCR_EL2 and must drop it when L1 invalidates the mapping in
> > kvm_handle_s1e2_tlbi().
> > 
> > Keep VNCR_EL2 unchanged while remapping its backing page A to B then
> > again to A. At each step, L2 reads and writes TPIDR_EL2, and L1
> > verifies that the accesses reach the selected page while leaving the
> > other page unchanged.
> 
> If you were tracking cross vcpu invalidation and exercising all the
> architecture corner cases (such as permission changes and co), that
> would be helpful.
> 
> But as it is, it doesn't help much as a validation tool. Its scope is
> way too narrow.

Thank you for your comments. I will try to incorporate the suggested
test scenarios.

Thanks,
Itaru.

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

