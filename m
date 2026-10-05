Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BADCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 19:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aHfuEbzIFM5SKQ3RDfYhX0clrFStbhhg1qVmhCdGp4=; b=08JqRcIcoDuslTvzC2lxUVFg/l
	15gKGl7A0qaFhRHBqUb3nnGHTr4ApopKurFVPByzend/PZ3chtshKx3ypz3/8ERQTJ7JoA25bcG9J
	uwva/cG5PtLgxXxP/I1WOdFeKDL4/WvMPnuDEkeJSbGoR5raaR/G5EoYoG/j8aVVdfeba2hNNMs/a
	wDYjd96WQwfJQQ8UNwE9elWMQPTAMwxVAZ/RcsT1U4vQmmf7V23s4OGyYZtPGjWUfXKm9fsEOFeLP
	m/Lf1AdBCpaNDTDkw4LZV4XrKONlKMDWesFEH1f8ow9Z0fQuk+6Jpgqo7T7/hqfybepWjDaVMXfq/
	TZK5jgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDo2B-0000000H2gW-1TMw;
	Mon, 05 Oct 2026 19:07:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDo1f-0000000H2ee-0EOB;
	Mon, 05 Oct 2026 19:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2aHfuEbzIFM5SKQ3RDfYhX0clrFStbhhg1qVmhCdGp4=; b=b7fTSn3qHNbB6auHR+55ZWRdmk
	1X+/mkBx9+EqouJ457B2/K56TPydv4UORugGm2WssBPazNa4r/s/+KaGH4WDX0Yj/tLcx1gv5BOZg
	RDOOGVBjHJ4o4YRTyWGAM12C65BD4uWpZxgZ/RpHUfnLoFivqj8DSVThJ2uUQoiX2Mn1aTyIX4mF/
	MjHXpDlb97x7kG7nkdcz9f7s3oOjEJVGiO0mncrX7WDXRhFACp062tEH9HbPqmfls1E5cRxiYjKjj
	oifUjKTGQs18V2IGQJ3pm/TTdS1DK56oLxk/OFZOZ17UU9w7GNU4W9nOayBDq0158CpaGnvHB5pUx
	N5p00AhQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Mon,  5 Oct 2026 21:06:52 +0200
Message-ID: <179122712926.3317128.11498761891958238263.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_120703_096535_43803E2D 
X-CRM114-Status: GOOD (  13.76  )
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


On Tue, 15 Sep 2026 13:56:39 +0200, Amin Gattout wrote:
> This series adds the device tree binding and the SoC nodes for the
> MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
> same Synopsys DesignWare IP as in the RK3568 and the register map is
> identical, so the existing driver is used unchanged via a fallback
> compatible.
> 
> Only the two receivers fed by the Innosilicon D-PHYs in full mode
> (MIPI1 and MIPI3) are added; see patch 2 for the details.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576
      commit: 5a610d237f689cde0a37a8fb3fb7c5a47fef0f84

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

