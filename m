Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t0RJCBq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YyQsSBoI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=txfyUbbk7S6wULCvktRyIt/cKzs3N8dY80CwO9mVhmQ=; b=0t0RJCBqRV2cvxzdwAqjtM1+Um
	JGyBaoVifndj0epJRtwBT8CnZX4BE0ZSpikCNaa+kOnpchSse/wtgA4LHFVud8vD2Z1jo759ydBUM
	JSEx0aSj7UXSezPjGJjl8e8n6zzf7ODXdk/Jhr7IKG9vHKBapOVPFWINEoAIpoNl46RcMU9YHwoAe
	Yz5cOp3rce8apby66t/ktzU67V5FacUL38/JHixl60y9+i3NJk/RpME+clurFhADOjZ/7Wp6ycrba
	k3VmQijMXzzlzKzaXwGLY75Wy4BNwYam8XTi92rnBO37ZV4pKPL/WgTgOzG46YsGUfBZxK8U8gyKP
	Ch5AwL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEyY-00000002eRX-2gcO;
	Tue, 03 Nov 2026 13:54:58 +0000
Received: from out-123.mta1.migadu.com ([95.215.58.123] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEyW-00000002eR4-1zBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:54:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ujFyUsSp/zUZUClWo2l35wPvTBRekRlNepNILaDkzbA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793714094; v=1; x=1794318894;
 b=YyQsSBoIVcrTq6eHc+sTJ+FcbWaYyzwj4hUWDN9plLWoL7+R9jc8hulOxMytBcPxJQvn1pgz
 dMGqh5jMQooTIDvZxZjs9t4iUOxmY+t60D6jmsv5eWWlbPWX6AuKVO5LA081AnXiP2BEGJtgZ4k
 on4FSh71BPYlzc/M0lcDk0YU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 979239acd86c290b;
	Tue, 03 Nov 2026 13:54:54 +0000
X-Mizu-Trace-ID: 979239acd86c290b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7445e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:54:49 -0800 (PST)
X-Gm-Message-State: APuU4Z9Fplu89LrUjb7QzxmaHJ+afILz0ZnkdNz3tZitneMOuBZp8Ekq
	cZu3UkcNWs6kEhFIbOIoPTT8M9Ok/Oz80s7nuBfzxeyoPDGOKLgeEfYq5ex6LWdBd+U+mgiMpm1
	QAC6K+HjAMza3S+fHAt9Oqek/TWfw2bNksYRQmYsF
X-Received: by 2002:a05:6512:a91:b0:5bf:b7d1:6478 with SMTP id
 2adb3069b0e04-5bff0a6d4a4mr137754e87.1.1793714088498; Tue, 03 Nov 2026
 05:54:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-9-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-9-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:54:12 +0000
X-Gmail-Original-Message-ID: <CA+EHjTz8A5FQwwFdaf6+w=hs2pEEp+HkaGrLLJnjOzV+sq+Sjg@mail.gmail.com>
X-Gm-Features: AclHuK-wIMoHSmRAGSQfIwrf9SSkWPIjCKlZxQFL7L_HnSVtO2Gkt-bZrl0MzVc
Message-ID: <CA+EHjTz8A5FQwwFdaf6+w=hs2pEEp+HkaGrLLJnjOzV+sq+Sjg@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] KVM: arm64: gic-v5: Add ITS translation cache maintenance
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_055456_675926_A906657C 
X-CRM114-Status: UNSURE (   5.95  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 19:44:46 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
[...]
> +static int its_cache_add_translation(struct kvm *kvm, struct vgic_v5_its *its,
[...]
> +        old = xa_store(&its->translation_cache, key, entry,
> +                       GFP_KERNEL_ACCOUNT);

nit: fits on one line.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!
/fuad

