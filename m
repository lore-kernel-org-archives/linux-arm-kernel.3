Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AEFCD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L47rZqzW3wKWtZXD0HqmJCzLXnaZIJ9EkrReHB9BEA8=; b=AmuFfaxL/BJ8pDMEc8O7yqiTrf
	8cHITJ+nBk1nxrq/07LsugTJ/6ZBdONa/9LIaCFzvF2he8bc7DTF2Ilia4vlk5biWqNYBRvVluLKe
	1QAGP2dOXvyRsy0DTQZ23ofrTXT5tWSt1owRNDaxweEvtJqFtFPgytH5ywGpx6O+Xl0MiVXzo+se7
	R2cKKioaJO4Kj+qXL+ztj0eXY3OzLgUKzRIWqC3k3P38LKBLwIaOh1aP7on5dMIjkegKbFRY8+Joe
	80dPhzyCeUChc4p0qKK4Ogr1zZi5jqBTaE/Y6PT7KMcmpipeumtg8kG7XdPymToctpjA26YO+BI7H
	IdyJeSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPId-0000000GU03-1lPu;
	Mon, 25 May 2026 07:00:31 +0000
Received: from mail-m17234.xmail.ntesmail.com ([45.195.17.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPIa-0000000GTzH-0LUo;
	Mon, 25 May 2026 07:00:29 +0000
Received: from Vostro-3710.. (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fae795b2;
	Mon, 25 May 2026 15:00:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
Date: Mon, 25 May 2026 15:00:10 +0800
Message-Id: <20260525070010.1060602-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505171208.3267387-5-heiko@sntech.de>
References: <20260505171208.3267387-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5def463103a2kunmd5eb258ea242f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSh4YVhhJH0tOHR1IQxodQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_000028_324512_6CC4B2CC 
X-CRM114-Status: UNSURE (   4.73  )
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

The same warning for this otg port:
[    0.232211] dwc3 fe500000.usb: Configuration mismatch. dr_mode forced to host

> +&usb2phy_otg {
> +	status = "okay";
> +};

OTG port missing: `vbus-supply = <&vcc5v0_usb_otg>;` [1]

[1]
https://drive.google.com/drive/folders/15uvc2lcOAKP0enXezASUhVFLuzkq3IEX

Thanks,
Chukun

