Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4F7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVYebm7zqhPMZpfjWSWykRmUcK/0WDHp7LsTyzYba7M=; b=FynVLLZMngA/UN/0YhK8HJpMfG
	IGrWOwnRLlJBiMNfIJXnabHruNsDqiKIF+NVGo1LRlyc6HKm1nJlCeaL9xoeiPu0P/QxZkPXLroAd
	O1iP6nfGR8grBTKeJ5ES1mEwRWFstmiDwmvcdd+R4aKmBacUeU+TD/zvEpg+39gI9CZGMOcVam3hQ
	78FoW9vbkti9Rzs6cKkpSImoPc90QYI09JTR2VuIDyLPoDmUZdu3nuYhBxV+DisRcoA9ThogB7QT9
	HXMjnxpgge0tVgOBdZf1opnVfhgqXYFP+YNiRKS1mhFfAhFstmXTUGJoh7zK1MadZAyqQ9f+/Fqiz
	FKxZ0ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn95e-0000000FYdN-0a0X;
	Fri, 24 Jul 2026 06:08:58 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn95b-0000000FYcC-2Uzv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873333; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=hVYebm7zqhPMZpfjWSWykRmUcK/0WDHp7LsTyzYba7M=;
	b=XntnDc9A1nUUnMJ73d8lzlMSwc8H/ZQtI0GKWCzSlWUbuA0VZVfuDkuRFXMDNRU7zPeaFO44+kox6YdYjSEEkPUNZAQ6kS9x9sLTpMuQFwz5QANioHcLiE3V7ZHmZgPTxz7b0Z7oUkUw9UJeCWxCkibcHx0UGxy+JhxFSN27uRM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R471e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iAqQz_1784873331;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iAqQz_1784873331 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:08:52 +0800
Date: Fri, 24 Jul 2026 14:08:51 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 13/28] arm64: sysreg: Add NVHCR_EL2 description as a
 mirror of HCR_EL2
Message-ID: <ymjztstct52bfytetjtuen5rkmmqtghgdrcioysap4udfcwevr@5wptbt56mgv3>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-14-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-14-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_230855_808228_0880D77B 
X-CRM114-Status: GOOD (  11.77  )
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

On Wed, Jul 22, 2026 at 08:42:19AM +0800, Marc Zyngier wrote:
> FEAT_NV3 introduces a new register that contains the HCR_EL2 value
> exposed to a NV guest. As such, it has the exact same layout as
> HCR_EL2.
>
> Describe NVHCR_EL2 as a mapping to HCR_EL2.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 28755f70f0bf0..42839d2b15ae4 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -4266,6 +4266,9 @@ Field	1	E2TRE
>  Field	0	E0HTRE
>  EndSysreg
>
> +Sysreg	NVHCR_EL2	3	4	1	5	0

3 4 1 5 0, right.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> +Mapping	HCR_EL2
> +EndSysreg
>
>  Sysreg HDFGRTR2_EL2	3	4	3	1	0
>  Res0	63:25
> --
> 2.47.3

