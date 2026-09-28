Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5939CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=572ZApzffR2V5WVZZG923BXMb95uxq8rXlHIXJhmvi4=; b=ehIQTZOFYJGrTYKek+BJjR10rD
	NPG3ufACEIjPoPFcz8y9ym0qCytpii5zWsepeeIAyp7MPPynWIWJBLff7U+6msJVbX2CofRit93xF
	xthUATPRmkWNp51gjut4eb7UaSaNhw85gi5Uu0ppx3USrl2wI8YcO+FSMbVyo/4X5D1bfDGDjHmBH
	kHxxUdungulY+hP6D5wC7AMOKd630SOLrkLUhc/R+WUWftXryXwoh1Y6ElSPa6pOtaHUTtbs1TZvd
	WZH0gYTyoqd1vAvXlnLP12Saug87AvNdpNAzPAMKyBU2BT5JUWvgS9g2RtnYCQdpJKagMpDeSLXdC
	RIWB/afQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1kr-0000000HELt-3LRg;
	Mon, 28 Sep 2026 03:10:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1kq-0000000HELd-0Ikz;
	Mon, 28 Sep 2026 03:10:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2587D42A4E;
	Mon, 28 Sep 2026 03:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4031F000FF;
	Mon, 28 Sep 2026 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565011;
	bh=572ZApzffR2V5WVZZG923BXMb95uxq8rXlHIXJhmvi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e5D282Bw7e+LCL3BfaBn/xHL5axhjK4+/hI1+KnHpF0fOc4M9VGiMkah8tqedfPPl
	 4VozO5QljckrQqi8d0htX/SoPJlvWkhnhUZYftpsleLPSrpkm19v4PDxW1CzQfvcEI
	 vDlTuAQ30QQ7t83WpGIWk0dgxvid1/E1R01F0+s1m5/lpAf311A+12PDXutGyY3ySF
	 y8/WERcDxVbsK1VAZBfzo4ai8jbwwRtZApBBw0wZwMKn6B589YPSX9y97ceVN87k4O
	 u2invxepd54ZbZSaXlzT5kqIp5XK1U8UbNev8wcVzBZdFcoBOesOvJYB4qAGxkQiLq
	 bdH8j9IeCzd4w==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
 helgaas@kernel.org, heiko@sntech.de, yue.wang@Amlogic.com, 
 Hans Zhang <18255117159@163.com>
Cc: pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
 jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, cassel@kernel.org, 
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260911162537.469018-1-18255117159@163.com>
References: <20260911162537.469018-1-18255117159@163.com>
Subject: Re: [PATCH 0/2] PCI: dwc: Clean up DWC PCIe register macros
Message-Id: <179056500511.302500.18235445992989185257.b4-ty@b4>
Date: Mon, 28 Sep 2026 05:10:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Sat, 12 Sep 2026 00:25:35 +0800, Hans Zhang wrote:
> This series cleans up the DWC PCIe controller register macros to better
> match the Synopsys DesignWare PCIe Controller Reference Manual, and
> removes an unused set of iATU unroll register definitions.
> 
> Patch 1 renames various register and field macros, dropping redundant
> PCIE_ prefixes and using documented base names.  Field macros are
> renamed consistently so their register association is clear.  No
> functional change intended.
> 
> [...]

Applied, thanks!

[1/2] PCI: dwc: Align register macros with Synopsys documentation
      commit: f29719b5064c07cec23c928055df302181374df5
[2/2] PCI: dwc: Remove unused PCIE_ATU_UNR_* register definitions
      commit: 4996364a46e738cc455f5fa9b8b09f2f3348bcc9

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



