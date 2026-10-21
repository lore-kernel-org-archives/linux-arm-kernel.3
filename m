Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+mhvc2j;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=da4vocG3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yp/fM0ro6tHmyo8E9yuKsYQD4EKEIrb4BvBf4JN4ow=; b=m+mhvc2jbA/cGcxaPjbyVsKVe0
	N37NK0sHNj0bB53unTJOiaKGuMsuC8HeWVWnOvNYbaJfDJvySblCd4ZJNEefk2bMY2ZeWyPydeHok
	EiSFds7IkjlCsHgfKqtNZiVUWwzhOwtrFn6v0U94dS8m2vRvqFanhrtGK8LkYJKVrct1AXIzoaD1f
	2PUN5vmfoZ8Fh+34jxwu+816D4A6NZjNfCXL9WUguIcmwYgoH6LkNmnrT6DkwFxbM5li5UI2m5BcJ
	2j10MzzPtF/B0FZ6FxGJGPJ68cPRHk92MH1ziTLaX1k2YW/CR3PYBAHAoTenhLp2lkAGkEMsydChJ
	5qGWbl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ7V-0000000BCXx-1nML;
	Wed, 21 Oct 2026 06:48:17 +0000
Received: from out-136.mta1.migadu.com ([2001:41d0:203:375::88] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ7S-0000000BCWd-3Bli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:48:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9yp/fM0ro6tHmyo8E9yuKsYQD4EKEIrb4BvBf4JN4ow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792565291; v=1; x=1793170091;
 b=da4vocG3NysPY8mYu9ao5ZobzszHgd7V4ic6f/1PUsP0FsNQ5H58UpJe7JZLO3gF3xUzCGT0
 OKU8ZN9vFnfIDsU2jqJ8N293mpwYPkjSrADxHjHLNc9KA8eNPpz1Jlhu63gW9jv+vWNp1osIkHG
 RYaXsmTasDVFB8wY+0YoWm28=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id edcd8538bd79f99b;
	Wed, 21 Oct 2026 06:48:10 +0000
X-Mizu-Trace-ID: edcd8538bd79f99b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be58ad9600so5563e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 23:48:10 -0700 (PDT)
X-Gm-Message-State: AFq9FYKcR6losp9e0I2oucP1tAMX+Aj3yp5Ov8I8XpDb3BpE+I0RAhJc
	WCneVIeUnmPIKsc02WOrG8eRBaRCECqdPDpqMP30yOD6q4XEQtNRK62xBxag+6x5SxnE9PLwpf6
	4ki8eqHlQJeuZz+wwoM2sQyrL35WfL6KFIqXQptGQ
X-Received: by 2002:ac2:568d:0:b0:5bf:a37d:dd53 with SMTP id
 2adb3069b0e04-5bfa37dde95mr9658e87.10.1792565289649; Tue, 20 Oct 2026
 23:48:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020163923.1407856-1-sascha.bischoff@arm.com> <20261020163923.1407856-2-sascha.bischoff@arm.com>
In-Reply-To: <20261020163923.1407856-2-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 21 Oct 2026 07:47:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw_k-v7jB0NA2knArR1wtefZWkhVRgm9T4E=Co6sytEiA@mail.gmail.com>
X-Gm-Features: AclHuK9qbfaij78T_z4eQI7pVHIrgMA1rYSiJ8XdhcOIOhDcFbexzAqkSNQZiz0
Message-ID: <CA+EHjTw_k-v7jB0NA2knArR1wtefZWkhVRgm9T4E=Co6sytEiA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] KVM: arm64: vgic: Require matching VGIC and ITS models
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_234815_013516_D4646EC4 
X-CRM114-Status: GOOD (  15.20  )
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

On Tue, 20 Oct 2026 at 17:39, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
>
> On a GICv5 host with legacy support, KVM registers both VGICv3 and
> VGICv5 devices. Without a model check, a VM can create a GICv3 ITS
> alongside an incompatible VGIC, regardless of creation order.
>
> The same problem exists for GICv2 on hosts that support a GICv3 ITS.
> KVM used to allow userspace to create both devices in either order,
> then ignored the ITS.
>
> Record the VGIC model required by an ITS. Reject an ITS if the VM
> already has an incompatible VGIC, and reject a VGIC if an existing
> ITS requires a different model. These checks apply on every host:
> a GICv2 VGIC and a GICv3 ITS now fail with -ENODEV in either order.
> Allow either creation order when the models match.
>
> Have vgic_has_its() require matching VGIC and ITS models, and drop
> the separate has_its flag.
>
> As part of this change, swap the type of vgic_model from u32 to enum
> kvm_device_type. This requires updating the switch cases in
> kvm_vgic_vcpu_init() and kvm_vgic_dist_destroy() to include default
> cases, which we mark as unreachable().
>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

