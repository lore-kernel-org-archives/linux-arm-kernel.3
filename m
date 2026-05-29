Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9F7CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Sv2oE3HgaJ8ddF5NqbbcxzHXn2MsOd3Do0wBQ5O3ng=; b=PKTiU3k6RTPOMuxArTqxqlUksy
	ONpRzX31urCFLgN6pIktIFkXlYnCRcFdP3sT2cftJhrve3q42RJ0Kp3o6nzjFisO4gKznmwprSufg
	lOWpfcygwI8JdWWlJcC6lCWNvhEjR60YYDV2Y40r/igPTAkzuli/til2oDDT6KPHMnVUJn+OaKACC
	8dwqFxKnKzhfmpZ23oiEJ9/7PXeeYPuzS5RaNJAo4I+EEkBbvH1Obl3WVwYOd9bBr5SrbyQhpZKcs
	smQkcscrks422FM+gRlvUzedcBeMI2RJPLq7keWlgGVFlq0B1EgCpi0xbgzustVmcm5d3oF0RUqsi
	A1fY4SHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSr42-00000006qCr-2xoH;
	Fri, 29 May 2026 06:51:26 +0000
Received: from mail-m24116.xmail.netease.com ([45.195.24.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSr3z-00000006qBl-1Yif;
	Fri, 29 May 2026 06:51:25 +0000
Received: from localhost.localdomain (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 404a795bb;
	Fri, 29 May 2026 14:51:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
Date: Fri, 29 May 2026 14:51:00 +0800
Message-Id: <20260529065100.554468-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528232358.4054610-5-heiko@sntech.de>
References: <20260528232358.4054610-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e72803b0303a2kunm5b7351cbaf12a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0oYVkJPGBgYQx9NS0xLGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_235123_641403_5D6645C0 
X-CRM114-Status: UNSURE (   5.54  )
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
> +	vbus-supply = <&vcc5v0_usb_otg>

The semicolon is missing at the end.
It should be located in the otg node:

&usb2phy0_otg {
	phy-supply = <&vcc5v0_usb_otg>;
	status = "okay";
};

Thanks,
Chukun

