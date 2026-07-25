Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E81C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 07:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3LDk1ob8lSeDF4p3l0ihZVgutygUEgJnbVoCOXhudc=; b=h2Vpm93Du+0RuEvpF8aYAsRL0H
	rFkKXfmhKGmn0riaiZUsBPOUmqmZUH7lX1IEPp8aY8R/VPtERdyTHvJGsPDhFOQBwnO4WIcEwKVKA
	8DHv+917pBXmUM+s7fTf9B+/srAbdtuP/LrIVADC002NJGIT+D1AxjhRkJPBO/X0U97V5eMyGStwV
	I+rwX9pMMmu6/3aZK8Eh06dTxXLIwcifMY9JAqHFla7zgFLAfbdl9LtJLyevveNXM4NG7jPx8ascP
	PSw2Y3/5yLXqsUUpzoqmUtajvD4q7+ZWnEjyimC5KC2laqWIM4M/IqMDTa5t+9g3iasXyCyFMWv5a
	EBnWUSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWTF-000000008A2-3TXH;
	Sat, 25 Jul 2026 07:06:53 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWT4-0000000083L-2JMa;
	Sat, 25 Jul 2026 07:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784963197; bh=L3LDk1ob8lSeDF4p3l0ihZVgutygUEgJnbVoCOXhudc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XWf8dGWaqENWJRpUNGuwCb21rKHWpa/CJRRpSK+m7Rfq4ZdUNAoFFCSNyD9ZbGAj3
	 QrG1PxwZekOUlBe3z2IYs795Kcr6qUCWTw1tng7coAXX1CwkBq3mXzSak6NKI7PGb+
	 Uo+rWo+bRlW4EqwGF5T6sRnaafpFBSdkTD4RYc7c=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 19989659; Sat, 25 Jul 2026 15:06:25 +0800
X-QQ-mid: xmsmtpt1784963194t29xv9a84
Message-ID: <tencent_8E35228F9F4F133FCDBCCC4902F6887D0006@qq.com>
X-QQ-XMAILINFO: N2ZoPGp9lKFW6O+7p5ZF8g+DCHmxkQcPFO9v1rbFeYY0V7uOwLUPdFrXOHVysY
	 piP0nwKdWprL4pEiZgFSN9bI0pG9g1C1nkheUdlHLBxmvve8zKbtzGCuvvopyXnQP+6soTSEhh6D
	 Kk9OLi1vKr0lK+OjJ6PU66i55uSLgIXsLZsA9GueukkLYEdM5MkFjR7RJv551QUWoi1ZqkvcWJU4
	 t/TTw9riTDgt2E8QFLIxQOiTQZ2OoEUIUW7hvk8fBOBErUUZNLM+eZoEbJdb2O7o/UsAv+XOdc4b
	 9QOfCKE36W5ub9smZwb2VUGld4c8NchI5JqEwYkpwlYkGux7XASFxGoH1Y54drfstuWxj3JKNSst
	 XgIIf7CKk14Pui6+dearVzb+77RazXLx+uf/KEvOL8lBkp0CfCooXjk3wLEFyQwmM8vHhXRuv+O5
	 oCzOuOpWZ4cMlocWw4mg5aIt2sZxjMIglU6HSmqBU62PoSuNt1TBXjGGW2RRsxXwRxwHn+IEBV4H
	 ewOIMb4epPaRDxD9c8Ye0506mKxlBRRjKojQ/EJTpJPUtGzDmEy5T2xRfDuYLwRjpQPhygOxrJ6G
	 f/QDXRPc1YBHYUhD8Xf8UKxCVhCBOpM69wr2wnAhuYnUIPhMz+EnZCwyWYVUN72iaR5Ebqo8dyJK
	 5QA/p4aES+TgJyTSUbDEKrtwU11zE4FBRoKK+7ORqjpD6Z294xCmusITWozh78s2GLQVAwa0ifFZ
	 2rVYD8Bnuw/31XoQ7pssED7UxKBw4OPhTkhMC43Q075u1SDlAWu/vqhqJggrfzUDEU9H6QLvkN6k
	 KW7btVpLcJ4DmAmhete/Tyg0AagMqf+ydoSdLU2O6EJLJ8JXkfkMWFYuBVisbxD9ppW247IVdVMC
	 lAiJ1eUQqbF7GzFz86UGy4195Y6d9f7zDP+6UetApcYOlv78jabYoLcREt20buAYXa8J8Ydx7txV
	 2bd3XgxnL2eIHtrZBvCUTFchUMt1TSEIc7Y2SOMLcyCsnz4pLXa0EVma8HXpZEi1z48TDJF87N0d
	 nONVjvlY+F+H43JoXG2wnBH8UxNPo4x31GVUikMVMAr+oNdbZaC/HxXVQBmdGaVUu2EaVoHxGFYO
	 atnmVshJZUg+YTvNoAY2hecZaLhCfCsb79UdnnBOdrCBN3l9O6zUQmnuApXlNgYh9hai3u+f4umT
	 tr/i0m8HcaT+9Um0L6rsD+YOlgUtkTcXn50tA=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Cunhao Lu <1579567540@qq.com>
Date: Sat, 25 Jul 2026 15:03:34 +0800
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Enable CAN controller on
 RK3588-Tiger-Haikou
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260725-master-v5-4-75da459d2b93@qq.com>
References: <20260725-master-v5-0-75da459d2b93@qq.com>
In-Reply-To: <20260725-master-v5-0-75da459d2b93@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cunhao Lu <1579567540@qq.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_000643_155019_3C85D7F2 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

CAN0 is piped through the Q7-connector to the CAN-Header on the Haikou
base-board, so enable support for it there.

At least on RK3588-Tiger, the CAN clocks default to 99MHz, limiting
usable CAN bitrates without skew. Errata documentation mentions
300MHz as the default frequency on RK3568, so replicate this here
to allow more bitrates.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 873fbeb8daa1..6273e695b039 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -155,6 +155,12 @@ vddd_audio_1v6: regulator-vddd-audio-1v6 {
 	};
 };
 
+&can0 {
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+	status = "okay";
+};
+
 &combphy2_psu {
 	status = "okay";
 };

-- 
2.34.1


