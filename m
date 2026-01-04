Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B79C2A06D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 02:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNDZLWKhrHJbwF/L2WBt8vwEwWwKgWB+TaD3IW0Xxj0=; b=g8Oq8oeSa3TG7bWRqj5z3EnAKb
	1IyX13pv9YihrWEt0GW8X3EiAfAyiuTMtLxkKHzCU3qjW5bymzWoy0L/NN44i8iO05qGaDckXZohm
	4VqjZ1YCwxcTXvtfea5f8F4vE+j745qF76qLlDs8eJUlpNxn6aEIR4wF1FKUn+O2FoYzGg8qfw6FY
	/jKbmxDS7M8P/0VI95nPy0W4uxSEVVXjxL83sT2aj6qQbyYU4AtRxovvEIg1KRCcxDg8tqxh+wH35
	fVaI7ncwCg26BmDhOz4fl4iZRwj1vYbe1RLsS80zpxFV5kZb8VRBFT+hZ80v7zeb/GA0M678w2D1e
	nNFiKiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcE0C-00000009y9O-0kiL;
	Sun, 04 Jan 2026 02:37:56 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcE09-00000009y8L-1uGT;
	Sun, 04 Jan 2026 02:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1767494242;
	bh=TNDZLWKhrHJbwF/L2WBt8vwEwWwKgWB+TaD3IW0Xxj0=;
	h=From:To:Subject:Date:Message-Id;
	b=XiSlwM3FVSC1U/iPZcM5xUrKlu8CJqni3KS05ziFp0jc7a2AGqZuKsoyM6aIg68O6
	 U5qMN2+l8mBewGAcBqSsmc7F/4kuBGxztggkMbqmJDSERgMR7VHaoh1mqs4uhHueBb
	 3Fsnrc6C6uZIRylRD9kwVgGmGF3r9kuDlImNlPos=
X-QQ-mid: zesmtpsz2t1767494235td39373c4
X-QQ-Originating-IP: BaSWeEwo/TkAf5is9miro6TBD6fknxA8mfPjOfcMmzQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Jan 2026 10:37:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16547497180258447957
EX-QQ-RecipientCnt: 22
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	John Clark <inindev@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3576 evb2 board
Date: Sun,  4 Jan 2026 10:37:02 +0800
Message-Id: <20260104023703.118-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260104023703.118-1-kernel@airkyi.com>
References: <20260104023703.118-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NCtt2ALvHOv3QZeVyegWhrUERdDvfxlnohqEaZcCChyYC5NyBdTWLBuq
	9Jqua0mlYafonPL4kdpKk3Me+k1XU9keCZDMnJfQnBtP+4dVz/dYRkyYLFR5slw4raJkA/q
	+AmCpn2QqEVuD9eegBTlki0+huDSXDE5Wxvzgs1Jvhb5Qr3KktUp9+lLKGTgwuTeVvUKy0S
	8YP3wwWcPgO2A9PUjt1P9DDQNDrCwYozRBAf+gLknPzLhr6KPXHTXszDSl1+ZHJfWqA/8Tu
	8Fh2/0gtlYSmy8sZZIjtIz9Nx2Vapo3pdLKWzA34cT164qtjQ60+Or/jHB0tZGNOjvwAjp1
	nBRPhpqU6pTpkWn75VO5SWaf2UZJLSAfIuePpVqBs+MOAg6XFsDXGg6ZtnyyeljDHt7z+oo
	Tlf/XWUIp223MJ52ub2sJ+eFMiiKyxqNfybpZ5BF+7RPxORDuaB7W6LFTx2XQYV1W1J9YRu
	PpEggBH7tYqIRmxOylTSoDvkY77jyM1GS2ofHLBogIzZ82Q4PLB8ReRC+jBNcpxwCdPA0gX
	bpGCkI5EPzOGSzbY5+K2IuUs4ppQ4tDHGyO6DlzTSiaZRue+/FY9FfZtmST5WV8x70LG7Oo
	1pTU6u8vca3/fj3omyO3++vW7YJynlhg/TJps19kmbSoH5NyuB9apuOZ/T8fh43D4pw5MTe
	u3dv9AEW3lvrWHaJSm+lSEYaOXfqbcsZlXFVQXnc7gdUP7ffiJ2kKgCoZrcuXgCfhI+/d43
	5R25IhotDdsPVtLxxvDietsLbURpBUa0P/qV85QVaXUNDqKSSdi5FPnILTRPoHKo0gzSfHS
	sTRBWYGzUxMb8du4fRv9ByHr9yDAp1X08o67xuA5yJ34MZrMOlqkVMNlUjpJ6tHlD3PoSla
	hjVA6Aj/15sqCk3ff1mOWaHfqklm3yCISTUSZCGqJS5AWH+5xQbwDcuUxPez59UZ/RE8bxZ
	3Wz5UrmoIPw6NCMrBfPFIfmChmlEJ/3tvS82kpeABOlFwdy/GLQbw7TeMRYGCeBSE2fU=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_183754_061244_59A6A187 
X-CRM114-Status: UNSURE (   9.26  )
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

Add devicetree binding for the rk3576 evb2 board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..59ed57082003 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1136,7 +1136,9 @@ properties:
 
       - description: Rockchip RK3576 Evaluation board
         items:
-          - const: rockchip,rk3576-evb1-v10
+          - enum:
+              - rockchip,rk3576-evb1-v10
+              - rockchip,rk3576-evb2-v10
           - const: rockchip,rk3576
 
       - description: Rockchip RK3588 Evaluation board
-- 
2.51.1


