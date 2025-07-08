Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40583C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=; b=lq2QXC22x2RVcD6Qa8x7yyfeIl
	+QyldBQnujLnKgqNwYNAaV0xKHut53iQRd8USLbAGcS4zSoDBVSQKRVWN+ZkO+/zZZpY+6LHce92A
	c7ZmrB+Qtb+Vt99SJyaJUgQWVPVw6ME8jCrHMzbwb21n2dc41Rrdpqu8EFTBogVLut7KCeImR2nZo
	5BRZQfLvtDzJxu+eX8TpH9GjJGw/WD8klK/Xsakd4MMB8IYuz1F7WTVV80lL13kqWcmySKDD5jsYI
	6gcRwIRftAhXTCJLZgnr7nCoA3Qu8MjRCMgiOzddZitZu1Z1csBwsejXlpsBtWL5KaMBc2KQ5CU0M
	H54NP+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFKG-00000006ZV2-0ong;
	Tue, 08 Jul 2025 20:54:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElI-00000006U6I-0rAL;
	Tue, 08 Jul 2025 20:17:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74af4af04fdso232870b3a.1;
        Tue, 08 Jul 2025 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005875; x=1752610675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=Xw2QZQ2jMvVPUODjSX0iSgpfPKuIvLfbvhmLztBl5DabPefr0CCv6/UZ899YmiuTOH
         GTSqE89jtxMeRIaJr9qz12om2JqruE/kAvdiarf87rxakbzEGtztaNL5nHECvBjJzRMD
         MznQNdhB3+g5PjiGv5y1L0xD7sADziV0Hbb8nou0VCddFeC7XY7pWTwKAHxsiCM2GwiG
         RlE/3Jx94um9uzdYQ77GtoJrywwl6qyKquMQzaN1raB9dCHZr3CHOclnbjNlyF/F+4Li
         Jypd0/+PuSpgHyF8nuPatd8RUE6dy2bNV2wn1Iw4QPK4gbTI+PtxfvzheSqkcHjk4Urk
         mYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005875; x=1752610675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=Itb/eCP9DI5PqRdy5Dz+bEpBfmECikfHqq7KRPVoG817I45XfxexrEtyXEH99IvLFq
         zaREfmH2TrhMb/8uJ5uHfEiTOmbsKtIVIoRC3Y3uucmOr3Fz6YRnUJBO62RrcAqqnyph
         p96vUzf4uz+a1ssDOgCrtPWzp0/wkO8vyUBoJd+Kf4Q3FGirfnJdsnyM3PYOCyYjp1U0
         8MlKNMyYTvatE0sUXUh95cs2XA11RjCT6E3IrC7xvvgs5XPbqNNhKSK6cMkEItBsn7Gs
         0bbE9sAS1qHq4En3QiRV5CVGRtVaBohgLdPgMV304sizRcAMxhNsw57Woh1x1H85D2m5
         KV2w==
X-Forwarded-Encrypted: i=1; AJvYcCVxerdM2vPj+22S5GA54n6xKsmMWTOwmfTd1Em0sNq//aYKH5GdTW3EVAJK/hUrxHJosX4KPWdogt4tppczfRDu@lists.infradead.org, AJvYcCXg7GUckeTYX0CE8hOvWo+6pj3Df9b3PCwrQF24WE/7wfIZfWzhzn99v7ajNkr8YIIGuyB9ahqqwwQRBDW/YSw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+6w8ppFqiuszo4XZ1zpTdvikqKq1hLWV8dOu1FIIUcczQJvB4
	S1ZplLTq+7xIeAv2PyKi/GCa5Q5WAFwXzA2vpgLhjZLEHmaxjkC/V4qy
X-Gm-Gg: ASbGncvpGLhzsq8Uzc++Gud9xVJ3ozNSisJPg0Z/XYCHoeQOS3v/zbWpcF2QsoSoOUK
	QaF7r1YnEuI66n71XPgg+CUiDBk4Zy+ArZAmXkKA2rKsnXUVcCrl39FLQo23xGwVmQdxmoVVrLz
	4qN9PcKq7eKWNmjthjtu53iDlt1Zqc4R6enlawvQb/Ba/KPCRGz8Sz7wjI3n811noWWW/ZhUwIl
	vkDDh1EAgZp9M21RrupzSgezDw321fm41cpuXllMfMQk4/Xh1a4HwbAbi8azsfKOmTl5QSBn1Rm
	+XJlejvTnJb3lGt6zIX+eAEq/GSRMKY8ja1vIHRyYyo=
X-Google-Smtp-Source: AGHT+IGomUnEwvNFZ9RVViKBVPxUvwGewuMOyD18+D3MRX0eoPM54PqDSPSGW318yDq1AOglDIUS/g==
X-Received: by 2002:a05:6a20:c79a:b0:218:17a2:4421 with SMTP id adf61e73a8af0-22b60db4dc6mr5833909637.10.1752005875381;
        Tue, 08 Jul 2025 13:17:55 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless-next 6/7] MIPS: dts: ralink: mt7620a: add wifi
Date: Tue,  8 Jul 2025 13:17:44 -0700
Message-ID: <20250708201745.5900-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131756_233846_67A92BD4 
X-CRM114-Status: UNSURE (   9.70  )
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

MT7620A devices all contain a wifi device as part of the SOC. Add it
here to get it working.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index d66045948a83..460164bdd430 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -62,4 +62,14 @@ uartlite@c00 {
 			reg-shift = <2>;
 		};
 	};
+
+	wmac: wifi@10180000 {
+		compatible = "ralink,rt2880-wifi";
+		reg = <0x10180000 0x40000>;
+
+		clocks = <&sysc 16>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+	};
 };
-- 
2.50.0


