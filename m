Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA0606BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bKtNPBJS;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T++itLuy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D7WbQXrrSrOg6sS9GtWj6hAsCJUVrDxUGniXvXJ1jxo=; b=bKtNPBJSfvgkwBf1TrJkIsf2tA
	EXwyG5e1PANptiuU+OO0Vh5IbXyfk/wiw2JPWGU2AHsQtXa1KuXcp/BbZKV65JazHuq5lDBuN0bbC
	Ddbw24rslOmwINU07cJ1LOQqgqlYkGQjPklmnM5pGlNqaCxbIK1c05CsqtE+CCW6nTnqapcS16FfF
	u64cpWBsEiHuI/5/L5pLvPsnXMAN2SVAy+tMB9h8An8sJZtfLUeEF5vILUgpZRQUePzqyhogVqsKf
	7vcKp/fNMEuGhaSVApXa0EB4uly33d+Lzbj+B9sK5YQs+7++qCxMufh7e+4o1OdFd/+QvK3+nALd2
	tpKjOdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgpa-00000006hYA-2Jct;
	Wed, 04 Nov 2026 19:39:34 +0000
Received: from out-56.mta0.migadu.com ([2001:41d0:1004:224b::38] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgpV-00000006hVJ-21vb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:39:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=74ExVBB+ei6S46cEXVQqMO9R7/DDzZNlWMQikqnEM6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793821167; v=1; x=1794425967;
 b=T++itLuyTP1AUV4F2nKmw6k8rOK026rRvOJLoKjFlzEWNO+RUUVvVgB+IjWHuCCsZlxHMmiS
 gW+XyOj2PbXUt/WYaDLNOiMKsXpwPixkN7GlWdhM7CIPxCy2a5PshgiVAZCiYXQoCYdRC0fcC7a
 EEXtCcCU4KAn0bCgeAhosgXk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0c9756348fe17db1;
	Wed, 04 Nov 2026 19:39:27 +0000
X-Mizu-Trace-ID: 0c9756348fe17db1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so1172e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:39:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwdhe8pF6nj2NOX0aNCZnUQ0fiYHgJ1LXBfMIYqakd25nOuCp7sjtrIVV5yJAcw1eBrYo7ooMyKwTEpBl4/Trqy@lists.infradead.org
X-Gm-Message-State: APuU4Z+n03JKvxES+X+HZg/jJjRIokIvir6ACNztleZ/oodxq861l7Sq
	yeB8T6nZi5pxaYgEKzoFJSvmeTG/5KngKa0zqtXbxPmWv+iuCKoQZ6J2COVHR9BduPP9TXgmt8K
	trJtEI3wcTNyXpWb16tVY5JRnKX1hIK1jIk9EIC8n
X-Received: by 2002:a05:6512:3dab:b0:5bf:ec8f:c361 with SMTP id
 2adb3069b0e04-5bff59a5dadmr217277e87.14.1793821166164; Wed, 04 Nov 2026
 11:39:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104084842.132944-1-fuad.tabba@linux.dev> <aus8xb_xT64WKHDu@e143914.arm.com>
In-Reply-To: <aus8xb_xT64WKHDu@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 4 Nov 2026 19:38:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxkaNRhiq6mFFZTODfntk_e_o4gYGOGrjDd7Ehj4R9nYQ@mail.gmail.com>
X-Gm-Features: AclHuK8riSEhzUcDf-9TQZh3Kvvf2G4Bq4PoB9O0DW_xpYQYnA8l-TCApe4f2jc
Message-ID: <CA+EHjTxkaNRhiq6mFFZTODfntk_e_o4gYGOGrjDd7Ehj4R9nYQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] KVM: arm64: selftests: Tests for protected VMs
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_113929_819887_2C77BD75 
X-CRM114-Status: GOOD (  18.07  )
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

Hi Joey,

Thanks for sharing this.

On Wed, 04 Nov 2026 14:10:45 +0000, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> For example I also added a 'pre-boot' stub, which looks like your
> pvm-entry.S:
>
>         https://gitlab.arm.com/linux-arm/linux-jg/-/commit/cd3ae35d89974b02b7051a0c45cc68b4df8f9d3e
>
> However I extracted the registers needed for the stub like this:
>
>         https://gitlab.arm.com/linux-arm/linux-jg/-/commit/f559d5b61fa1a37e2d7b23704bd367e079cf8eae
>
> This is because the current Realm branch I'm working on top of rejects
> writes to those system registers (TCR_EL1, CPACR_EL1 etc). Which is why
> I had to modify these functions, along with __aarch64_vcpu_add() and
> some others.

When EL2 boots a protected guest, it takes only PC and X0 from the
host, so pvm-entry.S reads the registers from a block that X0 points
to, rather than from X0-X7 like your stub. I think a block would work
for a realm too, since your test sets X0. The trampoline also sets
VBAR_EL1 and passes X0-X7 on to the guest code, for tests that install
exception handlers or take arguments.

The host side of pKVM accepts those register writes, so pkvm.c creates
the vCPUs with aarch64_vcpu_add() as for any VM and reads the
registers back, SP_EL1 and VBAR_EL1 included.

> I'm not sure how much there is to gain by sharing overall, but good to
> bring it up early!

Thanks again for raising it. I'd keep this series as it is for now.
When you post the realm tests, would it make sense for you to move the
trampoline and its boot-args block to neutral names and boot the realm
tests through them, with your register extraction in the same series?
Patch 2 is close to your "Allow VM types for arm64", but allows only
KVM_VM_TYPE_ARM_PROTECTED, so you'd only need to add the realm type to
that check.

Cheers,
/fuad

