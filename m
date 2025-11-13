Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94491CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/jeS8R2INGgMyMRHYo8PH31xZ8F+hej1l6sBG6zsic=; b=E/pDwwKHqmiJduTaE1yGWS8B1P
	n8dgQY3A8v0alhU3fjQXeSQvOfbf0It8md1tS+pqkcdJplmsMDLnGYIOo/CMxp2cLCS9YzFaNwpjk
	mbEw58JAkIYxMh05hFEu2a+bTYIXzt3ANbIdJNDKCVaf8G77UP2mPFALJ01Aaik1SXC/mQWFC2Yez
	c63eJcf7xoy9iBnIgdEPINq+9NwrJH3IG0yEGZzODYDwXwhCXTP42he/ewVtOEh6GBTQhAO6O0Zvp
	/hCZ1yyvk73bCqtU02+m8HmQMgg+yVpJUL3r2BffcRffj07JkCSre1Crc9/uK8shnm63iplr1+8dJ
	5sfnP0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWwU-0000000AVPV-1Hbm;
	Thu, 13 Nov 2025 13:00:50 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWwP-0000000AVOn-2lRy;
	Thu, 13 Nov 2025 13:00:48 +0000
Received: from localhost.localdomain (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 297bea02c;
	Thu, 13 Nov 2025 21:00:35 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4
Date: Thu, 13 Nov 2025 21:00:21 +0800
Message-Id: <20251113130021.822765-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6F2972A5-047F-48A5-B409-C3F3E71643AD@gmail.com>
References: <6F2972A5-047F-48A5-B409-C3F3E71643AD@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7d4db1a103a2kunmc0f785fd12ff7c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQx9JVhpDGk5CQ0lPTEMeGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_050045_881606_1AAE3659 
X-CRM114-Status: UNSURE (   6.39  )
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

> PCIe and MIC picked from OEM source codes.

I know it comes from BSP code, but it's not correct.
A PCIe 3.3V power supply will not have a 0.1V situation.
Rockchip fixed this in their kernel a long time ago:
https://github.com/rockchip-linux/kernel/commit/17e9559f67d26f3c602e38a24feb5194e51ac782

> Since parts of the OEM source code are not available in mainline,
> I refer to other boards (e.g. RK3568-EVB or RK3568-ROC-PC), but
> I don't have a camera or screen to test, so I mark them as demo.

These things may have been brought by rk3568-evbxxx.dtsi, and may
not actually exist.

