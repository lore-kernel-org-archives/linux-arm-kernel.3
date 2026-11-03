Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBABE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=seRNqJdS;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KNalMyhN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tyERGr5hdOOoKX6h8lJLvesFYUWczrxWlktN3GBL91w=; b=seRNqJdSlr4rYkE0OyvTLWC8Bw
	X7lb2RSokopV6WXENiMqnJaOxekZ9fMyhXkIm/mbOFdc5Fm8I3JsTm4hXj9kx6rGc8T1WT32RfG/b
	DaZJGwmc/ZdtPW2gRV2oFAPWD6KihH1pD0Qh6M03h/MbkMMOZpM0VnVPwRox/mAyd6F48iTqcbWwX
	uFdv5i+uK0T1bNl4j2xoJkpiMaeoUw/Pq8YOsfd0n86IWO+z7ygATACH32fyX+FwS4aR54aGnN2Ke
	NZ2BuwnPkSgXY0uyaz0IP22OcPgkVo845V92Bk4eHpjnGIgv00IbUrSrVTbfUxuMpZUpIlRmR0XLK
	egSOvMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF0y-00000002f02-2yVm;
	Tue, 03 Nov 2026 13:57:28 +0000
Received: from out-21.mta1.migadu.com ([95.215.58.21] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF0q-00000002exI-3po3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:57:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=G9LToFbCiWp9wS1VO1jBKDgeZl6HQaIVAnBp5WasFrg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793714238; v=1; x=1794319038;
 b=KNalMyhNtZ0dVj0JJx1rQdz6pdbCalAr1+Xj1B+OcTgd81ugL7kEJdTSuDTbCZ3QtxG2/jZH
 5vIOhRJlA9Y/NyFbZcct5/Ht63+0rVPd483KkwFMDA8Huy5MhPWBIPiubEIVpwNAG1kK/9PSROC
 HH1M/cx7qaJdW/KRgCEclWno=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id acc0efc4ebd6b7f7;
	Tue, 03 Nov 2026 13:57:18 +0000
X-Mizu-Trace-ID: acc0efc4ebd6b7f7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7472e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:57:17 -0800 (PST)
X-Gm-Message-State: APuU4Z8fE48r015fhR6LkVCZsd6QFXvRZk+Iwcbn+BB3PTRxaI8s/vrX
	ImAaXtfkuHQML6Yz4vNeMGu8Bpz+Lis0R9sE3fMS0d6pQegEH2sM9374B9FkQYXZ+4y8GyuMSui
	3zeKhJbxC/xloj562+9eVLZq7ZK5HbRMh41L0q5Iw
X-Received: by 2002:a05:6512:1087:b0:5bf:c0d0:8fff with SMTP id
 2adb3069b0e04-5bff0efda80mr92373e87.11.1793714236905; Tue, 03 Nov 2026
 05:57:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-10-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-10-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:56:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzCH=8RwJ=5FXB=Hw7_qWYmYN9qZPFzFs3ShEcVjiBXjg@mail.gmail.com>
X-Gm-Features: AclHuK-svprfnHONOILI0GBqj01szuLcNL1Pgm3q7EqTgPF9NwQczUK83_h49Hw
Message-ID: <CA+EHjTzCH=8RwJ=5FXB=Hw7_qWYmYN9qZPFzFs3ShEcVjiBXjg@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] KVM: arm64: gic-v5: Add ITS MSI injection
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_055723_600607_3AC083B1 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 19:44:47 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
[...]
> +int vgic_v5_its_inject_cached_translation(struct kvm *kvm, struct kvm_msi *msi)
> +{
[...]
> +        if (!READ_ONCE(its->enabled))
> +                return -EWOULDBLOCK;

Should the plain stores to its->enabled should be WRITE_ONCE() to pair
with this?

Thanks!
/fuad

