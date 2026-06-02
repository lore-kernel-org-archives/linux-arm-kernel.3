Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A39CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwD+lgpE2AoLhKFDcRsw65OP9SHvdO8TEaJlMiwY/JQ=; b=Fzn4iK29lHqq3ib0FAKXdoKe43
	dnovn/MX0VHMPhv6CpZwgUyLgFnKFWKfTIVqXEtRK/4hAXPNopwZiI9dxsErsvSeqvpYBrVdCUAEz
	drw1dtUG/TrVEw8wvmBAJp6LUrNw628QcVtCtKktxj0xSpt7K9ANmXBv2SF6+5mGH4r7SZMB5mczg
	w1xU9Mh4JodFiDluSbg5JFF3eeUvjN7uiz7rD+KU/Y9zfvjDaJdv6fryAqTsw/BJAa6bQyUUoiGqn
	GLk5YaXgrIfU48iJwCUwlqr+kgY/33/Is9Gx+QbyMqx2ACXYruZ/an44yKsy0k9RKheJwRG9zB6Fd
	8WJVH+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNi9-0000000CvQN-3zRE;
	Tue, 02 Jun 2026 11:55:10 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNi5-0000000CvPJ-47aL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:55:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OwD+lgpE2AoLhKFDcRsw65OP9SHvdO8TEaJlMiwY/JQ=;
	b=kCSs25zKgZEtMkWRGXtsI5iFHf5hY1YumhNQ9Ajj590nDA0ypfxercxstpvqn+bbV2waaUDoF
	5ppPuy38elEKLQIrL5100KawPFZcj9d63m7gn4JAPaYp/TTY06I0qrKy05zRvbUthD7zTsph/G2
	SP6SkC/7tfxsWiYNI7FdOa0=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gV8FJ5qvtz1cyVV;
	Tue,  2 Jun 2026 19:47:00 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 02C5240571;
	Tue,  2 Jun 2026 19:54:49 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jun 2026 19:54:48 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jun 2026 19:54:47 +0800
Message-ID: <6A1EC487.9070702@hisilicon.com>
Date: Tue, 2 Jun 2026 19:54:47 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Zeng Heng <zengheng@huaweicloud.com>, <vladimir.murzin@arm.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>, <yangyicong@hisilicon.com>,
	<maz@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<james.clark@linaro.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<kuninori.morimoto.gx@renesas.com>, <lucaswei@google.com>,
	<catalin.marinas@arm.com>, <broonie@kernel.org>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <kevin.brodsky@arm.com>, <tongtiangen@huawei.com>,
	<oupton@kernel.org>, <ryan.roberts@arm.com>, <mark.rutland@arm.com>,
	<will@kernel.org>, <Sascha.Bischoff@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP
 capability
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
In-Reply-To: <20260601112000.1145391-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045506_496385_C08016B6 
X-CRM114-Status: UNSURE (   7.57  )
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

Hi Zeng Heng,

On 2026/6/1 19:19, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
> 
> Changes in v3:
>   - Keep CONFIG_ARM64_WORKAROUND_DISABLE_CNP config and generalise
>     ARM64_WORKAROUND_DISABLE_CNP capability.
> 
> Changes in v2:
>   - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
> 
> Zeng Heng (2):
>   arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
>   arm64: kernel: Disable CNP on HiSilicon HIP09
> 
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 20 ++++++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  4 ++--
>  arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/tools/cpucaps                    |  2 +-
>  6 files changed, 38 insertions(+), 9 deletions(-)
> 
> --
> 2.43.0
> 
> .
> 

Thanks, all looks good to me and tested with the 7.1.0-rc1 kernel.

Acked-by: Wei Xu <xuwei5@hisilicon.com>
Tested-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei

