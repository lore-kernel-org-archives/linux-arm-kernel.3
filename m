Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54DCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY2AM7lW9609eu5wCP0vjZkmvDxxpLcxxBG8dpZSjRg=; b=00HfHnSxT9+U6HN0NNucgy51l+
	n7anvkphblzUW8b0NQLNvR16TVVRITd66oK50D7g/OJqvNi1FY1Q+lg2NWmro3NnCY0VyyFUxqstn
	aRYPp9okXWVMsvyA229QPWtPFWi8iKTf/dNT/DsHbhAk/JQhO+UnkWhKvNhlMrNiwGuKeLz32SF9D
	NA9w2qoaoT60dbkLfMl7clR8/F/UXvEQxTgteGq89crfiTtjBhQL37gmozdAl9/cE3SMBhMQfkIfi
	WjLYw4a8xncfGunV+ql3+3w8ElIUWzD0zcnU9vgA5o5XkVTu7+zMYFlX9DHVZ65k2mUVDeqR7SyB1
	a2wBkljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2lOU-0000000E1jt-3Vr5;
	Sun, 28 Sep 2025 07:00:26 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2lOQ-0000000E1j6-3H3J;
	Sun, 28 Sep 2025 07:00:25 +0000
Received: from localhost.localdomain (unknown [116.25.94.74])
	by smtp.qiye.163.com (Hmail) with ESMTP id 24516f395;
	Sun, 28 Sep 2025 15:00:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: disable display subsystem for Radxa E52C
Date: Sun, 28 Sep 2025 15:00:08 +0800
Message-Id: <20250928070008.74952-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <10594621.0AQdONaE2F@diego>
References: <10594621.0AQdONaE2F@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a998f1f3aa003a2kunm5258a7bd3278d3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUkaVhhKTUodT04eQx1MSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VTE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_000023_045573_F10474ED 
X-CRM114-Status: UNSURE (   8.80  )
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

> I'm torn on the approach vs. just removing the error line in the driver.
>
> Returning -ENODEV from rockchip_drm_platform_of_probe() is correct,
> but the error log could just be a debug one instead.
>
> Because running a system without active vops is obviously fine.

We have disabled the display subsystem in the device tree for some
rk3328/rk3568 SBC. Not sure if drm allows silencing this log, I'll
try to send a patch.

Thanks,
Chukun

