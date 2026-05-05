Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFE9CD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=; b=0PwOT8d3p7wn1YAwuHDdR24ubG
	mwvSSTlv6xB7JtSw/W8CMRPjGjxaorjitovK6TNRvz4qPAP6EbkOkm2Gwhzb1KmcF4y2JS1pPbkVc
	maMN0fqe4lCyL+JqPw5vOla9uDsPuEji1n19OdHFTddgsIg0TRE/CtwqDqn5WRZTO9pcPJrdTWCyc
	M/p3APyzQJaFzqYs7A1z6XqLu+ycOywN1axyB3kBtBZfIEm/iW5EiJgQpHiL4niwoeY5P/JZl/ghA
	ZGDST64f78la7+xFt7nQ/96ZxmkgWvKQysmqROkMSe4gCXdE4o++RVsBvFa6LrLy6ASu/twdAH9s9
	EsJF++Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnH-0000000Fqf7-3RRI;
	Tue, 05 May 2026 10:14:23 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnF-0000000Fqdw-2etj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:22 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-837c09d2268so840807b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976061; x=1778580861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=;
        b=YPjnZGnJtaPsaABUtY8oTRZB8A/KEyhcnhucpMO/lPqLmz+DAbuzL4yx0aJmQl9z5i
         CH0I6v8YBIIsHxpBvtLzuDDP8ANL027W2KEsU0IZ8RUlJr6m0Z7UgWpOoMDyNc9h6jUo
         1qwNDmTdARZiL0MXBlbI2CkjfTV0rLMwN+API=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976061; x=1778580861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=;
        b=phL4LlGey1apL6zEo9FMYfGljcoM0TQ/49WPnLmf46Gm59xzmYQaHQeSoYPiUTJspw
         3wV5Oq/5zULyLZRAysKrUBg3v9fkNMPHCVadcUnVzMHgMYiHso6hk8lfchYK2aS/lLr1
         M8ASHtuog9w05KXOSQcr2lfy6GDdIcZYnaMr7sBwpm2Md0bT+ctKtjIRV48g/7eRBftE
         U7jxwz0/eJ8uA/lO/M6dXvRYaCkBi+I1c/RRGYvDnA3tGneW2ruUyYkGeKm6SY3sdd9a
         kCLgXVyrShJ2/K9FBJXjxmTwzElBn9/4r6yCAjzvyWZ0MnkFtvp6D8NR5iAFQXZHHCh+
         UwGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RiXLKVmLNsYyPl0QdVTrh9APXUo+MMpFwcqy0pXcUwA8fE3eG5tUinWc7lNC2XBLbnyS5WIUi/JSLrkrczkqp@lists.infradead.org
X-Gm-Message-State: AOJu0YxqGnSWc7MB1FaBqkCr28Td3wAHS/WaAc+nBXT/YhtuGq4UqHMa
	YkVnvF+mZq4NVFRV0rbH6oclIItygEwX5Dz7lYBSWaoAPeg5zE+UqjYdiOAjJjAtgQ==
X-Gm-Gg: AeBDievvz1/V3QUka3XcGfaqWKGA9Dqk6z1wSBpyFl5tk6Qpt6ED4VFLdF5+XCQxUxC
	YmI16hNeQnsQ4nEbarbQdK439ySrJSdtxeAWq1szplojkMvPWIDWqxpcEIKFGHVB1CJpr+0so9R
	72+zdC0/FtVYmYrjnOigysUl/YRjPjxY3SXf6LFz4yFVSfBOgg4zAiee6owjyEV/2l8a812j6M3
	3/S8R98clmwtgUtHXdsoVfm0dL1MuPqS/7CEnSMYp8cmpXZ5Vw3G5Hac/10Z0MeorSKjFLvhyqY
	mvW6Zf3AMONZQfP6CMUUngTO6bGswRuigMD/zZ2UGAJSLC0IB3ZvrobDOORw9X7EB62mC6r5xY0
	sryCdqQM7EuaveUPVTz7Px70x8+ii+wSXv8iw7dEwwpkc1pufcx6XqWqcJKkQt2Vch1YE4znMS2
	+22o6TAh0lGdxVYxRwU5ZjsLYgiW8BuG2DO3b5SnMrG7TAJraHKUpl5sRmHmhwhM0/zrnZc3V4U
	GvN+qVSA3T7GO4MV8G8P09wquwItQ==
X-Received: by 2002:a05:6a00:4143:b0:82c:e5d0:5249 with SMTP id d2e1a72fcca58-83921eeef5cmr2466196b3a.8.1777976060673;
        Tue, 05 May 2026 03:14:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:13:51 +0800
Message-ID: <20260505101408.1796563-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031421_666454_6088BD65 
X-CRM114-Status: GOOD (  11.63  )
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

The MT8186 Voltorb device has one MT6315 PMIC. The first 2 outputs
ganged together, and the other two unused.

Add supplies for this PMIC. Even though the outputs are unused, the
inputs are still connected.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index b495a241b443..0250b4eeadd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -73,6 +73,10 @@ &spmi {
 	pmic@6 {
 		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6319_buck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


