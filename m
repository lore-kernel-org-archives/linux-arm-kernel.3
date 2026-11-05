Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF70606A6C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bQtMZLkm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TLyqchkq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ohk8fjJcBK9UzrBV+dt2XFBrhhVb8zdE0nF0K/taFC8=; b=bQtMZLkmFhTrJyU6+Ejy7cLKxX
	KsEAiERUG0VyduG4IYHpz88tKTYbs0X0CEm2pafW9elqHp5tudVj+e9QP9unYM3BIDq3DV6iz+RpQ
	pruBiypuxUzqs8NPCusy2rZDAAQhg5db0d4VVqnSGLD0cOc4YHHYB2XGzjmYlHCUWG/6vEDf+NuaO
	nU9D9/iQYDjF/KiyZEyFyZcXpEylu/Ocz0ZluLwYLQ8MOC6cYtfmOzBwUtm1pMrPq+NcLDMHgsJ94
	LBVYUl9kstYX1HKXFuIoWcONNAkXwMDhv1k964yMTNSkDB9G8yJWj/eO57YU6snfUb9Cjw4X8db3x
	0kbCwhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3UY-0000000AQbA-24qV;
	Thu, 05 Nov 2026 19:51:22 +0000
Received: from out-241.mta0.migadu.com ([2001:41d0:1004:224b::f1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Sw-0000000APqs-0SKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:50:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ohk8fjJcBK9UzrBV+dt2XFBrhhVb8zdE0nF0K/taFC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793908179; v=1; x=1794512979;
 b=TLyqchkqOZt/DtlVYwdrSUXx/dQb2voUuzu/1DK0ROKF9lGdVixSHWdqSbho4P4ggx6CDdCK
 N1psN8/3tnUAlOBXHA8POiClwq8TTNpT7OaXx4ex9SQ6w96P2zcyob28/LC80FP1KwAMIBi2O8r
 aVnCkYn/uC7CQOhfUQxoKWA8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 08e1f695e1c3dc26;
	Thu, 05 Nov 2026 19:49:39 +0000
X-Mizu-Trace-ID: 08e1f695e1c3dc26
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bff701efa5so1183e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz5O+O+sQlrBxVGyBjkhRL9JEOeuV8zR1xMBN4YcyJjDdNv3UVmABBlzymv0NEYg+TBDB7jRiue0qyc/JvNPcii@lists.infradead.org
X-Gm-Message-State: APuU4Z/TLOs+chov1AWBmoqqYdkQ3L1WCoDvHTd72DdUjREk2tb4NWfg
	o88OyfV1VBLPV0MqCi9gKnkNvZn0HXwhuq8ejyBQ4YCc2eH21mYEMHu9twE7ACZgmsQPeJFM9nz
	6vhxNy2whqMv65jMvQAm3R2ybe28GI6GObLDAgQVm
X-Received: by 2002:a05:6512:33ce:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5c0030a8446mr18363e87.5.1793908174490; Thu, 05 Nov 2026
 11:49:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104124451.2148724-1-fuad.tabba@linux.dev> <56rrmewwluy2iw52zmusrys3qfqcdhtsgzpqtskr6zt4xhmhfo@hzlwy5ol47kd>
In-Reply-To: <56rrmewwluy2iw52zmusrys3qfqcdhtsgzpqtskr6zt4xhmhfo@hzlwy5ol47kd>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 19:48:58 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxms6TaXi1ghx=hPU3fG1EQUwQYeX+d0jjJ=AzhDv0u_Q@mail.gmail.com>
X-Gm-Features: AclHuK8cooP5vM3_YGu4N0f2LHYPXd6jDq8nHFV8TmXlzVrLCE4RbmmBQjeYTg4
Message-ID: <CA+EHjTxms6TaXi1ghx=hPU3fG1EQUwQYeX+d0jjJ=AzhDv0u_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Stop stage-2 teardown scaling with the
 IPA size
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_114943_088241_F7394301 
X-CRM114-Status: GOOD (  12.20  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wei-Lin,

On Thu, 05 Nov 2026 18:59:55 +0000, Wei-Lin Chang <weilin.chang@arm.com> wrote:
[...]
> I haven't looked very closely, but do functions that use
> stage2_apply_range() suffer a similar problem?
>
> If I'm not mistaken we previously realized unmapping a full IPA with
> kvm_vm_stage2_unmap_range() is slow partly for the same reason.

Yes, when the range is the whole IPA, as you found on your reverse map
series [1].

> I'm not sure whether optimizing stage2_destroy_range() and
> stage2_apply_range() together in a single series is preferrable though.

I think it should be a separate series. Returning where the walk
stopped was a small change for teardown, which runs on an unlinked
table with no lock held. The stage2_apply_range() callbacks are shared
(kvm_pgtable_stage2_unmap() has EL2 callers that treat a non-zero
return as an error), and the walks drop the mmu_lock between chunks,
so it's a different change. Only NV passes stage2_apply_range() the
whole IPA.

Cheers,
/fuad

[1] https://lore.kernel.org/all/eylfcgxs2xzu57czyuhkpmum45lpxyccyu2yh3mipr67aq3xo6@xinygxzavoja/

