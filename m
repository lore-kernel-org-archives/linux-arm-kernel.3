Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 03:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nsAist8AxtC7M4LMr9CEpwZWddUC1Wkb4AeT8FbLZpM=; b=HVz2yhR3LdAvjWM+ytZr6SWnJA
	A9tg0kNFcxFnb5ahxYw0kbNorV7RhfZgS99SqakP88F5vc1XKZQQOGkJLRQ70x9HeFEXBHD8HEQrT
	RlC3tAnrSY+3NpPQ4chtYNTO9ymxVdB3DMsO2isOiYsBovbR/MokVQEISruBdxejf2sDNNJdZb3rX
	ZCJOFDMetOGUA0sPVpdhc2n9tSOv0wAC9i1UHLzy6YoMDs6gucPD1fxDiVTZz3K1Nk8Fh+YI6pvjz
	iwytQh/N25Ep3tx5Yj73JzFyW8ErGseR3R4FIXF1TgMjbEcF+6T1kj13RtVVUo+nn7clK3KCo5HZw
	X3eB3aDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4XB6-00000004Kek-2TzX;
	Tue, 15 Apr 2025 03:41:40 +0000
Received: from mail-m32115.qiye.163.com ([220.197.32.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4X9I-00000004KRV-0RIO;
	Tue, 15 Apr 2025 03:39:49 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e3d2162;
	Tue, 15 Apr 2025 11:39:42 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/2] dt-bindings: rockchip-thermal: Support the RK3562 SoC compatible
Date: Tue, 15 Apr 2025 11:39:39 +0800
Message-Id: <20250415033940.47914-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHhhJVktNS0pCTUtDSx0ZSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a963788044203afkunm11e3d2162
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTY6Sio6LDJRKBohPksjLDYZ
	DBAKCT9VSlVKTE9PTUNDSENPQkxDVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpMSU03Bg++
DKIM-Signature: a=rsa-sha256;
	b=N33YyMZqBQWAADFsHHYVkwM5CpZdGJC7buuowxQEqP5pwbiUAT0k2BcbsHeand2+okwtZugZvAJf15gYcKVTeCJuRpIBfZ6ednIVXZfw0qKHCBdKPIsdOXirM1x1I8XwNKBruM5I5/ay9pIsJUw9jQQqzMBN+dpDz417sjgP+o0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nsAist8AxtC7M4LMr9CEpwZWddUC1Wkb4AeT8FbLZpM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_203948_295828_502EAA21 
X-CRM114-Status: UNSURE (   5.80  )
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

Changes in v2: None

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


