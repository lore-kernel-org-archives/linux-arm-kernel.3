Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B58C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xa+W0+nTBU0c6F8sFcF/hT34zHg602fMzBdPJq8+4U=; b=pi1XWvQfOl2P4Q7Yq6Fsa7FdN+
	sSjPUMszsF62hWQhYeNQAxk8Wz/aL2gQy+QZAquNyGWsZvPNY4eXfMYR5pn5xPeCL2FkfeHfogw3p
	Q/hyy2QbN3Ip1l+X0Am1TpWavNq5pA17ekiBho0bycLDuTIE9rpD7p94hLVGUTB0SvzutlmHDC9h/
	ixGC43XDOZSoYlAzm+YmKRPr3IlBGQY6pKkVvl3VzhpkCSylvjLC3hvjQhlG5N5svCr0MG1TF+oKF
	Tl5QjOvt2qc11N3lgI/pTTtA6MCqMhzbYWgJBgw7xGoulAqzcHT72/Vxzb5Y1OL4ZhJyqj57/ncQ/
	R13LzdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4UH-00000001TfM-1im2;
	Mon, 17 Mar 2025 07:02:13 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4SZ-00000001TD6-2PP4;
	Mon, 17 Mar 2025 07:00:29 +0000
Received: from localhost.localdomain (unknown [116.25.94.202])
	by smtp.qiye.163.com (Hmail) with ESMTP id e81d55a5;
	Mon, 17 Mar 2025 15:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	ziyao@disroot.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
Date: Mon, 17 Mar 2025 15:00:02 +0800
Message-Id: <20250317070002.707674-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250228064024.3200000-4-jonas@kwiboo.se>
References: <20250228064024.3200000-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0IfVkpMGBkaSEweTB5KHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUtJWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a95a2e7360503a2kunme81d55a5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46TTo*LzJPLgwKMDMCKhRK
	OC9PCxlVSlVKTE9JSkJPQ0pMTEpMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VJS0lZV1kIAVlBSkpITzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_000027_816009_D8BD8AA8 
X-CRM114-Status: UNSURE (   7.43  )
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

> Add gpio and pinctrl support for the 5 GPIO banks on RK3528.

https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/blob/rk3528/drivers/pinctrl/rockchip/pinctrl-rk3528.c#L204-L207

I noticed that there is a little difference between u-boot and kernel
pinctrl driver. Does kernel need to sync this changes from u-boot?

```
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 930c454e0cec..c77d9a6cd535 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3070,6 +3070,7 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 
 	data >>= bit;
 	switch (ctrl->type) {
+	case RK3528:
 	case RK3562:
 	case RK3568:
 		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
@@ -3100,6 +3101,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 
 	/* enable the write to the equivalent lower bits */
 	switch (ctrl->type) {
+	case RK3528:
 	case RK3562:
 	case RK3568:
 		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
```

Thanks,
Chukun

--
2.25.1


