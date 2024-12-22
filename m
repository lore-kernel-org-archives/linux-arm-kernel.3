Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8214AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S80oaXL7tWde73OJYkrltFLEiYprDrAutl/drFrRVyI=; b=ITTq31GdjVmW4hq1/q/HZIhPTY
	JL57Es8kqAs/pfxxjUmK4jXM1+NWj9S80HpVpViDRgrHKL2MqzyoaXRaGKKzWUMxxvGJHLn+DvvE7
	nEty6gJnMY0Icgn16R7izbsWMLSpLe9JaTjRpp+sgbU+95P0XOJD6VVp9gqUrk7WkVi63sbVZ75rN
	+ctEvOMoMKuY6KU2VM5KGTd1hISvmxheTfBjVEAfjvQUTOfFssyr5jNxtVtzXg1VtJuJA3Ii/446m
	AOVMBDCbJB+A+xfYdSKdZMg9p3EmpBIdo6SJ5dlPlSpvJOIH8aRv8467z9MB7dBDALxfDVItplPF4
	0tPdnB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPxQ-00000008cac-38JB;
	Sun, 22 Dec 2024 17:41:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPu7-00000008bwV-3G38
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:38:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216634dd574so22981465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734889090; x=1735493890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S80oaXL7tWde73OJYkrltFLEiYprDrAutl/drFrRVyI=;
        b=Jml+LMXWiFAvvEJww/W2zovyEjIMJ+AkJbamLlWvHdDNza7lOVVJkuAEZoCz9HLnqN
         acE3mwSuaOac4hKLOxPnGRTQgYs5vCNGUd3F+qgrJHAqqRAcuwCnrA4NGfo3RtUoZ4Yr
         Bzh9fohv7xg8dh5P86ptZJ3x++rsHkMMdVlUD4TAJtNfTIzj4YNJFfzG90LUuXihon8i
         sS+TpxcXHROdhpJfZO8hRUrrnosQgXvuItUqKtpKZYq3qWxO7Sv0k3Km1j0d1vxlISJA
         VD27QHkxn2RZibiX20gt/IaExRU2mGpyiKEf9HboPM5mEKosjMoQJfxR7d0zsXNURIUa
         cTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889090; x=1735493890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S80oaXL7tWde73OJYkrltFLEiYprDrAutl/drFrRVyI=;
        b=OLDIgR4W1U6hZU/vNOtl4dH7AB6kpek+YKbzk5wrEChVwkNt6e/+u9g8CIWTmzjfPE
         wvboE0DN4GoVWyVul0J+HexBTcMOMaovGA61MlM1sKs52pj9B3BnqcHzOiLuLacR9lyv
         pcMB6BXiTDuNYrYSgaeSvdiK9l3zavlEaqVi9NULw6oo4ibCWXe6CSv5uLR8t6i1xzlk
         sgTgWlK3Izt6kpfcTQiqBnCi7IG45BqD6+4QRzvjGkMOT2LgQpX24WCY6MeQaWTYS2cV
         ccrj4HLIt8IyP02Gyrg05v97Ku6VOI12JA6rGr+uhcCWJ1PePmS0DJhe127dmADVN8Iy
         IBlg==
X-Forwarded-Encrypted: i=1; AJvYcCX2d7zfnAl1fmMTM+dV2V42pkE7z8e9bIDMR5m5gqcXS+ha8uJZTI/TdrySI0nFHWX0blFXc8tOCM3QBdcF5AId@lists.infradead.org
X-Gm-Message-State: AOJu0YzKX8qdgT8yd91FSDQ0j95JwOaGVoqIK+ycF4vgfaXgL95c5X5Y
	QgZlkywgh1srmPOL+HV7FF0AijHjpPlC0xfQoGPXtg7ODoCMDhjA
X-Gm-Gg: ASbGnctYF8itZy/lbbbNyS2/ojLPOV8AGZAWalG3R/qWJMpYBiwbFqfIF+V+hWWkhRz
	RJSiV+Jx5FwEUVJW0g5OzXknnJ7Jz0KuwH/dT/53zMbCpAegaif1pP9HoH/iBFooa5aWnR4r4v+
	pR6SkWf+k9IwK/n6yXhAn9pkWof+//zV2xfHyRJs/83wtWvp/1NBhtrYMC0FNwbBiNAJ9vL+8MA
	9IeHPxbc1cXagvOLoGWsNXpdVhH8H2OWICDJOhxKooAenMRlEE4AroXqw==
X-Google-Smtp-Source: AGHT+IG/coJgJoRcCwH+ym9eEokRTEI5QsTKkiAPkjlmzFEzuwTbG0HAJLv5pnLBA72WAXtndYWp3A==
X-Received: by 2002:a17:903:2acb:b0:215:9470:7e82 with SMTP id d9443c01a7336-219e6e88179mr122699005ad.4.1734889089738;
        Sun, 22 Dec 2024 09:38:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc964a73sm59328175ad.45.2024.12.22.09.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:38:09 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon, 23 Dec 2024 01:34:50 +0800
Message-ID: <20241222173750.148071-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_093811_833155_993579C0 
X-CRM114-Status: GOOD (  13.91  )
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

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11 SoCs, along with the associated dt-bindings.

Dependencies:
- Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20241222172735.145764-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) devices.
https://lore.kernel.org/asahi/20241222173240.147675-1-towinchenmi@gmail.com/T

Changes since v5:
- Rebase the series such that splitting s8000/s8003 device trees is the
first patch to be applied. Now this series depends on Apple A9 device
tree being split, and the T2 SoC PMGR nodes are added in this series.

Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Changes since v4:
- Use imperative mood in commit messages.

Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

Changes since v3:
- Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
This is required for cpufreq to function correctly which will be added
in a later series.

Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinchenmi@gmail.com/T

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com/T

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (11):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
    compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s8000: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8012: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  20 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
 arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 42 files changed, 7095 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 9a33cbb3b1e4a0b520a131aec028ddeb99da48c3
-- 
2.47.1


