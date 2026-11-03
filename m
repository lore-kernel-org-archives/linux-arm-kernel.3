Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E46606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9iCMTZW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aMro9Ewh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vj7nnf3+hX6pDD4kkVdX7ATUkAs5lwT8YtIid3wScRU=; b=q9iCMTZWS4nssSTEhN/gB7vrVU
	VE6pqrvK0gvGuoP2neENX1DbQMc1M/JMN5e0NxOqn9p4VP6wE9Uw8Hi14+L052gLcTIGsh8KcfVzJ
	eZhTYp6LdNGgWz+8VNvyMzPGDJ2YRt1D+i8n/UtYbaI9kh5eBaT3B3Mll1zZ8gHAQqEZ6bBrC8TGR
	nYj0sQg/Cyjq0vrHWawH0V9xODDxxlcGgqoyrewhc/1MBspFRwcdXPyYLk2PEpCTrn3E/7D9nTIRf
	xlKfMCyiDlZMb7bvUSo6LV8K+AM6IzuO+CrT023vnfQFoBwQphStMZYjy4ufVWcvJ/49ixZFMfCxN
	3S+dwEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEtH-00000002dZC-01t6;
	Tue, 03 Nov 2026 13:49:31 +0000
Received: from out-61.mta0.migadu.com ([2001:41d0:1004:224b::3d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEtD-00000002dYe-13pL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:49:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=lJFSAvh/s8cWO+ylQ8b65jdqU55xiRLoOy5tUADRJVg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793713765; v=1; x=1794318565;
 b=aMro9EwhcGJBQiEb2elhIFTVh43HOu5vVi0b3nGmKX/DXV2k7NvIkwum0LkfPgnaEtDfMN39
 mtJvDnL8sXKknijCK9i6wZ2/2eXU7lWzdLX8I2lXRJG1mZcIlmomibERUwU5HUpaMTSwfhLHTR5
 L+SO7iN5VIi59pf8AL0vQK+Q=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 24027180f14b83f5;
	Tue, 03 Nov 2026 13:49:25 +0000
X-Mizu-Trace-ID: 24027180f14b83f5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so5003e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:49:20 -0800 (PST)
X-Gm-Message-State: APuU4Z9ZKk7UOSM57OFwq1nL4UMApruhj0Hq5di6myq9y9AFeCJKqgel
	Zedmdld5EdHUrLrSiedf6MxDBQ60AyZUHi3OfV9rL3LRVS1CTugBs5iIOf9VrVccLhvicI17yLJ
	rGpUm7v34V4w+dWMV27ZHe3OhFxqNfl31gAf8662X
X-Received: by 2002:a05:6512:4013:b0:5be:b32e:c309 with SMTP id
 2adb3069b0e04-5bff0f075b2mr105344e87.13.1793713759125; Tue, 03 Nov 2026
 05:49:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-7-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-7-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:48:42 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwWFobMXrVcm2iFhWXoWfudk6dGL8ed5mCs7u9LTsTpKQ@mail.gmail.com>
X-Gm-Features: AclHuK9t40SuunANo3L6wQKi_X9nYoI88mdBFeXlfd2RawDyjQ21UrVXIFQXO9Y
Message-ID: <CA+EHjTwWFobMXrVcm2iFhWXoWfudk6dGL8ed5mCs7u9LTsTpKQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] KVM: arm64: gic-v5: Add ITS MMIO state emulation
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054927_455754_531F3DFF 
X-CRM114-Status: UNSURE (   7.50  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 19:44:44 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
[...]
> +static void vgic_v5_its_reset(struct vgic_v5_its *its)
> +{
[...]
> +        its->idr1.dt_levels = 1;
> +        its->idr1.itt_levels = 1;
> +        its->idr1.l2sz = 0;

L2SZ 0 is reserved in the spec when either LEVELS bit is set. Could
this advertise 0b111, as the spec recommends? (Sashiko [1])

Thanks!
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-194056@kernel.org/

