Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B06C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63jDLUJazFeD+vHresjDBVcauhED8YkKVS8cbVYhono=; b=JOjOwwJFyYK7dfujqmteZl5s6c
	fNtBD2gOO8uaV14DOM3L1HeS7sfiB8t0c+cvuB1IjAZ+FhiaYXRWpha/LehiOISrNcm759KNsAgEI
	W2YOTSs5kOlBwnEI8GSz6ZGcXdvhaYTQY3bSmuoMA7Q4ZAZHq+JWS1LOyCA6VNDsIgkCG7rWM1K0R
	eqVJQB/bRYdWS+/MbICtg3zNMltuE3T5m1W8jGA7ZiSFiRTQhp7H6ZG0UgYDRRg6KKyROEi4eaRLk
	SpKHuTtJKPzBtlyE4jYSkSYrGaTGmlw9VvHq3P6K8QwvJh65ncjg6NIHDmwT6EXyBJLLUGNyA/Czh
	Qrf9Jpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEj6-0000000Cwz0-04Ra;
	Wed, 28 May 2025 11:13:40 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEVi-0000000CvnT-2VMZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:59:51 +0000
DKIM-Signature: a=rsa-sha256; b=gbk96h/iuTYW8you7S2tyt1pVBCjE5T9hLlpwVj1zezbKIxRDDjuQ2VLMOqdb/5KKAxP3+pGFuu+dchjj2o6/B4inKtrwPzyk/A7FjVjgYPlp3z+1S7T0Gd/cfYQsqu6DoNHArMZdDf+2DyUSPLk3A4X9f4faIJOB76vZjSsLS5qsUTtP6NY3IzvHfZmRWtsBhFMjIxjxAkQytI338x8Oc0Yw+mNhNIXmMBr+ExSLO54uAoWTN5uIrtE4xTeHKNmFxghZGnFXjZ912pklSPMOJ647VErN5sipGU/cius1MIrnb26+fb2swP08DklEwh4BkvlVjqHtHv/qi6qWwY5+Q==; s=purelymail3; d=purelymail.com; v=1; bh=AlBhvJpL+ZxjXrIug0I6z5UpQ2bBMocBU3ycBy27pRM=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 715274949;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:58:24 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] arm64: dts: exynos990: Add CMU_HSI1 node
Date: Wed, 28 May 2025 11:58:21 +0100
Message-ID: <20250528105821.158140-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_035950_712343_BBD2F2FF 
X-CRM114-Status: UNSURE (   7.01  )
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

CMU_HSI1 is a new clock controller that provides clocks for the
DesignWare MMC Controller, PCIE subsystem and UFS subsystem.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dt=
s/exynos/exynos990.dtsi
index dd7f99f51..4ab6e35f0 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -254,6 +254,25 @@ cmu_hsi0: clock-controller@10a00000 {
 =09=09=09=09      "dpgtc";
 =09=09};
=20
+=09=09cmu_hsi1: clock-controller@13000000 {
+=09=09=09compatible =3D "samsung,exynos990-cmu-hsi1";
+=09=09=09reg =3D <0x13000000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI1_BUS>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI1_MMC_CARD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI1_PCIE>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI1_UFS_CARD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI1_UFS_EMBD>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "bus",
+=09=09=09=09      "mmc_card",
+=09=09=09=09      "pcie",
+=09=09=09=09      "ufs_card",
+=09=09=09=09      "ufs_embd";
+=09=09};
+
 =09=09pinctrl_hsi1: pinctrl@13040000 {
 =09=09=09compatible =3D "samsung,exynos990-pinctrl";
 =09=09=09reg =3D <0x13040000 0x1000>;
--=20
2.47.2


