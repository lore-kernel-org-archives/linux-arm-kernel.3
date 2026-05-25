Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02F0CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oxXIdwc7ZtwLd4S0smSplFJ+B2p+5knfkqrOw8dz/Y=; b=nTcvKba6v9AAmLg0c8Vi18VNE7
	jiYy9PNGzMA/ZI75fZ9zeUDwrBm+2BqWOaVOxamr+d9fLv/ublMIHHDhts+r4PSnyopdU/EunIwVb
	+A9ndx/Neo0oKjT2skE4L+rhOGivjllBxthWK1XLlYKkIIttWffQ7Ppvkr6P8PrVrQ4rGGVeH1V9p
	4QN65W+DkA/HSG6Y3iCQfNpDbIWNGKvAcs90RnWmXRUuWjQHyqNam1VQTgaHhkShyqg/oLl8A0YnN
	wa1TYOQ6nisPI8IU5D46YVshwcULI210v/PpK8AmkPrRCRhwgVmAUBJ+/Tep8QM2TrHUhEoHENEiI
	WuaNgKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP8r-0000000GSb2-1UKk;
	Mon, 25 May 2026 06:50:25 +0000
Received: from mail-m93134.xmail.ntesmail.com ([103.126.93.134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRP8n-0000000GSZd-3dmN;
	Mon, 25 May 2026 06:50:23 +0000
Received: from Vostro-3710.. (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3faddbbba;
	Mon, 25 May 2026 14:50:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
Date: Mon, 25 May 2026 14:50:05 +0800
Message-Id: <20260525065005.1056845-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505171208.3267387-3-heiko@sntech.de>
References: <20260505171208.3267387-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5de5f50303a2kunm593068b6a1b50
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR8YVkMeT0MeGRhCTUMaT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_235022_122381_76319551 
X-CRM114-Status: UNSURE (   6.25  )
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

> +&usb_host0_xhci {
> +	extcon = <&usb2phy>;
> +	maximum-speed = "high-speed";
> +	phys = <&usb2phy_otg>;
> +	phy-names = "usb2-phy";

I received this warning for this otg port:
[    0.163307] dwc3 fe500000.usb: Configuration mismatch. dr_mode forced to host

> +	snps,dis_u2_susphy_quirk;

This property is missing in the sige1 patch. Since this property
is related to phy vbus detection, can we move it to rk3528.dtsi?

Thanks,
Chukun

