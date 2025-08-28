Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825EFCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kmiVUhRavRhbmTQQVKaXaG+VoM+x59cj+sqorjef2E0=; b=2uUkK/x6M6At6HIW+7e08K3Eww
	0DYGChM/Ba7DjkLqySamqIQIrPM/S2YUnx8FReQq0pP/E50vXMsCyaE3Qef9JBEacmFCjKPdLjcIY
	ebE7JGxYidEA4zHMg7eNorzaRzgDZMxE+A/USTVcqfXJK4tqdAIbo3O4H303gPNzzAKk4zX72FLuD
	n3+Kju+/AQ4zBbO9BXHZEit8P3DNMgRGOjWXQOk+5ZGh/ilqAO4gBKsScG29PlGoMzNo0KAgjQX9q
	bNvFw+B60hUOsfPnX0icowIhU3/rauKh3GZADlAJg+86MhD5HJ+u3icLF5n6uS/9FyEtp9j4oWaqb
	Z8qC5x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjXG-00000003DiF-3KYa;
	Thu, 28 Aug 2025 20:47:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfiM-00000002IXg-0J4S;
	Thu, 28 Aug 2025 16:43:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ce47d1f1f8so625145f8f.2;
        Thu, 28 Aug 2025 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756399384; x=1757004184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmiVUhRavRhbmTQQVKaXaG+VoM+x59cj+sqorjef2E0=;
        b=X8n4myXRC1ondWc0u70ZYMk4h+IkX4uCcfDgf+l8WvjhInh6VUgDPrJ/TyBBDDRKwl
         xoZ/NcPekxakETRFRVEEgdLZtaZT9u4/h4iKnB+V6gHmGmhD2Z2YaEag+Iru9YaQlD6l
         UH35SXY1CBKVxgSErdnoiNt6/wtvsAG2AeGJO3T6MOv8QyMFIUV7ZapvDsLW22OIU7fM
         K/Ze2ptFamHIx+KEaqXYo77y/lAXxBGdySONrCRg5qTBvlPo/XRaLMzjSkoW5L5HyWNe
         YxWsKf418nJt+pRbxOAodIc1v5rvcbnPXImXrKouFSi+uzRXGonK/RudC8XFySbx9jA6
         2ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756399384; x=1757004184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmiVUhRavRhbmTQQVKaXaG+VoM+x59cj+sqorjef2E0=;
        b=a9K8fbiWpSB8irfRUkv4/3qcyshyMUqFYOI5GAxMapr2L2ldVFPsFsDUM9rbKaJMxb
         q/pYs4GimaBVFg7Mn2qiZUXX3Rv4Ji2XRRdVIjObKE+n1lh+z54iahL4GmGrjNOYWMBm
         t3PnFbWSQ7dQTbw537+WE2k4bz9oDYvjU9pWWW1fDtC2PvJ1S4RL4jXyQktEytIeCdvy
         iu6BJa/BZFbK9GdOSY1yAwhi24xeNwbc/pZ2yASxiZC8tNTJ5+EOncSB9l9RO+oP+IIG
         zdi1fHuhnWxVbzwX7wM24s1l2FOSA3qblIpSzXYN7ZMsjkdvMDk+fioht8eyyUrNQ+w9
         7Ixw==
X-Forwarded-Encrypted: i=1; AJvYcCUgmii7KG4uRdLqwxj+fHjifU74CBsuBtRboosc6HBu/j7z5ACz4vHHRxfwSPnP9WAHoss09d5X0NuN6hvr1NUj@lists.infradead.org, AJvYcCWfUoVeA4LsgHboK1xeP+uUbfnhdEwcBZZIdSsVN05yT/v+1wHbsmvj/yInVR5d8aMsf0ZA2cIiK/406Rr9Vew=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMf/o+DpxqJzkRpLRO3EXpXVd7U8SQ03fovHim5cZ64RDb2weO
	Dd6N54X+MfaXTN82xjtOwODV/qgvlZy77eo0+Su6w667oTEHA9Q8R2U0K97eEg==
X-Gm-Gg: ASbGncvaI8Qyr3uCwS4alm/WjglVL23B32WfvC6qP2Mp9SvqIvCsClzsu5tRVmC5aee
	0hqn9ZCSCTI8vI8eRMKvacMVM9bQJd6M5nRB0yzaP1Xb3IlmLPCU9PChGiVmBE2wA0y9n/bqojT
	Qz4NntSm35DRj4l2z47KsFZBU8h26sd7qq+8n8Ty6zCXQHawaVth9SkWxJZIBQSvjDs+FAtrn5u
	1i1w1WEnRxizzYqwjqfNzB2Z9Iw5cbGvcf3H09fRsJ4GRolrCshFP0kLHGqHa6/AsHICHd/FlZr
	8p+u7pZOMa2VHn9XrqXjyHAF0rQfmMZnz0u4F86oy9qfAugH4UuWmxquSoDObAt0lPR2f4Kil/O
	Fs3BuMvgXpITzLlozwmv+9XAUx/LfsDRhfzwlng==
X-Google-Smtp-Source: AGHT+IGZ1oHvbw7/WV61DeDUCKQxNQm0uGXVNfsfYJqhufPLLEDZwzYCkoecNuE41vbu/p9STOdVJQ==
X-Received: by 2002:a05:6000:18a6:b0:3c8:63bf:4681 with SMTP id ffacd0b85a97d-3c863bf489fmr14282744f8f.54.1756399384355;
        Thu, 28 Aug 2025 09:43:04 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211cabsm26033204f8f.32.2025.08.28.09.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:43:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: add SPDIF audio to Beelink A1
Date: Thu, 28 Aug 2025 16:43:00 +0000
Message-Id: <20250828164300.3829488-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_094306_112312_A8172932 
X-CRM114-Status: GOOD (  10.72  )
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

From: Alex Bee <knaerzche@gmail.com>

Add the required nodes to enable SPDIF audio output on
the Beelink A1 set-top-box.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
index f7c4578865c5..b276a29bdd85 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
@@ -58,6 +58,24 @@ ir-receiver {
 		gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
 		linux,rc-map-name = "rc-beelink-gs1";
 	};
+
+	spdif_sound: spdif-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SPDIF";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_dit>;
+		};
+	};
+
+	spdif_dit: spdif-dit {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
 };
 
 &analog_sound {
@@ -325,6 +343,11 @@ &sdmmc {
 	status = "okay";
 };
 
+&spdif {
+	pinctrl-0 = <&spdifm0_tx>;
+	status = "okay";
+};
+
 &tsadc {
 	rockchip,hw-tshut-mode = <0>;
 	rockchip,hw-tshut-polarity = <0>;
-- 
2.34.1


