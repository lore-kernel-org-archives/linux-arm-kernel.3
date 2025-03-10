Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5A2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osP0BQU6T5iMwY/fvi1GgrCzrRtrV4I2Y0UrmKJECpk=; b=Fh23jVgSHMiZZAD/KgLuxc630Y
	StAJZM1T72b+QjUCG0msL4018uN57lhf8sbRPG6Qlwe1mCRazUVFVLmWgTnsrHNw5Kf+v3bTJTkKY
	cETFQWZn91f7b5yKjc3R1NIDt635jBWnWO9WTPH2q12N6Z/oCHO5OFj5txbWIWPCk5LepBSgzhVFM
	dRf7oqUZi17H6zPMSPdPI8uTSYakB1zSQQm5BIUq/eoHDg+aMP40noliUb10hcdGayEcucV3r9l6b
	/Uc2olUa1CPc8EqtVJ1gDgHPDzOI7W4AxmslcF+1IixAiy+XKgMxweAx86R9gQRo/zARi4Gz95FUX
	vi9IZTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trX9Y-00000001hY8-0JyF;
	Mon, 10 Mar 2025 07:02:20 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trX7t-00000001hMx-3kYp;
	Mon, 10 Mar 2025 07:00:39 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id db8a14d9;
	Mon, 10 Mar 2025 15:00:28 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	andi.shyti@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
Date: Mon, 10 Mar 2025 15:00:23 +0800
Message-Id: <20250310070023.52290-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250309070603.35254-4-ziyao@disroot.org>
References: <20250309070603.35254-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGk1MVh5JGBpMHU8fSh5MGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a957edae03603a2kunmdb8a14d9
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pww6CRw4TzJCGCwCEwM5MREr
	OkswCk5VSlVKTE9KTkJLS0lCSk1CVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU9PTDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_000038_101295_D7E6B68D 
X-CRM114-Status: UNSURE (   6.00  )
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

> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m0_xfer>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "belling,bl24c16a", "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		vcc-supply = <&vcc_3v3>;
> +	};
> +};

This eeprom stores the device information written by the manufacturer,
such as mac address and sn. So it should be marked as read-only.

Thanks,
Chukun

-- 
2.25.1


