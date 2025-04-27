Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A32C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPSSrSb3jP6BCqf5pwKmn+N4eRAqsp/w9IrrNpu2wWQ=; b=CPSpPy/4t/Y4iwBX0r+MCwQoHg
	p7DUkH321f2KFS+Y/MregkHKWOmToyluY5xH2J30lhkWIqr+pDjw8XJJNfu9zO6MJR+KyGrn2dO+p
	Ya79EBzaH/KuPehEjYGKBzCO5VF9MnLtFNAIXtIqBNB0E9H6lMJrnJmgtjd9iMsmtZwPEjpXS9elL
	3vZziKxmwGAxNkd5HuiDbNE2iwg/vhMhkjbE3yXhkO1l3iTnpkMaYmB2fauIDdmUkH5IMjhoqbWRO
	oxRGN1PN/nFXe0enrNHPTy/6AbI06q3OAJCrs3d18D3olA7oAWHzF0JNliD0zBduBbktQyQ/CDGaX
	tWP+Dw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8yZH-00000003Itc-0LeZ;
	Sun, 27 Apr 2025 09:44:59 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8yXJ-00000003IgL-26L3;
	Sun, 27 Apr 2025 09:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745746956;
	bh=kPSSrSb3jP6BCqf5pwKmn+N4eRAqsp/w9IrrNpu2wWQ=;
	h=From:To:Subject:Date:Message-Id;
	b=fo0JMPAv3B5Tbg1cDp42RKbPvmkAVbw2ryrf+xBoeOfM7RiT8ES85czoaLa/a/1om
	 ktKLzUcyBPqudHfqR0HJ6EAnwavQHu9uYPl4hiQWxwphaj3cM40W7ZTYgCIjqe5GMK
	 8EXdoFfB/pSm5F0snMChdotT8CfpC7ZCKLiEKIhA=
X-QQ-mid: esmtpgz13t1745746949tec797486
X-QQ-Originating-IP: /T03SnbxL73Bju9CPvvuA08Yp8+fugFNhO3ZT4bd8gM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Apr 2025 17:42:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7345639608399007083
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
Date: Sun, 27 Apr 2025 17:42:10 +0800
Message-Id: <20250427094211.246-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250427094211.246-1-kernel@airkyi.com>
References: <20250427094211.246-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MgQY1K25Ph0m69AjCHDG8dL3hBqrmdXSfid7xJf5VUMV91uYYBeZ1EI9
	UrqM9K0jxpexEz1Zc1hEobiDcaY4SPOQlv8uVcowEWgacqMU1+4ZmYRIlkDK6TnA7xc/RAc
	IJQanCak27/v/1UGeju/EFCc9IfUZ1g1rUUo/7HSPu+qgntwZIz3Rm7CyvE291HFkdt7XQs
	q1reLfQ8kWxKUTd3eG51jypywBf3FN97vwp6+nq0og1fQ8VgVgGk7Q7PpiJBZxmxeuuuHtx
	vc4oMQ0PDX0FTsSr2J3XoPm75HGHMCLynDT3BXJ/t4AHY27wpkOxqxxurG9U1yoz2sZzVk2
	5tR2Q7qffWU4z+7IlgjG0yd1Gr3u1rJG40AsAsHYFWUWkph7OS2WJH6zqmiAbuyVOaFGrg9
	IOu+rIF8vHxo4fM1vZ2K6c0ItcWBGo71K3A00Uo0Je6FyayFMjMz/lTB7aBC7CxG12oS9Rj
	sKbKO2FoRmBPrVo7+Yb3Pr4kMcr5hnIwa6k0iFA1llQupBmcs2igTn6qitvKniRO/HAsoK3
	Z0PRz1vrniZy11AOFwjLwvlIK7PVXAOj3q3q0DgEgZ4BfUvK3yi2Met5+Aec/4Nv4ligp7o
	f9tdy0+HWDU9yZr2dc7n2mft2o0mlTcdRUKTdaNZr5dVR9zPGrt8JqTioNwemZSlYH3OsRe
	PsJ3PklKE+WuJvDevnrmuGwQlIZjM2QHP+RJOCS0NlqCvSAG4oeHEhB7KF2801biY/dDGKk
	7D/N3Z4owRrPieTBdX9+DFOj2zyW/iix9NKdATTuuVr91jew56hIHSMSJanz5Y5IC5sn5/a
	ksKOVige01jJGcfIWGqch8gvqSMyo3Obo0HrXviM7frKCpezlNoTnp+k8EW/fkiib2rmZAh
	/yLIi/whi4D6u0N3mqP5jd2y5v8X59THrinRnb1XkzrUrvjUcoVzEYipL0781jgG9kfXIr0
	ufvaUYK4qz7ymITFC7iNBSLQsYEHvcWI/dFoXSmGdR1e678v765nbMdHcnDuJYv3TQUc=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_024258_099986_A2B0813B 
X-CRM114-Status: UNSURE (   7.84  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add devicetree binding for the rk3399 industry evaluation board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..684d48ba20fc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1047,6 +1047,11 @@ properties:
           - const: rockchip,rk3399-evb
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3399 Industry Evaluation board
+        items:
+          - const: rockchip,rk3399-evb-ind
+          - const: rockchip,rk3399
+
       - description: Rockchip RK3399 Sapphire standalone
         items:
           - const: rockchip,rk3399-sapphire
-- 
2.49.0


