Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D631FCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DLpyZSc/PcRQavT/zMZWHTXgBSYOzj1saw62cjP6VI=; b=k1Wjd3ui82k3urm3osHJQbwt0A
	kbV0L0DoleBOKmyAqae1PWCobArioUlYaDViDfZu97Z94GN88alZGnfHVLa3+fMXy5KTsNqVEmVSO
	sVfKUJKBukNACjEklYSfnohOS4r5zJtBEkK7Bg18kvcgFX9D/sWjBiyD1QU0un7dRvyniQodRg/IH
	Ur8tUc5eQ/oevQfw8vzu7bJgFqfsshcDuQrpNrIve13vmuSntC2HkbVwKcaSV4OBz4lwZ1hBIc7Al
	XTzbbW8xHab3NHeddEkdtWL2fHyWh8RuXEC0F6/baw3UUO5ZGwsSMRz+SGp6Zgcvn7POfJwCC+b25
	nWZWDbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFq-00000005kE1-1FFn;
	Thu, 28 May 2026 12:54:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFd-00000005k8S-470q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:54:20 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 295401283;
	Thu, 28 May 2026 14:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972835;
	bh=q7VLBqimYzupbd2MCGzFG/BMVIanGwvIDsMTThkF/Lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pGOcCjauRzmbMM5UnyCvl0hEwK6ZLq6sNHGkpUxdlVKWuTyKzHFhn4uxKBPP9bYgu
	 MWJE+xdnvmb7TmgxsTUuPoJrLscSEEO+0NAE4HX6JqYVXLwrNEjXiG4OieGicBCGnG
	 n+l/RBvYI/rEpKMwXZPFX6Y5fg/LFwSM4/x7ISt0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:45 +0300
Subject: [PATCH 4/6] dt-bindings: soc: ti: ti,j721e-system-controller:
 Relax the bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-4-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=q7VLBqimYzupbd2MCGzFG/BMVIanGwvIDsMTThkF/Lo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDrxldsV+KmIFHU15M0ukq6NnSYMhuhvVLNWj
 h+KoBykuwKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68QAKCRD6PaqMvJYe
 9QCYEACMzu26Uad8Lh+13ZCIDZupz+NWKdZpVaqilEyHzKDmklnAilfGBLt5rVwon+EtdhdTgXC
 txs3lLCuxaVRzyNh3rdiby/TTV0zmzuorCkphEVxJS6cYruYRIvo8FWVOYxCgc6FgqG50r/g034
 BGwnFc8Qi3sQl6Eg3dHTi6FBR+ZHtY3CVvUlidHcvLC4/DUhO8v3WKVhn9nOoRmGvnoQ79F9kQE
 MkRWlLnXQL6RQn6BCt8RfoN7td9+cvNHQOzmkZnJjCat+82W2cW1lLrK1o5bQCamdAW043rbfxg
 fpQ1AoJT1YggKNC330AdBAwyiEAaUeybHmdZxba1Dho4zd8/tSOmyOCJGUy/fA0trorxnCq9opk
 5gOa5MXD/gC8QUfUFUwgrLICDnZDS/SK/TMuaiGETMR6IJicftO9rq5Qy/x1XG94FeB6ML3X6iv
 YfOVwib2VnIyFaSs6TiJg11P9lwMxGOcA2BmNBrNyTNiRw98xrABHPtfG9UycUnhzIRhlK4dCRV
 TAFWDGwzXOj/mWbe9QyicdhpRAiI3fxFxqyZFnR6vqCwM/HlCepTTPxsVca+bSws8GPkpKQ/DkL
 pK99beGb9tQ4ztMcMRNp9xW0gc/XzebbxnAY84/giGEHRJszaUKfSr9joCG/Np582ezb+0tEmee
 TcxV64+DOp90rLg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_055418_161215_A0428276 
X-CRM114-Status: UNSURE (   7.45  )
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

The ti,j721e-system-controller binding specifies a specific schema for
each child node. For example, any clock node under the system controller
node must be a ti,am654-serdes-ctrl.

To be able to use the same system-controller binding for more SoCs,
relax the bindings by making both clock-controller and clock accept any
kind of child node.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml      | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279..56712ebdd01b 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,8 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      A clock controller with registers in the Control Module.
 
   "phy@[0-9a-f]+$":
     type: object
@@ -76,9 +75,8 @@ patternProperties:
 
   "^clock@[0-9a-f]+$":
     type: object
-    $ref: /schemas/soc/ti/ti,am654-serdes-ctrl.yaml#
     description:
-      This is the Serdes Control region.
+      A clock with registers in the Control Module.
 
   "^dss-oldi-io-ctrl@[0-9a-f]+$":
     type: object

-- 
2.43.0


