Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D660EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHvGJwSgUhit7XMftNzp9FtkE863EyD/nfcPU6k268Y=; b=A+akCWMwkSLB/1ixzeUiMHfySC
	8Jn6ssgO4XkEOZk+x4AuqPxkA9kg+ui05Eqh9WBzqYtCwgyZG7y6mTLlOaabkPBttT08spYiNbieb
	0KXc+G4X/YY9xDV53XXW6/FdJVcPMSEu7nu024uwHafnZADwXai0rjDK0ylbr3d7dAcHKezhSdTxi
	MoiCBjfhMmxVD4EapGfBtfUdihLD9Dw/X3od0vbQuCIlG91eV35kKohCNuijDNxjsAfi7TorHbpX3
	VoFJI2FRZTEdMwdQCmobOJWZZJP2i1OA/CGYhBjkNbuIDIoWY4sR/NAZDOGSBCq0Y3fnWSbrvKliW
	hbq3+Yhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejqd-00000006FG0-3KiM;
	Thu, 24 Jul 2025 00:30:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZi-00000006DL7-22C4;
	Thu, 24 Jul 2025 00:12:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-236470b2dceso3132215ad.0;
        Wed, 23 Jul 2025 17:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315962; x=1753920762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHvGJwSgUhit7XMftNzp9FtkE863EyD/nfcPU6k268Y=;
        b=AU523Vt+D0LRUaQFuzsHWjadg5qKDlp+jDHUvaN3PBfmx8IhW5zNy5U023H6aupcwM
         efpyCQgvaTIRy+ZiQj4mvFQriO7v1s7EHJ/HwPhPyZVnSEm5SYsMYJrDGHHHQtsHV2nL
         XYmvyjed3t/vzvSGDxgzph/HnKmrLByioh/9oD3lHUJiy3hrlCjSdMCJEl2Wi6hmC7eG
         XJbnCkOMv3vdUetZsmnI1UnulnprUSFAaAjrxEiA0K5diIO0RJmZJ9tzulTofYzGxKjQ
         YyHY/cWpinYEJDzyxBBAmaVaX6cIhn66Aa/yrWmw/Ba1tZY0UkON2sVYwDp4Ln//dJs3
         C0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315962; x=1753920762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHvGJwSgUhit7XMftNzp9FtkE863EyD/nfcPU6k268Y=;
        b=E/pcWPhpsTmKj3VeabHEPNWkh4JfKRvO0BYRCHMZgxxjkYr8TPGY6zDevcHs7yjh9+
         OkKvfjLKXMzmNWjtbk1WUQLQLaES2fC8kJ23YwpwZ56jdziC9sR+r9kxTaSvaTSh7lDz
         mzBB6A8HjYMYshk7lqAIa1F2Lb1LveOW/3LWH1KFEJbHvSdXGhSWNHq2T7KReEwd/1+C
         GEYsbRUhnJ7qqXoSj6nYLLwH4yNHF9XTWpUiQvwucMhuWHeJZW+sF9spPet7dXDKBgjS
         h56KDxb+uz7bb2/o6hD+bXvtPgSlgh3Te2/G/DbmtjOu1FsdE78chAA6h0RvA+OvQFPr
         SK9A==
X-Forwarded-Encrypted: i=1; AJvYcCVOCxDZvu6CniLoKgtO3yRa+FpXFHsQsE46PBQpINW/VQmexubH2UcQ0YH/yTbSstgObigmzy+5jJ2seVAaG3M=@lists.infradead.org, AJvYcCXwNVCmNfSWXCVmKr4Z/YJG+VCc/tCWn4h/VsmK/tcpx5vh06mf6z5GgPRX1CobSkaE1+WZjbDwrgeJvBzdHWck@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Y2Eagt9xCnklsDQwhWEF4XnzXF3htztOzqFEtRbaEbVqYyY5
	am6Fs5Cu7yhkwugws7+GyEeu0mYvT6iHKufVoOszlQUq/Q95V3eW/T3by0BxVWlL
X-Gm-Gg: ASbGncshdC6hhgBLe5jztB7bUbEsx0uDNehbPWu2Wx7jgaktC9QnQiUAJUWbCzQvuT1
	NRzs1QRO9Bxt9QyOmD3B6qGDokkc2bp2vb+sC5Gd5xCRtdKJJohQwwfKI+rmMh2IfLtd2KYEF6F
	S7aZkW55bkMWOHF7Cn0kyfOVW28JGPXJiTZxR88/0yAWEod/mA2aWBQQReHtapoT4MEwp3k9Z1H
	8RLV2oE2r4NYUOBfqK/fcjrav8hVSU0+/VgFd2ypOYIBfOxK+ETVpiTCdZMo8VulrbraomBFOkk
	VTDVBZsAHloY5xxW+Xy1Wp+SzCVpmF11S2wzSGGp/QjHG0EGNN4CpM+DIhBZiE+Ar0aF1TtasVe
	MLWw=
X-Google-Smtp-Source: AGHT+IH5W+cWX/6Lw4RE33r/VTyfoRy2lyKOk7XkxeVAx0d8TuGczQAVYWXMV1RCf3gKX2bPRfn/rg==
X-Received: by 2002:a17:903:2b0f:b0:234:ef42:5d65 with SMTP id d9443c01a7336-23f981f3d31mr60238605ad.52.1753315961681;
        Wed, 23 Jul 2025 17:12:41 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:41 -0700 (PDT)
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
Subject: [PATCHv6 wireless-next 6/7] MIPS: dts: ralink: mt7620a: add wifi
Date: Wed, 23 Jul 2025 17:12:31 -0700
Message-ID: <20250724001232.2275-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171242_523979_8EFA8B85 
X-CRM114-Status: UNSURE (   9.12  )
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
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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
2.50.1


