Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEE1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptgJWZIsX40jO6cPpRKjQdeEPxbPXOrzES3xheV45dk=; b=YLQszQxDEBC2W6CdnyONFjJazT
	AHUxeRcZjnfBjtjDoUfF7AjIQFsWMnwLS2bBCNRENjIYnWPYUG0/ryPrnvZc6Q8F2SPa747SflUp4
	pz6KdiUAYTnpBhMRSpQIGMNVKZE0unxwusj0dfGob4YPEPUjhlpcONCLNFos26SBWUfk829CNvvyo
	cf8Mt6udTXToWBzNQMohSAQZtX21Qa2EV5LNcnXnumbH/cMK8aLdLmNO2GrLPOBU2BfUdnAyx7TsQ
	GpS9KmoPm5zdxdM8EECjMPBqzVfmqnENbRJsG7u9fR2J4Yh1p1KVE+khcZxky5jppj1uilYSkhNCL
	zM0+p24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNFE-00000009MJH-0kIH;
	Sun, 05 Jul 2026 13:50:52 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNFA-00000009MI2-0rT9;
	Sun, 05 Jul 2026 13:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783259444; bh=ptgJWZIsX40jO6cPpRKjQdeEPxbPXOrzES3xheV45dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pUGtZFZKQqvSwsZUjz6BNbqy8P3MvSlkAumXiAOXKwYyNYnOcs4OkgytUePqRoEwl
	 HU2ywkpuJIprZ9YHKtekZjxKu0mUmH+eiVNF0Aqkv75GMjuhg+7ZpEFSsnfzM4M+dF
	 DA4m7RiOZcP3IumOgrBygDqE/EQZ+SU2qBRWgErg=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id CA0A8E0E; Sun, 05 Jul 2026 21:50:32 +0800
X-QQ-mid: xmsmtpt1783259437t28oiiu80
Message-ID: <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
X-QQ-XMAILINFO: NuGpsYW8pZ+AqoI3ue2b7Jwtso/wx9Ppt3m474UdRjBsrXBJPuOaiOiqvRULXY
	 lTJcdGr+1LVkuqVBzlpvUVs/v17ZU84o3DueR5OSElbSXP/64fy/XK2fQl0gP8/Zcv9zH4LZ3iCS
	 VJMeWTwl3iRLZbSWwlR+lvXCy7wvFh8bZab5yoGfRaH42SYjCFPmDsLa18zMXH0f0PJZnE57HB4G
	 hDHf4fS/Zlho6SZgGdnuFe+5AoXPNmKXXlwKIVUANUvqblUGgZXEW3uL4wKXJUzji6oGrwuaZveC
	 IAZm2sWK3CZpOfMEKp7w7/jupqbcsnftLAz+gEDGiW8HOs02r7Tm54qSWyb92qaCV7vl6mdIo5nj
	 UWDvir79a2psorJV1Nx7Rt8ORpx0k0BKFTCOhvX29830AkJVdfBcDiTY5j3Ovjx5ChByH/zMAbP+
	 0JvbCVcDI69WCexbxjsHSLk0AKtzk9JC3ZOgddooGMKY8Lm/c8H6kcvlmP1GfZkN/5cf+HOtTGLP
	 V1nE1SuVDpQ04PXLiez+Etz4KRguKta/ShtUQ6v8naH+CHwf20b5k2eIwN3iMmmy4wJUrO3JlGxX
	 MeMgRIGLQ9rcuv6R9eIGiykU2hJMabmC0MvBfrBiYyNLkBtMwM+Asu3ufMDveV7Q2hjYGgpUGZ4r
	 zC3WfLgQd8NIUMqowA/gJCiZJmEavebp3NpG19xU5QKxV9WY32bN1ivQAEs8h11tHynl2ieaVwrF
	 /WiLZHQ98QR0/7I+wPbd2Dhwf/wdhFkXr3jfOjknSrH1Xn873UZ5UOFYwYtM8eW/vcJgHfDpfWzF
	 wmjcPGuj6NUq5/GqcAMhND0bTPZKKemgohLBywzHNdWN96mixuGV15QIJ/wc7hPeKXNGCaPbycJ7
	 pkcOka3Qbcinc4yaKQzJ6o3bV7COQWseYsIdkS21Ibp/CBL/2tWxbEhdkWrksaffRUipU5m9YvU9
	 IgPF0FUiOqMbIBFSVWhooudmCD0idsJWRY9G7clenT0QIQHPijcZNrF1ufIXk1QsmTQ5cQn6J3k/
	 KFr9TKFM80Rh/+t8rY
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: LemonFan-maker <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Sun,  5 Jul 2026 21:50:13 +0800
X-OQ-MSGID: <20260705135014.1004166-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705135014.1004166-1-2254650260@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_065048_566042_DA0F166E 
X-CRM114-Status: UNSURE (   8.39  )
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

The LubanCat 4 is a single board computer based on the Rockchip
RK3588S SoC.

Specification:
- Rockchip RK3588S
- 4/8/16GB LPDDR4X
- 32/64/128GB eMMC 5.1
- microSD slot
- HDMI 2.1 Type-A
- Gigabit Ethernet (JLSemi JL21xx PHY)
- Mini PCIe (PCIe 2.0 x1)
- USB-C (with FUSB302 typec controller)
- USB 3.0 Type-A x1
- USB 2.0 Type-A x2
- 3.5mm audio jack (ES8388 codec)
- HYM8563 RTC
- PWM fan header
- 40-pin GPIO header

Signed-off-by: LemonFan-maker <2254650260@qq.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index aa66a15be233..44b005bc709a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -191,6 +191,11 @@ properties:
           - const: embedfire,lubancat-2
           - const: rockchip,rk3568
 
+      - description: EmbedFire LubanCat 4
+        items:
+          - const: embedfire,lubancat-4
+          - const: rockchip,rk3588s
+
       - description: Engicam PX30.Core C.TOUCH 2.0
         items:
           - const: engicam,px30-core-ctouch2
-- 
2.55.0


