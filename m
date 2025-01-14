Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0B0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 00:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkDTYY8KW5swg2Vb/3ARy/Sz6kcmYdaLC2Hfhsg9HCM=; b=w0zktWwv8kp/V83RA2kGOVPkHZ
	DgA36OByWuEjRQ9SOHc7uqF/WqfPXfnZXVnNviNHBXg4SyF/WSjr54WtNwCPesZs01iimUZ+xcGag
	WRk+E8fP5xMW4YorHlcVlBni6oXYs7Jj3N9dNawwfM5hDCE1c0848Up65IKOtaigpC3Pyiew5fORc
	sSImAkX+srCA5Lc06+KkgG/O9vBFixsopAxnOUtHl5cGNnQdLQr/jtvTqv4bGBwlkJdWL4Wtcs2br
	LdTHpxIP6Xa5AgkUGxc0er7jzW5FYd9PiW0OPZeJ/MGkPJfCVpdJOqZCiN6Lc/wwQB1iut+qtSMN+
	mWrVvpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUbN-000000071t0-2vKX;
	Tue, 14 Jan 2025 00:16:13 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUa7-000000071YZ-2G99;
	Tue, 14 Jan 2025 00:14:57 +0000
Received: from bigfoot-server-storage.classfun.cn (unknown [124.72.162.122])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 4472178919;
	Tue, 14 Jan 2025 08:14:47 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 4472178919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736813693;
	bh=UkDTYY8KW5swg2Vb/3ARy/Sz6kcmYdaLC2Hfhsg9HCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvRjU2uWrVOulgoWCG+VJVtH6onLVhPbmYurG5LeFRS9c3NQV95A+A5UZDNwUJqI3
	 4PQ22QT65bYVKAj/SRiE5GzsFzZpbSF8Rv3txSBRvMv+HRsweOdSZICMgOhB7Nd0vc
	 t2U/hmCviYuwMPjqziKwfESov4i55U8YSv8KV07E=
From: Junhao Xie <bigfoot@classfun.cn>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Junhao Xie <bigfoot@classfun.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/3] dt-bindings: vendor-prefixes: Add prefix for Ariaboard
Date: Tue, 14 Jan 2025 08:14:09 +0800
Message-ID: <20250114001411.1848529-2-bigfoot@classfun.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114001411.1848529-1-bigfoot@classfun.cn>
References: <20250114001411.1848529-1-bigfoot@classfun.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_161455_973688_B66F2970 
X-CRM114-Status: UNSURE (   6.93  )
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

Add an entry for Ariaboard from Shanghai Novotech

Ariaboard represents a product line from Shanghai Novotech Co., Ltd.

Link: https://shanghainovotech.com/
Link: https://ariaboard.com/

Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..25e1efbe7c3a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -147,6 +147,8 @@ patternProperties:
     description: Arctic Sand
   "^arcx,.*":
     description: arcx Inc. / Archronix Inc.
+  "^ariaboard,.*":
+    description: Shanghai Novotech Co., Ltd. (Ariaboard)
   "^aries,.*":
     description: Aries Embedded GmbH
   "^arm,.*":
-- 
2.47.1


