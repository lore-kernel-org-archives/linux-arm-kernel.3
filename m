Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2140E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/Q5xeJIoq5Ujssv/lVVpXyTtV/F6QlZNcPSL4YMIqE=; b=z9u7iD0tx37xxQB4mLVOkI4e68
	bRSNXmGh2BVuaRdDuTLIuHqzngrYp9oHE1qgdlDbzuqR+o6w2pXtPdl6NJ79AgMKqDvspEVJvVJLF
	LFXiLAKk6F3SRiMXLqfb3UhNyy3HEGshqkrTJ2mRSsHX5OQd1QsA5NKtWBzb30sc+vWzAn1WKCCQX
	J1mtfKICkxc0Ynn/ZxlfucM8u3p6LIMrnrA8VGjrZxzP1Sy1wZAtbbmM4WURh61ftWY/QXZiV72q+
	jGL2Ld3Vpd+H1pSlHpqA0SJk1/nGzaIfqKxWvgmZaPhbsx0V2024qnuofBmB5V0pqG3Z1rJg/VAFM
	Bt63Iwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDuN-00000000gy6-1Ope;
	Fri, 27 Dec 2024 17:13:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDek-00000000eYl-3iKv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaef00ab172so487132866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318665; x=1735923465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Q5xeJIoq5Ujssv/lVVpXyTtV/F6QlZNcPSL4YMIqE=;
        b=pyubXaiO03Gxo2V3mqVUFRMAIfEPJE/maoNco8B2Ln5xKN64fI/s1ZxB9PpNp9ffq+
         0/XILoMpIkFYaHsiFDDe5xuuVzLHdmriluv2EfCQon5k2dda4eSrnxho5b0CV4rPWBsQ
         nUgY2miln1cILBFaOaw/ZH6wHxoxGkpDZn4IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318665; x=1735923465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Q5xeJIoq5Ujssv/lVVpXyTtV/F6QlZNcPSL4YMIqE=;
        b=c+onrEZaVl/Fb6gU2THOKvgXIKRCkcvQJ0yH0NaSQScokAfdDjlmy67PDN1DwpoBjp
         X29gbGK+udYHfyuopcyg4XFdlLvw39VwksepdLC1qQ5k7u0xQO2xHrFPFSM9zqyjSPA6
         b+W5FY19DyKFDx9DKKnZsju3uYj96ClggrCEU2MwBqrsY/ai1AReORFLvlefjwrsJx33
         +MLgT+GdblSEQXf8JwCVQPLVc6e4PFIRgyQInC8Ha+yVNef5tbJpCVCVZXdyQUgZuvPA
         U/k3KfwrP5lpUB7NvB1yi1TIdC0M7Sxw+jwFchCiI3JdE+IKu9j2ucSFlxWWuhedJWuZ
         pl0g==
X-Forwarded-Encrypted: i=1; AJvYcCVgpTckK+YOJQ2NXllu3vNGEEfXPkfzdGfbrOvM88+tATrZzxNH4RdOUATpK8jl+DK7pBOsUS2tLi3PxScu6RkK@lists.infradead.org
X-Gm-Message-State: AOJu0YyhHbQxDoRwAnUFYCaMWI8IS3bpD0nzzCi1xmd6LoqG9E5akKHO
	6let/mOpx0vMI83flf5X/z34w3L3kZY+RegYFqVE3DocOSvrjqdAR6vdtmpAqcI=
X-Gm-Gg: ASbGncvClqvC57KSA6VsmGTz2xWBajFjj2sIde3N28PAYC03tgGQAeAXnc4CeXn1HAY
	eQ8ghQZbKFRELSpMM2PK8A7G+SITsI/9xYhttekttk6U6bCGhsYVQnp7VSVzZta5Fr7elr48mCR
	1fT/CCd32X1rvhHnuKzW22UVqDg03s2CLBVisu5Om99s3Y3qVxFYvRl4foVCvEDKvzsXz7GxOUQ
	5zBic4g+HxCrJAr6g3NtSNbHl3TTUJa/bPqJY+JmSNCvD6bLXaTiVJEFkg2neG5lmcJry3Nmdbi
	557upXvH+z6dTCs74nB14g==
X-Google-Smtp-Source: AGHT+IG7WGJrOsb7TyGRh1ACx7FW71ZyfueLA84uEuZp9U5n20JO6c7QeCVbSZ/v+tRXVp6Smkf9tQ==
X-Received: by 2002:a05:6402:2802:b0:5d3:cff5:635e with SMTP id 4fb4d7f45d1cf-5d81de065b8mr63355995a12.26.1735318665532;
        Fri, 27 Dec 2024 08:57:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 13/23] arm64: dts: imx8mp: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:16 +0100
Message-ID: <20241227165719.3902388-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085746_923725_BA368D56 
X-CRM114-Status: GOOD (  10.73  )
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

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..a1872b5d6e2e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -754,6 +754,7 @@ clk: clock-controller@30380000 {
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


