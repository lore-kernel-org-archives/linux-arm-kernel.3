Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C38C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eGUMGHsMeb6CDekXNib8NcewB1o0trIH1XTqYThLLsA=; b=h6zMV+6mCXuiZn3Er62p67923Q
	IGX1G/VbNSmSpczEm21FNXytIlOuqS3DOTukxwehC7Y++Ple8swILqZoXdYEBayy8qAW+OBRtfKHm
	p/VORWMIgvNy5TP+ltUCRvImYyEkrq3Dr/h0JEXR9uY+hrF56QSDk4/gYA1GTvOAoaXeUMpmLiYKw
	oppw+KMc/ZCfA6tcxPhGrdvB8QBnh3ny2O24GT83ZjrQPvNzeuwUZzaOOXre2aWEXUJ4JDlBKQQTl
	S/yVX1eNVjoIvFAG9KLTclhuK9E41dU5UpTq0DVkYEVHnw7MBi7OHHhvSsRbTKYeVPuXgvRqeU+An
	kXmNi15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC3u-0000000BBIy-2iKo;
	Thu, 06 Mar 2025 14:18:58 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAZP-0000000AxQz-3Yxf;
	Thu, 06 Mar 2025 12:43:25 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2b83ca5;
	Thu, 6 Mar 2025 20:38:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add rk3528 QoS register node
Date: Thu,  6 Mar 2025 20:38:07 +0800
Message-Id: <20250306123809.273655-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB5LVh4eSUlMHhlKT0hLS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a956b76b74203a2kunmd2b83ca5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NC46SRw*CDJWCDMwTxoSIxYY
	OgIaCiJVSlVKTE9KSU1PTUJMQ0xPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU9LSzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_044324_050272_EF1649BC 
X-CRM114-Status: UNSURE (   4.78  )
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

Changes in v2:
  Improve commit message
  Add missing QoS compatible in DT

Chukun Pan (2):
  dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
  arm64: dts: rockchip: Add rk3528 QoS register node

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 160 ++++++++++++++++++
 2 files changed, 162 insertions(+)

-- 
2.25.1


