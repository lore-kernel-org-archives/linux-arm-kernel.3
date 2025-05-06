Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513A3C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmPl2NWCW6l/GgyaS45T1TTxOQfLNoKS3ckGIaEtrfU=; b=PXsRTkX70H2wLQawC874cYO3C5
	34Qm0Xqr4nSGL6i4wwe6xnDjrO7xgE9a/Dy6MhHoLmaJ+LyT8KbEVeIG9CHhucu/CQm+vcYrdXa0X
	e2mXIw9b1rxWcQh/591rqi3W+JfLpfPnzjIkFSAf/cTQ/q8Lk5zFTCbmqVkxpRMEiWUvnyUCG2Lbx
	GsTgT93j0txXz/aJMAXO3GcAiY6L9A+M+b3lVZmmhUtnnDhCJn+GeJwhJFKVrGvOnexBmN5U5ep/D
	fCtoT3/Boc5Ly+OwG1E/BMgoSjFvZ7XDIHONMDixbItTlOs/GEQdsiQqqbR+asaq6rgv3HHBK5Gyr
	Lkjuqlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBN2-0000000AZPv-3JuZ;
	Tue, 06 May 2025 06:01:36 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9Eb-0000000A3RF-1xcq;
	Tue, 06 May 2025 03:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746503061;
	bh=hmPl2NWCW6l/GgyaS45T1TTxOQfLNoKS3ckGIaEtrfU=;
	h=From:To:Subject:Date:Message-Id;
	b=t8zA8px6pjfuSw5DCGUYiq1PirqqdGYgcY7y0NDQb1DykLZeVPTHu0CIVBfmPUC1U
	 yCAsosW8Q6ZlBRQKWwR2jVlgA4HnZjCV7TiNDCORPPuVKdbOHiAvr77fGIyW4czQnv
	 y9+4UmEpBFqeI0OUZ7DjvwYYwzkYB8IGriwT7C7I=
X-QQ-mid: esmtpgz12t1746503054td3df7c82
X-QQ-Originating-IP: dNySWQ84WQkpugi5Xu4JmUqBvfVdu/gFrsoHSj/33uQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 May 2025 11:44:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12369147248136889238
EX-QQ-RecipientCnt: 21
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
Date: Tue,  6 May 2025 11:43:46 +0800
Message-Id: <20250506034347.57-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NV9lVvsB36OpbcFDcLZiJ/ikIK2DxiaVcijEusjpLtC41OeTUEx2/Mu2
	jSpreWP+d511Tt4jsQMBbd1O18IQwPUaudmb/TKZo/wq3OmDqyzuu2p5R3LysZbIC4tbaCb
	hBLzU1PIa6MCBvgQj/lFnIvtzKaasoJiFqan/sg/9VySeTO7XPzoZIWuk3RmqX2ar+kWSyP
	W3va/vqw2Jy00v6eflkybYcqToIUxUsGoLMi9Vj/BQcnT4h9i+9kxvCunliZo7fjvNndw8j
	Dbm69sdUS7E0OKQYLSUKsTp95UsBD5Dpx0eZl3SQaNvn5lF3ebo3CGIOv28Aj+Y0g9uj7Jm
	ay89W2Pq5nCOZ0QblQewxWqIRCVfvsucA2fB+qGr+JQYqGaKMzXHT0hAnQ/yPWPxCR188uY
	ar2JnvPYk+zFCmyEESf/5fnhVE70wjdOpWApYd9GnoFCOurOvRMyBAgJVKFUua1Ge2SAKl0
	8TRFJccxEdSwaEGQXqwtXwkPM9o70CZdTzmISvcXLUEolc5DadNYAn1PdkOSqGas/KRcnqC
	kOD0yOrTyy0ZG6ieeXJcxoS+6tbY1XsyGB1BUBF/3t7kS/2V/m2AB8MWTMxUXCSNh9zjbZl
	hYc6Fs7jeCoe8JNGEDUVJVcpu9MsEqeVw4Et3UA2C4YWM+Lw7BZbfKjIltGMfr0xlMpdQla
	ThTl5ts2uOQq8QstrywVrUyNish3XiZbzDVgmGPOseuYuW2RWZhV8DDat+Rp1vMZQ9Ojojy
	cNX+iHFudGbDJisVb5eJhO5LnzKscTXVwFNe6dAO7mAWPjlxgTRA9ZHAV/AVXUYZvOfsEI0
	PyJy7GO05Dh62y9i8YdAvSG6gNG3r2pXGE0v+G1TaBL9feLr1KEczKrIRXjQ0iP40Uldb06
	+zM2bfJgryWCTpiht6Jn3o7aDF8py2woqm+KB219ma3NKHPxmULdMIRWfiK1S3WvD6zj9YS
	Qb25FCbRUAqfqHDu7NeW229coz+rqNyIAhxNwA9Shz1qzcnO51H6n2V/CHdJIIztRm1g=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_204446_361562_0C49A502 
X-CRM114-Status: UNSURE (   9.25  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v1)

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


