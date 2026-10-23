Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559FD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Icpuo2Wr;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HUJ+ki0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JwF30sKeSWshZnOg+Mo+E0Jy9f5TcKQZda9OIaG5oAU=; b=Icpuo2WrFVVMWGuBS6p7T3oYWc
	BjY28sfIvaZ8hLemFaG9EAupXoha4Y0u2qznGTK7Zlpm/JQ/7BaflV2kwi0BebZG6cKTOUncTkZzX
	eK5fKu2JiTa3i5HI+Md8XUPIhJWVtUld1rlZdjlQhbDHkupV26OM9uYoTuk2BxOhznLdw2HupL0AS
	1fMS6c0dAuNsAoZCEnR3eLGmEuqLW+zLhGgJLFnF0viANFtupZYcL19M77vQn7GfnxWL0NheOHnhX
	Occ3JI8rwXybS3z6gW8C/0Y5QT/2g8wWXC9q95kA/Bob0vKHXn1dnEym9g+X4y4TKr6qAzi8PkFhW
	V21sV4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHzu-0000000GeO8-3PY1;
	Fri, 23 Oct 2026 16:20:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHzs-0000000GeMt-00UD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 16:20:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CC641BA8;
	Fri, 23 Oct 2026 09:19:54 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C44E53F673;
	Fri, 23 Oct 2026 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792772397; bh=JwF30sKeSWshZnOg+Mo+E0Jy9f5TcKQZda9OIaG5oAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUJ+ki0y1DGTe3OAQuJWJM7Be/JlxrwSwrDWEo/lnY3LUCkHXwU9DunS8JugvmJoz
	 H4r/fxAPAo2G96uuXVflHOBIxQUoDQUzqG51ln/bag0OUtY1Dxb7ti0Gr5uqaZGPKw
	 gZZYuWN4fhw/qodXgpUlRnlxCVK/ufzytY45s0jM=
Date: Fri, 23 Oct 2026 17:19:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Johnny.Fan" <johnny.fan@cixtech.com>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org, maz@kernel.org,
	jeremy.linton@arm.com, cix-kernel-upstream@cixtech.com,
	bob.zhang@cixtech.com, jie.fu@cixtech.com,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v2] perf: arm_spe: Support heterogeneous ACPI systems
Message-ID: <20261023161954.GL26205@e132581.arm.com>
References: <20261021020322.3015121-1-johnny.fan@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021020322.3015121-1-johnny.fan@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_092000_116927_01C409E2 
X-CRM114-Status: GOOD (  11.20  )
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

On Wed, Oct 21, 2026 at 10:03:22AM +0800, Johnny.Fan wrote:

> These synthetic devices have no fwnode, so the firmware-described
> IRQ affinity cannot tell which CPUs implement the feature. Pass the
> CPU mask as platform data and have the drivers prefer it over the
> IRQ affinity when present.

Could the MADT-derived CPU masks be exposed through
platform_get_irq_affinity(), so SPE and TRBE can continue using the
common interface without fetching ACPI-specific data?

TBC, I don't know ACPI or GIC. I just thought it might be a neat
approach.

> Apply the same treatment to TRBE, which shares this registration
> code. TRBE must also pass a stable copy of the mask to
> request_percpu_irq_affinity(), since supported_cpus is pruned as
> CPUs are probed.

I wouldn't expect any changes to the SPE or TRBE drivers if
platform_get_irq_affinity() can return the correct CPU mask.

Thanks,
Leo

