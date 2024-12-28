Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11962E77191
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 12:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj31GoEVYZFTUM3sz1kl6VAgTM2nE4Qhup1sZsAcGqw=; b=tYPJKIhPZ9NgLRXO/gADaCBMnl
	mqv4e3e8OHnnwx8zLk5iHpAWFikPJYiMwUQl0ok9AjxT1SAyfiBViQlAVZ7Yt0nhzqgwUvkaSQ4Wu
	Y3gJ2AdAlNgpgKhcOmgiBPVYG538sEAxtdrHYWrS0W1YFgCcTmzf39GvDe9lLxDjRQyE5JkwpMzrK
	bkLG0l8ghE7n2Z54JykDSdzJqwITKHflV4mLnLwO/iMLW7LifEi6KayjA8poqmLZMEY+kW7M8N1GQ
	qEHgxw3wCj9bvynHK8jSRojmpGJcXPCC8XAepdEBBM//TLjEQkLk8rH7FUjvtiFmJFd4PLlhCxiei
	2SlstJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVvl-00000001reC-1bmz;
	Sat, 28 Dec 2024 12:28:33 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVpu-00000001qWX-3y6E;
	Sat, 28 Dec 2024 12:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=rj31G
	oEVYZFTUM3sz1kl6VAgTM2nE4Qhup1sZsAcGqw=; b=GLPxYNXE1LAfeIhc4VVVk
	QpaZxPdrCgj625vtYJowhtkiHShka4V8YX8IJbeFjGjG7ZAJp+sko3t98/VY4Jsb
	KtPu4rCeWMiq3INi9q94vfDLgVzfSSGb2jvoXJBerKOgOavslEVnFGtHWp91RgCx
	5oEbzK+6B82wAGJ65gIrf8=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3t0tl7W9nUxdCCQ--.1009S6;
	Sat, 28 Dec 2024 20:22:06 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	krzk+dt@kernel.org,
	joro@8bytes.org
Cc: cl@rock-chips.com,
	robh@kernel.org,
	hjc@rock-chips.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 4/8] dt-bindings: iommu: rockchip: Add Rockchip RK3576
Date: Sat, 28 Dec 2024 20:21:47 +0800
Message-ID: <20241228122155.646957-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0tl7W9nUxdCCQ--.1009S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw17Ww4xuF1rWw13GF15urg_yoWfurb_C3
	WxZw45ZF4rtFWFvw1qvrWxWrn8G3W2kFn5ZF98CFs5Ja4qvrWkJF95Gw1Fyr1UGw429FyS
	9Fn3WrW7XF9xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU015l5UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRPDXmdv5wS0uAADsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_042231_314559_A512AA14 
X-CRM114-Status: UNSURE (   6.70  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Just like RK3588, RK3576 iommu is compatible to the existing rk3568.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 621dde0e45d8..6ce41d11ff5e 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -25,6 +25,7 @@ properties:
           - rockchip,rk3568-iommu
       - items:
           - enum:
+              - rockchip,rk3576-iommu
               - rockchip,rk3588-iommu
           - const: rockchip,rk3568-iommu
 
-- 
2.34.1


