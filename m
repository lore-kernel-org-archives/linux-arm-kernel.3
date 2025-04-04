Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMg/mbyv18ecWJasTanYiU1U2w607DO9wXxwbI5HC3s=; b=ZeeT4FvYEPXivG0jvJx9OjAadv
	s/JQnPK+m/eDPdE/aT5pdBXapCQ6Cm4quECQE/U/CqfLtCR6tadRBcHsBN21ZpKDYqxbL7UMg8REL
	vnkKR9mOXeuPlR1XW6ucxxKR9lyp1dV3wGPvBJBUcJ5uG5FpaYp3GQgloFBY6zrANgRYpiWpEzcgB
	lf/qq4+OD9bVeKWTnveo2Mp0Go1yFBUGylRUwXPIqNJYQ7qi6cT/+d5zi76LE5MEynKEbUgjP1tnC
	R+1x66iLTKWnz/1LoP9jIC7rHtmLhc991IETJmJFK1bS1ArsFQf9mHzxSL04NDDdFS1QYPdotnnQE
	1lTKErtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Xlk-0000000AhIz-4BMh;
	Fri, 04 Apr 2025 03:31:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHq-0000000Ad4Q-06uP;
	Fri, 04 Apr 2025 03:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B95426113B;
	Fri,  4 Apr 2025 02:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A8EC4CEE7;
	Fri,  4 Apr 2025 03:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735602;
	bh=oVGi9LwOUr1+hNrJwoDMMLjyDofanD4Qd7/JOe/aRMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uK9nKufjP+IzSykFxQTjmnYd2dqL7STkiN6hiK8+ji7QTyS6gWUiu1u9C2OsGHn4A
	 UUVKxicewOK3olz4cK7R8+rvVygmEeyOjYJ/XybvE2hSdAaUShwA26AC3kdkFRm0Ke
	 PnwjgfqxaA+k1p/yF9dzhXAO38jVYb7c1vGDsm5R6/bWI22AYdeZdV8SwVwUo/uph6
	 8njaUuSZePjfDVosNksNGLsMU5CGBgO2SMVw3zxckT0uAcfgSYU7Gf4VdpmsDExi8O
	 i8AjKEoK9kCcyO2xwncvhJekKB/D/3D6qqXPOB/9b35CSHw88934H5EB3tERPiGyrB
	 plN55+SUAVCew==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:37 -0500
Subject: [PATCH 16/19] dt-bindings: Reference opp-v1 schema in CPU schemas
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-16-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
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

The opp-v1 binding is only used in MIPS and arm32 CPU nodes, so add a
$ref to it in the CPU schemas and drop the "select".

As opp-v1 has long been deprecated, mark it as such.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml   | 1 +
 Documentation/devicetree/bindings/mips/cpus.yaml  | 3 ++-
 Documentation/devicetree/bindings/opp/opp-v1.yaml | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 3e76de3e950d..3d2b6286efb8 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -353,6 +353,7 @@ properties:
       physical start address it should jump to.
 
 allOf:
+  - $ref: /schemas/opp/opp-v1.yaml#
   - if:
       # If the enable-method property contains one of those values
       properties:
diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index a85137add668..471373ad0cfb 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -50,6 +50,7 @@ properties:
   device_type: true
 
 allOf:
+  - $ref: /schemas/opp/opp-v1.yaml#
   - if:
       properties:
         compatible:
@@ -68,7 +69,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
index 07e26c267815..1b59b103dab6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v1.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
@@ -18,7 +18,7 @@ description: |+
 
   This binding only supports voltage-frequency pairs.
 
-select: true
+deprecated: true
 
 properties:
   operating-points:

-- 
2.47.2


