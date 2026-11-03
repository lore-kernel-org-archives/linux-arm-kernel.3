Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2BA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l1XIPDnV;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nDjtx8mp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7JATDHeSysjhrflLAzQ9XRWSKRJGHXy+wbdwm4zZP4o=; b=l1XIPDnVj+Zu39EgVIu530CBwy
	OxIf50YdtD+HVyj+UxpFj7udvO8SOMexOrqvnoYxpcBLq0X+OfvMEsiAJOAznPF0TrjBnErYPQ24J
	BoolfOntfSSAwFXDOp4hcxC0p715njtroNQ24fraLpIrYgJUUV+Qr8EzJONmGdCAAlSdJLg1wE1zI
	e02z2bM7OGjzWcUMc+yGq9e5rNvfFxk/10TuhzWf5udiKqeiK57DfLYsHBm51QrFuBXJPQaCwR5vj
	bzsGh9QttivFcwwoF2KlKQu5ITXvSAvjXCEiuXVTCHMCBuEqtX1TEOAit0BtU1ktNmhyUoV4ng8VE
	0yWpMzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEpG-00000002cJ6-2qCJ;
	Tue, 03 Nov 2026 13:45:23 +0000
Received: from out-128.mta1.migadu.com ([95.215.58.128] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEpC-00000002cGB-0bmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:45:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7JATDHeSysjhrflLAzQ9XRWSKRJGHXy+wbdwm4zZP4o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793713513; v=1; x=1794318313;
 b=nDjtx8mp4sSvuji6s+dX4yALqpAtBds/Zhz7FjrQZtN/vI5+Vc6sQ+fYDpdZhfU721gO9dlC
 NHqF9thh653Z44AbC8fzCoqZ/6sr0+mnerpJwyN+TheIFxDbxUQdodthmCQLPSBDmCvK5o9Ykxd
 Y7NxWgDCwuue1QcE4wdft7ic=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id af65fb2ffbbbcbd8;
	Tue, 03 Nov 2026 13:45:13 +0000
X-Mizu-Trace-ID: af65fb2ffbbbcbd8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7350e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:45:08 -0800 (PST)
X-Gm-Message-State: APuU4Z+WZKmCSYPkE3//enxujCCvTiEbB31ggA92a5tMz6+0FY13TSBL
	/13pKIjkxHNBcwHaZdz+Ypb9jmpNuprtxQPAD8cHO6WE/lgv4InP8dlsqDO6TnNZzLtHrnoiKW/
	S9IAZ8ZjcH8UUmhZMhDDLpa+F4nLe2TqmgdecJTQs
X-Received: by 2002:a05:6512:3e06:b0:5bf:a49c:ddde with SMTP id
 2adb3069b0e04-5bff0efce9emr111926e87.10.1793713507212; Tue, 03 Nov 2026
 05:45:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-5-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-5-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:44:30 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx6RuEs7gP=kUMJEJ-ktC_p0UNxG38rq3P68Xyo8xOMag@mail.gmail.com>
X-Gm-Features: AclHuK_8x91av0-bAi-LcSEBarsfA-5SHr6ALUzPfLF0-91WlZxDuJwLvudbzOc
Message-ID: <CA+EHjTx6RuEs7gP=kUMJEJ-ktC_p0UNxG38rq3P68Xyo8xOMag@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] irqchip/gic-v5: Add ITS MMIO register definitions
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054518_609488_977A6C4E 
X-CRM114-Status: UNSURE (   6.40  )
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

On Mon, 02 Nov 2026 19:44:42 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> Keeping the ITS register frame definitions together avoids spreading
> register-definition churn across the subsequent KVM ITS emulation
> patches.

nit: the re-tab and the XDMN_EVENTs rename worth a mention here?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!
/fuad

