Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE46C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzLLtntjAk4L5s3zWav1DdCRi8bGrElnziK/fcZnQjE=; b=r+vLbYNLqJySPzrQiYruTeuND7
	1A82OceBuGkjkn/dR9zzU9pcvd83Z4+RfhKI95dWNZmR3G0ks1L0lgWPUUTXpIYAVmzzMz5A6gRyZ
	24D2yv84kFLiZb+PFHmpEyLvk7LQinWdWbwXZovFEKPOd9R9ZDir28chjD4cosCPlldM4rJWeQpnD
	ALOMKfYTLc2ijD1+q+f2hOM6noTY0B1YV8TXDLMeA53hU0Iwh3XaAbXEfCx4dwnpSxpXcx+QBHuRF
	5ibU5gX3cATxi+bMQa2ii+J1iRNZbmzrLLZDX5wXp0y07yR8mRmobRQUH0/OQpZEjCT1L2VSpztGk
	xUDXwwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ag6-0000000Akxk-2c6z;
	Wed, 23 Apr 2025 14:02:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aIG-0000000AdAg-4527
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87012614B4;
	Wed, 23 Apr 2025 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F384CC4CEE2;
	Wed, 23 Apr 2025 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745415460;
	bh=KhlYkEqRWOy+NUA8qYmqopvVILH6QfgOFe66Bi46DeE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JhyAb8iG4C5NZlsDnjgyvBm9RfxuzisolYd5qChiFgNy83amnUcie66wIdpJCGLlK
	 fET0xRvjHri7RkCPDSs2bZPs0cBvmYH8gJmWVUennym0MjSW+UbxqHG1k28jRNHdIa
	 zo7R3dRCV4G8W8+eGzAv3zgkclx/N4linJyyF0xTz9yooRzsdXstxXsx8OAiCyuYiY
	 q3A/yI1kbBIEmhW1Zv3skfAHcwzhp1r5W8uFJiHkmOzeWAV0aZ8xJd/vJeeH8H2g6O
	 ZlAX+3/LYpD2KHyyykyHl6Bv+DnM/uj1Myx4Cb++9GOc1RQ+ejno2d91gZqVCp1nDs
	 PHzV5qiQpxc0w==
Date: Wed, 23 Apr 2025 08:37:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 niyas.ahmed@samsung.com, linux-kernel@vger.kernel.org, g.naidu@samsung.com, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, cs0617.lee@samsung.com, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com
To: Yashwant Varur <yashwant.v@samsung.com>
In-Reply-To: <20250423060034.973-1-yashwant.v@samsung.com>
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
 <20250423060034.973-1-yashwant.v@samsung.com>
Message-Id: <174541475597.315167.13886111857775924354.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration
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


On Wed, 23 Apr 2025 11:30:34 +0530, Yashwant Varur wrote:
> This patch adds the ethernet pin configuration.
> 
> Signed-off-by: Yashwant Varur <yashwant.v@samsung.com>
> Signed-off-by: Changsub Lee <cs0617.lee@samsung.com>
> ---
>  .../dts/exynos/exynosautov920-pinctrl.dtsi    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250423 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250423060034.973-1-yashwant.v@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: pinctrl@10830000 (samsung,exynosautov920-pinctrl): 'eth0_pps_out0', 'eth0_pps_out1', 'eth_extpll_avb', 'eth_phy_reset' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: pinctrl@16c10000 (samsung,exynosautov920-pinctrl): 'eth0_mdc_mdio', 'eth0_pps_out', 'eth0_rgmii' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#






