Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F31AC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONcQ26rozGTeYTFN4AmRp548glZjumb6wG79sSd/wGw=; b=iY3IKJPuwhZxDMJw7/o3wQ7vW7
	EIhNy4I3RG6EIMds4MTyuTVT2fl+c0Vt70GbsM3e8cbKzFqpQ0N3yKa+fe7ISmzUUhpApOtksEFoa
	MJjymxwyA3cEAyqgb79OKhbKHEAb+Q8hPVfNpcgA6JAU7Y4uRdPxsqK2om/vd7ln+sAmgCvl6v9GT
	ON31M9S5AxctpGl2ukwdQr4ekS/jfWjyk43BCpHsQa8qd0PcqG/9R+6QyO8Fcp+Wn2AJK1b3M+EDf
	9zx1tJ9bQHTXeI2FOjoj6mytGC4RfnUUQKjI+9I3mc96sTGXZEc9fXW2WuTcUzSrcDfs+xRro2br9
	00D0Cc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SlG-0000000DfCL-35cn;
	Fri, 18 Sep 2026 07:11:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sl9-0000000DfAl-31m7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:11:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BFAA3C58469;
	Fri, 18 Sep 2026 07:12:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E270960649;
	Fri, 18 Sep 2026 07:11:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FDDB11C7B021;
	Fri, 18 Sep 2026 09:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789715503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ONcQ26rozGTeYTFN4AmRp548glZjumb6wG79sSd/wGw=;
	b=BOn559NGFM4JJTDaDZomXpW+HeR6L1FpzuDZcpegacC0EWH17CgOUh8GaZeLbsSQA+OKgI
	YJqBv3xsMKPOjMOSHWrbzoJz6mPq8JbhfWjuIQhyAJOi23et+j6/9UkTWFXjrVbEo+DXBA
	LAHVKlG8pvIOHGBjNnC8FqtxEt6J2+/6uHVGmb2y5eHgB1/ziSBondVCal7Tk1qz3mhkpx
	roCnuoCqnGySL7UjrqsowJSlJEqVDnviYjtCb7Rt0e71lCmECtuljGFyXLbqKlKmp+HlbT
	zlpmRCdB42oHn9bH3HrcRcJC6LclwNeN7n8bUBjVSUtQXqS+mt3VqKtAijKPrA==
Message-ID: <986afd25-f69d-4b73-9e7d-f1403a1c6e6e@bootlin.com>
Date: Fri, 18 Sep 2026 09:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/3] net: stmmac: advertise integrated PCS
 interfaces to phylink
To: Thomas Karpiniec <tom.karpiniec@outlook.com>, netdev@vger.kernel.org
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Coia Prant <coiaprant@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
 <SJ2PR11MB8401D53F5519472525156BA9E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <SJ2PR11MB8401D53F5519472525156BA9E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_001147_931808_C40B00B4 
X-CRM114-Status: GOOD (  16.06  )
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

Hello Thomas,

On 9/18/26 06:50, Thomas Karpiniec wrote:
> From: Thomas Karpiniec <tom@wendy.sh>
> 
> stmmac_phylink_setup() adds interfaces reported by platform
> get_interfaces() and non-integrated PCS instances to
> config->supported_interfaces, but omits the integrated PCS.
> 
> On qcom-ethqos with 2500BASE-X selected by firmware, this leaves SGMII
> out of the supported interface bitmap, causing phylink to remove the
> lower-speed modes of a switching PHY such as QCA8081.
> 
> Add the integrated PCS interface bitmap to config->supported_interfaces.
> 
> Fixes: 68cff4fff61f ("net: stmmac: add BASE-X support to integrated PCS")
> Cc: stable@vger.kernel.org # 7.0+
> Assisted-by: LLM sparse
> Signed-off-by: Thomas Karpiniec <tom@wendy.sh>

Looks good to me, thanks !

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1350e92943ac..f956e0d2ec64 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1414,6 +1414,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  		__set_bit(priv->plat->phy_interface,
>  			  config->supported_interfaces);
>  
> +	/* If we have an integrated PCS, add the interfaces it supports. */
> +	if (priv->integrated_pcs)
> +		phy_interface_or(config->supported_interfaces,
> +				 config->supported_interfaces,
> +				 priv->integrated_pcs->pcs.supported_interfaces);
> +
>  	/* If we have an xpcs, it defines which PHY interfaces are supported. */
>  	if (priv->hw->xpcs)
>  		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);


