Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC960CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aky2/51RduZBuBKf+FKa+EmDr7pgEdWUv3WBf9Rvpyk=; b=YZNcl0cjNwEcXJrf5tEI1tOhZd
	WyyAvR2tMELyajM8YyRZ1WBi+jRk3a3XeGiLh8ShvtuueKthC4gF/aEZz1JNohMuESU6Ue4S7Wqnm
	dRN307VWgu/8r938gznhtsS4Cjl1p0VoxNT7huvf7v3s9JhsyritIohcH1ROJ6wZ6365CfMG6zSLP
	xL4mxp9E4VxX9bg2h+9A1acmjLKHectlGLqfFBAE4t0H3UOg8xPkT3dTfb4X70hlpDc577LV8oBmR
	7SfENHHUStYq9S10W7sSBMykP8Bd2Pw5sV6ezNCd6obVDDSB7Hv9/JujXbwMuYijkWB/NjuYzGIJT
	XxCooVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWFw-0000000FFal-2hoq;
	Wed, 07 Jan 2026 16:19:32 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWFs-0000000FFYa-14g1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:19:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aky2/51RduZBuBKf+FKa+EmDr7pgEdWUv3WBf9Rvpyk=;
	b=gTJ/W7Z1rc/sjLAinJV92HtJ1Z78MpXhjc67kXnqSkDd7IXHrkfF2LlP2+U09l5d+ArqvZM4X
	9BpMG+z5vmQ8gV3eMlCQzz1iE+HgoeluCk2KoYvUMVzoJAJWPSG8AjYY5DxmaxF6htbP4H/Vhsd
	gq3/2aWD9aqx0Ru3OzThdTc=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmY7y6thqz1P7Hn;
	Thu,  8 Jan 2026 00:16:46 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmYBb42kSzHnGdq;
	Thu,  8 Jan 2026 00:19:03 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 0489740086;
	Thu,  8 Jan 2026 00:19:10 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 16:19:09 +0000
Date: Wed, 7 Jan 2026 16:19:07 +0000
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
Subject: Re: [PATCH v2 30/36] KVM: arm64: gic-v5: Introduce
 kvm_arm_vgic_v5_ops and register them
Message-ID: <20260107161907.000045d8@huawei.com>
In-Reply-To: <20251219155222.1383109-31-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-31-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_081929_765004_F8A0E7BF 
X-CRM114-Status: GOOD (  16.88  )
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

On Fri, 19 Dec 2025 15:52:46 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Only the KVM_DEV_ARM_VGIC_GRP_CTRL->KVM_DEV_ARM_VGIC_CTRL_INIT op is
> currently supported. All other ops are stubbed out.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Trivial stuff only from me on this one.


> ---
>  arch/arm64/kvm/vgic/vgic-kvm-device.c | 72 +++++++++++++++++++++++++++
>  include/linux/kvm_host.h              |  1 +
>  2 files changed, 73 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> index b12ba99a423e5..78903182bba08 100644
> --- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
> +++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> @@ -336,6 +336,9 @@ int kvm_register_vgic_device(unsigned long type)
>  			break;
>  		ret = kvm_vgic_register_its_device();
>  		break;
> +	case KVM_DEV_TYPE_ARM_VGIC_V5:
> +		ret = kvm_register_device_ops(&kvm_arm_vgic_v5_ops,
> +					      KVM_DEV_TYPE_ARM_VGIC_V5);

I'd stick to existing style and have a break for last case as well.

>  	}
>  
>  	return ret;
> @@ -715,3 +718,72 @@ struct kvm_device_ops kvm_arm_vgic_v3_ops = {
>  	.get_attr = vgic_v3_get_attr,
>  	.has_attr = vgic_v3_has_attr,
>  };
> +
> +static int vgic_v5_set_attr(struct kvm_device *dev,
> +			    struct kvm_device_attr *attr)
> +{
> +	switch (attr->group) {
> +	case KVM_DEV_ARM_VGIC_GRP_ADDR:
> +	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
> +	case KVM_DEV_ARM_VGIC_GRP_NR_IRQS:
> +		break;
> +	case KVM_DEV_ARM_VGIC_GRP_CTRL:
> +		switch (attr->attr) {
> +		case KVM_DEV_ARM_VGIC_CTRL_INIT:
> +			return  vgic_set_common_attr(dev, attr);
bonus space before vgic

> +		default:
> +			break;
> +		}
> +	}
> +
> +	return -ENXIO;

I'd do this where you have breaks above. Makes it easier to follow
code flow. (a tiny bit anyway!)
Similar for other cases. Style in the file is pretty random wrt to
errors in switch statements so up to you on which one to pick.

> +}

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d93f75b05ae22..d6082f06ccae3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2368,6 +2368,7 @@ void kvm_unregister_device_ops(u32 type);
>  extern struct kvm_device_ops kvm_mpic_ops;
>  extern struct kvm_device_ops kvm_arm_vgic_v2_ops;
>  extern struct kvm_device_ops kvm_arm_vgic_v3_ops;
> +extern struct kvm_device_ops kvm_arm_vgic_v5_ops;
>  
>  #ifdef CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT
>  


