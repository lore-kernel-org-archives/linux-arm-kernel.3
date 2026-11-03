Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE8606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3LFzTT/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sgCBJy+8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FH5m2ZfhAKsc7ESTr6aXIlmL3H0K88jNbIy7JznNN8U=; b=x3LFzTT/PcPJ62mubpq5qJoJ3j
	0KOYZPGjinpstkqLbshINwPd49GX+uuPKomd0bZ9A5oRipdrNwBCrR2jPAvmBs77Y65kT+DFXNWgZ
	HRs0NTa2B5r4QNjPBz4qmjHz4weN1cEysLCo0R1mdXVspuBZvMcFQq2PVSoYR396XdzSFk1shwOyr
	/MJ3oWXqf0WyYrPhD/CUC2ZJ2zSo9Vwk+ZL0jy59lb5PdowWAzz7j9HyRC1N0kUYbIQDt/5tID1BB
	CQVODCZSXxBt3EB3siGkywAgqotwFAoe5zAaX7Jrv9FN7HygPw0CefCdPsXrEPuOUpEYLK2b+eTIL
	FngyeKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFQ6-00000002i13-0qsk;
	Tue, 03 Nov 2026 14:23:26 +0000
Received: from out-213.mta1.migadu.com ([95.215.58.213] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFQ2-00000002hzK-2Lfk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:23:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=j/giMBDl/7wt+voQgZBnLNS9pFqFZnvjPU0eYzrRGeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793715798; v=1; x=1794320598;
 b=sgCBJy+8bXqqb/95uGDHNFFKR2n50vK18wH4QICOLU8A7bioNe7iDtH7M5o4evcQvj56wwqZ
 ssdzcfqn0gTemu82FTLMhet73kCPcIScywIzEaFPhw5BfXhyXvVlrYKeUs+QA8LlfoBPy6/34n2
 4FJSAAiDVRVKzYQnxnQfZrSI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9e760a0a43d2776e;
	Tue, 03 Nov 2026 14:23:18 +0000
X-Mizu-Trace-ID: 9e760a0a43d2776e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7046e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:23:13 -0800 (PST)
X-Gm-Message-State: APuU4Z/XMiXLVHU3xSEP8iio7NhZItJeZ8mbLtid+QHaHj9vNwNCJfxP
	Azg/UKCOLfmkvwccfvcAV5ldLPz+Ef+5L3eIiVfnw5TT3V3Qn+Q5vYTUWrE4KQ/oJRlHzaZmg+1
	2hr5w6k/v/3H12z7qerbFijogqrEPfTJz0mngONNa
X-Received: by 2002:a05:6512:3c8e:b0:5bf:c17c:93a0 with SMTP id
 2adb3069b0e04-5bff0579302mr159986e87.14.1793715792546; Tue, 03 Nov 2026
 06:23:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-11-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-11-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 14:22:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyX4RO2zDEhuJAu_iu8BsXkNvFBAh2i01fy0Mf=QQ+Tjw@mail.gmail.com>
X-Gm-Features: AclHuK_IkcYbSwt6PamGBhm58rJBGW9RD9jT6VqmMt5IUNnlWXOrPHQFDe_cukI
Message-ID: <CA+EHjTyX4RO2zDEhuJAu_iu8BsXkNvFBAh2i01fy0Mf=QQ+Tjw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] KVM: arm64: gic-v5: Add ITS userspace register access
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_062322_771563_9BDC8798 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, 02 Nov 2026 19:44:48 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
[...]
> +static int vgic_v5_its_attr_regs_access(struct kvm_device *dev,
> +                                        struct kvm_device_attr *attr,
> +                                        u64 *reg, bool is_write)
> +{
[...]
> +        if (IS_VGIC_ADDR_UNDEF(its->vgic_v5_its_base)) {
> +                ret = -ENXIO;
> +                goto out;
> +        }

This lets userspace set CR0.ITSEN before the vgic is initialised,
while the VM ID is still VGIC_V5_VM_ID_INVAL. An MSI (KVM_SIGNAL_MSI
or an irqfd) then reaches EL2 with VM ID 0xffff, and forwarding writes
the same into the ITTE. With 16 VM ID bits and every lower ID in use,
that lands in another VM. Could enabling the ITS be rejected until the
vgic is initialised? The existing its->enabled checks then cover
injection and forwarding. (Sashiko raised this on patch 7 [1])

Thanks!
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-194102@kernel.org/

