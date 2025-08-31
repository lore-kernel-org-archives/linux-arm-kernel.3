Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834B0CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9RhloQd8FyIRUvh/1W1whEioGXbbLiifjRKRWueUl4=; b=J3bpRRaqppRbWtzUWYP83mP+L3
	a5jFXoRG3nObnpiRE+GIG38alh0juo9E7P24wQUIrz7cxxRXGesof8Iov0NM92iMdem2rzou7DClA
	Ft/rNZwoQf8xywvkfHi3T7TgrVnQM1Mf1urxw5ZDI30yooq4uMVATwhnSARJCCMwzulzh49ei0swa
	c7vJtgtGctyRU1uNj85l+rDc0UlfjiDtVBDdW8g5TC6MJDYBnIW1f5qdsarozj+yboxKPTbw5Zzox
	g8rqA4+MN63Wu4WuT2l7mHvL5cITkAFZ4KGloQbyV35IItfh1SgX/wMdlq0TZuqxityNYFF1e66DB
	UmiV/W/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usg5p-0000000A62b-2zvT;
	Sun, 31 Aug 2025 11:19:29 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfkV-0000000A4Vh-2A9n;
	Sun, 31 Aug 2025 10:57:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b4c5467617dso3213679a12.1;
        Sun, 31 Aug 2025 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637847; x=1757242647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9RhloQd8FyIRUvh/1W1whEioGXbbLiifjRKRWueUl4=;
        b=Uv19aPUDiYvAs2iiPLi/mbciYIcXcxb32JEnmSmz4MRxMY1alkyTgAMShWEUoegAKJ
         VAX4h7uzIVuToJU6VDDYk8tO60ucnTDHyQTBSg4Z6YO4k7m1EQzb9aZrvmUHmqLIZvtL
         x2f1JC486oFRy/PwbQH6blMAirxjlxcS6WsivQGWS2eBUC9zd7x/KqpdQqj5zhouX234
         Dz75RdfUSEwuCEyaavNLv2W93U9HL4SETdV4TkOnDzpZkkV5CgiOqz5syghNkPvfFhds
         aQasI/3sjRd0l+lyhwSqD1xsm9jiMs6tSaImz+EBXWCrIteojWc12FAVgB14EleJ20gm
         2jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637847; x=1757242647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9RhloQd8FyIRUvh/1W1whEioGXbbLiifjRKRWueUl4=;
        b=OeN1DZvc16L7Fz0k7QnIR6IoSvL5VOMJP5LwNAx61GXI1bldWvrzZqA1ARHflygMCr
         grYliXheQN0m+dNTc0WstXmPaElJc/72djafdjXei6PQZ7EbQn2/WhlFw5vYVn0YCaG9
         pjZJJSXBu/lo3SWNnLivxQfIEFV6kcbzz+u3zW+eCAspbw3YwDe7R6AOqcADa66Iwp+f
         2TpaziTGCVXRwl8qv+qkZPMPXTV229p9jYiQ2l+r7wcjs+aeQZwvCQQ+ujNYsGG7eprC
         47pYyT1dy67kXPZrTx02p5baBzHLB0qtdagKnekdKL/ItJc3HZ/goNJgl1/47RfakT81
         pvpg==
X-Forwarded-Encrypted: i=1; AJvYcCUAFbQmOo+h3a5DZXM5qFYldHZkiW+nblilpS5ttzQa49UXOOKfOiDQCpRp7VDxWtkj2d/8bVGka4k36qFPHFo=@lists.infradead.org, AJvYcCVVAYyrBt6EMA6BDnsAbAvLcLnSWi3WfBBzuUbQ+YgTAXDb1tpHz/6aMl0ew6uOimsqUMmu+QZ1I8t+GDV62Ypi@lists.infradead.org
X-Gm-Message-State: AOJu0YwRxZRpTqv5Snc8/wRTlMALIe6p97OGRn0elyHXURCnVicDEKd5
	OxUcqV49Cj2yj+bUGk2Nzgf4cSpThhpyqvHpL4DLJCE31rgHnWZZqO84IuLnAwuGHj+CcA==
X-Gm-Gg: ASbGnctA4bsZ96RdeXdbUNU+rV9zs/UxKMkRlob5E9PoppWb62WchHekOH8el2FCYAS
	Zq0SYvXXDlD0xuaYTvfttaCci4hKyalhc65WTvFJTwX+vOi/eTkILZh+2JrhewyEj0eq74oqZyI
	MLD+nLz82VZv5+0SJ1rSv3mPjctQbvLVnLbIaiGAPd3oeK9rMt8WmSLgRQyZhqLEzIwkcA/l+8C
	uW6bIbG0sXHpAsG5EnwtRnMtYaEKMXIk29BPRtWVxtYptFMjkUROzU2iGXm2ULPKsmhVeoRnRhj
	Mv2frMnIIwym2RT6LxeE3ZQEWqH5uITNL1gat3LjmgAPt4k6lFMMZF5BHFqtNw/Cwj/9GcJUl0r
	uSZSgGQ73kFV1rnNFvY6alvYo43GJOwNxxEP/WVo=
X-Google-Smtp-Source: AGHT+IHJ+aaw5aw2xAtoYYFqlQzNbX+trirXwnDJntQaqfh44rp73111tb3yTPpeEXOyXQHd6503IA==
X-Received: by 2002:a05:6a20:7348:b0:243:c336:7bb0 with SMTP id adf61e73a8af0-243d6e5d4d7mr6150732637.23.1756637846707;
        Sun, 31 Aug 2025 03:57:26 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:57:25 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 6/7] ARM: dts: rockchip: Add D-PHY for RK3368
Date: Sun, 31 Aug 2025 18:48:54 +0800
Message-ID: <20250831104855.45883-7-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035727_553956_5355418D 
X-CRM114-Status: GOOD (  10.15  )
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

RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
trasnfer rate of 1 Gbps per lane.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 0e47bf59a..674a3676d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -884,6 +884,20 @@ display_subsystem: display-subsystem {
 		status = "disabled";
 	};
 
+	video_phy: video-phy@ff968000 {
+		compatible = "rockchip,rk3368-dsi-dphy";
+		reg = <0x0 0xff968000 0x0 0x4000>,
+		      <0x0 0xff960000 0x0 0x4000>;
+		clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>,
+			 <&cru PCLK_MIPI_DSI0>;
+		clock-names = "ref", "pclk", "pclk_host";
+		#clock-cells = <0>;
+		resets = <&cru SRST_MIPIDPHYTX>;
+		reset-names = "apb";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
-- 
2.47.2


