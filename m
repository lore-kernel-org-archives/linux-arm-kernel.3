Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2jWJuLgHrPs7M9dO8QM30Eyc5bIJ/1eecsMwS669Og=; b=wyq2CNp61tp1BI+lx+ZYIiwLuO
	m6Zpb4WQgT6I5zRWXheAsi4t9+cN+go5OWInWSlWdrlefrerRkZVh2i+iaZrDQ+MIJE1d8kVPV+9c
	yjhZNr/SVwilEbKrr5o3Syr+yyHQwPqmbyDDwLdIcagFCOAPLOc3FgG8ID3ZdoF8fdBhufMCSa6zV
	1jawXVq7aDbN5XHVF60GDdHUy8QCPD94wgkrsi5T2TU7nfd30CB00JxXVEgBN4gmzQ0weHy1nmMRT
	j9VrgjBSOsTGZmfhiE3Oj1Xj+KcrmhQS6YjSA0N5NVv7MiNrC41kByzGIc6D6f/IeDT76yyYo5h20
	l3I1Gvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEh-00000001I12-1QYd;
	Thu, 09 Jul 2026 07:31:55 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjER-00000001Hq5-3PSF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:31:43 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id BE16E1380149;
	Thu,  9 Jul 2026 03:31:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 09 Jul 2026 03:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783582293;
	 x=1783589493; bh=t2jWJuLgHrPs7M9dO8QM30Eyc5bIJ/1eecsMwS669Og=; b=
	NcjXP36jr3upWS9hN+FAjMOkg9AJoqH2V1/XdxVXx2FPQytKW5D3LEdp5rrLr0vz
	HRMvhIrdQIHfK/4E5WxY8MqJsfaIccn483PTiP6SjKEcqiiSnuhMnnP6fYo6LP/t
	wJgvblgDbNy3uKytHHw9IQpJVtHXDaG3wVb4N+8tqcGIvPRu1n9CD594Qx/3iMoL
	VsVjnqNnH8cuX/Eazj0B8ml2F0eKXa1Xox6VRx6JLeAlGlc/d0yFqOWu8ePjyrqT
	51XuIuvTNLN7K0+YCabxcDylDRr2TE6vqivL0D5yop+VclYMXa9O7GlbQ6pgBnqA
	/3nbJWQFrmOcg0sqTozPxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783582293; x=
	1783589493; bh=t2jWJuLgHrPs7M9dO8QM30Eyc5bIJ/1eecsMwS669Og=; b=E
	fOYLRLABOf1jQaS0RUJ1Tra54OMvskUxlTA9lIszIsRAprkn6dG/ZIXmkFrC1cUz
	MyzhHM4oVNbVwHFakRFz1uoREeU4zwSWYUsJvA3fjmMc1LsciP2lSG2aZWk2MkJZ
	Vzu1kbTYZHC86R6JhglcIA9BnJtg/TXheP3PEkiwl2sTOqlGtD1bOvp7v8Jbi2aY
	xh9wBc74wbvIGIGpcbTrMqNeE62MiNYtpCsLenTw45m9B6hgVq3L3/z2VO7wKtfx
	gfn5n2nCGavuxuLRkJUr6p7IMtSpD7S60NyT4cqqTHdfSJmX+10Xxx4A1ypFcMUb
	F1OPVLawmrMANTjOElnhg==
X-ME-Sender: <xms:VU5PaqiPjSioJ9Cshf_s5uppcfWRYnQt9sqpF1oRTq0f3aXUFzH50w>
    <xme:VU5Pav4NiJQ0LnOc2Fz2Z7TNbdCUQpA8OGtR-qQpQHxdHldVXUt1cI9QaO-N-zzos
    yZgMc44twHPiIci0tDNYhxQVAtH0ytSjKhriBW8q1QQzhQBA5ENyV8>
