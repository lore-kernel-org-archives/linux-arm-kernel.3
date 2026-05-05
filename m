Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31CCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=; b=sZpn05YzuoX3ky+OzvXtTSKIfu
	aD671JIWSr1j0XIFe5mGi8e5/JX5yvLpnE7td9YSokd5jINAcXr/QXtOZ7DEy1SIaZSF9e9EVf40z
	uNh0l4hNEFdoUvhK1Lfv+NL4j3QncqWqyJh6ft6hrDbAp+ssIupBZsIzpLQOrGD4/gQ64So3tmBYw
	Zz/8YISBA/ODmI2cT2dKCS7i/1O4DVWU8t85OS2flDUUup64mdw5Jnf/1znD5oyD+5z7fhizPQDkg
	bIorgYNsExbCz0cishx6ImavZLF+ttR9TI+/OhyGeuDxlnd4cNCOhHPV3xxN2KSevm24hpe+Y7Jv5
	fvULaDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCo3-0000000FrhS-0czi;
	Tue, 05 May 2026 10:15:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCo1-0000000FreP-2bif
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=; b=M7rkvl2aPA5HY8dZm/33s02p05
	y69zLsQFLJYkoH2CQeAbwbgcuLNccQlqnqBL5jMKowxdn9WhhuW5Ab3YxFAwh5QXGPc9iODWZPkiW
	x070PiWfZwevBB3orCPCUa7VemrPAkI+JcasUc/87NfD1ZYrJ7IFfnFHl/VyR3xrTcd46/MseiBbJ
	e5a1vx4gwGJyTGnqazwixfJa5vCe5Cr8bxklGuC3Dhmjji+cVVxomgbcY7Xv05y9N/VyONUohgCmL
	LyP44NAM6VyoTUt6upd+fkX86NfrGTqHtaEEM6QiL8XRyexCqWCIW12IEcPWdixD452VUXYO7bSut
	E09ajwMQ==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCny-0000000D9kK-2l5y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:15:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1653806a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976105; x=1778580905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=;
        b=UG2+qGHE8zShE04SwXmFRVOmlEFDCCOJTLZC3YcVIxGWJOVvUcsZgqpSMt4UAB/FhE
         4Rg1c5+tUbY+1/G9dcVF8cUAxd6mbzz5drs649As+83tolmTTuFvzKY+GmnkQNBYusTz
         ZaCSisoTUpcvWyJfAjdXh5xwvAiithqUthY3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976105; x=1778580905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=;
        b=hG9X6RPIAPGl784PR/MGhuovWvsNyA5bYHbUyfR2JLxq7qM6mUpSVsi0hWwuU/3wpS
         hZzsxed6XT7RJUmXUggoiF0n0lA3ySJyOBp7TbSr59GLrzAc2RFZmz3f+aCR6fXiRShh
         w2E6AV9jsytFqIYCYBYDgeHRAQB/MGg/gF89XA1cWeeru+JewWoUbNdNtSDeAAVqrZNx
         FfzXlNr5EWNZjQJfA8kd+7RXRNy5IdWyfAgQq/Ecn5B/r+Cx+zSeHVt+ea0GL4m7hpmQ
         76yc8utFa1i/CrLHjHgXuO7N5BXQL1EggD1xyKL1RLkm4Cb5FxR58XfCBHlNR9P1D0AU
         il3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8fmYHDKEhEDtFF4YnAKBgnrp0g121hCATQtq1CZC2uYluBwgQeJI8ATGGep9HeHrZvzd1DUmxBEvkHiPvtKwTy@lists.infradead.org
X-Gm-Message-State: AOJu0YxBK8ChFDbwuT1UmVXMU0NTYcFwQvjxx4DtIBMUY1BipoJF6m5m
	MEV8R/lFhnWUZlyKVtXAzccZRohOIwvYY+x/p3YiznJeKDYQwZ3yEVy/XWCsEIVnYA==
X-Gm-Gg: AeBDiev5h4+aIGCoGfMDxD8QjV06nQsojyPv8VNXGKnjOIJh/4Cf205YGmXLOJH+0rP
	GyJ1Vtmmb1tb+16iGIprMxACpIf0WayAZh/Yo8v/1KXOktzL7NliJtN862SIF7rhKur1rv36vCs
	6n/lSy4DhiuyuWFSXvO7yBJm3J9R7o90azhUWfpZN+aw2UxOoBJC+Z7D/c75KV/2+az20+7d6Zd
	9iFloHVvo+o8VDWfrK0s4/tghggfk8DUtBKSh9rcbkC73D4xC9hCN6gBfR4KTt3XIVg1CRD448J
	V3sp1nNnZ/xVHMzDVPDcfq9UqrM0fd7b9LbGcsdPjGZvFrhm4QjKmDDGRbMtOLj3D6p1AzOBcIc
	oaKImtP+0HsciGCkZ0uF0g1GWsCeQt88ove9I4BK0AeUiZgdqd3cONB2jn2u/I2SYi3ppPCDH5b
	O2Ob8n8EiSWoKF6/XJrAwIiafQkGkA1UgtzTecHusFiOxQhloqB/+1m5IuV9aVXzTV/BfH380X7
	EUZBr/E3Yb4LsWuEV4=
X-Received: by 2002:a05:6a20:9143:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a7f1c4a82fmr13892686637.38.1777976104687;
        Tue, 05 May 2026 03:15:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:15:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fei Shao <fshao@chromium.org>
Subject: [PATCH v2 16/16] arm64: dts: mediatek: mt8188-geralt: Add little core CPU power supplies
Date: Tue,  5 May 2026 18:14:06 +0800
Message-ID: <20260505101408.1796563-17-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111506_831797_13AF860A 
X-CRM114-Status: GOOD (  13.96  )
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

The device tree for the MT8188 Geralt is missing power supplies for all
the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
is currently not working in Linux.

Add the power supplies for the little cores.

Supplies for the big cores will be added once the issue with SPMI is
resolved.

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index d57e0eec676a..4cb23595d17b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -217,6 +217,30 @@ &cam_vcore {
 	domain-supply = <&mt6359_vproc1_buck_reg>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
-- 
2.54.0.545.g6539524ca2-goog


