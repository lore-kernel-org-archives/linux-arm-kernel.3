Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHCOdPzK;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GVB4NyXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SU/p59HmrY1l63uWO1J6fBGj9iSaP1sfb4BVk3OH0dM=; b=EHCOdPzKvcgT59bWN1etP5hVeG
	vU+txIkml4fkV6Thv+UG7qe74qHXTggkgjh6MG8GC41xSCicUY9x8tK+GO+GZOOnFBu8hv06oz6Jo
	5oglnUZGRp4xkXjNw5bHnlo0ozHLkHUJxoC0QwzVhx6w/o7Q9a+XnWzTesEQQvPW3h1E6aJIb5D7M
	1ulyEzDfu32iVf4rhqDR4As6sKxCIhkL/O7vjVcCvlLgrhAJJRAoHN13WeBWY+JBUYFUCiXc+N/Az
	RSrzo/xSXT/WVYqtBAh6k4u4qxXoj0h2uAwE9+F68aI9+aR/6JsyESithBU0gwkWpLOjVC2dS7D+X
	bWP7pi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFmf-00000001vYx-2vj7;
	Mon, 26 Oct 2026 08:10:21 +0000
Received: from out-98.mta0.migadu.com ([2001:41d0:1004:224b::62] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFmc-00000001vYO-3zpr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:10:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SU/p59HmrY1l63uWO1J6fBGj9iSaP1sfb4BVk3OH0dM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793002213; v=1; x=1793607013;
 b=GVB4NyXlnFX9OJ6PHFkTR1Kh6n2gJq/JcPdWFE358T+Faq3/DgQFNcv0V7BAEl0OnG15RPuT
 tqUIzGkn/TnunME3ZDBYu+ogaz5B1Uy+OYmv0j1uaq0VTwFFjyXEDYIwOvi7MNEU5pI5ML1Fo6A
 ZShr+KFJijmWM2v159W+g2uM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8e4ea8107c634eaf;
	Mon, 26 Oct 2026 08:10:13 +0000
X-Mizu-Trace-ID: 8e4ea8107c634eaf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8556e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:10:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzilqcjoadC2BQpyvlFcm7gE7DqARTKe0uhFA0EO4oIQOXW/ryY0YfLM9s94E/COhXuGixcP/aEOAER1QfEHrDs@lists.infradead.org
X-Gm-Message-State: AFq9FYIFSxFWNKVZqAtuUWjqlOKUbye6vsyKjfDKkUOU4fA9bP9OBpe4
	wUbg04agXD8SbyLyEaCrPXbGBXFys+pZsKV+ttglmQCS96Sf33EoeUgY/f/nTq2yAeoLQ68y3y4
	OvwpgA5IKpaENNdkNI8GdANQCQZA0VKK4xjYdhovV
X-Received: by 2002:a05:6512:3f03:b0:5bf:a28a:f2d9 with SMTP id
 2adb3069b0e04-5bfb79dafd3mr111700e87.4.1793002210084; Mon, 26 Oct 2026
 01:10:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026012128.2270251-1-sashal@kernel.org>
In-Reply-To: <20261026012128.2270251-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 08:09:33 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzF5PsNt+riasW-SK-nhkLYh3kojMFyCEqs372-Mficnw@mail.gmail.com>
X-Gm-Features: AclHuK9ieRbKRZ3vlLRpK7x9lOVSGw-njZY_CzO5qLbrpHOtyOHbR5m8v7LhEMQ
Message-ID: <CA+EHjTzF5PsNt+riasW-SK-nhkLYh3kojMFyCEqs372-Mficnw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: selftests: Skip unwritable ID fields in
 the failed-run test
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_011019_151542_6DF55947 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Hi Sasha,

On Mon, 26 Oct 2026 01:21:28 +0000, Sasha Levin <sashal@kernel.org> wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every field of every register in test_regs.
[...]

I tested v2 on the FVP AEM model configured with no AArch32 at any EL
and with PMUv3, under nVHE: set_id_regs fails on ID_DFR0_EL1_PerfMon
without this patch and passes with it. It also passes on QEMU (which
supports AArch32 at EL0) under VHE, nVHE and pKVM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

