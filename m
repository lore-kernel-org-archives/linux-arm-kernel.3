Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D2C606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDcHaAZ2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CpP+3/t6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CmVIaM3M0lQoS5Gw+xCsHIl1GWfVDNYrrM5ZXpTz810=; b=FDcHaAZ2rNzeEFYqR9HEiKgL0I
	xuOGZ35bDkxK157H+RYVE8Qu9hnp/NWSaLKEZfJGwnF5C0HnzmnpQpBsLTG0Ji6GxRgdxFbNtC/y3
	OAjYcTL3Yo3i7epflF/Q3fk1QYFggxA3IFkjUJWWjF7XgWWDute1UQnUQ58H1ZsR8dxyH6yoq280J
	EurqHFSVeOMmfBtTLW+E6ZPpLHXu5mfl8Qat6RRtnVkPOIyD2RDz04PqMVNkrPgngL/V0r2xx08Dd
	dTucCR9yKbjyl/QCgfVLcySswa6iAO+GAxgJJJDjc6ag2K5PHlZvL9wD1K2ZifQWKmtGqEPuuCJtp
	vPMuH5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJYO-0000000CNTc-1fUJ;
	Fri, 06 Nov 2026 13:00:24 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJYL-0000000CNSg-1yGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:00:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CmVIaM3M0lQoS5Gw+xCsHIl1GWfVDNYrrM5ZXpTz810=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793970019; v=1; x=1794574819;
 b=CpP+3/t68utR6hEDiZS/i6ooDqKtUlhSz7zh1/RLyui3ByMWAjFE81XcDitGRloMXri8Ue66
 mcDiR0U4pNJu0mpYwct9AkxWxq/xH51prg8RqIdyQ8sw+YCxytebbUvoqFy9daBD8aGbicrZvXC
 vV0G6AnXbbqyXWwMMGkigY48=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 023bdebe7be633fd;
	Fri, 06 Nov 2026 13:00:19 +0000
X-Mizu-Trace-ID: 023bdebe7be633fd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bff701efa5so3747e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:00:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwBTriwKScHiv/OnrBICHYeo4kX81nbwxpVjwVNojZGWFtSacJY9HxbOqYl/Tn4dmmeyQQNahlc0UWXHeYAl14O@lists.infradead.org
X-Gm-Message-State: APuU4Z8waakAIwIUfkZvLlMMzZz7ZimOOI95Hn/z6SjatnDp4mW7SS8f
	sg3WtVozuirWLtbSG0AVCQxRtXNtEcIA1NaOWVHfBBW/V9NHffh1Ypuzr7Awr4BXHzknbK+rNFQ
	zVZXpMeIqFnRape3d1M8a0hs1pXuQedhXMd5AyMlQ
X-Received: by 2002:a05:6512:2509:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5c0071b526dmr56719e87.7.1793970013173; Fri, 06 Nov 2026
 05:00:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu>
In-Reply-To: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 12:59:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
X-Gm-Features: AclHuK-w8IPMfkMD2ik_GPs_KpCTf31_7nutwDTH3Csiea4URVFMI1--f_NjCec
Message-ID: <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Order a later pinner's accesses after the hyp mapping
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_050021_986769_81B23976 
X-CRM114-Status: UNSURE (   6.31  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Could you also give a case in the message that a well-behaved host can
hit? Since 7.4, two vCPUs of one VM can pin struct kvm at the same
time from the __kvm_adjust_pc hypercall (cf533b4d3630), which then
reads it on a CPU with MTE.

Either way:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

