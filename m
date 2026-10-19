Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF7606EFD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XBvLtBeO;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pLUGfr7o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chgIyerIQUJ4MpBdj3CzM7sYFHniQ/ji6TFUETNF7sE=; b=XBvLtBeOqGE0CBXmPoeT34CVIM
	nOoAJwJU5MHpFbhgR3EqBgcdGUCt6unnuqkiFHpGhwrPWODAbcCuFtnemrQLHCrlWU5PJ1XFD9o76
	hiwFv1O9/fPGZWKBBISvd2823Nu2HwrRt31PU1PMoBOKdk80NUJ2EQIw+KH5E2UsNBKGnQUxoV0l0
	Qu4LKkeRelnTgtRS/zedFpihyPEnJ6TIMCY4aVGL7+Vu3tbR/NOLZdYPixUetpdh5rZNE5trJYVQt
	eA1kdDwIzZw66g31aIIw7tvdWSGjs1OD/q5tY6AMIVTqw3VSmTemp01I0HPFindlEuB/g2EpPj8OO
	HUdPE7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpMX-00000007rDC-3OHT;
	Mon, 19 Oct 2026 15:33:21 +0000
Received: from out-147.mta1.migadu.com ([2001:41d0:203:375::93] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpMU-00000007rCS-3yfJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:33:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1U6BfBwCfq4V3+m41gJdoq8QfWpdRN+npCvu9W+LDfU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792423996; v=1; x=1793028796;
 b=pLUGfr7oRZbX4oqLyLg7KpxyMYl3j00MH9rAR/TSgHv1DhjMP5zV/T9G+i9QDU820IK18QQ2
 UGVq2MbDvI9qIfFz0hEX00GyVEFeiGpcwo8Kep1jJ625CHR7A1Re9StRqhUUmA+4lA9brS2gTj1
 c3MOarw3I4N/7tnUX7HmOygQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7442c16b685d71e2;
	Mon, 19 Oct 2026 15:33:16 +0000
X-Mizu-Trace-ID: 7442c16b685d71e2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7334e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 08:33:12 -0700 (PDT)
X-Gm-Message-State: AFq9FYLZkT+XxEXE084/TdZq2jVTwrPQTz0HeXRPunWWMeS0f92QlR7h
	vpDkbOLjpklO6bKdB92gIOPCwBr4HdHU4QsLoqxbVYztVQyz3yIYQQSXlcENo1WsBKFVVGeEi72
	uf4VgOkLR4djCV0HdsV97wXeJsYH02D48kTSa4puu
X-Received: by 2002:a05:6512:3096:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5be51d36f63mr209729e87.12.1792423991379; Mon, 19 Oct 2026
 08:33:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019134242.1289002-1-sascha.bischoff@arm.com> <20261019134242.1289002-2-sascha.bischoff@arm.com>
In-Reply-To: <20261019134242.1289002-2-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 19 Oct 2026 16:32:34 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzqKiWr2tnV0rUiA4VVCs5a0E2XQQTdwvH0bTKZ5dxe5A@mail.gmail.com>
X-Gm-Features: AclHuK9YsVMfbpulg4gsG40qG2ygFeEoSjoGnDJEH8FVka3Piy823C8uPTVEmEs
Message-ID: <CA+EHjTzqKiWr2tnV0rUiA4VVCs5a0E2XQQTdwvH0bTKZ5dxe5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: vgic: Require matching VGIC model for
 GICv3 ITS
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_083319_271134_A95A8E22 
X-CRM114-Status: GOOD (  14.90  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Mon, 19 Oct 2026 14:42:41 +0100, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
> On a GICv5 host with legacy support, KVM registers both VGICv3 and
> VGICv5 devices. Without a model check, a VM can create a GICv3 ITS
> alongside an incompatible VGIC, regardless of creation order.

Could you add to the commit message that the new checks apply on every
host? A GICv2 VGIC and an ITS, in either order, now fail with -ENODEV,
where before both were created and the ITS was ignored.

[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
[...]
> @@ -42,10 +42,7 @@ bool vgic_has_its(struct kvm *kvm)
>  {
>          struct vgic_dist *dist = &kvm->arch.vgic;
>
> -        if (dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
> -                return false;
> -
> -        return dist->has_its;
> +        return !!dist->its_model;
>  }

I think this should check vgic_model as well, as Sashiko raised [1].
vgic_its_create() accepts an ITS when there's no in-kernel VGIC, and
the VM can then run with a userspace irqchip. On a GICv4.0 host,
kvm_vgic_flush_hwstate() then calls vgic_v4_commit() on every entry,
for a vPE that vgic_v4_init() never set up. irq_set_vcpu_affinity()
fails on irq 0 and the error is ignored, so nothing crashes, but this
patch makes that path reachable. The MSI paths Sashiko lists are fine,
since KVM_SIGNAL_MSI requires an in-kernel irqchip and irqfd an
initialised VGIC.

Something like this would keep the 0 == 0 case you pointed out for
Marc's version false:

        return dist->its_model && dist->its_model == dist->vgic_model;

Cheers,
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-177254@kernel.org/

