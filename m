Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59711D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=; b=JFO0WSSBsSJ6gXv9vaCcOjAAsD
	dZ9pYJSuZIbNIRVRSIm3QOdYTebygYUJOR3hKYsMr6HP/49crfmWblrDK4sciGdcsVueBJdw6aLx7
	wFDnQ4xuktnwFzAUSUhbDl9bheT56A4EPYj2w6tpgbEYxi3aNeIFnSraoosGPZLFBlRKzucAZgBSt
	PVDxUT650tb0IPtHfmvH5AzrYtzOX+cMEf6XNWAEjdXoumcS/E9VFHFHPdc8GjN0UNOdfJrYOLvwu
	lAoSLdxxiRQ7E67ouK8s6f5WulIJ8hw/U2H+/7kMtQ0HK/kVCP5JeS4fwsg4kl9lHX/HqTT+trqED
	NehMlgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLc-000000075qS-0qPw;
	Wed, 17 Dec 2025 16:25:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLV-000000075ie-1F9u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Dec 2025 16:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=; b=XrE4/MZZ2TzrD9UCDVBpwVjHQo
	I5HYIKwJqk807V0BTPCECLYjZ3ShVrUot52Yv69NUO/OGHZwyH75ZJkRoBXtTJkzJG6Gl0ZoXERvP
	3qjFtVUn/6bgeAZDUNu1tE8nFXZMdbedaECPSHXPCb8FXBgWZakW7Q6bSWzOhHz8CfG38+6HdaeDq
	Qd+eOvloOjzazzNJppC+sC9jI23fEStqi1X1otdkbm9s/sl1G/ud6iwvQKBVtZXkT/gJbmD4OC/O6
	o3mu2IxBTCVFLxDyDwyC91fhvYvHh82mlSe6ajcEwYVWqYdwsyBpeRm1La+yDtNjQ20hry78G1abj
	7CXoqGgQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtTz-00000007C49-1g0i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:30:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0a95200e8so38785205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988743; x=1766593543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=IRAgCO4C7IX48DOK2Jl1DcfN1FojZK8Dr3byh/FifYaQupDvjj98q26tH0/6UTpVnA
         C5vXItd7SGGxU/QuiaTLhqKkCgAJBIj844OKndTSFHxLX7GjWTST94M1ttLJ8WbFym+P
         uagE2R6APfOYXIy8nsD5vaqZ86A1xeduvOIhs1IDIWJc+hxcGadA8aKXDtwjwpU8jEUc
         d9USferc9xf2MsXh1cWxfX7b56ywwZW5SzPIHQTugfeatBS7U+PP/DTwrVHuYByP5GCx
         I3uwlXqaTqwNFqdpqeMvDuZLbKcq4sA1D6E70DH1G/FWwpH5eFafb1KcfgdyjveDNUzW
         JaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988743; x=1766593543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=eVgmtDWZVw85TmnpsTTHytwunYuDpm1J29SCcsBsP2uQZfzjOU9DVRPpYwgtGA9uOn
         ur9VAjc2ArzdQs81FBtDMJhdh+Gt5xii/quSRjvFcQllm8dPbUYJem4ZtQHVvG00N4hZ
         HOhvRtuqt1khDxlw6/mMvzyY8FWB8DTmTGDz9JIKlmVO5eTI2k0WwlDjzRhW8yEnWop+
         VWGxb3hhE1IGONkFOwKINOYqRkcZz8ZKA0l1ZHsrzGlZaQKun4su8ZcdvuxmfVhYllx7
         FT6vvWWHKkr8CBCQPhNdJZ6eP2fYGAEbav526SxG++UybjxZjZyCC1UnQjt5W6WNDtJB
         +W3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi0K2tKfSk6vjl8WSbdqUCmwwKC77XGNb9uhi7YPKDJUpo326WFAi2kogVK8foESkosSFmPRMe0mlyugBq+m1v@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs/19igevK3wZgUy8SnU+e95r4Gxrxec9Dg6rsp5K3MJ/B0FrZ
	9vIwJ2xWpk1EOWbDS4/P59FnoLZisHUVMJvBgp8263YhNsxgJdrMLqqv9WJcqmqj
