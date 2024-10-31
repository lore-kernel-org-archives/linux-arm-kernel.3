Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D21D767D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY6AwgdHxbopxTlrLA2vjYBTcxsL4277viuzwS9TPwk=; b=S/nVoFGyXaNqL02swhPr8j5zlp
	rqTxdWz3xBtZcIL2DAn0VN2SB7FwTJ3zxHnP/Eh2K93TQT01XKEmwhqQmEjOF7k5AhpenJhg0q+LW
	kOQEky8zLZ+m6NAo0SKLU9IlN85phl2Dc5Nt32v5g0AuZ53AxxNvVATZso2AycfMPvTyTrTRYpwaB
	tSF//eA0WZNYRc/TbHYSvr9YTA+wwHPmGprtJLyVV2zRA5EQ2/kNbN3LeLPLAujxjljeSJDfde8L5
	4HMClHYbjolEIWcmtJGNGoXn2UbbcLOOm0ak0p57oenTUe2lKdiZenCuaywCnJmQktPNHYr0sZgJj
	EjpPNWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Vz9-00000003mKb-1nLr;
	Thu, 31 Oct 2024 14:17:15 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VxJ-00000003m70-1Oo3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:15:23 +0000
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id 6BAhtj3S5vH7l6Vx2tnb0M; Thu, 31 Oct 2024 14:15:04 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 6VwztcuW9CgT66Vx1tPeXF; Thu, 31 Oct 2024 14:15:03 +0000
X-Authority-Analysis: v=2.4 cv=XvwxOkF9 c=1 sm=1 tr=0 ts=672390e7
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=6Ujbnq6iAAAA:8
 a=7CQSdrXTAAAA:8 a=vU9dKmh3AAAA:8 a=oUTu_NvtNUWWlwhRUWsA:9 a=QEXdDO2ut3YA:10
 a=-sNzveBoo8RYOSiOai2t:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GY6AwgdHxbopxTlrLA2vjYBTcxsL4277viuzwS9TPwk=; b=ZFzwELqOkrSNBIMVRTiDlSFHyU
	uj5CcjhYb80VHZUVw7ln/7cP9qYhRKcYxMzRae/5d6Dmz47qP5nCVXEsYdZtSAdFgyVtwYmIRLd/z
	Po/4rajeYeTvsjdgq1evjHmH3bwOiXAFu3GsqHKS6zwO3Uy90qgzB1rIR5hrv5W2GsrVH8o+8OAOJ
	3baIK8SJmQAa7Fhi8mhpu2aWlNDzQm7YwS2/D8QNke3Op0VtQzkDqKyayfIflaAeVHfILbQXcXX2/
	bT5K+wuHNoK3tKUqeK4yEWjN1XVqYT+WBlqD8Cy+AcG3kBgXa02V19AM5iFV8coPfp6h5j+viKvc1
	cA8+nkxw==;
Received: from [122.165.245.213] (port=51552 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t6Vwq-0038ez-1T;
	Thu, 31 Oct 2024 19:44:52 +0530
Message-ID: <fd26dadb-1a55-49dd-9530-5a3e2a58e36a@linumiz.com>
Date: Thu, 31 Oct 2024 19:44:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] arm64: dts: allwinner: a100: add watchdog node
To: Cody Eksal <masterr3c0rd@epochal.quest>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-3-masterr3c0rd@epochal.quest>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241031070232.1793078-3-masterr3c0rd@epochal.quest>
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
X-Exim-ID: 1t6Vwq-0038ez-1T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:51552
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNPfkwxzFXhH1MnTsN9Bcj2LHfsMrrLsDO86chPthx2p1JieJPzpX33vg6nbKBTtealBQpylvxzJU86rHkJucm5uUllr7FWtCTfBLSuCJncTJojYrsfo
 l7O7O6UJ8z4q2aSjDDWf9CF+E7F5rcInLEWE4hOcVLxr2UVFBHPAMqbDapCASwmQ5Pi6SFevXtzolFmn4YbbMgyuZTS6dG0nKtP1Xt5NcWo7cZTFcVTrheFh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_071521_403317_827B84F6 
X-CRM114-Status: GOOD (  10.01  )
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
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Declare A100's watchdog in the device-tree.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
Tested-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index 1eca7c220ede..adb11b26045f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -144,6 +144,14 @@ ths_calibration: calib@14 {
>  			};
>  		};
>  
> +		watchdog@30090a0 {
> +			compatible = "allwinner,sun50i-a100-wdt",
> +				     "allwinner,sun6i-a31-wdt";
> +			reg = <0x030090a0 0x20>;
> +			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&dcxo24M>;
> +		};
> +
>  		pio: pinctrl@300b000 {
>  			compatible = "allwinner,sun50i-a100-pinctrl";
>  			reg = <0x0300b000 0x400>;


