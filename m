Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B2D767D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jxM7lRle7VcSb1cHFDpbe2ijsT2r/j9mqp7JE6/0QY=; b=EaJ8qgS14dPVaNBtxB0ntXmHwb
	YuypyRAPa1UkIO00eqK8j85f45Mbz0C/c1T0uHRLVIuvK0gv348zmJBcmY6cVz90QyJN9/lGsoDid
	2skypwtiMpsdaBiIorEoh0eRCagQULN69z2fGisTecKPs/CDkYiE1MR935I8SrbECg8wXSwsDEPqL
	0K6idTEnRhtyWEsZHuG+Ot6XGo4ZIbmUN+NcTRIF0lpDxpoAEb8IbnagRtzBg+kEnBxSmbUUEHBOj
	5DXQbPiabV34prThu8Wlk9kKUSf4YZI0Mb01vw8yTMaOh1t85lP2SJ2JyeGlRBESbQVCeUDSf8amq
	KzCrS2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W5C-00000003nZN-1SyZ;
	Thu, 31 Oct 2024 14:23:30 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W1z-00000003mmH-1LFi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:20:12 +0000
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id 6MqftlidwvH7l6W1ytndnN; Thu, 31 Oct 2024 14:20:10 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 6W1wtKj9MmNYj6W1xtTyrX; Thu, 31 Oct 2024 14:20:10 +0000
X-Authority-Analysis: v=2.4 cv=fb9myFQF c=1 sm=1 tr=0 ts=6723921a
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=6Ujbnq6iAAAA:8
 a=vU9dKmh3AAAA:8 a=UQ0gWoj1K6JKIvSkpFIA:9 a=QEXdDO2ut3YA:10
 a=-sNzveBoo8RYOSiOai2t:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+jxM7lRle7VcSb1cHFDpbe2ijsT2r/j9mqp7JE6/0QY=; b=MElCisaXm1Z0+gopzkxIofO/XC
	+bkgABtUvhl7xIE1PLBpyq9jFI7iHPGc6lOLzoTPbeRP4d6rtjGAq1K0QB83bWCnZR/sInsKWQnl4
	ip/MD9ihA/DsKWRDpRSau8c3zk5rcrL4ZIVZBDAPWdXPfkf5CLNimFRm80eEOEyoPbto/+ZDoOp5t
	OO5nny7KBgSUcN526T+uBC716GoaxD0A+Gv0RJdwTKaEq5N800HkDG/rpNqez1wRabx+h3MX+MeAp
	QGDtNqgxeyeKKUXiiBuh+89gz2WYaPxPACvKWio8Wx+H1AoG45aWwWzCRNN7kcakWMWSk7zFfrAuK
	io09hJAg==;
Received: from [122.165.245.213] (port=32784 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t6W1o-003EHK-1D;
	Thu, 31 Oct 2024 19:50:00 +0530
Message-ID: <4c2afef1-dd0d-48e8-a9bc-650edf44b399@linumiz.com>
Date: Thu, 31 Oct 2024 19:49:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
To: Cody Eksal <masterr3c0rd@epochal.quest>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1t6W1o-003EHK-1D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:32784
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 25
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEfy3sxAoDArhMG0gkOyYNaybkh7xCW0M7302f3808xXs9IT8fX8g2pZCUujmC3E5vqddkkp8r7uYyY8XADyuXBsJguWTjtw8WAUfgY+ATEaayxwHKay
 PinQk00duvg4aZ1urNv9QtzwXPIw8snB0BS2NGIq+DpzLIIXOC+2wV5jiDIfsbq5BPTUregd6QdiMwAQIxLbj/3jAZNmheXMahQZYkJF5YCsGNSVErZFwQto
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072011_419859_F0DA6738 
X-CRM114-Status: GOOD (  18.53  )
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

On 10/31/24 12:32 PM, Cody Eksal wrote:
> From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> 
> Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> let us use efuse_xlate to extract the differentiated part.
> 
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Although I couldn't get the secondary CPU's running because of missing BL31 support,
it works fine in CPU0.

Tested-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban

> ---
> Changes in V2:
>  - Add the A100 to the cpufreq-dt-platdev blacklist.
> 
>  drivers/cpufreq/cpufreq-dt-platdev.c   |  1 +
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 28 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 18942bfe9c95..2a3e8bd317c9 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -103,6 +103,7 @@ static const struct of_device_id allowlist[] __initconst = {
>   * platforms using "operating-points-v2" property.
>   */
>  static const struct of_device_id blocklist[] __initconst = {
> +	{ .compatible = "allwinner,sun50i-a100" },
>  	{ .compatible = "allwinner,sun50i-h6", },
>  	{ .compatible = "allwinner,sun50i-h616", },
>  	{ .compatible = "allwinner,sun50i-h618", },
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 293921acec93..3a29c026d364 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -22,6 +22,9 @@
>  #define NVMEM_MASK	0x7
>  #define NVMEM_SHIFT	5
>  
> +#define SUN50I_A100_NVMEM_MASK	0xf
> +#define SUN50I_A100_NVMEM_SHIFT	12
> +
>  static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
>  
>  struct sunxi_cpufreq_data {
> @@ -45,6 +48,23 @@ static u32 sun50i_h6_efuse_xlate(u32 speedbin)
>  		return 0;
>  }
>  
> +static u32 sun50i_a100_efuse_xlate(u32 speedbin)
> +{
> +	u32 efuse_value;
> +
> +	efuse_value = (speedbin >> SUN50I_A100_NVMEM_SHIFT) &
> +		      SUN50I_A100_NVMEM_MASK;
> +
> +	switch (efuse_value) {
> +	case 0b100:
> +		return 2;
> +	case 0b010:
> +		return 1;
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static int get_soc_id_revision(void)
>  {
>  #ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
> @@ -108,6 +128,10 @@ static struct sunxi_cpufreq_data sun50i_h6_cpufreq_data = {
>  	.efuse_xlate = sun50i_h6_efuse_xlate,
>  };
>  
> +static struct sunxi_cpufreq_data sun50i_a100_cpufreq_data = {
> +	.efuse_xlate = sun50i_a100_efuse_xlate,
> +};
> +
>  static struct sunxi_cpufreq_data sun50i_h616_cpufreq_data = {
>  	.efuse_xlate = sun50i_h616_efuse_xlate,
>  };
> @@ -116,6 +140,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6-operating-points",
>  	  .data = &sun50i_h6_cpufreq_data,
>  	},
> +	{ .compatible = "allwinner,sun50i-a100-operating-points",
> +	  .data = &sun50i_a100_cpufreq_data,
> +	},
>  	{ .compatible = "allwinner,sun50i-h616-operating-points",
>  	  .data = &sun50i_h616_cpufreq_data,
>  	},
> @@ -291,6 +318,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
> +	{ .compatible = "allwinner,sun50i-a100" },
>  	{ .compatible = "allwinner,sun50i-h616" },
>  	{ .compatible = "allwinner,sun50i-h618" },
>  	{ .compatible = "allwinner,sun50i-h700" },


