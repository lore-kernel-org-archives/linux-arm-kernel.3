Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E95D79751
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMiVJUqDKq7YKJIu3ZUJNtEQU6Eyi5qop1Aw2z7vqEc=; b=iFO63RdUnvTq6BvAJrActfZS5F
	6BA3fsU1qB+d19Wf2IC3Yu5a1Mm2nfcusWY3CP0kN3U2hvP/Fwc7jyBA2tpRwsTqPNTcpS67er7iZ
	y1lwwDNk6RUDuaDN0vnVAa7/DimEOERw7ND11hM6CW60ea3ZVaBNNdJCvKL0Yreh5Sy92mG+ZxZF1
	kVDh2G9qhqjs2o97waoyWHPdQSDsfiQ+C0I7UrbR6vwyQnaXBEw2oYXdv0jx3ijiXN4UuzxnHQV4q
	u11hm7y/gGrcdZ+a4WnDNRNfmxpsY7uU57EdC6qKuZD8RYYna22uNEcAUMwmSExM8bj3snWlSJQd+
	dePvGnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm690-00000002Pdj-1Hn7;
	Sat, 31 Jan 2026 08:15:50 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm68x-00000002PYw-0KGs;
	Sat, 31 Jan 2026 08:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1769847318;
	bh=EMiVJUqDKq7YKJIu3ZUJNtEQU6Eyi5qop1Aw2z7vqEc=;
	h=From:To:Subject:Date:Message-Id;
	b=gTEuapOw6+5vaFDixjLVMxklzQ2cPharGS+VdFZtoaXN7yxFxJFHEelbEiSKWfGAK
	 XjzFVtQ+BGHs2N4Z56t3Q/Srxb/CsQxPCVkj9HrAzEOdAQnvuxbpVA68WmlNggBY4z
	 oDs8lW4ypoSkkGfJhcoLUw6YwMLCtx0zxTDRlQ58=
X-QQ-mid: zesmtpsz2t1769847311t280b5eba
X-QQ-Originating-IP: ubMpBFfxjDX0rtbY5fR2eOsNjn1UKwYQhGx2NtiLwjA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 31 Jan 2026 16:14:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13477520136800706907
EX-QQ-RecipientCnt: 22
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add rk3576 evb2 board
Date: Sat, 31 Jan 2026 16:14:37 +0800
Message-Id: <20260131081438.100-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260131081438.100-1-kernel@airkyi.com>
References: <20260131081438.100-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MjuprvNQPEAVe2Ob/KJ5//jokuka0mjbTjU5EjlwF+KUC+wJfLEkT3P9
	0eaQGSNE/xQlRyOnQyrxhpCcRuE6qDKbIHE/EqupdTL4bjJ4+Q4kdiUCabWSfM9qtQurmi1
	c8MStP7y3N+LWu0opk7Iw4s8cLKK36X8nELdoV6Fxr2utZIvF+CUNKj1UFkDMD603sQ0hXb
	IUc987jn3vHSn5gphRUsvAp4RXpOorDsF5K1uDQ+5rRFiSQHF4S9Bj9ysJM7GfAYHV9jcZ2
	YfGApEvnhhPvnE8yesSWrnzrz1D0bkowssuYVPZzcfgG2qb72v3hfBgGLB1jmuJ+GLAhITx
	7P747LuwiMjMjnUx4uhhBJEbA+EmY2fX8cJfyrksKzIM7RM3hDExDcsU1SK3i/iN3SHi57g
	SBCMxHb4M1OmQzXlVI/Y6qX9gXhBB9rsTxp3e+kXUpefLg6DlZDfms8YFX9DVr5c5qP9jBA
	zuFoFh1gAn9TLBV746jceYT4lN7yytBmMDNeI82GSBbFPxWvduyL2t0K/Tdin/p9l43ooeG
	rMo5iPNBgh5DuvdDmGoqvv/27IdpXS8lhdELGywLvId5X9M5YIhhFM6wLscsrasC2wDFaDI
	mfmamR2z5rYKXcohqJuKpj62qoKLodNzTeQcbBjlwsEaJ87QFz81Ih8d7hiZD4WjFVX0yH+
	1EPyQC1Fx7ZyPkRE6u/d+aa3e7Dh3WJ3tmNqJs/V5fuChFHCsWv2O1sbdpexVOnhmzve8yZ
	7AMjdPtLtueGv4LjgDOZ0IHC+OHgj7g04nCa79zi+HZsc3E9WoPH6M9NYxzOF6FMJalUa1x
	eYOiCna99DX0pswnkNySPGOiyuLBY6DwAOW0OGrmyJUZxc01g4ERiktyrXXtBEHP25SR2Zh
	5zKy3FrGr85T2seuE4goPkHFcHm5MKCVXIPxhxDhpt6S7g9j95ZevmVyh5FhK1YDd+CDXkm
	l2hRvZabOWVBFAK+sVXCT49lKE7GOiKqcm5qJY/F1xFAQyY6MsK9F2+aPOG7ZzpqXFgkrUR
	xXX4dBGMKIr7kZVETd/M4OnfAbuh9zai6t/hpyDCvKzgdwcdLo
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_001547_985491_AA171B36 
X-CRM114-Status: UNSURE (   9.01  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
(no changes since v1)
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


