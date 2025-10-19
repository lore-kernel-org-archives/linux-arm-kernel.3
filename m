Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2255CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1J3gPqMHpX6saWyMtO+TdHzbExLK4+Ng14TD3HYQ4k=; b=SqIDHAtzu7Ga1dFU5f8Asnyo/L
	XHg8NuCZuGs1dgIzSH4EPgrUZeq4WP2JTat1gKL6X5RjgqJJDmdeh9mFEzgp48Qi2F5kKPloGuM99
	lGucCauLx/RtEZwXIRd2q2rGW48EKmDuk1TiqODa0ZkfvOztBJ6bwOp1+R1rKGv7OR+mR437F1Sru
	RQSespw+EzRv0zEsohTdQEAkMNcYFe6VfNYuTH7896QPW1XJCQuGTgrrL8Yb4ogdIsR4t9ktpKVGH
	ZiROYbJyfz7wORGMwvKhJ+hVuwBrrM52tYq/cZTBXEy5q8DUig0Jdjeg9q/t5xSPen8IC6eeWjVfD
	pHwANteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANC9-0000000Al2e-096z;
	Sun, 19 Oct 2025 06:47:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANC8-0000000Al2Q-0j8I;
	Sun, 19 Oct 2025 06:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49A3D60250;
	Sun, 19 Oct 2025 06:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AEBC4CEE7;
	Sun, 19 Oct 2025 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760856408;
	bh=+a+2hCN0GD5orS5JrZMFWqnSdCPfMOObGECdOlF/YN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TMqNhywCW0j0gr+EVC6Q8qsF30M2Gyvdxr11ywRpofXBeFofDxgeupde2Zp2j0hag
	 PU3jp4JzMkkaDx07u16quNHT0hyGYr2GVQsGJloGcoyOON29mN1E3tQVeRlcVYP8wI
	 1LHai7ybNXEMzZ9+F0/A3IEa5+Br/LLChYULjhDGs6ySp5JLF5gs+FuK97gV7m5cZg
	 4H5JHZbJ1Gidk9EB/BxiuDcyPza9Lh4O1Fr4IxVmk+12xte/wWWJgXQh0Sy/mAdvN2
	 pkp6MXFgt+U3uEoTmgS1nctWpJJnfasbbFsfUvFzj+XY8AcB8SYd3XjTnFyCCZ5eR0
	 9+6y5b/x0xR6g==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
 Yao Zi <ziyao@disroot.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
 Chukun Pan <amadeus@jmu.edu.cn>
In-Reply-To: <20250918153057.56023-1-ziyao@disroot.org>
References: <20250918153057.56023-1-ziyao@disroot.org>
Subject: Re: (subset) [PATCH v2 0/3] Add PCIe Gen2x1 controller support for
 RK3528
Message-Id: <176085639822.11982.1205401883779675228.b4-ty@kernel.org>
Date: Sun, 19 Oct 2025 12:16:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Thu, 18 Sep 2025 15:30:54 +0000, Yao Zi wrote:
> Rockchip RK3528 ships one PCIe Gen2x1 controller that operates in RC
> mode only. The SoC doesn't provide a separate MSI controller, thus the
> one integrated in designware PCIe IP must be used. This series documents
> the PCIe controller in dt-binding and describes it in the SoC devicetree.
> 
> Radxa E20C board is used for testing, whose LAN GbE port is provided
> through an RTL8111H chip connected to PCIe controller. Its devicetree
> is adjusted to enable the controller, and IPERF3 shows the interface
> runs at full-speed. A typical result looks like
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: PCI: dwc: rockchip: Add RK3528 variant
      commit: dfbf19c47a01eda5df4d476d64a273e1188ea5a1

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


