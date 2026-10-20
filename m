Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79782606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+fulB6D;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eXKLZ2CE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm6uQFMUOlEK8EAN2+0e2HbI3MSSUoFOndOtynycXe4=; b=X+fulB6DBQTIKXZZfiypj/0EGX
	RYXflUjUl2fKgtWYtUE9F2Q6/5SnqtALTnP2n8KhKxGI+fTdvjPFa1gGUOW+WphWeyLCbW53OdDNr
	qwOJnE3FcqCG3iz1SmePNNKD6DX6UjkTss/l80vGkhG7OlGeNRdrm5N6Qy3dctHxBX829x5795qIJ
	HV5nEKjleLZn+4uzWMlOXgzoe3vftL3U0M/2SlIXwmwO6ZnPTWifgepW3EFqoQRO6dlOUTiPrHlvE
	yS2U6/D7srZv/BnWAgrtHnPqho+Ulf93dnuz3uoEr6VAhB/uy/FZI7io9aycLkOty3Im4ZQmAvg0U
	rVdpDwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9oU-00000009man-1l3O;
	Tue, 20 Oct 2026 13:23:34 +0000
Received: from out-37.mta0.migadu.com ([2001:41d0:1004:224b::25] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9oR-00000009ma4-3XRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:23:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vm6uQFMUOlEK8EAN2+0e2HbI3MSSUoFOndOtynycXe4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792502609; v=1; x=1793107409;
 b=eXKLZ2CEsRs3cc8t/0JN+EqorP7f2s5GnSPn0qVrFR5E/YtNuz0eLndpRFgvebuRJ2bMgl89
 /Cvy2FUcXxY8yIJxdjQpOI468i+CzMEkGomyQapM2hgsT6WaXtWnUvghhiJdc6Gsi2atpRhlhfu
 5EFdthVLtiqTV7OGwjmBR67U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3c3d86844bb10ef2;
	Tue, 20 Oct 2026 13:23:29 +0000
X-Mizu-Trace-ID: 3c3d86844bb10ef2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6912e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0X5tVuF6lfh5RZlHfMOlWdl6x3WQL87XawYhJ9mrBxVlEzsHLTpaxRVkmpFhBREJX3x7jKdeHemFnqbqbrxuM@lists.infradead.org
X-Gm-Message-State: AFq9FYJRU6yLT57RjuEwTDfIvyAbaoF4z8/t5ehLmK+Ui+go/MEtbkEx
	pgKiKpew12RnNyzNjBwElFwRHkoCPY6+pKjoXJaaR7ytENLjpAXUmd0AviddL2Qi/Y/Oh+YVuil
	Kjqw5tsXB+/IAIw61RV+GpYg7/OqbnRdHiZvU2xF+
X-Received: by 2002:a05:6512:10ca:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5be66f2d62fmr149788e87.12.1792502608409; Tue, 20 Oct 2026
 06:23:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-2-fuad.tabba@linux.dev> <atdUzfOA1Obd7Mir@gremlin>
 <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com> <atdoknSMviv1xdqd@gremlin>
In-Reply-To: <atdoknSMviv1xdqd@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:22:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwBydjpMR+jheWzFBy6X+jXxvXF5vygfToHaTYh6XEcyQ@mail.gmail.com>
X-Gm-Features: AclHuK-B0w4gvRBhE874iuCL5xWD4kCqXtNGNKe6lqJ9UqbH-GMhLoiaQjnhj4c
Message-ID: <CA+EHjTwBydjpMR+jheWzFBy6X+jXxvXF5vygfToHaTYh6XEcyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Price <steven.price@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062332_043618_B6DAF29B 
X-CRM114-Status: GOOD (  10.17  )
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

On Tue, 20 Oct 2026 at 14:16, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
[...]
> > I'd keep it: it's why the whole folio has to be cleared, as the flags
> > on the head page cover every page in it.
> OK, but there's an inconsistency between the comments in 1/3 and 2/3 (you update
> one in 2/3 to reflect what's happening), so maybe worth having the comment from
> 2/3 on both, rather than this one?

Sure, I'll use 2/3's wording in 1/3 for v2.

Thanks!
/fuad

