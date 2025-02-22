Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B959C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFGNBl+6tIuC19XOOXE9HXgAfugs/lzg8pmMhzdxFLQ=; b=2GdjJPPC1r0Eo5mZgHuhzQIdiq
	Ht02RiorLye8FzRFhCulORv2fFh2lLUyQq2JvOyT4pSMH1OJaHoIsSXBBL67HVnfpaKQ1fQCAPN/P
	nAJYmOD/hzrHuyGrrKk0bm6BMipnUnt7m+5tVNqAwhYj1yQGe2gDNisqYxhnWM4a1k8s7lReyUPlX
	WOR44cf9IauVzXYAgVvOSYHJpNQ0zIuHzvtjRrg0MzWzgayH/lkv4AnVxssNvs/0K/WKrLs1wPErd
	hJvA9JxH84NbFDTfPEirBedBGZnAYAXkEr/iEkOE31rd8qfgafF+aPzMmQyctiejgTpeoSvwkP3QK
	92xSyskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tltQK-00000008T78-20N5;
	Sat, 22 Feb 2025 17:36:20 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tltJB-00000008Rln-0d0d;
	Sat, 22 Feb 2025 17:28:58 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-29fe83208a4so1947443fac.0;
        Sat, 22 Feb 2025 09:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740245336; x=1740850136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFGNBl+6tIuC19XOOXE9HXgAfugs/lzg8pmMhzdxFLQ=;
        b=RFrq3owDfIymsDfknbr6rSQcC0CrhvvZpoRGuW1E+xmQyPprFORiCkiyjSlOmltLUB
         cmKsH6OKxmmMjgcuAryfkO/f9BfzEIZe+OZs6LdL2+blpu+6GiAlH2Lto7oONeV10UEO
         lzvn9A8PU15gvvFzoPCezvhA/1DWO8gte7YZVHp1bWf6qf9NjK17i0OeyENoD/izL2Vc
         os0AD4nauO/zDjuotcWfqdMDIAr1MWLnO3VrsF0f0/jriUwVn0OaP+VO8ff7VVwHoHMk
         OWbeq9wc/UIcfu/nFo8jE+goS+K0aYlLrKKGwANUytuzofKyTNHNgH+JphV/QkB7ZLbR
         BFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740245336; x=1740850136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFGNBl+6tIuC19XOOXE9HXgAfugs/lzg8pmMhzdxFLQ=;
        b=QHn+bpaxz/Ev8pqRkdDOFL7hVNlrxMaGJKQBxALC8JWqWSq7885KcRP4no7EKZQFov
         vDNiH9KnE1C2MxBWe+bnwRMoFQoepgH6n2V+6IlrgHIQgFFMkrqphO22x7TAgxQsqxo6
         mR3cpUrN/Sfd7exNe46nlrX/06iVT+MEpW+DpHBWpdfoFUCMsz1ra0ZIK+SR1DRxI1Ob
         lJIW2CB3evy8jU3iPRAaM3vIztzgFvaYNPH1xM96f8aL9uBc2fH5VRywFPDC7tVAxuIN
         piLyv3/dKFxY1BWnRq88eIzIpBq2fAECdIpH2JBF20gDomPeSU9XrUupyzUI1ADo85u5
         O8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUHI/20fztNNK44JjQsjULVhIV8go5wc9eiHq8RgnezrUTTiOw8Skt200uA+yep4M6RA7wWccUuK98HM5ygGYLi@lists.infradead.org, AJvYcCVXeMO46rZpyQIdW8eewMRTOGNg4x/7dxF4XbhzGPkXxIVH1Rj8Kd9ccogHj6NW8ZnE2EjOIinzBwfeOcsA2Jg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw09G54V5l8IwrAFHGkfd8h+3DtLKsCS6kEIRHvMhIuesSt6lev
	gwZcgAH/n3veSNN3Wcy7VKPs3T+3nF1ffKsXzr3A19/SGmL9rWrM
X-Gm-Gg: ASbGncsXyOtnioo0Y8fUK7EIkN3mJf3RPJMUaG5B+NL+axOuHYYtMt52B8YoobUT0hj
	AlawoDwiNWVrHFf5tpqb2K9J7ykc0EPcmuHRA88ax298orirY8ipbP8rXd/O9nt6lW2ibW8zesG
	Ynm9cGoz+Rm1iE8JMLFcXp/0dllk2BduWldw+807RDIBmzkUahepo56Z5iD/GWbvBOG4skxnA9S
	UNXwS/GTUspVtm3ZaNWxcF2Xa/mah8TCQGQGv781LQKQqvQ/ydoauSeypCkLOZgbpA75uJHPX4m
	B85mqqzGwnyaWNcDb/awJUF0TfgKCSY8adk=
X-Google-Smtp-Source: AGHT+IHAL/70G3mr2+6i2VTtbssd2wFWP2Fex0W1obJqJ8FQylmT4Wnsflve4vih8jrLfvYpj38+2A==
X-Received: by 2002:a05:6871:a115:b0:29e:5152:dab1 with SMTP id 586e51a60fabf-2bd50393dc4mr5638207fac.13.1740245336148;
        Sat, 22 Feb 2025 09:28:56 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:996a:132b:43a2:f7b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b963a0ac4bsm7244238fac.47.2025.02.22.09.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:28:55 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 11:27:52 -0600
Message-ID: <20250222172752.6254-6-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222172752.6254-1-honyuenkwun@gmail.com>
References: <20250222172752.6254-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_092857_185699_FD6C40BC 
X-CRM114-Status: UNSURE (   9.38  )
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

HDMI audio is available on the Orange Pi 5 Ultra HDMI1 TX port.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index 571a7f61bfd5..de11d45eedfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -42,10 +42,18 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };
 
+&i2s6_8ch {
+	status = "okay";
+};
+
 &led_blue_pwm {
 	pwms = <&pwm4 0 25000 PWM_POLARITY_INVERTED>;
 };
-- 
2.48.1


