Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ayfAvjYeqJrgYUP6e8kHW/UxkKYEhMvbiKhityi9Os8=; b=GzjjW6Ys4OpXynhxrBLGjqXcJZ
	kUgPD/5HuN32D5ixt0XQ4hasgImXNfFpO4V1F/R+hSBfZGUdAmVfGd5N4XLBPs6lJTTTVM6cF4k1X
	nYL6tDHhau/EmgcmHeOb4fl547PS1JmvH6t96z3Dz0O46h9o6EYj+Pkij5AqOIyLds8IqsMxPi5iu
	fctb3oqFMnzMXrIeL+gceymQP7t7K6p45nzRz+n1N5VEOHZ0hpsZ0EkUDMxULspu4LGNEgk4g6uMB
	bfRtk3huIQmxcz2eMSz8rQkrpjcPWAlBjVW0ZTt4i0rmOtpgs4BeO5OTOUpLaWJr8kaIQv+uqKaCU
	dffEKDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9eP-00000002ZxT-0SQt;
	Mon, 17 Mar 2025 12:33:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9cj-00000002Zm5-0AhA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 12:31:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-225e3002dffso37850335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742214676; x=1742819476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayfAvjYeqJrgYUP6e8kHW/UxkKYEhMvbiKhityi9Os8=;
        b=efMonaHpKnfuy1f2tK2ywXqOwCZCI119NjuSrXm7AvgsJVNBCJEtS38bNeMQ7FdfT+
         tEI41euSxqdnYoSThUEt9v9CN93a4HTAO0tDmYG67D4y8hOpbyCZt6ZOhNturrDCjhru
         9eLOp54qChno1CuuwXCG/szSADhEnw9sTgHTtajiu46T4U+Eiy729kFAsUEVXiZcheth
         7oEVempbUrONLTqvO8ZV6bWHbCI24srYh4HLdou3RPnN+myXSgCL/tawtlr7ErtrJqZW
         ExJ9NwoMrtmf7o9nWzNrLNQ0DTi6OO8sYEV8B1iiqLCRuIJnrjuHQl9N3WNcAMa1mHQp
         mqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214676; x=1742819476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayfAvjYeqJrgYUP6e8kHW/UxkKYEhMvbiKhityi9Os8=;
        b=eYEuEnRVzWirwvkq6JzAkOuNhZmFR9Vc+gPcRnSlwkHlP4fTxvCcib0skBg5efvmAA
         GK4TOQnqT4ArohyXlIwbteeQpqOsCspa95fqf9f+AtcExWXah5Zife2pjDs9nl6+z/b8
         zgvgQKpWNBPaBWiah1rQdKwYZb7nWQbbq5K5vdiBDu807bj3shtgRV96Sg/U5Mqq/IHq
         DKY0qKDZ3y9n5u4erv021nowKTIOXIalC9DyfP5cE+u4W71igCMaE2TmZjyyp4w6RD+u
         vrZ3Sju7rvVsU5Xxo0XeuepSY2hkLbl3lAPABapJAr5tj3TWBBjqZBasuJhAiEjSQyvS
         SuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcRAnVSc+LcptUnd13kHPwDeCBXnSG2mSUPtM5ZYSaufkNl92WdCogvhyfok7tzWe7K3KBIBLvaNDH+rsQJN6O@lists.infradead.org
X-Gm-Message-State: AOJu0YxMTLj1NVH9wpjpQVaf7TdnQRALmesdKQUXtKxR+kOLiUECxqVq
	i+WXs2R2I7EPbTwgrbr3+gKV/7qiRfQbh13dB0JpkYZAO0plviq2IbO4GA==
X-Gm-Gg: ASbGncu7fb8ceo3LHTb+cLOglud2zasia7WG3qBO87edNzA2y3ev0u2xZt4qTe9Hx3I
	lEx/FAPnp0LkNUP+6sn35ewLXkAvUd+YgQVPIWjUOOm7+6FXYnCHp4cYG+biJGLNUmQIF3sIc70
	U7DJcfmla37R+BkZ4vuU8/wFkbS780u7arTq7a2/epQ0xUqPdxWenJNbAEu9qXGOwK1yEvut583
	BdpAl+li1Tm9d3j8Ai2HVH8TFChMMVvvRSc9KMSWOMN1r4bTfRyz+s5IHCgoAqTgGCsVyieqETp
	p6VSbSJ35LuMy32S1KD6uHOIBKu+oALVW6q0Bs1emXcJkbtYsCIWx7wxGqVBYt9sF2kBVA==
X-Google-Smtp-Source: AGHT+IFBtkqKjbPIxs74ySsOilsqF1P2xvhpvPrvuUqdkVbilTl2fTrYL0Yhw+mVbxLGQg7+wV+loA==
X-Received: by 2002:a05:6a21:6002:b0:1ee:e785:a082 with SMTP id adf61e73a8af0-1f5c11275d7mr14213711637.1.1742214675611;
        Mon, 17 Mar 2025 05:31:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:93b8:613c:dd7d:1b25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e0f3esm5871892a12.22.2025.03.17.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:31:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	hector.palacios@digi.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3] ARM: dts: imx51-digi-connectcore-som: Fix MMA7455 compatible
Date: Mon, 17 Mar 2025 09:31:09 -0300
Message-Id: <20250317123109.2216509-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_053117_077082_FDE37670 
X-CRM114-Status: GOOD (  12.23  )
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

From: Fabio Estevam <festevam@denx.de>

The "fsl,mma7455l" compatible string is not documented anywhere.

MMA7455L is the exact same device as the MMA7455, with the exception that
it is lead-free. Use the documented compatible string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Explain why it is safe to change the compatible string.

 arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
index dc72a2d14960..1980f751f161 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
@@ -165,7 +165,7 @@ &i2c2 {
 	mma7455l@1d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_mma7455l>;
-		compatible = "fsl,mma7455l";
+		compatible = "fsl,mma7455";
 		reg = <0x1d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>, <6 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


