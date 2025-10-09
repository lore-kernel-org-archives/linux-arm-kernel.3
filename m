Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12C6CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+k+gk6VQNvvMox+c8DfhOTxAsmkufNVxeH8bt4I1AGw=; b=fQ+03BcaBepqqlj/aR48rZ+QzY
	cG2zQBWkC/fQusFdt93gJhvfWG6/6iuGB9owwefNjqSta2bPNCe06/MdwE9eBh38jvKRDeV7SI3dh
	GtzGT0S3lsjbxau5dhSiv17C6wf/zmLDEwaNrQ8yyWRhdwLGEKcZnyqwRsd0ebjmiUHDRngjLHx2D
	THSxj/mwjGZrFDDLon2Ex/da3klm3EehvHxDOf0jg4905H662kcxxIm/snQJAPOJI+9Of73syx5Tz
	Vh/GJpapdaPtx57hk9MxHTfqVSYaahaGM26OxTj+mifL/izHoZ7Cbndr9qqwaS9v9oJEIxdD20Bya
	NCLMH+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zDm-00000007Fdw-2UhJ;
	Thu, 09 Oct 2025 22:34:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zDj-00000007FdY-0spD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 22:34:49 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso1954454b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 15:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760049285; x=1760654085; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+k+gk6VQNvvMox+c8DfhOTxAsmkufNVxeH8bt4I1AGw=;
        b=D5AM+/jymbQ+ttpQe6jY7QBPeuKahupz3rsNZVzOVDoAkg0oSHf7eZ5/PhAVrmGGJk
         Uzf9dQygI8zHi9589eP62QV3xsemABeXuyEZGYE16Kyv97avEe4AZqqtO19aFH2itM9D
         1B8H9ytBwV4dntcU3872gtaWcGD80Ka4q2d2XwcquzGqdiESohBiuU8c1acDJLtho9LR
         33s7jR+Z08JNEtD/LvZ6z2IJQwiFRuXlRAIfoh8WI2X8mLbhcs5A7JbSS/q6/eWQZ1x1
         9ooItKB6GQC9Rpjy513z0W244ozXORzrQ8qztJhsr2koo5CnG2lcIfDEuvD8ozXPlZ/b
         VE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760049285; x=1760654085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+k+gk6VQNvvMox+c8DfhOTxAsmkufNVxeH8bt4I1AGw=;
        b=SfWNFedDsBLy2m58jKsvDGjgw0MUhlCNbvGJXIC1TGcW5Z5ullREekYdVrkQsgiAf8
         +iCR/K0LAS4Xcm1L8I/6K3lE3wWW2tShSgdpREcN9WIe7qTzVXIUCCdkUviY5AKYF2Dc
         AzcpmqlPxH0/IC/a+0gzF0kJHeAm5rW2/SBPBBmv7Hg4PwGLTux2oL4rY/bGxHjgEn6J
         w5sthvS848Dp2htzvO165FcLX3FQBMvBOmYyNrZjngYjugtUluRSuQxGKKZKNbHIg9gT
         oDH4mWAv+2VMiWL8eFSxtMFCPpGTKhM8jfO9JJu1D9sbkhM+DS7buWydSvJ0nioX0W2E
         8iOA==
X-Gm-Message-State: AOJu0YxzIPidAmFg6JJ3uC6pkr0OHe5ErAnOmjeYUco8IOfecqPCvf/p
	JgR2e5dcmgufvvygtuFzNvIiWcdzF4aeIrZF56os1y5J/Epc4Ith50U5cfUW/1mtM5R48Ggrvt+
	wioUZ0HTD1oKw8RDg2k6O89KcqQ==
X-Google-Smtp-Source: AGHT+IFT3+ACqwDT2lCoDe9XM9NV6pIpsUJnUvsrRoGgkm257Ov/Ea7I3q36/zx0MsZeeBCKYpcs1LHgia7b4IPfmg==
X-Received: from pfbgu11.prod.google.com ([2002:a05:6a00:4e4b:b0:77f:3d60:9807])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:391a:b0:77e:8130:fda with SMTP id d2e1a72fcca58-79385ddc9f9mr11632278b3a.13.1760049285570;
 Thu, 09 Oct 2025 15:34:45 -0700 (PDT)
Date: Thu, 09 Oct 2025 15:34:44 -0700
In-Reply-To: <20251007221420.344669-9-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-9-seanjc@google.com>
Message-ID: <diqzfrbrhfgb.fsf@google.com>
Subject: Re: [PATCH v12 08/12] KVM: selftests: Add additional equivalents to
 libnuma APIs in KVM's numaif.h
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_153447_249347_AAE016A6 
X-CRM114-Status: GOOD (  10.23  )
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

Sean Christopherson <seanjc@google.com> writes:

> Add APIs for all syscalls defined in the kernel's mm/mempolicy.c to match
> those that would be provided by linking to libnuma.  Opportunistically use
> the recently inroduced KVM_SYSCALL_DEFINE() builders to take care of the
> boilderplate, and to fix a flaw where the two existing wrappers would

Typo in boilderplate!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>

> generate multiple symbols if numaif.h were to be included multiple times.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/numaif.h  | 36 +++++++++++--------
>  .../selftests/kvm/x86/xapic_ipi_test.c        |  5 ++-
>  2 files changed, 23 insertions(+), 18 deletions(-)
>
> 
> [...snip...]
> 

