Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02F710A1E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eUbyrBQrZeyw3b/k/SDrTACodn8YBSMmYKpGCCfH9E=; b=boBUavd6Rd9A9Kx70pZDcpD8QV
	s5VppzdIV4sjcuaO6SrQXZhiTtRoei/H4Uaae1UULFKE33/nPbGYn5BdISh+XW4sbDw6APc6SrTHx
	fnJGKTpdvJQjDWzmi+N93vaeDcHFA91BHtDJsPTS5aqDQDU1TrKiz358X0Yf+Rs7PxAsuqRR8faT5
	appf4lUtMklWPH8QXVXp34O7+0qWpbrjXfkA7N8Fujhim7wBJrGubPk0N4CPFX8s5L09AtqbWHC0W
	tVAjnt+vbBWr1Er0QYcATtWsCGPunb2r3UA2MOzc4yJ4nr03opx/6wl00TDla2Vb4/Jvwh6u1JWWw
	gC123cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ikc-00000005M2P-1PyS;
	Thu, 26 Mar 2026 11:19:46 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ikX-00000005LyA-1ZKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 11:19:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4eUbyrBQrZeyw3b/k/SDrTACodn8YBSMmYKpGCCfH9E=;
	b=PqfD5wy934jLNLeuXyaaOLg1+NyOaHiHgYF2LSoav3XafE3peWSUj2uOnPF8hsW/eYKyKuIHB
	5/KMAFgPcTmA6XJp+T7F8S82XOXNdfs6CQzyraZDnhcdH+dqpo7V67PYgw8rXtt9iqY99o2hes/
	oZm+auom9IW5mWJazjO8v/8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fhLkf6WRjz12LGC;
	Thu, 26 Mar 2026 19:14:02 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id A396C2025E;
	Thu, 26 Mar 2026 19:19:29 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 19:19:29 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 19:19:28 +0800
Message-ID: <69C51640.8070408@hisilicon.com>
Date: Thu, 26 Mar 2026 19:19:28 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Bhargav Joshi <rougueprince47@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ulf.hansson@linaro.org>,
	<zhangfei.gao@linaro.org>, <linux-mmc@vger.kernel.org>
CC: <daniel.baluta@nxp.com>, <simona.toaca@nxp.com>, <d-gole@ti.com>,
	<m-chawdhry@ti.com>, <linux-kernel@vger.kernel.org>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix
 dtbs
References: <20260325225439.68161-1-rougueprince47@gmail.com>
In-Reply-To: <20260325225439.68161-1-rougueprince47@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041942_202706_CC2FFF28 
X-CRM114-Status: GOOD (  15.35  )
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

Hi Bhargav,

On 2026/3/26 6:54, Bhargav Joshi wrote:
> This series converts the Hisilicon dw-mshc text bindings to DT schema
> format and cleans up legacy node names in Hisilicon board files.
> 
> While testing the new YAML schema, dtbs_check flagged the hi3660, 
> hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node 
> name prefix. resulting in warnings.
> 
> Patch 1 Convert to DT schema
> Patch 2 updates the Hisilicon dtsi files to use standard 'mmc' 
> node name.
> 
> Changes in v2:
>  - Patch 1: 
>     - Grouped compatible strings into an enum.
>     - Replaced raw numbers with proper flags.
>     - Fixed property order and removed invalid hex values.
>     - Added explanation for clock order change in commit message.
>     - Collected Acked-by tag.
>  - Patch 2: 
>     - No code changes.
>     - Collected Acked-by and Reviewed-by tags.
> 
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> ---
> Note: this patch is part of the process for applying to GSoC device
> tree bindings conversion project #
> https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
> - The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
> - It is used in following
>     /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>     -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>     /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
>     -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> 
> Bhargav Joshi (2):
>   dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
>   arm64: dts: hisilicon: Rename dwmmc nodes to mmc
> 
>  .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
>  .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
>  5 files changed, 124 insertions(+), 80 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> 

Series applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei

