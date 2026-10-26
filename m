Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEEB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xBwX1fQv;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IvwcoIFU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PYgl4/AlR9E7qD/6t01/AqAhjtHt2uKRS8XnGrG05+A=; b=xBwX1fQvbixEtoD53qd+scHlq5
	aESC/R93eJNRw6IdRhzfcpmzYl/Q1b0BiYHcULa64l6Y8mPYkkr32QS2lHo0W9lKsLcR4W/0yrMCK
	jQkFNkVrL5Mxdmha7/5j4fkEhwJQl6XcfFsr8gDPIllHJ4zjma+WYmV/09Oh6xWfAJm1yZCAIdaM6
	2EQN6bP6sWy2uo/5KKjsQVrsMYUNqcYfP83YdYNRkBj7Ih1x8PHPTVWEVRfeLqvpIh1ILcO6Q/PKr
	R1pHXwMG48WyqubN3UVL5ZhkdGjhrmWq+kK9zG1MTsGW17IMPjBGJxdYOOrQrMaXdOARKtfUZnIXi
	+XrN8qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLODT-00000002xhp-0r4K;
	Mon, 26 Oct 2026 17:10:35 +0000
Received: from out-43.mta1.migadu.com ([95.215.58.43] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLODR-00000002xgi-07pF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 17:10:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pcthy6ORiWzW3EmGLV8zsnkU+qv48Vriy9rB5HlVHlU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793034629; v=1; x=1793639429;
 b=IvwcoIFUwnmW6X8wZFE90I/ZGEzZdt3lwnKHTcY0+9LG9Mtcg7nt7cEoqLCdMBmRRfD0LhWM
 JVLhwl5jKMKRCSYivSEJwdUT/jyAuzwbyolm8peKQwGdCOLlGRjVz+wcQUY1x8mEmWJ/B+cRdG6
 H2w+V2lRGYQSeRzRfQNIHgbk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f92945dd341280c5;
	Mon, 26 Oct 2026 17:10:29 +0000
X-Mizu-Trace-ID: f92945dd341280c5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so225e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 10:10:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5kCPjd7aGrEqmib0EMaUtLF6am9YkRsaqfROBJL4SmeGQ8Q3+p/i8eDxuhIzHn2eO2/AbDiAv9se6lobaUecp@lists.infradead.org
X-Gm-Message-State: AFq9FYJFnefLh8YzWoRfyj+8bP5kCQI/6LfDbjVYBwNKgcW7yFUTgLGM
	15iwEHgcRd2Z3jn4Pnf5w5L6i4oaSRJfZgKfu4El5k3Ui8dBkXjYGtKEpEGH0VtrwMw/IrBwLn+
	f+HO4TTz1RjTbji+9DXrtNuOehGjpJNydYC8/Orc9
X-Received: by 2002:a05:6512:130c:b0:5bf:c1d8:b44b with SMTP id
 2adb3069b0e04-5bfc1d8b53amr122078e87.14.1793034623586; Mon, 26 Oct 2026
 10:10:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev> <a86348e5-a55a-4a99-a3c6-24b3213ed3d1@arm.com>
In-Reply-To: <a86348e5-a55a-4a99-a3c6-24b3213ed3d1@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 17:09:47 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxyenZzByhAckimWUSgG5fMFVBwyB8bsC15xaoaU1RPVQ@mail.gmail.com>
X-Gm-Features: AclHuK-pKf8gC2S2-5qJFUs5PfEVBnKKd1_HAZS3RuQB33ufSZ6ApBNWFpRYh6w
Message-ID: <CA+EHjTxyenZzByhAckimWUSgG5fMFVBwyB8bsC15xaoaU1RPVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_101033_244513_61CDA81E 
X-CRM114-Status: GOOD (  10.99  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 15:41, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
[...]
> > +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
> > +{
> > +     struct kvm_vcpu *vcpu;
> > +
> > +     /* The host never uses ACCDATA_EL1 */
> > +     if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) || !ctxt_is_guest(ctxt))
> > +             return false;
> > +
> > +     vcpu = ctxt_to_vcpu(ctxt);
> > +     return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
>
> minor nit: Aligning with the other kvm_has_feat() usecsaes, should we
> wrap this under kvm_has_accdata() (with moving the cpus_have_final_cap()
> to the wrapper ?)

Thanks Suzuki. I'll do this change if I respin.

Cheers,
/fuad

