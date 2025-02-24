Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963D7C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRvxUSyzP58pDhMYVShtRJOBSgNvdZWoOgtOlD/IIME=; b=xGHJaxRD6VBDBPTVufcXtdd7nt
	1ZN4yNCx0JMSRb4+Gyf8aD983hv0XtgVvQyOfDWbm0GO/qSWVlF8RHYtxw2uA8bb/NdP+WTXUf07q
	QXlexynthsXiBT+3OTkqlb09tfkcMlUQWFfE15eGIi4VlB3AsHit0+4B2JNrK7oIXxR16JHcDdBav
	XZTNu10Qum7FV9h/3f8gunDn1UIj/6dypnNGvGQhjDkzhU3riHDb04DYyB73lRGGh68kx7q2Za5hp
	tuy0pfiaNxr2vkKFM31fanRSNP0GO/rGBeW/CbStXOFej5wS1whVtfmdOTYWSaKJDJggA9MRdGtb6
	5wqyJlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYwq-0000000DzN1-39Dg;
	Mon, 24 Feb 2025 13:56:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrR-0000000DyCC-3HT1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27B9E5C6DD4;
	Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6831EC4CEF3;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405064;
	bh=2fFVeE5CFvJX83ipfaRcNiSD6AFsyycdrk50gKKutJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IbfjZmGE6TulPMcMu5ucaAQTgTvn++o4J0YwgJGPXGx+p+Qv+8EGybZQDo6O4sHjm
	 Du9YIbWupOhCl95tfy7ypFkPD09Zx8eUJQeEHJKYENSBBKCl6QMUmCPvfhIJyFQMtB
	 TKclEtjkYWKSTkTXWelYCtljK3qLifZk2gyz3nVvfWx2TH51lZ39QOeczOOUeBIbed
	 1ti52p6XEpvT6Fegf2JH4ly+BTLRrJ9Dh7fLa+Gvp3SHz3V+CjZ2FE2kg+mQN1Atf4
	 Hbpjx5DzsiQvX4nRfDkkygZ4s/p8VCx07Q5ATLz3zJ1A5szm81bsHebyo/42fIJ5Ny
	 x7ZNgz83QLFEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E27BC021A4;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:55 +0100
Subject: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
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
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1292;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=MzfkGV7s1Bx+ubm3O33iLbvUjEe7KE6YD28WzxYypQI=;
 b=XPAaKQUyngLl8QTmZ2xkR4XmJbDTaVMt0nfkm38EyJAR9Hbkjfs8fA5TFPpN3fjtjLE6mPMh0
 IcCzcWXiVmbCoxk1qiFME3yluxZfxnzsoxkLi+xdTK8Air4RmwpRu2T
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055105_951941_AB4F9D93 
X-CRM114-Status: GOOD (  10.19  )
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

The main point of the Moduline series of embedded controllers is its
ecosystem of IO modules, these currently are operated through the spidev
interface. Ideally there will be a full dedicated driver in the future.

Add the gocontroll moduline-module-slot device to enable the required
spidev interface.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c7fb46f771a300926f05 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -107,6 +107,8 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # GOcontroll Moduline module slot for spi based IO modules
+          - gocontroll,moduline-module-slot
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
           - honeywell,hi6130
             # IBM Common Form Factor Power Supply Versions (all versions)

-- 
2.48.1



