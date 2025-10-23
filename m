Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028C2CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H2q0viC1oKDoybdxIdGnsDv0XEKPZJRHKvcrkOAaotk=; b=ZpiXHMExT8w4XSb/55IkgvEiQc
	z+6VHfgRqssUmDhmOOu6bnbGLC1WnxVekuoE8NiuJQi4sednbk90nUYLaHbbFAY/Ya0ClxjjZKhL3
	Qd8SriSwMALCs8sRwAGIcpboeI7FpEvRs7/WJyp1anR98Ju76ugrd4tkJzsGJj9LV1kz6SIb+v5u6
	abM9Dh71VlfmQmrRi5x7ZoIfLnpM1GxZyrDFCkWVO8A8iaWjdI6UmvedG5MccoWziYKRfjkSbzhcj
	24B9oSRxESftX7zEB8Bp+0yijUoRMyl6O8H0swHG7JKlMiqpF2I/i0LgVtjyMQd0yRCedF0CtL2aD
	FbEq1h5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuHx-00000006Dpn-3Uoi;
	Thu, 23 Oct 2025 12:19:29 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuHv-00000006DpU-3vN1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:19:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33d896debe5so957200a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761221967; x=1761826767; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2q0viC1oKDoybdxIdGnsDv0XEKPZJRHKvcrkOAaotk=;
        b=T5ADAlIutJ8vBQbaOUXYGbawFmwS0lb/dxA+qViiXfJSwOPSYjTju+TBE+oZqU5idb
         0BNx23m4ST1MYIeZNCtnhFjowyzxaNuT1KxDFTVuyLr1U6fn1gz3v9ET0v2EHxZA9j5D
         m17OUH67nU5PMf9Wd1ikgWZq0ENMTzuMp8Y9pqXDstE2Nziz51B+a1kPymzYrvdn6Otf
         8yIVO2AiziXyMoC9DVmtvxhjizoXNjMOmHULbc5DS02RKzjd0tEPBwTWkPDcV39nvsmx
         BeIWHcPdkXV0klOF7wWGeAFwb7dmCu9XOCGjdfxU8NxehsDU7Jpa2c+1rcwk/+H519zs
         0TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221967; x=1761826767;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2q0viC1oKDoybdxIdGnsDv0XEKPZJRHKvcrkOAaotk=;
        b=i6K5v/I8I7HZpHfku5gDVOEBq6uUSAWYjQeCM0TCRt7306HR4ftoXPO6yMHxGH2tu2
         x2xFQtPJLheRk1qeoMcribM8ko6HZsGEOJIcLI32lj/kfuBxtkNuBmpSz/2lzSSbFHQn
         +PDvSsk5rBgm1hkoScvBKzwhpv5tHIRUtVmrMSj1TsdiLcQhyaOdrGn3lcOmRVRSI61O
         s8eTW3FprLo8aL9GbJ/jfY8iWuB9DLQD95LX21bloux6eUjQSdsc8bAFK6/1X8WjF2WW
         hCfXo+hkheMwZm5WSrom72jlyAvUaZQIkmufyMuP3F07OL0l6v+xBythVNBzeu7R8BZH
         yMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfQYAQBmdYtGEwQ2PL7fveE1XQec7NhslQZomzDEiJUo/abZlpCmdne5fg6zI9vOMh4gi7yI+Krc3RzzS/kdIz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp66kXhhpDUKnyQjaueyiK5NW1UrImXcDGa/ri18XNKS2KV5c5
	rPkXTLr0BbUUG0Vfx/xFt/xIUSzWUQbXRkIFOMl6bqB9f8eq0zGRwJdfotBjKMw8kEo=
X-Gm-Gg: ASbGnctVBTscu1Z+W/pQjOVC0n2DOYDfi05/AwmfIaP1sVC46IrMUtPaoS+Cg4LIC/c
	/ZlITDyOvD8ASTMkia4AE/wlYYa8f3eu+J3SNlQvkrLeoVf7ndAcp4kgTj1YPAJNHlU4Ms8nwim
	ixLG/FfGUxB9k0Q0SODmYLnUvxyLyZqzI8Jri3vrSyqDS2DUKJ5qyN3TGsT70KpJCO8g2IoX2fn
	yr5AuFhUgDABMBKLeglK1NZL/Y+mZlMH4NFH6NQSPoYwyKutj9XAElmYn0ZcPokwMCGOjT46H+h
	zmK3kmkgUODvGZlA9bMCkMnUnopU2QQgP95LBcSlSWzYmPst07mN0UdDwyVoRGRyDBZX6XqozV4
	uIxFfefAJkdbD6wLtlW/c/X1C4mzA9ySOEg3iWmpR3JZg9TY34LpEq2U+lN8XMonGTMajkRSM4/
	BtQ3U7xyv6CYmxSqzu77CMUI/is+d2cvPOjQ==
X-Google-Smtp-Source: AGHT+IGJ23GsrNILCdW/8gbVtgjCsaLah5E0mTNdpSVoeuNI9VqG0QCaBp4Eb7N3Z7ssAPYGjAzlmA==
X-Received: by 2002:a17:90b:2403:b0:33e:2d0f:478e with SMTP id 98e67ed59e1d1-33e2d0f5967mr4230135a91.3.1761221966488;
        Thu, 23 Oct 2025 05:19:26 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff37c14sm2277474a91.2.2025.10.23.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:19:25 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Thu, 23 Oct 2025 09:19:15 -0300
Subject: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting and
 Ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
X-B4-Tracking: v=1; b=H4sIAEId+mgC/x3NQQqDMBBA0avIrDtgIqHGq5Qu0mSis0iUmSqCe
 PeGLt/m/wuUhElh6i4QOlh5rQ3m0UFcQp0JOTWD7a0zvR1w3/QrFApyOb1DLUEiJspxrZlnHP3
 Tpo8bnDcjtMgmlPn8D15wGHjf9w9b8i5+dAAAAA==
X-Change-ID: 20251023-upstream-imx95-smarc-defconfig-8972db535918
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_051927_995559_D12586DC 
X-CRM114-Status: UNSURE (   9.40  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Enable the necessary missing configs for the i.MX95 to boot and also
have Ethernet working:

* CONFIG_NXP_ENETC4 for the network controller driver
* CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
* CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
* CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
 CONFIG_FSL_DPAA2_ETH=y
 CONFIG_FSL_ENETC=y
+CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
+CONFIG_NXP_NETC_BLK_CTRL=m
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
@@ -615,6 +617,7 @@ CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
+CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
@@ -1349,6 +1352,7 @@ CONFIG_CLK_IMX8MQ=y
 CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
+CONFIG_CLK_IMX95_BLK_CTL=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251023-upstream-imx95-smarc-defconfig-8972db535918

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>


