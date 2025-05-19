Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DA4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hTC/OP0orcM6FbeOlNENWSTcaGgp3V5Z1uYO+r6tCk=; b=aLsOgCBh7HclUOP1GVIGsztum/
	N5bwI4L7Z28nH15oEHDJQgG+U4CZYsCdOV2gbVf2dQwxa3j9Qim0gWAl8wq4J/um0dvm9D/2eUN+l
	QbRcFXRZdZxKiXR3LklzYv8uEnyZiXUhEeLxfM2PuusV9dJl5bZE/boqJXMUnrZRv55b4KQKmrAN/
	89mJ6sLwgofu72uGINwZS2i9Ck5yvGQtjChzV5ApE0pGCq54aWNDnK+nIT/ewCCm6/Khzc4ahqTOA
	f3ongiCxX1sdIp5xhq+Bdn6nM8Tg6IDOLoQedF1HbKsk2ZhLSogFZ2AfDjHUCrQG65z842E2tvJ9d
	yLvku5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvUv-00000008IVp-0zAT;
	Mon, 19 May 2025 08:05:21 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvMO-00000008HMR-0RCE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 07:56:34 +0000
X-QQ-mid: esmtpsz16t1747641306te62f64f6
X-QQ-Originating-IP: KUSRsfj2034q0KpgVunyHgpIxpYlaY5rKNO7LaI+oTw=
Received: from localhost.localdomain ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 15:55:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7114426328788078209
EX-QQ-RecipientCnt: 16
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
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon, 19 May 2025 15:54:31 +0800
Message-Id: <20250519075432.2239713-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519075432.2239713-1-i@chainsx.cn>
References: <20250519075432.2239713-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NQR8mRxMnur9bMPIsjcw3XRVG27vGYRIITfIHYWO33BOjMSmKSwxvFLZ
	+6RXEuYxoGBTfqsAH+9jgqzymz8PtUKPhPfwJP4afUU/qyEQuJuQLiqtfs+4eCk6Gg4dF51
	hDmSf4t6Rn6LlKn+AJJe+MuO228PZUdBcxkoNDUoqtYCqosDA+AYQ8Haph81nQOftaYe0aR
	wsaYqjssr3aMLA2c+OILa6c68kcR0VaBERu3XpV3ef2s7Bl1otxQKuxexOYdRdCTuuHjUQH
	1xqY5OU2gxSZVEP0G/JGwr+MuPjVHtfwrrc5TkPb7YgNCTDeupq0A0nXdwHqKdxfG/3La0U
	bj+yVyrf4UQLZ3aZr7kEKFblJdI29ZT9oahJqY94tXwaHMVOlx+W6p30EhQeuIvgw3t2413
	n8s484zjXwbOXS2q5c+9FHyULig5iNneIQmw4S8HnCuZMMFfnws85jrI/7mUlxJ22RS4gH9
	VUooZO/OH4I+2CO4jAXn/p4Om9CmxoIPdBQUidDegmdC3O1Y6SCI595s8wME4X+0yw3+4j1
	pdOM46VdlV48Z9gyXFXYYHHg54gdqfnNH3Jb9hBYkEySRhqM44ALWzOn07vpJeQ3+UDlVA5
	SCO3+Ff0HkNjaY5Gp5w4W7saB+A9VUpK9D7VjPBVVLvcrT84xx0Dpf1mWTOzN/n/+K/jn1C
	/FGphNJT47vSywekeEoLi2RXtuZn/ilJmymTA+ShLgBmSynyuMTNTszsgfu1Et1vSFFlyN6
	/dg5BN99VyddsoM5n1IDpT1qjfI1Xzx++O5ms6A8ohbDz4iwArKyruX2dKIEut+nYwRDbUl
	f8p7Bum2EbAuQOJLdhGL+SJeXjMhafQLxQi7/7bO7R4L8guPrxrSKcX4nF75XBD/IP8ppoY
	D8uXR5d5jL/Pc9Xdf9uldTCHasu2gZDw1+Iw+drM/5N3apmu6cWO+aDr0m+FrcR/f+6vxQs
	IXIOPHiEyHXaI+wOWY1OaLsUMPqFt68cu2cYo0iFlc38tj1cx8uQw3dwAX/Ea0QmTtL5K+r
	HvHZuT8YLnxhT6Cr1Q
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_005632_643526_F5DD3546 
X-CRM114-Status: UNSURE (   8.30  )
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

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


