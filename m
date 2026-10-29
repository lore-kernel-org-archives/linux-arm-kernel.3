Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154B0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gMdEueC8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMITbRTG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=; b=gMdEueC8mMabOL
	XmaSJtzK77lgjzm54lBqbzjqC1Intn82PoRPRPEf/Hsj83czRJJ3hvYxp9izpKJ2sE6enugkGUikR
	SFMqgJ93POFSE8QVRiJ2XZYQgaL1TViFZFLpuJWR+KF7wVhTWmcHAxjpcKgNn/eExYcfosIJz4Qzn
	EaxBsQdgt0oPg5ihdMkPfOqloRWYIGC9PykwTjhj4uSVkbN1L33dLWoh7CiIitQlM12tTnRimD84t
	t8IbJgNJNK25V5oNUy++zuq5q5d5IN3zzrCb97/2c58NKHsiaqh5Yo/lvyMa6xdAS4WqznGvXkUDJ
	N7lg80pIIzRSeJr3GGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN2G-00000008vOl-1wb3;
	Thu, 29 Oct 2026 10:07:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN26-00000008vFd-0Dux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:06:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a210470b49so15545405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268412; x=1793873212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=eMITbRTG0WX/xdxkYfSsH8XiNXkvyDms2jI4WUWoCxEZxLIuTbWtX8g22oB9+fETuS
         9PE15TQvDCK3efIUTtyMf67KuB4UkkqpgZdypddNAEQ1aV1UJOASRALibWz31dpn3mK1
         1zXoSKrHyU/s52j8c0CJUr9bO3kpM/0bJ3g/w4kcrqhBnvz8/z6jksJ1oYpB4vx1AnUF
         1rXbkRyamjz4Tw+daILdCTJ+NdM9gyn0UR0FFoxU/74ysBqOnfipu3SoTRIgDR5Xh+1X
         QZzvYDAocUUq2fn18HQcVtvPIBWw2ZF3z2eeKQUdaEcllX5b4LZbksotiEGjc+0YPLTD
         pFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268412; x=1793873212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=yAJO17NMXo+u+WP4d8E/g9LcUw6sjmiMhV1lIKS1YJsAgIp5SdjTyrFX//mKWeD20b
         uZcxxQ/Fitpfm47JO/hMn912FvwfPK355TZyMtjvnAYLi0VrNnibOvFEDxY1nmqaJxJ2
         NZRIxLrEyr9xxviFdQgW0jFSruXTcYY3WxnhIRBcHLPdphX82PEkk0Gy9TsUEJIaXG+G
         fWmoemDBe0vA5Vh+M+SCH3Txz4FLEYpZYk6sUiFdEhnEJjFkqBIz9b+W4/BJQHscFtws
         EvtyHev8zctT/56Xa+TovnR7TZtO6hMP3/gq7SwBDs0Det9cVbWKAupEW/SQFdU2MZVT
         9BIg==
X-Gm-Message-State: AFq9FYK86ab336p7LmLCtu3AxLqDUQW8r2TVQe39klDPGTprlT8b5ZEC
	TIzhQOFbIeAtDQupPn37/pfTmWrMecyGyaVicHWY4zot37jlwo+jjzId
X-Gm-Gg: AYBFou02I40NHKdX7FBcqvnUCRdXXO9h1lY9bMuN1nPPFgyfyArVPcUpCIdC8eCWxVv
	bA4S/5d6FUf94zYPBk8y4Vj8wCDEodV51R7UlMi/03tXSsQ+XQ7MccW6nNUIEnS906dPS4l7Fvf
	k7+XqcSVWlDFPJ3gngwJmwkTAazC7S+YATVhnlHj8dUfjDTk8QBcUQ7euHCDpQUx4HpASAKN8lb
	OHawsH0jAotWBN8ONnaOBVFnzRJWogI9AmRCbAZizuq0XDOgoHFEpN+teWkv92wEBpM0nx2DfhR
	MzmDpRkuaXetjxemM68ASAENsBiNmRTaY5oJ8R5iV5rnBpbSoN/OCq0+oFYnmYwVW9DQfjaZMqm
	vfFbgt5M6bxdJDCvisJNCcr9EBkushJ6ZT5aMRbrmAxPJO8fi9yk00yl2UqV4sVphWkV+eq+ndx
	SaqSqP1DuVzOXDLU/5tzMOxw9SNz30XbTXysxrgoqSG/jbh3XISMZ3EzUgbYSPFmcLbs7/ar53w
	2qPhVBeEFz0nyqQlxZhFJQYAX/JySM9j9SDLnU8j8r3LJSL7RoqpVaxa3uAIcmbxu1r03NhFU0q
	IGnuN+l09FjgV8j+CqgQ4UZxCHQ8P13zNISWmqZDe0jH00NBOvJISNbmEdGkzlRteKloTb//7e3
	PCmawKxz9
X-Received: by 2002:a05:600c:4ec7:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a9660b5041mr117976975e9.8.1793268412452;
        Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:26 +0100
Subject: [PATCH 4/4] arm64: dts: rockchip: put the PMIC into sleep mode in
 suspend on RK3588 Tiger
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-4-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1641;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=SDfGdhdTbDViPNWR7gWVkSFVjA2d78IFMYAVeDi6pgc=;
 b=+lV6mFqZezu/+F0xruZF+cG3BHg9hNr6TFfbzH6ls2C4+aEQv2qB9TmeiX4sbnF59e3EHmvUT
 spRbBmKPD3LBiX00XMbFZ9MHPNkvGrR2KGQSbwdMr2iUT+IH87yeXEr
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_030654_221759_7D68ECA0 
X-CRM114-Status: GOOD (  13.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The RK806's PWRCTRL1 pin is connected to the SoC's pmic_sleep1 output,
which the firmware (TF-A) asserts when the SoC enters suspend-to-ram.
It is configured for no function, though, so the PMIC ignores it: all
regulators stay on in suspend and the regulator-state-mem settings have
no effect.

Configure the pin for the sleep function instead, like other RK806
boards do.

Measured on RK3588 Tiger on Haikou, suspend-to-ram with the logic
domain powered off by the firmware, module supply current (5 V):

  PMIC pin with no function: 0.218 A (1.09 W)
  PMIC pin with sleep function: 0.086 A (0.43 W)
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 161c89c62bcda..592a2d11b36b9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -471,7 +471,7 @@ pmic@0 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_slp>,
 			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
 		spi-max-frequency = <1000000>;
 		system-power-controller;
@@ -492,9 +492,9 @@ pmic@0 {
 		vcca-supply = <&vcc5v0_sys>;
 		rockchip,reset-mode = <RK806_RESTART>;
 
-		rk806_dvs1_null: dvs1-null-pins {
+		rk806_dvs1_slp: dvs1-slp-pins {
 			pins = "gpio_pwrctrl1";
-			function = "pin_fun0";
+			function = "pin_fun1";
 		};
 
 		rk806_dvs2_null: dvs2-null-pins {

-- 
2.47.3


