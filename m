Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A46AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GsM3e7XTMaEdnzl6LqqgFbWzKt5lpe2maRUf73VkOp4=; b=jQ5JStcl2NSMa/CDOCJHuV2Wgc
	9S41iIVjw0O0LyN9TkGYI4FOMAHQyiJmraC2CETofejDtnaL3RHjageeuUYb/cdEfYgu3DCXnSCnq
	QjCE9586QCT76txsOjjx5UiBFnKZvavfsinmxG2P33VVro1c+/jNzAddtIDvWT1+oikbLRX9L8zuo
	y7dRLTie/KTtfXA9Zfy6KW58HkW+GnS8yDE8XvgY6v8/DVLTo9tKoQXK7AHljMkOc30pqHffwzBJh
	neemFDKQcHgzjGE5N2/3BroO0DABICV2qqXD7qfxcoqDRoL/YVY2/32fntCbkxCB3IiioaBUnbRla
	6KNinD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1SF-0000000Bd50-2cSJ;
	Tue, 24 Dec 2024 09:43:55 +0000
Received: from mail-m3287.qiye.163.com ([220.197.32.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Op-0000000BcP7-11Fw;
	Tue, 24 Dec 2024 09:40:24 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa9051a;
	Tue, 24 Dec 2024 17:40:18 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 1/2] dt-bindings: rockchip-thermal: Support the RK3562 SoC compatible
Date: Tue, 24 Dec 2024 17:40:14 +0800
Message-Id: <20241224094015.3816301-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNDH1YdH0NLSh9IQxoeHU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f809e51703afkunm6aa9051a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6HAw5DjIQGEoWFjlJMRAe
	DE4aCgxVSlVKTEhOS0hISUlLSklJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDSk03Bg++
DKIM-Signature: a=rsa-sha256;
	b=imNGrpl13fG1lpaN9pIzz3zYhTcgYxiySLeNX6PewZQwVSViJ6pK2/nwCngARHQbd90xbB9Cwn5TA6km2VCx/cbDwfjtAlfJtBHgL72AeHqiH1iIN5gur3bHENW7WeTJiFc37d01tZFD2KMZZPV8Fkayd42yi+a/cbo/9nPoFZA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=GsM3e7XTMaEdnzl6LqqgFbWzKt5lpe2maRUf73VkOp4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014023_470048_F71F772F 
X-CRM114-Status: UNSURE (   5.95  )
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

Add a new compatible for tsadc on RK3562 SoCs.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index b717ea8261ca..f55f2045fc84 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-tsadc
       - rockchip,rk3368-tsadc
       - rockchip,rk3399-tsadc
+      - rockchip,rk3562-tsadc
       - rockchip,rk3568-tsadc
       - rockchip,rk3588-tsadc
       - rockchip,rv1108-tsadc
-- 
2.25.1


