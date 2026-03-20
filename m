Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331901093191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRK5xBK6BAOpYcXqRcl+8YIfK5RsduYG9moVn3vQfqU=; b=gAeYFi32J7MpFH5ytR5o4BDq/0
	S0uqpLJZdAcgubzD947tPe1cacoyuc7QhyLrRnkAa7U/pAxGWBDAhqiI+Yn0MdNGMDr2V9/po/D0k
	/OnHP8TR5E/t6/Mh8ZEadmC6rqdzDZkn2ljDkkII+YKRGxxi5+ck08nFl9CJ046e/7E8jW3YH+0Mc
	2rynbhYFEBafpRfmqRyMSqu6ZguZ/Am96t6Yc131mS2i7kJ1KnQX+f3d+krXvygf5atSsrlJfFGkp
	l20tSqlXzD9Nq/fljbXxY5dc2JRsoPkkoOXWIGRwZOEdX7pfOINEuyQdWj6y0Rd8hdEoWnTNZ2V+8
	bph7gsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTQ-0000000CORD-0cXU;
	Fri, 20 Mar 2026 08:44:52 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSz-0000000CNwI-2rsg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c73a12af63cso275872a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996265; x=1774601065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRK5xBK6BAOpYcXqRcl+8YIfK5RsduYG9moVn3vQfqU=;
        b=Lx4MxIRVBpSjKJLmbaHT+puHIhOKSI0I6Qg9vL0fDdapXpzMc9s2rlkKB75dQVUpl9
         AvwtNQEN2PC2zADuUWQZJcsBpZQXNK/e9zPooRjLKp75j/KdsTENH0GgAvXsDNwohOWE
         8sv5rWNFYZgPEPcpnF/8Bj/X0U67wGKXymOsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996265; x=1774601065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRK5xBK6BAOpYcXqRcl+8YIfK5RsduYG9moVn3vQfqU=;
        b=G5wVr+59MSvE9HucZxmi/0gKmR0DwQUe3WVef8rQVRWA7TEKgPeCobSk1C/pRCy4Au
         f7DKj1InFd0kNWknxmEfczvk8rwQIElFEm1os6y+9rPwFDTNKAyhbDVkAM9xX20hU6Yn
         W/IjvbC2eHYgsk9P3ErIZ+6VYdeFUcuhzXduPP1L20kRm6+34YrL9B/vCeWEwWAd1xOe
         y6fxPycHENhP6Y+iWFXBcPKpyAyoL/HFFEQJg3+lXH1cYxcVMtHFohuDLLlrESPvlOJk
         vKaMrYTFvglxCJ4jza7bfuR9+7sxXB1OfH0xQ3gS5J3cOB5zy4SMJ5vqwv5PR1TmTc02
         KqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRUqJnSFHXUlvf2mojjbxPhbBzmUCOicy/JlDOvC7W2PDYVoDT4Bb5iwAmLwCGmM+y4abR9Nf9kJ8lfPcWLuEB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2HY+C074xVdElbR3HQVTJl+tL89rQWb9yZGoZZ2YbI9Mgxa70
	Wn59BfBFRFAmIhOLUqrqD1qDDYKEpXImlV9wUzHYrzonYTCrPqCi+lX4dIWSXTQB1g==
X-Gm-Gg: ATEYQzyweDykewnulqQk6BWr4YIr2RllT5WOSB1QXNvEMcBYCNiNKU8+O+tLyzp25BR
	zj3C7IRXBIH5a19Ybikq/SNPUPAsJTDGKuq1LPzHJ5a1/r1twsw/rGhjRiB607En8Jn++8W0bgc
	G6IU+FPYfYiARF2Qn4eN4k/EzeEXDXIaDd4bhI2dheDakre7b+FWRkBCauRlT7/yxl98J3dgEOC
	g0FqW1DRW5nYPxsJXWf/aJGrsn/A+jEh01uozW36cpRfBpdLaWzjkfqcEjTKpNsyndE9W1QxpLv
	mjMBy1kYG8fkGgYmcYZzKv5uZ90S5Wal5UuQJXIjKCCJfUwRo4fvHEAC4Vby+QdD4iUfVplLuGS
	T7JuA2S0EylZbsTb1PMwxTioX+nhmOnEQUUgsgwWLT4Y9jh04tGTBGUO7dz9e1S39EOdSRCQE5q
	/MbMK0tqsCctziWFt0RdHunCRumYcjzLWcCcRMEIfB+H1Fg10iCb/tY9zeFrk0pF9YnBgGsWYU/
	//O7zbi
X-Received: by 2002:a17:903:f8e:b0:2b0:67fa:dbfb with SMTP id d9443c01a7336-2b0827dc4a1mr19058875ad.47.1773996264637;
        Fri, 20 Mar 2026 01:44:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
Date: Fri, 20 Mar 2026 16:43:43 +0800
Message-ID: <20260320084351.2461060-12-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014425_800734_04FE6BA8 
X-CRM114-Status: GOOD (  11.99  )
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

The VBUS regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ca747531629d..19a24380044d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -212,10 +212,9 @@ tboard_thermistor2: thermal-sensor-t2 {
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
2.53.0.959.g497ff81fa9-goog


