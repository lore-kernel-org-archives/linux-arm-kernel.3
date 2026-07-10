Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9B6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ieRasb/r9Y0NhsqrsCL266EF99WeR/pKOulm5/QEfI=; b=pFxKIh+6igJTVS
	u+NUvDtZyaXyiwS0wjqpe+8jl5CAMsICtnn1ongVMewSIrLxDZL+LxQc9YzyQD+qo/GkyeUvczeNe
	qi/Lyvw65HkOw7NxNCDrt/1Q2kkVay0qrgiyBBDrcm7T9joMM293dACckIoUSIpuDnRrWs7pQK+h9
	Ajd5k3r3ZgYl7QqyzpA2H0CdASNdCQgAfh0q13Wp9tBmP6E3P+Tlj5txOPDLXt0zc+dJeW2drOR3k
	OtRZ1Jt4cDO/5wXDjirHkzjD9VafwLJpjbP2fzCWbqc8qNHKMV3LU7jo21d5yDiiWQ3KEcf+4H/8k
	6skZgmAYuU5Opg3IWrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0o6-00000003x2O-3YZe;
	Fri, 10 Jul 2026 02:17:38 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0o4-00000003x1E-06jk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:17:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2ieRasb/r9Y0NhsqrsCL266EF99WeR/pKOulm5/QEfI=;
	b=U2cRdjoZNUfhNfAzEQDjzInZGn+H+idviHLP3v90paEhAIOBR8mRIzfRWIswl3TbkAhS+7ZCx
	NnrCSsNuzA04FXUbVuhglIAELntpYurbIzevPP7dDr2rIwUPYPNmuJ0t1pd5YE41ZaudNKooDFJ
	HuIB+heFo3w7xonkBdMupys=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gxFbw1Xt4z1prpH;
	Fri, 10 Jul 2026 10:08:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 49CC440579;
	Fri, 10 Jul 2026 10:17:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 10:17:28 +0800
Message-ID: <eb9ddc11-bb03-4502-b043-f21c0748c427@huawei.com>
Date: Fri, 10 Jul 2026 10:17:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/36] arm64: idreg: Add an override for FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-28-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-28-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_191736_221669_C3C22658 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> Add a named override for FEAT_NMI, allowing it to be explicitly disabled
> in case of problems.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/pi/idreg-override.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index bc57b290e5e7..e5ea280452c3 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -154,6 +154,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
>  		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
>  		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
>  		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
> +		FIELD("nmi", ID_AA64PFR1_EL1_NMI_SHIFT, NULL),

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
>  		FIELD("mpam_frac", ID_AA64PFR1_EL1_MPAM_frac_SHIFT, NULL),
>  		{}


