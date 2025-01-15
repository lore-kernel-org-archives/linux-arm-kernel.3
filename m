Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18B7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jxtWaTfyuPELfAYiVdvRvexrsuWUFdvu8wgS2c9QwY=; b=0gk510DP2ZNuVFX8Sz/lzCLMlh
	RENGOcJh7BoADqZ8KT8ufl81VWsPeHFyH9MNelVqqk/6e5T6OksrPkmFgbP2hBVYdhPwu0RtOcyvM
	tx/bLRnNygMTZZa5f9mwMAxgc26yswpbB5hdhQ1mEPAUWeKOU/QbzDZJbMPKsJg3P1yuQDMd5HB3g
	ZlbZrZ3okdKodd09As9rmoh5qiAoozh/u+CzX53gUkJ6vEBk1hm8Us3kSGnlD3tm4O7Ymz9zRCQGR
	mozQiufQ+m5Ex5/kse+G+TZXDbBOnU9mHbuhPLvupVRliJi9QGQbcBooZJsJ+Cxy8rx/EUat+Hj7J
	B9lkc2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtC4-0000000APus-3wjX;
	Wed, 15 Jan 2025 02:31:44 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtAn-0000000APmA-3Q3r;
	Wed, 15 Jan 2025 02:30:27 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:1f0::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 8b615223;
	Wed, 15 Jan 2025 10:30:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: bigfoot@classfun.cn
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v7 3/3] arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
Date: Wed, 15 Jan 2025 10:30:18 +0800
Message-Id: <20250115023018.15353-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114001411.1848529-4-bigfoot@classfun.cn>
References: <20250114001411.1848529-4-bigfoot@classfun.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0NPVhlDHx5DTkhJSh5NSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUodS0FBSllXWRYaDxIVHRRZQVlPS0hVSktJSEJIQl
	VKS0tVSkJLS1kG
X-HM-Tid: 0a9467cc2b3f03a2kunm8b615223
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6Sgw4EjITNU8OTipCOA0p
	TSwKCQlVSlVKTEhNQktDSUlJT0hPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSh1LQUFKWVdZCAFZQU1IQjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183026_020572_8EF64BC0 
X-CRM114-Status: UNSURE (   6.03  )
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

Hi,
> [1] https://github.com/photonicat/rockchip_rk3568_kernel/blob/novotech-5.10/arch/arm64/boot/dts/rockchip/rk3568-photonicat-base.dtsi

I don't think this link has reference value. I was misled
by this several times when I wrote dts before.

> +&pcie3x2 {
> +	max-link-speed = <1>;
> +	num-lanes = <1>;

I'm not sure about this.
This PCIe3.0 x2 is not split.

> +&sdmmc1 {
> ...
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_cmd &sdmmc1_clk>;

pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_clk &sdmmc1_cmd>;

> +	wifi: wifi@1 {
> +		reg = <1>;

No aliases needed.
Other parts LGTM.

-- 
2.25.1


