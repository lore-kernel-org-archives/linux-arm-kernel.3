Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E160A3812
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrgyBHHO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bA31QBbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=; b=GrgyBHHOyQv64EBsBLsx4Yvqjw
	PBDV2P4OVabJLd/jOt6ufAvWbyDNPuUWlYrlZHNmQ2Qi5rSxevG86MOvHhLVkxKjKZF8PhGoyn0lz
	cJ9hABf7UpyL4JKCDppGuJXlWmerhoT3eq50TXcGXRvFrcBd7OVDX+mq5QL+Sby2OEdwv6eU47DFd
	F5LogedM4fxuB1l2slOPvWse4qF8IUUDOrUt6gtsi0OwW28IKyIDJV1gBoUtkcTcH8OV5HbVJWd3J
	Fr3tOOiXiWh5ofguV8OsyayfYrugb0+2C9jZwhaAGzUU5o0uasezuueyNZxvts9KEHZSxc+LGpYQs
	22M0yL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVXf-0000000BoS4-0GKS;
	Wed, 21 Oct 2026 12:35:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVXY-0000000BoPp-2o2L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:35:34 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8520161fdb9so385740b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586132; x=1793190932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=bA31QBbqfztFmlhlJdi9VKXAUeLAeoq91dKyQU0Nd0YlR8eG6hICYALlJyqnr5o0bh
         GDHuZy6/RKeb0pYq7NIq1ROJDmrj6ipE5MDYGHXG2dSnxugJ4bqEZdT3rPknq2Sc6Ztd
         dq2bNppGbKrjeaum7EPVvGd8/4gazXAVDDkPRdaG8jPBwkW2BzaiJy0X0TxTkw7eXT45
         IF5/THOJnDc7nwt30rOe1BIG8o0kOaCrQfQITujQuESRhZg/AkiYHQfKNVhrmwOu2cYv
         u0utIQfc67HQtI9HGosirW5FxUdi63ODzKcpXUPXAxChlV9kpAwt2ylRFcjFT18IdumD
         hyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586132; x=1793190932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=qPjRb01T+IYbEW8zT1SVtBUpEXlx6Gc8i0sIIZGQTTZrNrp2ce2IZ/CwcJO9lFhwjE
         9rLarfxoIGCuLp1tDe98HS8SGFlJmkzoMDHYiPTqJl+pNESQNzX8uZmOG/v4h6mtOqx/
         Yem6RsXlaw92LmMl7OghQbdYLsaEh8mV8MveOjS6dtCY0NrPprI47FoGtO21cuMcLIK/
         8/toMsACiJg0Um4+KqWy+E2wRDSAf/jl1rnuQdfzSFMi9I2nUgxw9vKUC4UZKaJpoDdb
         b/eD/dYqe2CWhrIpq+vgwKY5ca1YK42rquhaJtlHCN6VnWJom5UoLJd4Ov3KnC0PN2Ra
         mgcQ==
X-Forwarded-Encrypted: i=1; AKwUvByBswn93+xUy3zVFEFdjR1RcS+XTF2jw2IL9ltCABx08Y5b2Ob6V26IJnBQzvtCGI3wWsH+OYCKLG5mhecnv4NI@lists.infradead.org
X-Gm-Message-State: AFq9FYLTn6MA+sgN3VNHGyF6nVq5t2Q9at2Q5kqlMtXFRH+Yx41g0NHI
	i26ZCIvbzvaWOCXQPfgaBIzhemNunJmgQQjw4bX2PsQO8eUUCUwFKdF3
X-Gm-Gg: AYBFou2i+cBO1JjDBMteVwm4lBgnUtufWS0H0NjcpSlJc/hXlvyu+ljLLhcPPlt0INK
	v2YcCIuOGtvDc0oELdMB8rTXUrsB/64lnt4vPiHTZypxS7hfMigASraH/MlUZzdqQg7mzmh33xr
	cKJ4TMtp+d80o6Lyto2WFYyHyLuOMmAFyRmeOvaZtVI+va0Y5vE3oG8z6c/GGg2eBNJrcfHexev
	h+lOa+Xr5oPuvZtSavKvCvtWNX+IzoBI7ByK+jmu8RdX2O1XVMmSU/N5shMBGifn4zNhT3DXpJ/
	PoryNWwhg09hi+GNrG8t8BgDABeBxHjCbVtCHWNE2/QyDYmgAu8MZJPe7DyMYM+I3/RnQwbaHGW
	MPWT9sF1Zpfz+KpvEDMSoDZzVN0EaNjGHYFwosJnKBpAv9BK60fyiMgfNnt7XuIWHxQxKQkm1Ip
	afvs7J95/pVOR87TZyzWO2VbbWeR5zp+ywlO93aS7omiPmawIwobLcJOmwyTC8mykzm4mgCP5Pr
	1OgPaR/YLEv2YcmA2c4RdA8rQ3sLFjMcdRzFXkarFsJ0J7MxlD0yxQxA/QNInxXA1zZFrAX7C46
	sFKN7QQ=
X-Received: by 2002:a05:6a00:998:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8a089c4294dmr1551510b3a.7.1792586131851;
        Wed, 21 Oct 2026 05:35:31 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm825732b3a.13.2026.10.21.05.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:30 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 14:35:19 +0200
Message-ID: <20261021123522.346317-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021084602.121087-1-sympthicode@gmail.com>
References: <20261021084602.121087-1-sympthicode@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_053532_712348_92BE2F6F 
X-CRM114-Status: GOOD (  11.77  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - Move tpm6 node under ahbbridge1 (bus@40800000), before lpi2c6@40a40000
   (reported by DT bot)
 - Fix author/Signed-off-by email typo (simpthicode -> sympthicode)

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0


