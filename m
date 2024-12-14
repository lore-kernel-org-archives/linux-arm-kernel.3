Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC79E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mACgc7N2Czi8SbqrCExepMJxswCGR0wPOoAVNRAe0dI=; b=FbKRqvYoHyqAri9Cy+2PaS/CdJ
	OGVx7ozOnqN5A2DDg2A608tESqdeThH+daAHc4RDo+SqJUahM31ZwEsAsYSNrG2jrqeBed3p8H2KT
	1k0K5Xqi/zMG+U1HoV6MtR6x9Ndu/BVe9Xm7baruZvdXBQHqL5xrJ/dgjTCRJeVaDW73GtrnjNcU+
	kNYlKZkcmnsTxQmh+Kdym4n2Qils45O0ijwTDohpTV4cZVhFqBuE28Y2heQhN/SV50e19dPw4d8J9
	sUFWLOQaunAKpfficsxZ4l2j6oOtCmsnki7zkeIv+azELhaHwH/oK9gRNQR9ZHxh/i1cxCAi/GBdf
	DXVF8SmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQq4-00000006Hzd-3PVV;
	Sat, 14 Dec 2024 12:01:40 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQov-00000006HrP-3s5B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 12:00:35 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=bU9ZvT68b35Vnf/jG+nfSrI+u3RPLfDLpdt/v0IuELutyH6qBHcNxA/9v4cNA0OWm0qwy2Abbu4H+2hht2o6uFqsSWFI6qEwMkE538QD/8XH9Gim/mmS/2XBVmLuH+YrKXr7ebNVbY7Dz4y1aT2jeY914OjR4TmgU6x8DWAUW/D0ysEoRxPWnCguuxCFsPJIOd4VCvZ7PTZnjhMKntL3vECtxyYWR0bERB8zB8pms/9JIstrYj14q7EBkYmP57VJIOZbel0u402ZxNXiDYKG3L2LnYXGItR26WYO+OMsxmUOtO04OvYiLWrp0gWABCOtD3yp+lQlisy1k97U26A+qw==; s=purelymail3; d=purelymail.com; v=1; bh=vZjQH4jLLh+PJA7ZEulwt93RcdAvvXTWLz4r72z3nAQ=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 770029855;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 14 Dec 2024 11:59:06 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v1 1/1] arm64: dts: exynos990: Add a PMU node for the third cluster
Date: Sat, 14 Dec 2024 11:58:55 +0000
Message-ID: <20241214115855.49138-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
References: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_040030_032379_1CC61521 
X-CRM114-Status: UNSURE (   8.50  )
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

Since we have a PMU compatiable for Samsung's Mongoose cores now, drop
the comment that explains the lack of it and define the node.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dt=
s/exynos/exynos990.dtsi
index 2619f821b..c53df5d7c 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -46,7 +46,14 @@ arm-a76-pmu {
 =09=09=09=09     <&cpu5>;
 =09};
=20
-=09/* There's no PMU model for cluster2, which are the Mongoose cores. */
+=09mongoose-m5-pmu {
+=09=09compatible =3D "samsung,mongoose-pmu";
+=09=09interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+
+=09=09interrupt-affinity =3D <&cpu6>,
+=09=09=09=09     <&cpu7>;
+=09};
=20
 =09cpus {
 =09=09#address-cells =3D <1>;
--=20
2.47.1


