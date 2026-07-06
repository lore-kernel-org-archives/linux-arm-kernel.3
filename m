Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A4CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pR1b7+xzGSlhQK0IQGnCFDCaN1WTfnJWTFTWbY2IVA=; b=b6lczBlMsrzM3QUw98r75Kj/4c
	F4++rPhTMujr91mDTAg5ezVvzIPhuBKsV7EQs8UY9gm+O3iEDMtdoRsuh2r9Cu9aiKqi811n8GgR6
	3zITN4mNBIyEd1YqA0nYIxiWrg0ZCr9O8fYup8PIzLWac7tN1Cfl2rkMQ9xVzYG5ksmp062aROq9v
	2PQ6yYo2734p2aFBIisP9m1UJY4U42yUM7+jfXt9KJ1dAdqC9rYGriOfPJh1B7Tx+TyyUt8Grnu/K
	Pdzbdh5eTxpZdsEzKdqMsi6JPLNqAt+aqg1ezpIK8j5pOMiu+/GDXCtCK08chMJrAmzgt0zcIjsuD
	1L1sStyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTd-0000000DVXn-1XYB;
	Mon, 06 Jul 2026 19:59:37 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTU-0000000DVMj-3HHI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:32 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so1273157a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367968; x=1783972768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pR1b7+xzGSlhQK0IQGnCFDCaN1WTfnJWTFTWbY2IVA=;
        b=fBHpGghNFuv5lZGk8e/wSnqsRNFRvbbCo3fD+aBRFuaolIqh26gNhHwhDKaM0D6xHd
         fWdBFU2+CiSC6cKes0l5FFaXr7FDJtuY8rIpxmLnErIBQIVTMNCXToCJV/oceZDVaLLX
         GQ3WSjPNcEQGBrWKXrbHk65XlYWa5S1pdK1CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367968; x=1783972768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pR1b7+xzGSlhQK0IQGnCFDCaN1WTfnJWTFTWbY2IVA=;
        b=YDARcEIG6Gylb27j3ZOdo3Skb0y3l0dyP8nZgaq6tDzP8ytJ/65ZOcmkXQ6DyRZ6I4
         J+MzW1r0jGi3zAXbIY1HLoq9f8578WigaeCSeZE18YrgRoPxwZ9IUo/t7g0x8g7sM/Ic
         ndUOnOXhH03uVjTTn7FmpRZBq7GyuBLnZ0Wvi808mahZNSiYbT43WkgkIgJqgu1AdUYS
         +kUp8Sa/K7t4d6Z1fzJj+totl+fZH1WQN7WZBfFksGohFnm1XcF5X+pcaWABI9H4i7Wc
         xQEyNQ+vDdZgoGApO/HIUZPRJjEJaqanR8dSHfF265kpUcJxiehUaxjSs0g73sd2sAv8
         vw9A==
X-Forwarded-Encrypted: i=1; AFNElJ8OrBfPin0S7+L5J9ken9EwTgN2jeds91dvNVKG+tqzMvTc5TDF2tdzHLHdPCcbTQj2Utpt9GUeAvj9Czlsvhnh@lists.infradead.org
X-Gm-Message-State: AOJu0YwP3EyZjU8xkkrwcSjj9MY/PgUlEZfy+uePKiYlN9S6+3+XGf9a
	5sNoesFX1SknntFf/ky3Nxa+LtEKBffT8elFltnK5FeuUhU873SfApxTCUPOHU4TDw==
X-Gm-Gg: AfdE7cmPM28x/ZviJIMdcVVvvOIrajEHeFX2HyZazcuRf51j7HdMO8bg1Yy8/Fqkqg4
	f7V18pcItG+QcV6UOF7gCB8X350youpnCXCNAk1PXKTaRhD4dmHh4vFMJjQvf11RgqYqi1P2lLR
	b7ean4m3BsH9do67o+R8Z6qeJFu2bE4UbmWfNaY1bf8psXX+HBv1SlPe2sZXHipF8OAY55RLXP1
	KgbQD+1V77C7jstVGzuScU7A9/T2n0rcvpV/YVnZ1l60PpSM1hz7H5k18m+NtvD3765SUF3r2S0
	r/m2Xlt4ay6yR1RtmQZfSFmXL6FlvYlsbbQSXM7sagUy0w5QRPWwskUi6uxTvyE3JeGdHIKO3K6
	i2Dxe7uJk10b+tABt4nK6q9NLrnMOELXqcrOS69qKzzlP8jPmu8IL2HtxzcG91Tt7F+6qzjjMF4
	vGX9BDjTM=
X-Received: by 2002:a05:6830:3887:b0:7e9:b4d0:53a2 with SMTP id 46e09a7af769-7ebb23a11b0mr1118805a34.27.1783367967800;
        Mon, 06 Jul 2026 12:59:27 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:27 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 07/12] dt-bindings: mmc: rockchip-dw-mshc: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:03 -0600
Message-ID: <20260706195818.3906949-8-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125928_835920_3D23B59A 
X-CRM114-Status: GOOD (  11.46  )
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

Add the compatible for the MMC controllers of the Rockchip RV1106,
which are compatible with the RK3288 variant.

Unlike the newer controller in the RV1103B, which uses the RK3576
fallback, the RV1106 controller is the older IP whose drive and sample
phases are set through clocks provided by the GRF, so the RK3288
fallback is the correct one here.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 4965bb518c54..21ecfaa454f4 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -43,6 +43,7 @@ properties:
               - rockchip,rk3562-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
+              - rockchip,rv1106-dw-mshc
               - rockchip,rv1108-dw-mshc
               - rockchip,rv1126-dw-mshc
           - const: rockchip,rk3288-dw-mshc
-- 
2.43.0


