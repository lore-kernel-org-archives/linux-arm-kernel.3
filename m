Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0489C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvJGAbyWkcvedoLLc4FaW3JqrKOaqT7oAs2HApM74cQ=; b=ahiNDfVVY1y325ReEPsSXSNtqK
	U2FuoDnOZXUavD7Ru4uVpL8A5UW3y5UbN4rFL7oc47ffxVrvLUeULAluXFC2to7sb72B+xONFVMdA
	wLbtIF601wSys9SDTzrbQb5/xxEmdQXLSrc1sAjPiXYwW8ExBNeQcp1xDhxmjqDJU6f+Lsqf4jRr4
	vP6MFFkwdQO3ATT1rIpDB0qfldlgqiYzxgooqj/pNlPyqkcWmCDSIRtGJTVowM7cFjbaCYU5kk04t
	9wOVkk9ZqiaKZA8ZptlB9mtbTzeAseW5Tc2WrD3VNTG+KGsWhgxyycANd+ulkZwTClR/Pafwr9maC
	8UsES9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIEN-000000042cs-2jEP;
	Wed, 26 Feb 2025 14:17:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIBJ-0000000421D-0PYq;
	Wed, 26 Feb 2025 14:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KvJGAbyWkcvedoLLc4FaW3JqrKOaqT7oAs2HApM74cQ=; b=KP+ssduJCcCljk3HCk1xztnkk3
	zS+GF9pbhbYxs31tkIc2o1qgOvBu73G6nQzg79jNujH4QtrV/x03B5kel06GZxwVlF4zqtsEz59p4
	ru+ycq0C3F+HcU8HRvffn8jqfbXLhQYlB/evrA589kvVMPsgnBKDNt5w82GcGfGRkMy8PdsroOFSz
	636143j44zLKs98WFAY6XFV11DqeZmGi/Z8eYumMznOW+xAbNtzwH0fzumWX2A8TB+ZXJi5AIUW14
	0UawrXNqsHTNcbdTLvHAIJ0D5AOQF89jh8mWGN1MckA15++rkbSjCzJ4fntz5Op3XSfGPuwfEgOUO
	oRwePrdA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnIBH-0000Xq-P2; Wed, 26 Feb 2025 15:14:35 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dse@thaumatec.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add overlay for tiger-haikou
 video-demo adapter
Date: Wed, 26 Feb 2025 15:14:35 +0100
Message-ID: <12349849.zAa99ISigo@diego>
In-Reply-To: <20250226140942.3825223-4-heiko@sntech.de>
References: <20250226140942.3825223-1-heiko@sntech.de>
 <20250226140942.3825223-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_061437_142608_31EDFE8F 
X-CRM114-Status: GOOD (  16.69  )
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

Am Mittwoch, 26. Februar 2025, 15:09:42 MEZ schrieb Heiko Stuebner:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> This adds support for the video-demo-adapter DEVKIT ADDON CAM-TS-A01
> (https://embedded.cherry.de/product/development-kit/) for the Haikou
> devkit with Tiger RK3588 SoM.
> 
> The Video Demo adapter is an adapter connected to the fake PCIe slot
> labeled "Video Connector" on the Haikou devkit.
> 
> It's main feature is a Leadtek DSI-display with touchscreen and a camera
> (that is not supported yet). To drive these components a number of
> additional regulators are grouped on the adapter as well as a PCA9670
> gpio-expander to provide the needed additional gpio-lines.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

in v2 Quentin commented with a (which I forgot to add)

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>


> +	vcc1v8_video: regulator-vcc1v8-video {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc1v8-video";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	vcc2v8_video: regulator-vcc2v8-video {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc2v8-video";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};

and suggested to add the additional regulators on that board, that are used
for the camera part that is unsupported right now.

If there is a v4, I'll probably add those.



