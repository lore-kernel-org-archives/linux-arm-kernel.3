Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8BBC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TD/KY01OZz9Nblu7OOwnsyyP52UC74xQLYOzBZ2uMc=; b=2Mkg55Ad22RC1VFDz1O4PQSMk8
	AdMkw67VCD+1VlOKT15N35CI1sTejssQ93u3WXeBR/8S9Z6GBqgTQVzkFcWwteRFrIaM48S0lpYoZ
	eOnVeo7WYr0mQCQsvrTZYERqacCL3XSuJ/fAILRpRgz1CcVjTdaI8UbDlI3I5cUO7Akw0/SOOoLFH
	M0zDS5gC2gYUBzBgnZCWq7EpvwiW6F3Fuv18laanXIzDo+6dkJ0Zedwd7KmP4xMgU/65k7OrGR1K+
	rkILsdbaB7r5Ah+Ub+qlX+S6lywDMXfTxfyCZ1QZuJyXVZJTza0OiKUj19FgUqfWqkxqV4fSjo0Qr
	m68oKLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5Ux-0000000AC6P-0MQX;
	Thu, 06 Mar 2025 07:18:27 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5Ro-0000000ABiQ-43L5;
	Thu, 06 Mar 2025 07:15:15 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:1dd0:964a:aacd:16c3:d0a])
	by smtp.qiye.163.com (Hmail) with ESMTP id d21cf5a8;
	Thu, 6 Mar 2025 15:15:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
Date: Thu,  6 Mar 2025 15:15:02 +0800
Message-Id: <20250306071502.96949-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <52155b03-20f3-4e64-b636-70042db03ffa@kernel.org>
References: <52155b03-20f3-4e64-b636-70042db03ffa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR0aVkJPGE4fSENNHx0fSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUofH0tBQk1PGkEaGhgfQUpNGEhBH0saWVdZFhoPEh
	UdFFlBWU9LSFVKS0lCTUhKVUpLS1VLWQY+
X-HM-Tid: 0a956a4edab403a2kunmd21cf5a8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mjo6Nhw*MjJWMjwpEkhMUTpN
	KzxPFBpVSlVKTE9KSU9OSEtDT0tLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSh8fS0FCTU8aQRoaGB9BSk0YSEEfSxpZV1kIAVlBSk9PTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_231513_189303_77601874 
X-CRM114-Status: UNSURE (   8.01  )
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

>> Copy QoS nodes and add rk3528 compatible from bsp kernel,
>
> No, don't copy stuff from BSP kernel. It results in terrible DTS.

But there is no public datasheet for rk3528, it's just a minimal change.

> Did you just define syscon per few registers? Third case last weeks...
> so no, define what is your device here. 8 registers is not a device usually.

As commit 3e712a03d0481f7b0c24d961a43e385dcfa78c74 says:

---
ARM: dts: rockchip: add qos nodes found on rk3066 and rk3188

QoS nodes keep information about priorites etc on the interconnect
and loose state when the power-domain gets disabled. Therefore the
power-domain driver stores the settings of available qos nodes and
restores them when the power-domain gets enabled again.
---

I add these so they can connect to the power-domains of rk3528 SoC:

	pmu: power-management@ff600000 {
		compatible = "rockchip,rk3528-pmu", "syscon", "simple-mfd";
		reg = <0x0 0xff600000 0x0 0x2000>;

		power: power-controller {
			compatible = "rockchip,rk3528-power-controller";
			#power-domain-cells = <1>;
			#address-cells = <1>;
			#size-cells = <0>;

			pd_gpu@RK3528_PD_GPU {
				reg = <RK3528_PD_GPU>;
				clocks = <&cru ACLK_GPU_MALI>,
					 <&cru PCLK_GPU_ROOT>;
				pm_qos = <&qos_gpu_m0>,
					 <&qos_gpu_m1>;
			};
                  ......
		};
	};

This is also what the other rockchip SoCs do.

Thanks,
Chukun

-- 
2.25.1


