Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956B9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=; b=kWf3anHnjIPnzKfnWP/th8HM1A
	dzGNQF82eyg1JfIJ2vTWZ4LBRCgoLusyZBL7r7ozLMxfMJtayz3MKSrMuWxlukYNo4BaP8arOb7lM
	3m6JBHZ++JhCzvin6m2zAr+Pbv7PGEOscDlV99BOZCneLJP1yiBIaQNjS99nR07DitVJ/y5Nq582c
	vI/g4mG2GrBlb+DbDtm+7RWNlFRCVn4qTsM21Mr53zXdkzn9FNjQCrILpVM9gWXi8rNPACUun5zdl
	H9pqwHGYev9hroDc7bPTvypvUxJa7UUekQrgulx9kUFFu+YVYvXPiHhKGxyqjtFkZO0nKklbHin8B
	eTXkSYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJy-0000000GXJS-3KCh;
	Mon, 03 Aug 2026 07:42:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJw-0000000GXHX-2AFZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so2290735f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742966; x=1786347766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=CpBXuzcJfx+Iv4RjXXa7xDcT6b7Eq7kLZzqLfiAMfKAYQqEp9XSbDN4e70vuYYe7Sk
         tz+TmCrH4hy5W0fbzg7pH1gyuNndVtC8Z3In0TVu/ID/v54zb18/Sq+Zhj/0kX2/QgaJ
         E6ZPbBubIDC4qQ02D3c0+1p0+efoXETKz58Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742966; x=1786347766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=Tq5BZDtL8dxdUk5rnylrxhJbGcgFDgQF3Kr2WbCWYRxDh1WTAV5c7m1whPE/urR919
         83PVuyLhxKBMr3rvngIUwoO+LZM1Ifdi/wwcQ52sxR5t5OB5iuiTNZiEaw+9j/nxSISy
         efUYUnxbcGqX5c40W+UhMl7qmfEp41fCxiS/MWI4LMPhkJ7LpqGSeh3FNLEu+V245GLx
         xFIp5fYK033PGr4Y7xYqcD4F3t7Y3d9tbYDEs3/sJVdz+Xc++EmvX23SThXSr+IVI22h
         0f2Ap5noy6GXEMVUOnR/fGnu7YE0ksen0MkjRbx3dUalQEphC92ZsZ211ZErpuRBCyge
         pGsw==
X-Forwarded-Encrypted: i=1; AHgh+RrgG0ULIIOnPKRJRPgjRnTHOntQedBIwekP74lx7yqcZUjlSwUToO4KgKN39q2nnfiRgQN2XSwuF+JOGLLOWgBP@lists.infradead.org
X-Gm-Message-State: AOJu0YxgONbdgNUB26fwTUSlc3XDnPOztxoZ4GV+/+zCxa9hlA9+He+y
	bMpi9OpJTEgwbB8e77BZ1Ufymn0mKC4bHiTKLoQGHUOKVA2+Xqr8MsTAdjVc08LVmDU=
X-Gm-Gg: AR+sD12KucOKveyj9Jqg8q3zk/LopKJyB2N02PCu4sDv04+CDsd0MY1Y321r+rfeDdm
	XRB/0sXjfDpFoP18Xr+13JxjaI6yuUJVSMmBXe9fEExewitLx6uXP9rRECD0Kn9lBmsHACQN/Rv
	xqqV94CCuDNn9534oxv+YzhNyi8zphOno5z4IhEmq9kEnil2q3TgfBcwXCPD0PMKN/Q12vXrsUH
	XMSFTaYEG5yoT6kZd6+3gvFZoJDflXMSzj+GTzA2toQ8Krbro5irk72Q7FB1bPLMjxj6zFSrKbG
	aFn4vwnl2PZlb6El8pIl6gr8x8wNp26Jq94Crv9jyzJrs+XISF5wbLjqmoY1wzeyJ142Q9nTl8/
	alXl/qq7Nj7U0hkCBQEsPEmJI7lLqOotlPeNARcOJDm3zD2ul2u5grRhoxAbR9ToIrNR9Tzorfl
	nQFdf2ImkqLGac9UTXDQg/ftnUq663G9bGZW2umyXM35B+NdGi57HleeBTgT2j5O8llbJtgBbXS
	cNYM/XjLhd/xBDdTGYpg//wfc+vzohgf5EluLl6WyPzAGakSootGM7x8hAKv05kPxiS+QBj/uri
	pLTTPTBiL75ewa3d5ukuf8LKp7a/U1u9znoQYXdqk4yAJyeLDZxfK35yFM+x3ZyB
X-Received: by 2002:a05:6000:22c2:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-47fd9cf7670mr21118173f8f.17.1785742966560;
        Mon, 03 Aug 2026 00:42:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Mon,  3 Aug 2026 09:25:59 +0200
Message-ID: <20260803074224.3821911-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004248_571734_A363F7F6 
X-CRM114-Status: GOOD (  10.29  )
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


