Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7840CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nf6TbTTKpnL7mG5m//aAjoL13/cGP7KHINrrFH8p8l8=; b=Gw594z4U1JuoTrtX/VCC1zawTH
	hlRz4i8IFvnjC+SoV43O9fxKs3YzFPZhotKTBpdUJFQspK9JkGFEDnC1GeN2qH32GJosw1XigxoNb
	TpfccmWvAvyCWrDhOYD9b+SSCsy10M+KFT/T4Ci98rdkkUDMD4zydyLPtSO2NzDbhIWsEo2hdqf1A
	iVhlf9YRFt9O4vjwfU031UxtbkBkKXGkXQXFaws+IgCuQDGq35AWn4R3Qb447yqtKAxoiHOnzAmQS
	zA0iDAAYXNUUaZTogZXfEIn+Ax/D6JU8PY5jEwzFaZA94MSog4Yyp5jcSeT6+YmE24tSHI6oxhRa2
	Aug9sfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15xj-0000000EHPq-0oBp;
	Tue, 23 Sep 2025 16:33:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15xg-0000000EHNn-23y7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 16:33:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E1A64E40C64;
	Tue, 23 Sep 2025 16:33:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4701860690;
	Tue, 23 Sep 2025 16:33:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8CC2102F1960;
	Tue, 23 Sep 2025 18:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758645227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Nf6TbTTKpnL7mG5m//aAjoL13/cGP7KHINrrFH8p8l8=;
	b=IxSv1tFbbPL+umkvEM7djR6Yg3cz7Q2UpQOiuIDLVBOMNmPas+rqfuSPpYEwwmPnwbbhX7
	iyU8gRAEFEJxOGVjk8oFOFWqQuy193oS6ZkWZpkcspm4SOvyMGLSOcQiClfSkZGuzzMd/x
	mLJHUPoAEORo8qPGaXuGZD9o2RMTCUz/YiULpu35NKxe33xKoLQGEGmuntusBxIE+/PuAx
	bvmgZZ8PVFakA5zNOGZgzYYrnHournuWPnsbUmBuK43eReNjZ28U2VPgEmhK/7LSESXVZ/
	wngvVxssQbdW6trXKSOS0w4l66tKt7FP4VecgcIMU7IYm57HE55YXPI6spxjHw==
Message-ID: <bbcca781-9ac4-4eec-b3fb-ff4e01950127@bootlin.com>
Date: Tue, 23 Sep 2025 22:03:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] ethernet: eswin: Add eic7700 ethernet driver
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 anthony.l.nguyen@intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, inochiama@gmail.com,
 0x1207@gmail.com, boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 lizhi2@eswincomputing.com, pinkesh.vaghela@einfochips.com
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250918090026.3280-1-weishangjuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_093352_672725_C2AA2967 
X-CRM114-Status: GOOD (  12.34  )
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

Hi,

On 18/09/2025 14:30, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add Ethernet controller support for Eswin's eic7700 SoC. The driver
> implements hardware initialization, clock configuration, delay
> adjustment functions based on DWC Ethernet controller, and supports
> device tree configuration and platform driver integration.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>   .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 230 ++++++++++++++++++
>   3 files changed, 242 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 67fa879b1e52..a13b15ce1abd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -67,6 +67,17 @@ config DWMAC_ANARION
> 
>   	  This selects the Anarion SoC glue layer support for the stmmac driver.
> 
> +config DWMAC_EIC7700
> +	tristate "Support for Eswin eic7700 ethernet driver"
> +	select CRC32
> +	select MII

Seems like CRC32 and MII are already selected by STMMAC_ETH. I guess 
this is inspired by CONFIG_DWMAC_DWC_QOS_ETH that also seems to have 
these unnecessary dependencies.

Maxime


