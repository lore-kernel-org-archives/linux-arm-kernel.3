Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4F7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iISjTx1nlQUwjE0DUTxtYTbfdn/328HvHfkPgTezQS4=; b=ZLSTBKGOzienSp+pwUluHEWFJ7
	l6jbWi1MYSyjvPx0EGY1zIE6yGslk4al/MPQKRiwudAgFjDrUaBK46U0eshwbWKNkAS32xQjwPSfg
	lrXKVp01ZqhFQHNtSmxX/kRtmvrUn7NAoB8ix08NMfJMaf/bK+HkmMUB9m/BkzAlHE5sUg6/4zClU
	S4RgThUhVPWDzdfqTDe5ZANwz/BpDxjcJpkJYsyZpjvcr1mWh/iar0BP37pM0KXX1qdp1DNS4OjtB
	GPjGqCShACeVelO5qhg6Llj6wRysWqPI8toenfetTG0P3gJ3uJtXrlxtuBWbe5eWHocN4WzAkazlS
	rnHcplsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwrm-0000000Akww-0BVE;
	Mon, 04 Aug 2025 15:12:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw7v-0000000Af9Y-1MdI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 14:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 835A645E03;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47CFAC4CEF7;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317522;
	bh=mAWZyywLB1ip9iUzT4X4Zu/0/IQZja/30TmIx21F/xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p072hH0CBBYxBAoDsTtvfWGCWzfO20uAyO6Za3aNZDLir3smkrHZ04yd8upydWi04
	 1KSQjQlD+gBvew1KRdH2lAmYiRpZlCOUMR7C/+oSbC3qII0Ytu+EPIJB5QYFrolLje
	 kQF1+H0+h0yvBWR29iN3oO8fHlx3PRjvTlJjuXCd53R7pk4pQiydpngva/bDZZWQ9T
	 TTZ/6eZ6SmogZQI5BAMhYlh9n522mX+jtRPPw6NUmwS2b5WvKq8ndPW9kCQ6Qvv5gT
	 kD5j9jooP+pEwhaCDs6o2XRzWJeZPCMWK8p+onMHJqXjkWoXR0SSV1LAwfk01QqK2m
	 R5yOo8E5jgkmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9C1CA0EC0;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 04 Aug 2025 16:26:40 +0200
Subject: [PATCH v5 3/4] arm64: defconfig: enable Maxim MAX77759 fuel-gauge
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-b4-gs101_max77759_fg-v5-3-03a40e6c0e3d@uclouvain.be>
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754317658; l=764;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=gaoSugHRAz5fOiJGPTrSTYl8U3fwbJdk2k1I718EDsY=;
 b=ZG9Xmwog66bZ8cSUspq6GfK/PeRmbJru5wn9agjtUDDP6k3RzK0VaZzzaMfkTbctuK/5+YMlv
 VGOddOKH0rrDFrORISbF19f5WBqEmXuzmboc/ROIKMOnvlmk2PA+mSb
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_072523_409387_6323901C 
X-CRM114-Status: UNSURE (   8.62  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Enable the Maxim MAX77759 fuel gauge as it is used by the gs101-oriole
(Google Pixel 6) and gs101-raven (Google Pixe 6 Pro) boards.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7e04a2905ce4ec71e8263a85f20398f702917390..dd90e72e71dfd45c62942f83db6814f263517a0c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -691,6 +691,7 @@ CONFIG_BATTERY_QCOM_BATTMGR=m
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
 CONFIG_BATTERY_MAX17042=m
+CONFIG_BATTERY_MAX77759=m
 CONFIG_CHARGER_MT6360=m
 CONFIG_CHARGER_BQ25890=m
 CONFIG_CHARGER_BQ25980=m

-- 
2.50.1



