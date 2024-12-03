Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4119FE74AD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOcIN8krKEmhcBKoRnSzkY55VKh8B7LvJrkm860B3IE=; b=LQjE3JocO8zX+0Xmdvpztm/ayg
	JXSzfBKMPIK7ocFX59tWu1XlLFUc3zpExP1HsrDZT3qSol20q5zoHSh9NE0QMX5QeKSPnd0SDzMCs
	65WdVPgv9urErvSPoxm6tcD1sclKrUn80DSvjam7x8YdRFjOyuObvMfDIPDQuNxw7sjR/+4Z/qu2k
	l8O/+Msj5uA4gC51/oP/0LPsZiBYQoIIGX8JHThcINRkz//mazQwfAvT00VeeeYNcHdfXU5AUN2H6
	lU9oc7l/1D4MaEflNnP6eUiT9Q+JcRpSiCMOofv3zLMHRtoeu1HNtaHf/Q+6dCWfwEumC4rRTlXUF
	qfNNkEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaHR-0000000AljG-2WW8;
	Tue, 03 Dec 2024 21:18:01 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaFS-0000000AlRH-1IIn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:15:59 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2tjh2Yl0zGp8j;
	Tue, 03 Dec 2024 21:15:52 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2tjY0mVvz2x9G;
	Tue,  3 Dec 2024 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733260547;
	bh=Ndjf1g+BU+5UelJoyYqUccW642JOsDzZXgrOdY312Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EieSj4OoT0eXeNH81LYbtt5zuDETVUdrhB+f4TdGvNzCH2nmm3a5InJ/eUAGsq64V
	 9XULMX8CuHGQWW0sVc0hTla6rN6SPvYf++RI33WNhoeK3GVyt5jS8Ic7O8A9Lpx/PS
	 SVl+dDswf2lrAgS7uSmXxzDAkQptZNeXCcpiGWR9s3ZEoY2PaqiU63308+MmbYx+6x
	 vgkXthV6fWiBwZtAjCwuFm71q2PPd3YknsEk8fSXU7RYi9Rg9CZGDW/PXt+9GYbJX6
	 9NmjdwEgQGK4Pn2pyuDMlA8uAAjy/hJMgo7yIOI+KGTq+/WrITm2lZcTilm1t6OtEk
	 qqv9oyiNdm2zg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Tue,  3 Dec 2024 22:13:43 +0100
Message-ID: <20241203211344.515431-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
References: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_131558_422643_DC70AD13 
X-CRM114-Status: UNSURE (   9.13  )
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

Add a dt-binding compatible for the exynos990-pmu.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.45.2


