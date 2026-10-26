Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3CF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWnzKZ7/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BOaLcSNb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o2NPZbWA6+uMRn4xr5m7DWDGwtChXRj3f2KhhtG1Hlk=; b=wWnzKZ7/k+zSKyL7pRBkytvUfm
	hr6RlKX9pY53p6eZAs6IcPmE4KkwGNzAlPUGr9aOVCEXKIukhvVWdrm3RnPgHGUTzGLVWidAIUitg
	Od3gK1lXUKbl5AraJXA59i35oIojQtC/WKuhRJSBMIq9oZ4Mc6E4LYPGJZZkEnnccWAO3pyr373bU
	gDcXhVcqfdvQLOlUfsFwlI+cN9Xxb+DttZB4hS0k8DrMiQn5Nc3JEXyEFy0K3BWUrBs4m/Patyous
	TLUPRwBzFCZrvUM2JFBQHR1YZWvg211wzXn7d/ibOGydu4gZ1cfnvT01zD/cwtkBVJ2CX4XcYW9l+
	qEIYBPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLMK-00000002fCN-1OLk;
	Mon, 26 Oct 2026 14:07:32 +0000
Received: from out-66.mta1.migadu.com ([2001:41d0:203:375::42] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLMG-00000002fC4-16VM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:07:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=o2NPZbWA6+uMRn4xr5m7DWDGwtChXRj3f2KhhtG1Hlk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793023646; v=1; x=1793628446;
 b=BOaLcSNb52fcoWRAcVgWmTObLdGfm77N3xG/4XFYJkJSlpclvOVWQEYEH6gEVdDgOKvfJiB2
 +GDD3F70CDowqqrC3Q6TNASH+zHAMTNvs+G6Oh6i/X+MhSZeVJQ1Kl74FXP5sJ+HxvQA9zJM3en
 eQ/TgBCXXOaytcx17V/c25rw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ab6183d4299013f0;
	Mon, 26 Oct 2026 14:07:26 +0000
X-Mizu-Trace-ID: ab6183d4299013f0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so9244e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 07:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAP/NymSJO4RrCxJThS2gNONaoA/nglzrBJPRKppYS+qpNwk/uUvgPFjmXb0anmZ/DGSAa9Qsk1C0Aqn3VtcvF@lists.infradead.org
X-Gm-Message-State: AFq9FYJuXbHDV4CoYMgBTwsTKfBZNwNHn1KB8GxKX4/qt2Gnw0WsVN53
	zJkoKa6uCjxy7RU7wID6riYWmE+BKKoAPaLvT41BLweJNRn0hLlIlplRXofr3UrwWzFtD3dKUzk
	xYYEbacuCdxBF+oQ4cEBMm6DTARyDwcKVzXXU3DbN
X-Received: by 2002:a05:6512:a94:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bfb79aed47mr175268e87.3.1793023644976; Mon, 26 Oct 2026
 07:07:24 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026082305.2515705-1-maz@kernel.org>
In-Reply-To: <20261026082305.2515705-1-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 14:06:48 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwB63+RL=5=kb1jMbbjLa7-r9+L-4xXt28pP8jYjx456w@mail.gmail.com>
X-Gm-Features: AclHuK_Ciqa1-nHCIpB_KeKWlov_S50T8qZTQ8KyurQOAUPRFkCKEJz_GNIaL0Y
Message-ID: <CA+EHjTwB63+RL=5=kb1jMbbjLa7-r9+L-4xXt28pP8jYjx456w@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Reenable MTE on VHE guest exit
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_070728_539608_DF31BBA3 
X-CRM114-Status: UNSURE (   6.86  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Mon, 26 Oct 2026 08:23:03 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]

Tested on QEMU with MTE, on a VHE host with KASAN_HW_TAGS: a debug
print right after the guest run returns shows TCO set without the
series and clear with it. Guests also boot on nVHE and pKVM hosts (as
normal).

For the series:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>


Cheers,
/fuad

