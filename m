Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909D6CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 01:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rjq55+eOA9/1rvCud0HIBA7S3CKPm/bRJnQetVTrwZA=; b=Ulb1VYh/hCi8c1d0LDKt9oi0FC
	4igGDOT5c8SwaF0WG01GHOL2tqd8uzS6W1Gn1lOGttlx6KFJqM+lV6vDqN/9k/qHiMaFzVA1OVW2U
	XwNfcVT9Z4EVczhzTyplwiw5ue2NLVxtMMGKrKtYPjNpu3l/zsWDLaA25PUNHJr8XMRrzmi9aNQ0s
	aFjnWxJqWmsARr5p1jP+4nUG+H/PN8HfV8Dcxdlp6052nsuoDXeanemqPg3I73CH2oDU5m3lZrk8b
	ydIAxJ8LGBXEJN2UKx/R+ofsSqXj7R2pAptwpnkNQK1qR/cV0GGXRIsfzkmwv5sMiVV+A7Xi7zLVY
	cbA8IsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEz23-00000005E1J-1qLs;
	Fri, 09 Oct 2026 01:04:19 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEz1z-00000005E0l-2ZFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 01:04:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Rjq55+eOA9/1rvCud0HIBA7S3CKPm/bRJnQetVTrwZA=;
	b=Yi2bjh/KHDywomzaT0FjOJo8ntpiMwuJfT3Mr0C867BVqec4Q5pIS5j8S4u/UHVwIiZcMbtGf
	Dn8SS2cLU34cqyMHiJnNnuhA9MHuVxCcKZ0F9cCPH02Q1slBPyp25S/T7PIVpYKFqBSL0e9ACT9
	VwCoCEoCnmOApdd5ExoTygY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j17bn1kXzz1K9B0;
	Fri,  9 Oct 2026 08:51:49 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A8F74056C;
	Fri,  9 Oct 2026 09:04:04 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 9 Oct 2026 09:04:03 +0800
Message-ID: <6AC83D83.8000102@hisilicon.com>
Date: Fri, 9 Oct 2026 09:04:03 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike
 Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Michal
 Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/5] arm64: dts: hisilicon: Drop PCLK from static CoreSight
 links
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com> <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-3-c3edca1c480b@arm.com>
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-3-c3edca1c480b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.112.178]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200006.china.huawei.com (7.202.194.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_180416_336591_7C065193 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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

Hi Leo,

On 2026/10/2 23:07, Leo Yan wrote:
> The static links don't need to program registers, therefore apb_pclk
> reference is unnecessary, remove the pclk properties from those nodes.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 4 ----
>  arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 2 --
>  2 files changed, 6 deletions(-)

Thanks!
LKTM.

Reviewed-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei

