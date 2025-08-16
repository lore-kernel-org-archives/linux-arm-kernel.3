Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35688CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cUDfQC9YqwP+C2A5oFWSlcOLHtawQuWmuGa/avcL5uQ=; b=mySavdS9A6kNvi5f+AgtWdVC+j
	J/pdNrVXl2bI7O6S8QHZdDF/UgPLnGlLrYAsY7CZ54Xo3MpcOfwyNvMKidu0gR4kMmD5efQHBjlsJ
	ZfxopwBl2swxwnGX8Fe8tHF0zM/HOcpf69LKGos8FYn31L0wHJMil4udqDoZtq/cCwJf2Ok+sclp1
	iuZPXjKvhTM+MLIppiEa5pSZW3DRPpmLYKu6/AhQN0jbADOa36vwif8s3iYh69Yh47DRH+x0dLg6y
	5PzNw32VEJx/XCs3erYzPnVDIWfYUDNDIuKLylqACfnTa54zDUv05xiA/Fwk23C09HqvXosWAV8S6
	yAwPa0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBso-00000004Gq9-3xKX;
	Sat, 16 Aug 2025 08:03:22 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBqG-00000004Gep-2MCe;
	Sat, 16 Aug 2025 08:00:46 +0000
Received: from localhost.localdomain (unknown [119.122.212.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f93a30c3;
	Sat, 16 Aug 2025 16:00:38 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: rockchip: update Radxa E52C support
Date: Sat, 16 Aug 2025 16:00:27 +0800
Message-Id: <20250816080030.183931-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98b1e51b5303a2kunm56d2169525b6f6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkhCVklCHRofGEpITUMaGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVCWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_010044_790876_39CA3A96 
X-CRM114-Status: UNSURE (   4.95  )
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

Changed from v2:
  Remove merged patches
  Remove VCC_3V3_PMU for Radxa E52C (new)
  Update pinctrl names for Radxa E52C (new)
  Update commit message for disabling display subsystem

Chukun Pan (3):
  arm64: dts: rockchip: disable display subsystem for Radxa E52C
  arm64: dts: rockchip: remove vcc_3v3_pmu regulator for Radxa E52C
  arm64: dts: rockchip: update pinctrl names for Radxa E52C

 .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

-- 
2.25.1


