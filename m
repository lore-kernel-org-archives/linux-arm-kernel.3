Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28152CF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hi/WJwu0meQHwa9Ulmgnntv6q+cfCBIeaHgpN091xI=; b=blDrxf7YeP4trmBfPE3RgfvJDp
	e2ctZyINuRQ4mtmMwz3BUEva6WJydgHPkPVQkXRgjfrYvwFjSjKOKpzxTGRrRO8PXLI5D7Pc5IHyq
	UBzfABkXkuIjCPUbiWa2Z+sHu19WMBIOCSejS4vNC8VjMFNd7+USH1r+NHfQlCdwUp9XPcMDBFNs4
	479syF2NiPrKib+QCWlWRqnp2WuxEBy9Ernv5rBwbWxtCQTt3eFbEpFzFUrftESAkuDUeiZRJDNb8
	NHw2TwH0S7DHV+vEX2iszCeFHp34r/wC6IU4nQWiOXp/lU5SsZ9IPlODMRPnt1CMV5CfNWc9eGTNT
	lP4hhvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJF-00000001PpC-0f4i;
	Wed, 19 Nov 2025 02:52:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ3-00000001PdM-1Ygk;
	Wed, 19 Nov 2025 02:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD2BB42E1A;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F02B5C4CEF5;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520746;
	bh=dJK22r84acanscjFS46rpF2hSs0/5lm1epfUph3n/Ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qsnus/br7UswG92+Pk3QkDlt7CQ1JQTiN0Qwns8RsEMXP14O4ACSRh4yvx4Cttjme
	 jGHPc1fLJgLiOiN+WRYexHaSkdcYl7cOaeOyxLrefv7GmsGfPTgX5X0LniwRRCmoHQ
	 zy7u+qg8VSkaihsnoJRRgHBHOBlnjM7OWQnGHdYSFPCKdoEYqHd0D+NxGm/Ic0iilg
	 XPthBW33VNjFcny5JtiUZmjEUrtlua81UYEnIKE4EoODTiUKmEFjeDvbxddL8cW8to
	 2uGzFsdcsNz4NN7KXp9KMIGdKv/j3yU5MMJ0Iwfb/1f7XKGXo/YAFLsW/YUJZauDn4
	 iN1UB8a9h2pwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16A1CF256A;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Nov 2025 10:52:22 +0800
Subject: [PATCH v3 1/5] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-soc-info-s6-s7-s7d-v3-1-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763520742; l=1074;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=X2YO1s8uBuGAUV6Y26504dBNen26LRGhmjN4aH4eHgQ=;
 b=WiKPIWCA4HWTBGjIaDdqHC2n75mnLnvl6lLu/9eXM7AwajIyw2/H6p095qvJqFQgxK3Mp1pPi
 FpMlSXtqF0uApIbmkdbl6m57ac81Haxinb0wKEyz/AqDdOt051oPZX9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_185229_424165_01553BBE 
X-CRM114-Status: UNSURE (   7.87  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new compatible for ao-secure of Amlogic SoCs(S6,S7,S7D).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
index b4f6695a6015..fa7c403c874a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -34,6 +34,9 @@ properties:
               - amlogic,a4-ao-secure
               - amlogic,c3-ao-secure
               - amlogic,s4-ao-secure
+              - amlogic,s6-ao-secure
+              - amlogic,s7-ao-secure
+              - amlogic,s7d-ao-secure
               - amlogic,t7-ao-secure
           - const: amlogic,meson-gx-ao-secure
           - const: syscon

-- 
2.37.1



