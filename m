Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F482FC9ED9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 08:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHucHSZfT8eULVGqwS/p64GoufAGRaFL+cYnqR7Mpy8=; b=tWZE+PPlU5uXAFXyf0slBv21Gy
	2TIM78yjfpN2S6eEH8aW/HP/OYM3DML/fdbdsw9bPB8IhCMp9yJ9oLnUQwa1+ptR/lyanPuWktUq4
	0zyK2jvPt/mkj1XerdXKHVhEXY3TyR04oDkY5RzirwndNghEtMZvMrRV6DRaVpE/Jrg9qWFZ5W+jT
	MG4iwhQwA6BgbLwzItvJz8xaBu5W0LVDpThyTcsB76AItgKgDFfv7yQHxdFBxkzUbi+DylpyBV3GV
	xSqCaYq0OipTBpsjVgR2XXGBGKTFkuv2sdFyPToHloEbUrADbs8HQnopWORnvyV/C/O4QDuVsX7Ao
	fT5PkVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynMz-000000051Bw-3obO;
	Sat, 07 Mar 2026 08:50:45 +0000
Received: from [113.46.200.219] (helo=canpmsgout04.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynMw-000000051Ao-07xd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 08:50:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wHucHSZfT8eULVGqwS/p64GoufAGRaFL+cYnqR7Mpy8=;
	b=gjDHsJ+RZmgjANootDOD67tdU+Xs2iwsPVM+IiHxXMYwwbCRKAyKX4kcwZWUblPbD+v8mTF9g
	/Zi51erX/1wD3kCkKu7lENDuwSU/RWy0GHI43g03zCq9LIBznMTHM4brcb4bAbUzlc2I6obmRvi
	Hg+Vmxm6tpwWraJ7W3RoTkk=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fScKj6r5mz1prL0;
	Sat,  7 Mar 2026 16:45:13 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B2B540569;
	Sat,  7 Mar 2026 16:50:09 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 7 Mar 2026 16:50:07 +0800
Message-ID: <cbfe1b73-37ea-52fe-84cf-cb0cba962ff1@huawei.com>
Date: Sat, 7 Mar 2026 16:50:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] arm_mpam: Add support for the MPAM v0.1
 architecture version
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
To: <xry111@xry111.site>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <yang@os.amperecomputing.com>, <ryan.roberts@arm.com>,
	<kevin.brodsky@arm.com>, <reinette.chatre@intel.com>,
	<miko.lenczewski@arm.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<thuth@redhat.com>, <ben.horgan@arm.com>, <james.clark@linaro.org>,
	<james.morse@arm.com>, <lpieralisi@kernel.org>, <broonie@kernel.org>,
	<oupton@kernel.org>, <anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>,
	<leo.yan@arm.com>, <mrigendra.chaubey@gmail.com>, <fenghuay@nvidia.com>,
	<ahmed.genidi@arm.com>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<guohanjun@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<wangkefeng.wang@huawei.com>
References: <20260203095406.6437-1-zengheng4@huawei.com>
In-Reply-To: <20260203095406.6437-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_005042_749992_561D4446 
X-CRM114-Status: GOOD (  10.29  )
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

Hi all,

On 2026/2/3 17:54, Zeng Heng wrote:
> According to the MPAM spec [1], the supported architecture versions are
> v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
> identical, but v0.1 additionally supports the FORCE_NS feature.
> 
> ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
> F0_EL1.   | F1_EL1.   | Architecture   |
> MPAM      | MPAM_frac | version        |
> ---------------------------------------------------------------------------
> 0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
>            |           |                | MPAM v0.1 is the same as MPAM v1.1
>            |           |                | with FORCE_NS which is
>            |           |                | incompatible with MPAM v1.0.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
>            |           |                | MPAM v1.1 includes all features of
>            |           |                | MPAM v1.0.
>            |           |                | It must not include FORCE_NS.
> 
> [1] https://developer.arm.com/documentation/ddi0598/db/?lang=en
> 
> Changes in v2:
> - Add new patch 2 to check the MPAM MSC version.
> 
> v1: https://lore.kernel.org/all/20260104133434.1887677-1-zengheng4@huawei.com/
> 


Friendly ping on the patch sent weeks ago. This patchset is part of the 
effort to extend MPAM driver support for MPAM v0.1 specification.

The discussion of v1 version is available at the link above for review.


Best regards,
Zeng Heng

