Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AFCCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cohGyrI8Y3v/PqbDB9uGb+gGhgPNrHZHAkMH44mrP7M=; b=X2AygwE9BoYyCRdH56Lr2YQKCN
	ZyVpKZtOpXUyQFMHzmvOX7oZNIkA3uNttHNIjzcwm/NHnJLuqFWng5FvmPAzz9bds3g98uot0NBiN
	9mQQSEImpuWrA1geqQOGUpkp5qOcUfexjxsfRcJTeew/WQHEzdjfF87/RI4HEf0+CgFOmqO2GG+5+
	j7QqQXZREY8P4EjVKKqMVgqLhuxunI3CkfajNFWGbNyByJQOUuBkKjfyQWOLFqq8kD/jp1g+7Sw66
	JwYRI77S1GllkR/qn9y3vOwaKQMmW4odbiDrnoUNufTxSDjwslhyFX1svhIS51yoxQBKGEusZSyoG
	xfgt8e3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yd-00000008s50-2gyH;
	Tue, 09 Sep 2025 17:17:55 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxxJ-00000007ElL-1W6z;
	Tue, 09 Sep 2025 13:00:18 +0000
Received: from localhost.localdomain (unknown [119.122.213.41])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2236a7739;
	Tue, 9 Sep 2025 21:00:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable PCIe controller on Radxa E20C
Date: Tue,  9 Sep 2025 21:00:09 +0800
Message-Id: <20250909130009.2555706-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250906135246.19398-4-ziyao@disroot.org>
References: <20250906135246.19398-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a992e9000b703a2kunmf083b8f4a90bb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUxCVh1OT08YQk9JTh5MSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVPSllXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1
	kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_060017_566555_C7D40812 
X-CRM114-Status: UNSURE (   5.62  )
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

> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pciem1_pins>, <&pcie_reset_g>;

The pciem1_pins contains PCIE20_PERSTn_M1 (GPIO1_A2)
This will cause conflicts, "pinctrl-0 = <&pciem1_pins>" is enough.

[    0.115608] rockchip-pinctrl pinctrl: not freeing pin 34 (gpio1-2) as part of deactivating group pciem1-pins - it is already used for some other setting
[    0.191042] rockchip-pinctrl pinctrl: pin gpio1-2 already requeste by pll_gpll; cannot claim for 140000000.pcie
[    0.191949] rockchip-pinctrl pinctrl: error -EINVAL: pin-34 (140000000.pcie)
[    0.192570] rockchip-pinctrl pinctrl: error -EINVAL: could not request pin 34 (gpio1-2) from group pciem1-pins on device rockchip-pinctrl

> +	reset-gpios = <&gpio1 RK_PA2 GPIO_ACTIVE_HIGH>;

Missing supply: "vpcie3v3-supply = <&vcc_3v3>;"

> +	status = "okay";
> +};
> +

Thanks,
Chukun

