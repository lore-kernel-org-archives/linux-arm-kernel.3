Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4057C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlJl6dPQ3G3Xe2/k6Ybsm1nLThv8oymtsJ5QQ1h2HTA=; b=M9ZiCeuvtMX2UZRSfm8ZMrXFFJ
	fUEXq9Uf1q5z20oAN/06QnyMr2sXA7vyqloAWD60S+REDlVMnBW0J+t6yaG2wXgxRQTvgOSxAHx9n
	YiC+nPOXMuIiw4KopPlCrS5NrDXLXYAU3wZTNtJiofqQAuDmbhiwNI7fRTs9IOEDpTyETMxDmPw/7
	fZTnTCRfNHBbbGBqOViaFV4oJRlYlFjnxUQPW6prCvsYME1rrWns7J6C8F7xcx/F33SoQ33S/dfgb
	QDHHON26HuLo8+TlYMQU6KJ76PQmeJkDTgNsh2VNieeojbS1FZ0lkER2OjTuKkQKOis/8uW8M5Zte
	VcKXgxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5O3l-0000000Ct45-45Ey;
	Thu, 17 Apr 2025 12:09:37 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NwR-0000000CrAj-17rF;
	Thu, 17 Apr 2025 12:02:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DE3525BBE;
	Thu, 17 Apr 2025 14:02:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS4_IJQQwXiT; Thu, 17 Apr 2025 14:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891321; bh=JrgG1E6WF4FOY3BbNVxmDrHICSeGOa0nq70lXCt28ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YN6/i7flNPMgHAVVUnttrb7MppoY87tMLYhjGfx5F9+fdb0qvzTMuWsl0e2iD9yPa
	 f12KLX475jI68cnDree0Cr8ZQR+mgPiRR/lAwSnNiXKYvp/5ySXfHF/1Nc5eKOnRJ8
	 PuyhHxqeVyGCUilcppp4UEUfleR8C3C7Knyf5hXA+cXD/JuSCoasEHoW2e75WCdyTF
	 953iNc+mQYT9w+SKZZ2Ntg3kYse2G+x0afHV2xTX9/NFccK4mjPymh6MgRNQoIjWOA
	 TVmcUkEwwZMHPg01Rz7N9m0ltEgwYTwJTwyRodQcav1j08McAjv2hsuaUXfxSuTKuW
	 2fEKzWDvt61Ig==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
Date: Thu, 17 Apr 2025 12:01:17 +0000
Message-ID: <20250417120118.17610-4-ziyao@disroot.org>
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050203_441687_DDB6CCBA 
X-CRM114-Status: UNSURE (   6.61  )
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

Document I2C controllers integrated in RK3528, which are compatible with
the RK3399 variant.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 8101afa6f146..2f1e97969c3f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3528-i2c
               - rockchip,rk3562-i2c
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
-- 
2.49.0


