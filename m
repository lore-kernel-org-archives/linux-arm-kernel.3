Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17119C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiKU6reIrnI6SCKZDx6HjIur86vJTQOeiaKBcGcpB+g=; b=zbNlqGpn1P/yy7rTUVEuPE1v0G
	CsoX77sNvBYL4yaW1T0kGloWOPi0qU5RPPwd+0oKUNJUbOb9miYyZV8okR5QIQ2DR9DyqbDoCBK3G
	dmOoyrC8KyDp/WALTVbFxmA2+nickK1TCQ+IQ5kx91GWrOSH9eFuZzBb666KAbtXdN1kK/gsOuoqc
	KRVbPQR1EzeHaO9K4xf/xxnBAWhzCaZgM3tlxiLzsgZBL6sVYhN6LKZoViANC1gVvJwCOVTmT/aGr
	0FKJiMtyoXC61Qs3Qco1v1voukUAok9EkGPBIOpj372r+pfSuRKvEPfrSFeZ7fR7vnxDSzfI/2gBT
	aiqK/Nng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjp6-0000000Fzew-3s57;
	Wed, 21 May 2025 13:49:32 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjFZ-0000000FtYh-1jyy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:12:51 +0000
X-QQ-mid: esmtpgz16t1747833079t1c7928dc
X-QQ-Originating-IP: gG6HJvN2fXEpEODmJrjE4nv+Yyd6CjGdnbmLoMkfNyw=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 21:11:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14355936894611199779
EX-QQ-RecipientCnt: 17
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Wed, 21 May 2025 21:11:07 +0800
Message-Id: <20250521131108.5710-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521131108.5710-1-i@chainsx.cn>
References: <20250521131108.5710-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N3l5ASPewLWqsmztmqC0zrnAU/l8hYwnDH/D6+l4cI4eFcyzcrkJBxPI
	iv9VUiCAEBt4UL+ekVxq45OrSkdtfaxXk/xCTloCOueMP9IYQJyfTibSb4ZQExSkM14nAve
	AdTrPPQdW3ItwWfWzkDUiYBcn3xvW8sYgGyM7Ga1X3GEKnD8CMDHPSgD8Yt3ARKZSEqYX9w
	gtTwxI4isZPnxcD7cRuuHOJ2q7pWuIeudElBXe07ucL4U3HZ+7lUaH07edJnNrgD8+DZZUR
	PtDLSXYZ2xLSdl9H8b8nLRgAWSEVpr6g+UAc+VC43ynbnP2wn++xKsUbb1WS+arKLrWXUd3
	HNdB9yKoqvFWgHELvHkDhgck4uDvlVBblF/yYtHKRTmDC3ZgnJqO7Kb2wAgU1Ic6kbivCv5
	KfbF73qP1LYgVzqMELjkh58ILfFXrf936zvyyQqXOfH+HvGA1WL93TT/XWa5PlIAG+AjLtM
	h811s4jhV5e7PcLmecz8qsGt24d+VvDamThdwDwi/xFYLCSixMCGbSS1PX+zF2Tr1Cv6yXl
	Qq1KqapMwUIuzHXsRu2wLY2Hl8I/GIcIaa/+b4gVNUAMeNPZVAJXWd2ygVGjplWiBvPdp4H
	hcTb3ABaULRnKEA01H6qOyawotci3h4U9aNSaQjRb+6jLS4ZfkTMIgefJqwLIrDKJHiCd3C
	DXn/K1jjTO+sZ7/8TuieGdLTAko5kUSqZ6E/pcQCLuAnUdLw3gF0hvnTRCwjKZs/CGidtJc
	p9PnalAEtj7YG0rjVoi8VtWu4uLRCd7dWC1ho0aEz/cm1lf1XLQzV7pWdphuFRIB5a0E++E
	cGwqUz+MBUbFlVto13r4g2MbE7B7L0a310J2yrwhMRy59+0W9RZ+81Wep1TMNPhzrloDjFa
	sqfErEL6ZdmYLEafILl8Bjen45ioxn5U4bElrzHUUzo2ob/LqwS6Y5g3UjnrFk6/d5Qt42r
	T4R66y33snguo1u80dRMJCE0PVL8VjgUb58T6GZEGf+Bvcz2Dj7pJdHw/qzH/plucR/TWNS
	wnuZl75df5w56wcUBXcEyPUfUOpoo=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_061249_979798_A8268D28 
X-CRM114-Status: UNSURE (   7.86  )
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

This patch adds device tree binding support for
Sakura Pi RK3308B, with compatibility for the
Rockchip RK3308 SoC.

Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Signed-off-by: Hsun Lai <i@chainsx.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..c64adc0d0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Sakura Pi RK3308B
+        items:
+          - const: sakurapi,rk3308-sakurapi-rk3308b
+          - const: rockchip,rk3308
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro
-- 
2.34.1


