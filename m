Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8FBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=; b=envZcsho8ShJjsGLi7kk1aHx4H
	hxUlw5QXe+AMb5JnWguj60TdPiH4I743gWK3VZhwGD3ZO5OXPDLZ+BWJoCCEHJkb6ifrR/gUOqIFC
	8bxFWRENzQ+nHkVXkaAuGPVKTne+oWjTuHwPTYvbxvYlayVSzuagxhbyJqO3NelPVq86kmGKBeF6e
	2oSZKKbBVkfUidToIxs6Rn99f72r2WO3UNn9/52xzJ6CnQZ+QKjNAfJvB/BNbeE0EqJ1vnjM2/zrW
	2RbCZvqFSQoAMjBCAMdjYkXWYNn1bEsEw+9yV4wJkOz1Mk1vIRQjz8v/0lv2DrX1NkMb4opFkFuZ9
	o4BxJssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qZV-0000000D4Xj-3aok;
	Thu, 24 Apr 2025 07:00:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyj-0000000CyeE-3Ftv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0782d787so3505345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475752; x=1746080552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=hN+ORKPelPeKUqsUnP14EkupNd/LlNVl1rgmLp2TEmHJF/WAu+GGE6XR7nRmY0nSAk
         qxbnBsea26cwkEh/MKQsInoB8VBgOvxxAVqJk/wz21VZxnXyCV0NBk0iZPSQggWYONRe
         xT7Ue6rDgzbk6xM7+TRAVT9D7S1VgncljSmrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475752; x=1746080552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=s7l951AhF4ILeolEI0SHLUDc7CYeB2tV35zlqQE+NOq9SxuilinSKNKX8N2N8dReua
         PY5q9fzX8gNMxGaN0zv1puUv52wdLcBlCKoOu0urexz4EuXwvsTmgRP/GqlYXFP7IQ6D
         YX7u4iVEhsbofGpKTBF+myDT8NflbLGuvDHPLnhCVHRBPwmgA+PRTVpn8ogU2Comqn5v
         DJ0wxklH4koOILuCIzDDA0Ix0cPImpspZmtNHGv/XV1aUqlGQfNX/cVIlpystV5tS1xE
         sTiTsULNTcR1i5XRguRtzV/TxBFXeuwc897DCRGx8ncy7f+i75hMwWEtOJytQ1+Tvzbk
         IPdA==
X-Forwarded-Encrypted: i=1; AJvYcCVqm+fa8vi9Vukhvz89MrxMgIC+CQL6Ib7WCCw/mwM5I8QjyP+3IvQdJZk93hIK7PfPubCcL/b+gf5d3NMcfLdU@lists.infradead.org
X-Gm-Message-State: AOJu0YwsZFNsaExdG633IeXw6b+ZakWBVTHTiOnLo4QILtjWR6/DU1DQ
	GFQUVQVZh7BUxDzBh41dRoviyC6K8aEH4KI/YLXpNLRP2JGIC2ZAtg3aQWfpjh0=
X-Gm-Gg: ASbGncvmgsYpHZrqmXap1+ttD0BrWWw5EVCajm3L/Lc0YaFm4aa9XFM07/IYhgtf6yM
	7ugEBg1tFo6geRh6LdS1YIHGT9xybgJ16V3TYWYxKmb8lMDf+hsyzMpKBsLrOXOvjpB90A+p1LJ
	Sc3k8Aqn7UWFFrEfb2YBPlzyMQ3BltIFfVDeBk/yu317C+eiiU9+ZOtzHKnhHlkx2W2VlgrxJxD
	InXURNCyTI2+qRORrIDZ3d/CoE6bR6YSJDuWxvt4+yAcaMFNaYt/4nfv9Wk8+OjHuN+iHAoUhnu
	SyFlL/d+uGH6MX6DpO/lxaTNCNACkdYsfqJ2uirPPQp1dNn7kNwrx3E4sAqP8c6N2s97slhyOvu
	NIdu6
X-Google-Smtp-Source: AGHT+IEM0/VMCcdJocFhRZ/eLD26SRY/PzYxq7+AJZINwcLXa5TSv1nOFj6pBR4AmZJ1H3dAT+70rw==
X-Received: by 2002:a05:600c:4693:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-4409bcfc1f6mr10567655e9.3.1745475752419;
        Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 18/19] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:48 +0200
Message-ID: <20250424062154.2999219-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232233_813918_8ABD56C0 
X-CRM114-Status: GOOD (  10.03  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0


