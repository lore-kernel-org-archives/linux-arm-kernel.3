Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E77CC9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcfwhviD+3DU7mCwVMqId0aDxEX8Zf7Gb4cXQFIqiJE=; b=AHEq4qg0rBHBwrOQQo52AUfk0h
	9x8fYiJgBjW7O2wT79nT684iqUzxrMvEmL7Yx2a5WBI0QrSEYitl8fJ3hcBYBITgcbiRK3c09Jen1
	IYGvtKngzPWm74cCQd0293jfKMVpiHalI0c741P4covr2PJDg7ZF0TZ7DTb3c5rKbxJaztbXNR6yl
	RywUggqEzZwhwJjGInUMIYvnfryY7eK3+HucOg2ue86N2fdg0HYXcf88R/jpgy9gip9D7hSBb10tT
	8RMGhD0AFd3SkYujKN3y0N5wRCWih9XZGp5eFXc9YyVgWxq2cU9rU3ZAxXQPzjpWRWsDq9wKhagY+
	x0doETJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJBO-00000005Yxm-0Cfm;
	Mon, 12 Jan 2026 14:46:14 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJBL-00000005YwV-3NqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:46:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wcfwhviD+3DU7mCwVMqId0aDxEX8Zf7Gb4cXQFIqiJE=;
	b=cymrG1ZGTAoPDiXOPvfmXEmEO3QuJDyHKc2mCo5XgFtXJvy3YkdKwXCnNOL2WCsFJF4d8cfNS
	ViQMtxAng/+5BPzJSCSU9viuiAANmEBrP8CCtCqONNB4Iqxz84Wdf6Vni566ISQlrLN7AY1mh+y
	CVcmEsMhCElbt3/ge2mtLmE=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqZr76Yr0z1P7Js;
	Mon, 12 Jan 2026 22:43:35 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqZth3MXmzJ46Ck;
	Mon, 12 Jan 2026 22:45:48 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 0049040539;
	Mon, 12 Jan 2026 22:46:00 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:45:59 +0000
Date: Mon, 12 Jan 2026 14:45:57 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v3 09/36] KVM: arm64: gic-v5: Add Arm copyright header
Message-ID: <20260112144557.00005986@huawei.com>
In-Reply-To: <20260109170400.1585048-10-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-10-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_064612_066233_F1B0C74A 
X-CRM114-Status: GOOD (  12.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 9 Jan 2026 17:04:41 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> This header was mistakenly omitted during the creation of this
> file. Add it now. Better late than never.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Thanks for splitting it out.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/kvm/vgic/vgic-v5.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index 2d3811f4e1174..23d0a495d855e 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -1,4 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025, 2026 Arm Ltd.
> + */
>  
>  #include <kvm/arm_vgic.h>
>  #include <linux/irqchip/arm-vgic-info.h>


