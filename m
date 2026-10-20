Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=igO9Dhtc;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T2i0NKx3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFQd2JuIrkRskW6DIyZMgb3/rIjk8gKZ/llqAP6BjBM=; b=igO9DhtcuHPvusN2Oxg6HZYj4n
	gBL+/yVPL/UGelLwaUbyFWAXzHjieQjCr3RiAUif6ddFa+kBi7k4PEXiEMMZqtOEFjbXTyaw4tfbi
	3Akv2oyrfj4Hkpz9BIQdsXg/xxH9CPKNpS+0rFkPEIopWA7myoufUPRJlFTpTbRgEItGtrVG4Mshr
	YvCuVGz2klsaSwBip/sxJFcumi1Jfu67zWgXA47cxo6PjIXV2ZQYUlCnKsn4MzcFK6wd4BVaIw7t5
	Hrz00asTLD7C7lrxuTm7kEJp93jNVHiqVPZlx6cJnJZeJ5b81HlhDLXJtOl4BETZuRxrrxnRjIlcy
	/wTc3Jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFYi-0000000AXZA-2lN6;
	Tue, 20 Oct 2026 19:31:40 +0000
Received: from out-99.mta1.migadu.com ([2001:41d0:203:375::63] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFYe-0000000AXYM-3CYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:31:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xjvnNuI2ASxgD0d3laO0ICYnzSAp4eDcc86vmcYiWos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792524694; v=1; x=1793129494;
 b=T2i0NKx3TdLWWL/yo+FTu/vY7PoH0sgVZx3bU6q2huOiMetnZ35OvGbKBTS6o6rQJ+XGyEDK
 B9fh2n9V7Ddh9DMRcDAiTZLTFC9LdR0p7KQMLXRBRWcXkHzNgqKPi3F9G3o4b1L6KskQxCqyrur
 DevQ9W+4ssTfprgxJwB9rgtQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ed200eeafb5aa9cb;
	Tue, 20 Oct 2026 19:31:34 +0000
X-Mizu-Trace-ID: ed200eeafb5aa9cb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so18e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMr2WjjdEJOw2Duq6EvPFzqV0hnce95Nl0E1J1nOhuUuMRTrYvs2ZpZJWdY14vbhoz1sLdKDsDXS434XlmMprv@lists.infradead.org
X-Gm-Message-State: AFq9FYJn66qAq4pol6AakTssyv0/YUqeDZCRu94g+Mc4LilXpVyk1cFP
	VPSd929Wo5i6iiTSxsbvlkerWnXAcj9GNw8SXgJD80j6MZuGHdz5vixgA2J//0YW4g5ChylRXAP
	o/MHQUiUdY6Q9+pOU5Wr/3GCgUObb8YyQpW2qPVAW
X-Received: by 2002:a05:6512:3044:b0:5be:4ed3:95b0 with SMTP id
 2adb3069b0e04-5be661e26cdmr211161e87.5.1792524693007; Tue, 20 Oct 2026
 12:31:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020064306.1542865-1-fuad.tabba@linux.dev> <atc2Y4gHwtGlffns@gremlin>
In-Reply-To: <atc2Y4gHwtGlffns@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 20:30:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
X-Gm-Features: AclHuK9HrLZiA-ahBYloBklQOkqXrnZWgSufxI-Ey3LM0N-9js0xNvZGXm47ZUU
Message-ID: <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_123137_040811_1FE95DBF 
X-CRM114-Status: GOOD (  21.39  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Tue, 20 Oct 2026 12:35:14 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
>> Fixes: 70ed7238297fb ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
>> Fixes: d4a89e5aee23e ("KVM: arm64: Expose S1PIE to guests")
>
> I guess kernels that are missing 19868b67e3e7 and 2ce80f624032 will need
> that stuff ported too?

I think 2ce80f624032 would have to go back too, since without it a VMM
can still write the ID registers after they've been sanitised.
19868b67e3e7 mostly provides the call site: the version I tested on
7.3-rc3 called kvm_idregs_enforce_dependencies() at the top of
kvm_finalize_sys_regs() instead. Kernels before 6.16 don't have
config.c, so the backport there would be a different patch. I'd leave
the stable side to Marc though.

[...]
> static const struct reg_feat_map_desc *idreg_feat_maps[] = {
>         &id_aa64mmfr3_el1_desc,
> +       &id_aa64pfr1_el1_desc,
> };
>
> Right?

That's how I'd expect it to look. Since
kvm_idregs_enforce_dependencies() repeats until nothing changes,
feat_gcs() could also test FEAT_S1PIE directly: by then, S1PIE has
been cleared if its own dependencies are missing.

[...]
>> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
[...]
>> @@ -59,6 +59,7 @@ struct reg_feat_map_desc {
>>         const struct reg_bits_to_feat_map feat_map;
>>         const struct reg_bits_to_feat_map *bit_feat_map;
>>         const unsigned int                bit_feat_map_sz;
>> +       const unsigned int                idreg_idx;
>
> This field feels a bit hazardous - 0 is a valid index and now things that
> don't declare it are setting a valid value.

idreg_idx is only read for the descriptors in idreg_feat_maps[], which
all come from DECLARE_IDREG_FEAT_MAP(), so the 0 in the others is
never used. Storing the encoding would work as well, I'll leave that
one to Marc.

[...]
>> +static bool idreg_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
>
> To me this reads confusingly - idreg_apply_deps() would be clearer I think.

Agreed.

[...]
>> +       for (int i = 0; i < r->bit_feat_map_sz; i++) {
>> +               if ((r->bit_feat_map[i].flags & CALL_FUNC) &&
>
> What if it isn't a CALL_FUNC feature?
>
> Could this loop just be replaced with compute_resx_bits()?

It's skipped, so a dependency written as a plain field match would be
silently ignored. Both entries today are CALL_FUNC, but
compute_resx_bits() handles every kind of entry and would also give
the res1 line something to set. It'd mean moving idreg_deps() below
it.

Marc, compute_resx_bits(), the rename and the loop rework are all fine
by me. If you agree, I can respin with them, or you can fold them in
when applying, whichever is easier for you.

Thanks,
/fuad

