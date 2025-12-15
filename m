Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22AFD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VsYkPqVn11djoNpxIXUqfR5nF0llqUA37rnKhEinx4=; b=x3AesOrUkHEgWbGeCjJZqLwnLP
	7JP7ILW/GXfQVALX2G9kQHhOSJMF3rhy4WL+x/YqcyjjPUqtIn0J2B0DoB2XMr8ZyNm0tKDWEnad+
	XPLPykWuv9mxy6CXqyxzYtMTSb/qbIoTBrx9D98cTaUm0AjFx4vCaHa2Q3h10qMGW1vREmv8ExGey
	QQjp3i3ssZVOAWjXNoSS1iwWjS8JEsXDiEeH2yKYkgIuWQSkXkfSWKYP0xuxqzzVKOmNjWN5i7NRu
	U7VbWBPApoprEHO6W81z6vcF6XDHOOpxOCPBiXxdW6BX4id0UCdSVSy8xxY7VyUZR2J4TF6o1l1DZ
	0yxrNDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV73E-00000003YY4-3DzF;
	Mon, 15 Dec 2025 11:47:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV73C-00000003YX9-2FX1;
	Mon, 15 Dec 2025 11:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8VsYkPqVn11djoNpxIXUqfR5nF0llqUA37rnKhEinx4=; b=F/p1CudFDrVHOofWOv20shOQyS
	f0fpEFf5Fa6wJ4KVenEC6dVqcRKJ3rav/K9qlM5OGR02NhAqcPHKZSqkeZ1tw3PKYAbgP0clLvzKk
	wlgCUYQ4wh59jNqetJMkzXa/T7IiRHGrrMaczWlkcG6Cici4HRw8LtN0mOMSJEDc+1aH8mo4LnHit
	2FBKXUc7WsrnhvxpErJ8m3rhJyhehz8yuc6DVnsE30myirz8/CUQkZnJiEqbSPNltUuAAOnpHQyB9
	oNOOl9Y2qTe/wH4fzWXUDNcdMHsG5aFMaRnjhnBmgtyA50aCuOHN3hFigkk0sIsUZUmtDWuGSysEs
	+UbZ1pCQ==;
Received: from [192.76.154.237] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV739-0000On-NN; Mon, 15 Dec 2025 12:47:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add overlay for the PCIe slot on RK3576 EVB1
Date: Mon, 15 Dec 2025 12:47:30 +0100
Message-ID: <176579924021.1404176.5086927047208846310.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251202-evb1-pcie1-v2-1-810693b1b72f@gmail.com>
References: <20251202-evb1-pcie1-v2-1-810693b1b72f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034738_570079_EF60E4EF 
X-CRM114-Status: GOOD (  11.08  )
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


On Tue, 02 Dec 2025 13:54:31 +0400, Alexey Charkov wrote:
> Rockchip RK3576 EVB1 has an onboard PCIe slot (PCIe 2.1, x4 mechanically,
> x1 electrically), but it shares pins and PHY with the only USB3 Type-A
> port.
> 
> There is a physical switch next to the slot to transfer respective pins
> connection from the USB3 port to the PCIe slot, but apart from flipping
> the switch one must also disable the USB3 host controller to prevent it
> from claiming the PHY before the PCIe slot can become usable.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add overlay for the PCIe slot on RK3576 EVB1
      commit: 47b5d3697f6b9f53a0db30a99656a2f8f919e246

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

