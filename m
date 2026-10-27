Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEDF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T33faIqb;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CvnzYLZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+t8OXJ27yQjE3O++/rKAi/jak7lrU5zBJrJZpSfBZnw=; b=T33faIqbIP7w41MPHXOZz3j8c/
	O78Rel5oJKZ5mqOqxzwBEA6YIMLwdOHxl1uq1AlnjuG1pENbnE2PZl2uvtsuiFjlipK4cLLjYqPsb
	fPSiE8w0HyruN2kWAq9Uh72a5t4fFL2PaBByPJRgIwS8ioNRjF1Gg6TfyBxzaU3zMYA8BvS066fF3
	XxzVvHYck7Xc0Iv30wRCRDjy0g1+h5zFatavWKKfp4MaVYzFmexkdPctFEVaWfuhdSQT2a4mWKdXd
	qkES9OmAnzDpNI0Rio3GfMY1JpXYrtessLZ6F8fUiChQ6bwIrqvehjBH0UFd6z50bAfAfGECwYhce
	r2eVnH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdh9-00000004C80-3Bcm;
	Tue, 27 Oct 2026 09:42:15 +0000
Received: from out-53.mta0.migadu.com ([2001:41d0:1004:224b::35] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdh7-00000004C6B-2jWo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:42:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1vSES+s04GHXXZ3aI3e5tzkJqHQjxYx925g4IWtLlCc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793094128; v=1; x=1793698928;
 b=CvnzYLZXoUvOogeGuaysQaL1NdLHz1pTGj8bCOn3sgNP0OCYspxACEJeyRV24wIv7NV5qtYW
 oPO1oatmO4hh6F3l9knKYM4q8xhgYk4Ut6VnVeHTVNE+yKeluUNtDK0+1VDunDSBVijpVh5N73Y
 aeFy3oLL9bZXCDTmWFtMMXhE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 76c9981bcb8b866d;
	Tue, 27 Oct 2026 09:42:08 +0000
X-Mizu-Trace-ID: 76c9981bcb8b866d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6843e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:42:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgPoZCKz8eUCXjcPjK7duikI4Bz/MzR3hB0S/noKL4u9FIOspO9ZMohbyM/p/qkDotCecYxMRZ6XewxdhYixxK@lists.infradead.org
X-Gm-Message-State: AFq9FYLc/bSTySyp1Jzpv+q4Tr+o3Y5P5wyvcTq7A5T0BgdhZi2xtM/K
	3eopnLbHaibKbeBhZCn8h06OA7uVvG0BNigg4yznjVaajE0wTYBgDH3HshKb2SPq0YhphtotZPi
	KYE6KnQ3cvnTcVSFjCWQyDEexrtomRXkzsXoQ44u5
X-Received: by 2002:a05:6512:2250:b0:5bf:b27b:6371 with SMTP id
 2adb3069b0e04-5bfc6972c1fmr93556e87.10.1793094123098; Tue, 27 Oct 2026
 02:42:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027081147.498183-1-fuad.tabba@linux.dev> <20261027081147.498183-4-fuad.tabba@linux.dev>
 <86wlr3xzdb.wl-maz@kernel.org>
In-Reply-To: <86wlr3xzdb.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 27 Oct 2026 09:41:26 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwt5c2GiMZXdaEZ7cb=Op_0FQPXgrih1bN0bpqcib63vg@mail.gmail.com>
X-Gm-Features: AclHuK-5R5nG2ZiFsbhrO7zAaWYXWI133N9FKiM4gKJbvEm8i2qdS390y_nJajM
Message-ID: <CA+EHjTwt5c2GiMZXdaEZ7cb=Op_0FQPXgrih1bN0bpqcib63vg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Disable host PMU counters for protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Oculytic <oculytic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_024213_832545_916DB5D4 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, 27 Oct 2026 at 09:32, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > -     if (pmuv3_implemented(pmuver))
> > +     if (pmuv3_implemented(pmuver)) {
> >               *host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
> >                                                             read_sysreg(pmcr_el0));
> > +             host_data_set_flag(HAS_PMUV3);
>
> Honestly, I don't think we need to work out which CPUs have PMUv3 and
> which don't. I'd be perfectly happy to disable KVM on asymmetric
> systems, simply because they don't exist.

Ack. I'll drop the per-CPU flag on the respin, gate on
system_supports_pmuv3(), and refuse KVM on asymmetric systems.

/fuad

