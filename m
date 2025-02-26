Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45488C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4/K3P1V574nq3SEJWoGf6z+R3d8lTif4KDzIwKFc8A=; b=gkDb7umrwlQ3I23D3uF+9G/sF2
	dqobiQps1jHNx/FY4BD2VUY+omGx6oBDl+4m/GQ5C26/s7mNCVpCCpM+BQg1lTo4GCuCR+6HZa6d9
	BQDUo1TM58tb5sc2UJZNJggelcWxsVNwsBXwCAhYlTkRNGImnqp3WngHY/nYNnFVy8I52RpGC3bq7
	63K+fgWB5+IfxGgm2IRzzGrUevnK5L0uwkEz7amBzt9EWIKZBPCmVsLt0WobdEimels+/P24+DaTi
	Vct4yNrY5Gliya8JZScxrLcDXcLD8Jzoh4cCJCofpiPx8u0CIdpc9fUVXNQUiTAymljCxABgEGdo6
	KF9IwTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIQv-000000045lI-11yn;
	Wed, 26 Feb 2025 14:30:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFv-00000004304-1268
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB34E5C5BC9;
	Wed, 26 Feb 2025 14:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3843DC4CEF6;
	Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740579559;
	bh=PxgLGq6+qrxKe3Hxsa6qgMFp45GE/6elawfTgJ3Xenw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Spwp8u9FWTDkamXymTccOY/VJczw3W4EolYJxoaflzpLvrdyjDJwQWvkOsBD6qs0g
	 KG5prWWLZ9ArPRC1Z0QUXMNkv8QNNLL0N64AwT2llROUoGPvth+ABfIByTL7WkYdcB
	 gmbNVdZm3uL/4p+fMqB3OMo8tblq/hcaJUY7c+QSYbcZS6Jjcn/JoWDa5NxtiyM/HD
	 HOuD0qlBQv1nxFwSGFqsL0i0jrw/vjXnALMTDDhC3X9Fbz3VQMSwMIDHYjCYAxG68I
	 Vs+y8RFeXOMJK8njAGBvJd4zY8nvYvzcrYBw7vY4m50OsXnxNc1K8Y3SUw7Qce3jXx
	 KuIgLvK5M4PcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7B7C021B8;
	Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:18 +0100
Subject: [PATCH v2 07/12] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-initial_display-v2-7-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=782;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=nusWR5q5TNk92/50ob68LPNw76A3tW54RO2mF3ZYb0Y=;
 b=2CgGNin8Ebwh3dwvAYR2RELJiEsDuzfLytOtPMjDQUyT9S4KJgYogOrsUyQRb3lAL4OlDa0cM
 Ilcbio1GW0/AE0PKNGMKXGCOzztNLF+WAmj2VkhhJ6eGXVBLYODscXl
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_061923_339245_4D4ADBD5 
X-CRM114-Status: UNSURE (   9.14  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d75c66942ca2059e7a054072502b726d1dec04c..47fc659957d94e6dfbe3d8dc4aef80b2349a1104 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9843,6 +9843,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.48.1



