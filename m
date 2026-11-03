Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A76B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bBvIUdbB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xy89gbtl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZQzTNVyYYgBE97T4osUhW5EzJ8IbgXAyi0t0S4s5/Jg=; b=bBvIUdbBMPGwglpeQjJcTFOZo1
	97Wv5a+5Fg5UMyxBwYzx3SyycPba5oBtUZxSjD0A9i34OfsOo0ATIz+MmszcNcIISRha6hXBwbV6W
	+mg6aUA2TfmcjLK9JkxIA1mvBMOm/tNlAeDMoUU/OZhiOE8+oC7zvPMTbnrIGD6p40/rFLu91bxmb
	M+mBmM9R4Kt8d06Bt52AATa3HY1RkdADxgvAXbHNRbpJWkOgi74Qriur/Sc881q1JfCa8rpAtN7Pn
	MFQyeF6YTLizxLSXc2phTUwzbinXhgEmqnd1k4/7QmRzsiEb46F42JOHx7tNRMr688zIVax++grwr
	zBdspV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEoP-00000002btl-29mz;
	Tue, 03 Nov 2026 13:44:29 +0000
Received: from out-84.mta1.migadu.com ([95.215.58.84] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEoJ-00000002bkv-0Hgb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:44:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZQzTNVyYYgBE97T4osUhW5EzJ8IbgXAyi0t0S4s5/Jg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793713461; v=1; x=1794318261;
 b=Xy89gbtlqZaFqC7BENAk9ZX/zwZFSRGU5sN8hZcsXtvOXR1iAMngrog+lWECHbJu4iU1OlkM
 l1/8fV6mtGCqL4i2GlQC/lzaBoWjo7hfV3ajGfWCgSvauu6/syDrzZuDCCPXftJuEDzTQr+Vi9e
 FZXi7JsVkbFbdle8jVMHWKA0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5e2b9302697654a0;
	Tue, 03 Nov 2026 13:44:20 +0000
X-Mizu-Trace-ID: 5e2b9302697654a0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7332e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:44:16 -0800 (PST)
X-Gm-Message-State: APuU4Z+roNfS7KnfaZ6tVuSGxVcS3IQJsOFdtQLJ/UoGIlfcWPoPVUzo
	x1+Xi3YEUuGXPzvytAqZFMw26TtlWG3pxPApE2MhCwW3+sw7WgNGSoJUsK8CxLj/r0FNLqrASbb
	VXYWvJzAmXQl+E7JHyAS1hj9ETLMGeC/nf9Pjsx3G
X-Received: by 2002:a05:6512:b1e:b0:5bf:a191:c132 with SMTP id
 2adb3069b0e04-5bff0a75e51mr126673e87.2.1793713455901; Tue, 03 Nov 2026
 05:44:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-4-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-4-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:43:39 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzGVtvJ76kwU=qVZc9vVvXoVBy88rdU0idHZaCQMa5-MQ@mail.gmail.com>
X-Gm-Features: AclHuK8Yjeg-Kg3bL_DBiJyv5rYXjdrrn_KkW91Lom2D_wZWZ3GsGIHAcTdrDdc
Message-ID: <CA+EHjTzGVtvJ76kwU=qVZc9vVvXoVBy88rdU0idHZaCQMa5-MQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] KVM: arm64: gic-v5: Share CoreSight ID register emulation
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054423_291322_F11CC465 
X-CRM114-Status: UNSURE (   7.10  )
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

On Mon, 02 Nov 2026 19:44:41 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> This keeps the IRS behaviour unchanged while giving the ITS MMIO
> emulation a helper it can reuse when it is added in the following commit.

nit: the ITS emulation that uses it arrives in patch 6.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!
/fuad

