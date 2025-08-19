Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC42CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJV/5RPaWGgc98oNUSkouDfULr+CWm4sm+LX0R1P6/M=; b=RhWXOW2gUdIavPNNwkGwc3OoVA
	XzQC+dTeY0V5UgtdHc1+4iG6cOXmf3+3Rg2GYtdZTxfRV6dKkPEGRcIzT3Yphh76lgvgfBZzq64Fw
	UWC5y7X+kZYVgqUPl0X/S+89c7a5tZweW3ie6jKWZ2hO4kb35+/2FNKeP7KLJ+6aQnYW2W0ltRzPx
	nbjIZCVcW/y8aMvyheDBm7Hih7eHDNgzz99SHrFCkkkxvquaB1pDRTwM7BHqLQodXlST9oMvsQ7F9
	j5FBZOQeCgOS1F1qwtX6wm+bN0CZDUBWMrWOZTlNlDdJqHaEoIvaluZqXRDVlEmQ2q8lxkTGeTc+H
	OQv1GjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRxW-0000000BQR4-08JO;
	Tue, 19 Aug 2025 19:25:26 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNpW-0000000Apa5-1ts8;
	Tue, 19 Aug 2025 15:00:56 +0000
Received: from localhost.localdomain (unknown [119.122.213.154])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1fe57a9c0;
	Tue, 19 Aug 2025 23:00:50 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: naoki@radxa.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: update pinctrl names for Radxa E52C
Date: Tue, 19 Aug 2025 23:00:38 +0800
Message-Id: <20250819150038.874297-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ABB74D9D1E3774F3+5a8c0d7d-fb7f-47c0-8308-e2b69f0628c1@radxa.com>
References: <ABB74D9D1E3774F3+5a8c0d7d-fb7f-47c0-8308-e2b69f0628c1@radxa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98c2d8e14303a2kunm2a21c9924065a4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTk5KVktPHUlPQkJLHkJNTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKTk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_080054_679488_79F70143 
X-CRM114-Status: GOOD (  11.30  )
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

> "The name of a node should be somewhat generic".
>
>   https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst?plain=1#L193

Usually we use the name on the schematic. For example, the patch for e24c:

https://lore.kernel.org/lkml/20250727144409.327740-4-jonas@kwiboo.se/

```
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio0_a0_user>;
```

If this is incorrect, I will abandon the pinctrl changes for
the user key and power LED.

> > -		vcc_5v0_pwren_h: regulator-5v0-1 {
> > -		usb_otg_pwren_h: regulator-5v0-0 {

But I don't think the above is correct.

>   https://lore.kernel.org/all/20241216113052.15696-1-naoki@radxa.com/T/#u
>
> (I don't understand why this only applies to me...)

I don't know this. I thought the nodenames of pinctrl and regulator
were a bit weird, so I changed the pinctrl's.

Thanks,
Chukun

--
2.25.1



