Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38C0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kWO9PN1L;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uIJXJq8f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mKi3O//OzPap2qJSKCtACJ6xNlL1ssTyPNh7bncYyUk=; b=kWO9PN1L5d9mjxsXv50jgaOze1
	WSRiFp42Hi6xo84IMNobHdm0l9eej6knfQl6DONOH6vcigZhMxUGk6VOokM8owkWbEk3eTwlECTUH
	vsakLbafJxwtyQ91u48Kp+4iCDpYdtF0vtpY5U7jEgE2Uieuj3FuD2pz3C1WuaI21HukCkPL+glH1
	a88yApa8Qru7dmx8nxocJgNbUEuDIGYZvZrSq8YkbnccG6gnNtS8aAqff492Z/q8I0/vHjCRR4XKs
	diTwG0BXjLQ420Up5keyZcjgL7YFQ7my1lXNcIhUvmcLVxwtyKqlXrDRJl2o3i0w5ywYziRVbQLU5
	kFdLa1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGTJ-00000002yO4-38AR;
	Tue, 03 Nov 2026 15:30:49 +0000
Received: from out-223.mta0.migadu.com ([2001:41d0:1004:224b::df] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGTG-00000002yN6-1mwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:30:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2XHYumNn2qzjFjAML4bIuMLwua0bYDCp7CLVmp4P2a4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793719844; v=1; x=1794324644;
 b=uIJXJq8fVmmQ4oDVObtzRCW2SQoIZWsiXBwcIcHqmqQzspye5JdpQnJaWJtdGIfHGqt9Q/4O
 Uge7+BYwL/+GRlApNrW8sjDm9ksMGe4ozceYcgy04h1KaslO1GsKNUIGhDsySyndrs4UAlKwQ2B
 O0DtBGUmYfcRFZJfa+aPKE0g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 07c103eafd6d44c5;
	Tue, 03 Nov 2026 15:30:36 +0000
X-Mizu-Trace-ID: 07c103eafd6d44c5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6277e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 07:30:31 -0800 (PST)
X-Gm-Message-State: APuU4Z+haLmhhmVZK9aZeoKZfSjtsQQTwFG0B2MTEASiL4jAlUz5fiGw
	TsguVGIiwvcKGoa2M0SVJAT7x6Ip7v2GX8NaXsLOCVlv+yLVpfTGZufBEhMmZitW16kVdCpcjUM
	es+XJ9GLsPm0BR7BdOt+NLEMpkjpRrF1I0ayRWm7m
X-Received: by 2002:a05:6512:104b:b0:5bf:c2cc:a8f4 with SMTP id
 2adb3069b0e04-5bff0b1468emr151055e87.6.1793719829566; Tue, 03 Nov 2026
 07:30:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-14-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-14-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 15:29:53 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw9n9vny=xG3RU33_3XP-UisKHwgrHaz1SmCV_i=B=uuQ@mail.gmail.com>
X-Gm-Features: AclHuK_CbE3T3Cke74gwoLWvxyXr7v0yWEbhu6tfs8tvoXymXeXiqoWMI-TF6nY
Message-ID: <CA+EHjTw9n9vny=xG3RU33_3XP-UisKHwgrHaz1SmCV_i=B=uuQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] KVM: arm64: gic-v5: Implement irq forwarding
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_073046_667209_BBD47EC1 
X-CRM114-Status: GOOD (  11.77  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 19:44:51 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
[...]
> @@ -1152,7 +1154,13 @@ bool vgic_supports_direct_msis(struct kvm *kvm)
>          if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
>                  return false;
>
> -        return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
> +        if (kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm))
> +                return true;
> +        if (kvm_vgic_global_state.type == VGIC_V5 && vgic_has_its(kvm) &&
> +            dist->vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5)
> +                return true;

No GICv5 VM gets here, since every caller diverts v5 first. Could this
hunk, and patch 12, go? (Sashiko [1])

[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
[...]
> +int kvm_vgic_v5_set_forwarding(struct kvm *kvm, int virq,
> +                               struct kvm_kernel_irq_routing_entry *irq_entry)
[...]
> +        ret = gicv5_its_enable_direct_injection(virq, vgic_v5_vm_id(kvm),
> +                                                vgic_v5_get_hwirq_id(irq->intid));

Before init this writes VM ID 0xffff into the ITTE. See my reply to patch 10.

[...]
> +                /* Keep the host IRQ association so a later unforward can retry. */
> +                ret = 0;

If the retry never succeeds, teardown still frees the VM ID while the
ITS may hold the cached ITTE. Could it keep the ID, as it does when
its own teardown fails? Only misbehaving hardware gets here (also
Sashiko).

[...]
> +                } else {
> +                        ret = -EBUSY;
> +                }

This is unreachable, as is the WARN_ON_ONCE() below (the only caller
holds irqbypass's mutex, and irq->hw was checked above). Could both
go?

Thanks!
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-194187@kernel.org/