X-ME-Received: <xmr:VU5Pavo51PzPcIYOVzxHcuSsO5CdJu_ZZEjmXrLA03k6cw2axAMn4jp8IjVov1qhzLYKn-tB1XheEOzPTRWJHnajhFSSsLijWu8>
X-ME-Proxy-Cause: dmFkZTGTDz8RTLhItPbFFd+gcnt5D2cnrDrA9F0Bu4iuiJUOABQ/t6OEIghgd/I7rUj0fu
    DyRTW0vng3TTYmRifDkSqezpta5UmBqSTxduanIbo/irNS/7zSwkm3liyg6HqibupBIxF4
    qaBZR4W3LUq0RAzlY7KFquqnRzToKaRax/SSlc/VeNsQ8Ii2ifFnWadAhB/GXoVH5qtbmM
    7/xAVskeXjkTi/OSNh3fcUFwygXTI3pwsAhkGvaFtWofwSFRarcsFBxFMXD/PBZqIdLBgS
    sA8WGpz+BiJMX3wwD4hYH+vVlcJ5WzOfGtR1yboz7lR9X0/+HB2hbuocXq1tPn379K9mSh
    Uvs+ZwJTatqycpHD9Gv0grUb7P5xPTWsWCSaxCTBMdDcrUxI1N8iW5piy/eutEFJFNddXU
    u447zJvK9glK0RWRRoVpl84pUfBruFhm1k3sDVG0Vf/CaW0cdqGrIBN0jUXhYTS/VuXU4O
    qIBAruU1FEjSc8tFf1W3MW7Prq84veqXedQovzbqIdf7hjcebbFakK1hj+VuCFCqT7Hh+7
    KoQlb+3lg3it5XU/8Lx1Zs/v6zKUiM2zrfrv7VmlkkyeW+BMzLmWYzqowr0Vd9l0I5bez0
    V1qQQUAR+L8/CoKj3u93ey8OuhcA+Q5D6ap4NGocXVcL+F30S/2zDAOnLVZw
X-ME-Proxy: <xmx:VU5PalUbjp0wqBR5BVwEKBpG9dLZXA3QTbWvYjy6f0DqnCo_tq23Ow>
    <xmx:VU5Pam5atEa3IxCCMz6i_Vcg7mTDT-X_SytnPOwrJhY1g930ypEOTA>
    <xmx:VU5Paj2cm7MTacsk62FqTZPz2WG4WDd-a1gTVcW_aDizZcjZOlqcuA>
    <xmx:VU5Pat-TmX6-3VMQwNZiSyyVgpD8auGfzayfM6V9OaLFMlEcYy3uxQ>
    <xmx:VU5PagT_NqOhuhEyOEFhF_WQBfXhgj-sAN_scZwnD4BCuW8kW5BBaLlU>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 03:31:33 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 09 Jul 2026 09:30:55 +0200
Subject: [PATCH 09/11] dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-apple-t603x-initial-devices-v1-9-55b305833123@jannau.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=j@jannau.net;
 h=from:subject:message-id; bh=Ppfdy02YJ5CZLZtqqh7kewhrMf6+EmjK3Cy3GA55q3o=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhix/P3sT456O+JXSP42lPPimx0hkya04HcQW/7p1TZLf/
 8VNBZkdE1kYxLgYLMUUWZK0X3YwrK5RjKl9EAYzh5UJZIi0SAMDELAw8OUm5pUa6RjpmWob6hka
 6RjrGDFwcQrAVEdGM/z3Nlx2P3HB7lueyoLqU1daf/OaIWVf7qZ5Nk1qjgBb/VxzRoa/OwRfTir
 vCjnqpG38xMnyQXvu4xUXXnUuD5Vmjcw5Op0JAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003139_949961_959E964A 
X-CRM114-Status: UNSURE (   8.35  )
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

The PWM controller on Apple silicon M3 Pro, Max and Ultra SoCs is
compatible with the t8103 (M1) one. Add "apple,t6030-pinctrl" for M3 Pro
and "apple,t6031-pinctrl" for M3 Max and Ultra as per-SoC compatibles.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index 25ef04b60ca1..dd95037ea5ee 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -21,6 +21,8 @@ properties:
           - apple,t8122-fpwm
           - apple,t6000-fpwm
           - apple,t6020-fpwm
+          - apple,t6030-fpwm
+          - apple,t6031-fpwm
       - const: apple,s5l-fpwm
 
   reg:

-- 
2.54.0


