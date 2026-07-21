Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87D0C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYTJwHkAf1TmQrTHI65fUCX9+FxnuGE2Bm0tJuySfOA=; b=1Du+AgQFbsxV89xx4ZFGTc2pl4
	+Si21oN4XzWQKwinWuqRZFkVUHI9B0kLCR7r35B+wVIWZxvtenSTjO7j9S3LUcanobfXkU7BhmCXi
	n2mAGX4WJ0rhh3WlGiIKhQYgYD66auKwTT3/7Wvate3IxYgiHpiRgfd24ZNPk2wTZLok+aTokLUC7
	xJ+nHQen0yAjR/Tzs4eSORZAERl69+FWAR+MFUQTwEVVMtIzHPSTq4GQRJ/lHYnVLP4tWpFGsupAg
	TbSqEp4wg0CYvlwu/HOE47uX5BnxGqiovISN4K1EdmQpFd4vcgCtobTvKQ5GJxtq7W1RVtFWdnD8y
	f3Lwsk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9Wo-00000009PYn-2juQ;
	Tue, 21 Jul 2026 12:24:54 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9Wl-00000009PXx-2YZd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 12:24:53 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpTLgcZo7jxk9gnZkRiWtunb8641NF/jdDUnX+ZY1SNPE8Kb6O9ByFHjIgiFNpcQwkwp1MMnu3563mOeZdhLdRc@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784636688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYTJwHkAf1TmQrTHI65fUCX9+FxnuGE2Bm0tJuySfOA=;
	b=RydGKs1x/OXGbL9sCs16umYb8xiRI1e4C7iA0GWUFkzIPHErRDJnewIHwoLtEnTHKneGxv
	/2xL9jHY7qmS5UY4sZyAzGRv0oehI25UNz6qoXwtNgSRoD7OUqIIoQW++5rapU+3VRCZGi
	eC9/YrH5Y/nwzmZWZEANJY3WyOYnDZE=
X-Gm-Message-State: AOJu0Ywqz2X8EfB3u5YQmmABI+tgHx4ulAKUpo4ci8ROlM3yIBoxoxZ8
	PMN3JTCpqvEED4qugnmGOMx92w+smLlnLoNyRmbdUjoQloptfBMzzu2MCOWisFrNGYkJnD9wuO9
	e88oyrEM1TFSHTJmmDRWBFfrBbQpvKY7JXL/nCcZj
X-Received: by 2002:a05:622a:aa12:10b0:51c:935d:8d74 with SMTP id
 d75a77b69052e-5260098e461mr13025061cf.9.1784636681231; Tue, 21 Jul 2026
 05:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
 <20260717130317.1953574-7-fuad.tabba@linux.dev> <C5D63651-E924-4297-9B4D-6E9DB04D64D8@grrlz.net>
In-Reply-To: <C5D63651-E924-4297-9B4D-6E9DB04D64D8@grrlz.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 21 Jul 2026 13:24:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw8Z5LDEi+1b62EEr2a8fqzBFGMsETsH0suZk76_DsNdw@mail.gmail.com>
X-Gm-Features: AUfX_myF8APD4JrsQUjpdgeGCuOrmjzvI9FEW6Snxcw0N2xLLub-E89efv0Armo
Message-ID: <CA+EHjTw8Z5LDEi+1b62EEr2a8fqzBFGMsETsH0suZk76_DsNdw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] KVM: arm64: Don't advertise eager page splitting
 under pKVM
To: Bradley Morgan <include@grrlz.net>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Gavin Shan <gshan@redhat.com>, Dev Jain <dev.jain@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_052451_930512_D33869AD 
X-CRM114-Status: GOOD (  20.79  )
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

Hi Bradley,

On Tue, 21 Jul 2026 at 12:19, Bradley Morgan <include@grrlz.net> wrote:
>
> On July 17, 2026 2:03:16 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
> wrote:
> >Under pKVM the stage-2 walker resolves to pkvm_pgtable_stage2_split(), a
> >WARN_ON_ONCE(1) stub, yet KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE is still
> >enabled and reported for non-protected guests: the capability check keys
> >on the per-VM protected state while the walker dispatch keys on the
> >host-global mode. Enabling the cap and then dirty-logging the guest
> >reaches the stub, splatting a userspace-reachable WARN.
> >
> >Reject the capability, and stop reporting a chunk size and the
> >supported block sizes, for every VM once pKVM is enabled, keyed on the
> >host-global mode like the split dispatch. Gating only protected VMs
> >would leave the non-protected guests that reach the stub still able to
> >enable it. Userspace decides whether eager splitting is available from
> >the block-size bitmap (QEMU falls back to no eager splitting when it
> >reads 0), so leaving it advertised steers an explicit request into the
> >enable failure instead of the fallback.
> >
> >Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
> >Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>
> Do you think CC stable would be good? I do but sometimes I'm
> embarrassingly wrong

I'd lean against it here. The "Fixes" commit has been in mainline
since v6.14, the symptom is a WARN rather than a crash or data
corruption.

>
> >---
> > arch/arm64/include/asm/kvm_pkvm.h | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> >diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> >index 57afb07d6b13..beea00e693a0 100644
> >--- a/arch/arm64/include/asm/kvm_pkvm.h
> >+++ b/arch/arm64/include/asm/kvm_pkvm.h
> >@@ -45,6 +45,9 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> >               return true;
> >       case KVM_CAP_ARM_MTE:
> >               return false;
> >+      case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
> >+      case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
> >+              return false;
>
>
> Nit: KVM_CAP_ARM_MTE right above already returns false, fold the two
> new cases into that and drop the duplicate return. And please put a small
> comment saying eager splitting is unimplemented under pKVM (WARN
> stub), so nobody reads the list later and "fixes" it back, here's a
> example, feel free to bikeshed

I'd prefer to keep the separate return. The grouping is deliberate:
MTE and eager splitting are unrelated features, and the two eager
splitting caps belong together. The function is self-explanatory from
its name and header comment, so I don't think an inline comment is
needed.

Thanks for the reviews!
/fuad

>
>
>         case KVM_CAP_ARM_MTE:
>         /* eager splitting is unimplemented in pKVM, please don't refix this */
>         case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
>         case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
>                 return false;
>         default:
>                 return !kvm || !kvm_vm_is_protected(kvm);
>         }
>
>
>
>
> Killing the reporting too is right imo. Qemu reads a 0 block size
> bitmap and quietly falls back, an explicit enable eating EINVAL is the
> worse failure mode. Good.
>
> if u choose not to, it's ok, please add
>
> Reviewed-by: Bradley Morgan
> <include@grrlz.net>
>
>
> >       default:
> >               return !kvm || !kvm_vm_is_protected(kvm);
> >       }
> >
>
> Thanks!