X-Gm-Gg: AY/fxX4TdAbH06WWGpOknKmma5ana+CCMbLqDG2bUCnIZJWFaapyRpN4+bB/3C2UsQi
	omXQBmEK488kZgYebx7MyjVWMRx7S90TRgsu/PjYWmfk1MXKELGaiisR5h2CqyTYF50IfSv20Ll
	bsMlBA38z1EgekG+hs2Nqcdw6py4c6DnMsuwhNMfiIs85zWI0xIwsBvv2Wzrz1ElJSqxzV65Pho
	VwdnWLKFikTK+/a8ujzDqc87qsuxiH8ICStbVP5PENhOzGBK5SGuEKO4MAVdduMjIVSNDAHyK/l
	BSR/H86D0BvdUyRewA92EO/I5V67SxLfh85HPxuu1/5F9MlljLzrW+hGp4eWNU8tEQqw64Rsycy
	SzhJ9526zRFeYMsUiWexD8N1ON1lLq/H/BGINsm6j4OUeCq1AxT+z9ZHVItp9JO8bG0OJqXtQQW
	2bmR4LwB5APYNC
X-Google-Smtp-Source: AGHT+IGO53/Yde+EULUy0CNKhxCD9bgpjG2XsOvrAfTxxOPHWVYlfkkjFQH0s9aKhDolD5l/kE5sWQ==
X-Received: by 2002:a17:902:f705:b0:2a0:906b:ac43 with SMTP id d9443c01a7336-2a0906bb2cbmr170716235ad.47.1765988742938;
        Wed, 17 Dec 2025 08:25:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:33 +0800
Subject: [PATCH v9 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-20-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=2e/a3Ds8H9o2DJDRhuOCh9X1vWNSB/53Pgczil0A+/g=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlDCKyhlXQXgNMXNa02YnhpfcEZU+abnr76R
 Lfq5Gk/hKOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQwAKCRABygi3psUI
 JGdMEACWPGZUb8/3oKcm69SV5cFomSKZhj8IC0dUHaIPLUMSKrAiD2MohXMCY0rIBNmWfOGjtLA
 SbU1OdD0sj0VyfUFiwY512qW9/79M0x16Xop/VlCjK8mfhOGw2EaM3uW8G+8x2aJYE12WDClY7g
 kBYhIm82Yb4hZL6DFXXjvpWgWz7Ngmj9KJsprwXwl3JDnTQGLM5g5N7VY74KOBGNmmss2MZIEyP
 5I5ClG/JV/Uol3mOyMq4pSH1nubehREwDcnXwLP0qI7CjaZYvC1GTPCBxhfMLzCVpEyI+VyGdz5
 ljxDMtvnHQ4eJcSK3VPNO+3CVYrQtvgIM/bcVSoVc/gxUCeYLTopBkdK/Bzpfr+x/Aw23sV3vr0
 ByNgTOshc3xOtiaaA4PvMbdDA0fUIYKUeyfvKrcnlOBiacHLEBDUYdX87oG3vPvkDK4HSPvW2eO
 q1EZC2/08JEFb/jnkYbcIMIoXI+pISyfsKGcMNUh9Fv7iK4NS5mZHp2YI6qm+SjrsR+nRj8U/lU
 bQKHsbW03QjvEQNfrfTCEd4Iib0TNTnxyQ19J/sGWcheJ4Iiqdstw4uNz7YAKIrZnIgvMUa2sao
 2+km29FDFP+Y71uXLEskWQim5f8Kq3PP3u5ZW8zEWudpMCQOexstUtROXpSBVOm3KmTbo20gXCq
 8gztCEyvl+Q8Bog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_153031_509489_38247015 
X-CRM114-Status: UNSURE (   9.21  )
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

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index e7923814169bd4060706945561910ed1d5c2e0c8..579560de1aef8c311cbf66c60a2111e2d5ac37c5 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -297,6 +297,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.52.0


