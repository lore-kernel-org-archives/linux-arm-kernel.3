Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14F6CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnYPacrxh2Vf2kARWZmsahsEJWN2KdcsCERjzEKumDY=; b=yQqmMzvus0aIPqzN7niYtLYmcW
	YbRmX2W/suf+/dRRia/0yLsmQ8y46By4ksWB8VrK1QLxmBDdTVZU9dzE6PCN7+ekUiQliu/Dd0ebD
	Wdd0RaS0nFJDfUxWPbfRZHw9mt0F0D8OkGSPzPjvUbSc59LEc7jNouaxQU/jKqB9D91GJbK466/ar
	jDxUoOjKswLtjniTwiLoZpkVL470SDgqi0r6mSlkLBgxs3tMlRLAHTrVe/fRCRjxqtMGpR96vy0EN
	8xKO+gvBsiWRhFILYJyeg+LkRCu+KAz0G1vwdpsFAZ1pGAX+EhmSSZ4cJW7wEl7ixrwt+ni61Nqkq
	bTtEkxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD4n-00000000s71-3cOs;
	Mon, 28 Sep 2026 15:15:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD4k-00000000s5u-2z5u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:15:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6742B1A103C;
	Mon, 28 Sep 2026 15:15:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36700601BD;
	Mon, 28 Sep 2026 15:15:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF143103294F8;
	Mon, 28 Sep 2026 17:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790608520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xnYPacrxh2Vf2kARWZmsahsEJWN2KdcsCERjzEKumDY=;
	b=DYRMiRUI2yCubHBc/jLEDWCSg7bWV8uv5DRdc10KUOPsttxWpksmOSIJqHfdzEdQzR13TI
	zfIz+gu681ikcAFurqJCci5EUE8jUDOXJbDqEIqOZAapTB/2bdcATQoN6/rXrK0/mnRBJn
	+S+tzA2mL4I1cWChRfoNErkYzb6/qm1i31wJfoHMMDbR0t9h1BNBwft09ZSmvAAKdKEoz0
	KFu2/SNKZ/nvvWEk9ACdej7qJRzK886tT+kISLvLdMRyZmNzsk+X4nUodqsv9WI+670EC2
	PDq9OUTVWGsJzEnktcewWcQwLR7keBfJwS26Rkif7363ftwtf93lIiczYe5cmg==
Message-ID: <dafc17ac-316e-4cfa-83e0-314d187fb3e4@bootlin.com>
Date: Mon, 28 Sep 2026 17:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: support
 external PCS
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-8-4b1c682af70f@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-8-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_081530_899874_9EA9103F 
X-CRM114-Status: GOOD (  15.83  )
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

Hi Ayaan,

On 9/23/26 03:07, Mohd Ayaan Anwar wrote:
> Select the XPCS instance initialized by stmmac when firmware provides
> a pcs-handle. Reject interfaces that are not supported by the selected
> PCS.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..a99a78880c0fb7858e90b6212b37ebfc7fccaf84 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -7,6 +7,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pcs/pcs-xpcs.h>
> +#include <linux/property.h>
>  
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
> @@ -681,6 +683,21 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
>  
> +static struct phylink_pcs *
> +qcom_ethqos_select_pcs(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	struct phylink_pcs *pcs;
> +
> +	if (!priv->hw->xpcs)
> +		return ERR_PTR(-ENODEV);

If there's no device (i.e. no PCS), then you should return NULL.

> +
> +	pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> +	if (!test_bit(interface, pcs->supported_interfaces))
> +		return ERR_PTR(-EOPNOTSUPP);

phylink already checks if the interface is in pcs->supported_interfaces,
no need to do it here :)

Thanks,

Maxime

