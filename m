Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4148CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6t1hC3eW9batZoaqk8umbCCtXrmckaWWWgiTm6RruGo=; b=JajHXvBf1Z+ntWydxRXMWLN9RL
	tYUIBKOip3AScY2rgj+um9mSOu0EzLnrLxmIAEvZTStp8yoi0vmsR/Hw2QSRNu32pX4mTwKykHzpE
	YisufsNON01Km+tJvlmazc/XJ4LSCG1H6yg+KUOTRrUV+Z0nJj/tETJNVIAhhtBf6CsL91tg7fWma
	fbsZ5aDOVwChyMuviLQpu3vEE031+PJN7z5pUar/MlZB3XmsPyy21JCU1SdscbM7BsNYrxdRpGhfU
	5A1NmvxpVmnHm3MpxENBP90H4DS4qKLdck5KAvzKJ9Wno8lFy0DfeyTrfbvAl5cNeGCZxhLLvgFqR
	wDB7GlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4w-00000004arh-05AL;
	Thu, 02 Jul 2026 14:07:46 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4s-00000004amr-1NEK;
	Thu, 02 Jul 2026 14:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783001260; bh=6t1hC3eW9batZoaqk8umbCCtXrmckaWWWgiTm6RruGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lr4s7wvrKHuE4YLdeU5g8nIXd2ixiMyj4tyhGfnielvqIgRVrR/svqn6ipJjemM65
	 tZRd14esC1W3prv2LVh080jODRkwBDJADFdaX9wElyyKYpVYM3kuIj+ThSKmsKGnTz
	 fdPAnNCUEk/IK/II2dLxwD7yHbBcjhZfehTYkhDU=
Received: from localhost.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 1D09A800; Thu, 02 Jul 2026 22:07:16 +0800
X-QQ-mid: xmsmtpt1783001255ts0wqymql
Message-ID: <tencent_608FA189898644C636C1638421000111CA05@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJA6P4cVAkZA6mhVs8Q0iqgWX+nQnPJ/ZjZfbxCFsXZl2h3pWTpk
	 n+ScJAP7agI1XKZ/S1bdU17Iod0lGQcqZO96mRtc1z4MlCvD9k26AdZW8QDzikYjFyOPS3Vpt/GN
	 DMeYE0VHRZiWnHzUuKYPzijlNVJmFCbezoQukB/7Rc1fJABVxbOFKNBXEFY+6ZmcjWuwevFFuElt
	 8AjjHSt/P0mQmQ7qAKdmS/NMF3zMkikCqz11CugLfV0esXifU/4QPglgwJ0zgs01F3ovUnO05IO8
	 QSokE5qXDlTVPkfREJfVDlUVE5E+Jv51kpbrnOpwQHFWK3ugCTzMm0KJXjDUwAeNOHebXCie9JbG
	 Tdc2k+rETXBXq5y5Q8xA7gGgwWG9laMoZLvq5ZYZTWdptQtLRiCEy3lLmXVu3d+fVmE9XiBF9V6D
	 KlXfCkZDL+AMGAgJD7G5/FurQhOo76pof4Dskli7REc3s7lkaecbH767EEk+JZ2ebP5NpSuciaio
	 mQU4w5izdyyXK5ghMRrKJW4Ifd5U4X/ar+xyrtCrTkNHyoDqTKGemZUog1aUW1s/Ep8imsmOlq6N
	 psSFL6w9oSC84ltzn+XrmTpIBRpyYmx9wVXV4RKcq+MxYOYpsPdZxk6E+hq7TVXrxe7A0ATBdCda
	 WoxYZAbfldL6L9tnY6FBv4PdCrZD4LbzceuSavSHzP/FW3BmXpDhAIBPguNHzj14Bxz8e9jRbkzu
	 9JGhk2BAN7WXOaV2kdaU40vg+kIv5cUkQdUex2ZJ+lopAX7LSRWDCmlAeJsI1JeiQtM9AVtLhlx3
	 1tcSqagMPM8mCb9Yzp3tuX5OJrKjAez/IYrV/wQd8f207XNHR3JhioVApNYjY5GI24n+mmA4z8ol
	 Z4uYAJiCt/+wysqidt6hECFV90UNXW7yXLaLr1i/EO5PK5M54gPPPjnv+5PDy2UObA1KB/870/RU
	 V76C2Il+uSOEH7yFNJtoMSDoUbI5z4AxClfV7kfn5v7Ry21QifAEN3lJfr7AG4OqwAFyxOj543ps
	 mm8a8H06c7l5yq+PDx
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can <linux-can@vger.kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	kernel <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou
Date: Thu,  2 Jul 2026 22:06:54 +0800
X-OQ-MSGID: <20260702140654.2961561-5-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702140654.2961561-1-1579567540@qq.com>
References: <20260702140654.2961561-1-1579567540@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_070743_406044_F9550FD4 
X-CRM114-Status: GOOD (  10.86  )
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


