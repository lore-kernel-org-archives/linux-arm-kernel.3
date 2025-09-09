Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E474CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=; b=nmzlyBTHWOpj+rdMn8TUOi0ai4
	XGW7x5HEZoKBbCew4hCLXjmoXlg3QbwxYXuT/3O+QKN00hkLH6kstAmUSbxdC+QriG++OBsmlD/lG
	ur2pJiad0nip7AKy//Vm2LygCpsYo1IhLJcgB0YGoNQHWjk8US1p6M2Mid6iGTqFM0NmfTui1vaNE
	rtuCOZApJ5jMP6m2mkRtJrZq9WqD0Z8zU5T6jucuKusIApaN2U5VLhoyFCguXFxpXV/fdw86AcbcL
	aGG6wdSk45XqUX3qOTj3hnk3ibZhAc1ppQlZpsjWBhgpYuuo1Z5XKP9mbhd6WO+DcPm49WOkmjh5C
	ZpNVFoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0UC-00000008CZe-19A6;
	Tue, 09 Sep 2025 15:42:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvL7-00000006Hlc-1fDE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=; b=mQZzOvXwOcr7YNMR5jUQd3FJH7
	6UrnwSxoCn7Fabtv7m1fGsYUDjW/Vs1A0Y9hVlgpF8phv+52jDTafA0Ab6I11LVXavfH+jCQWAX7P
	uB6xIAm80iglj1nnPYMLcZVMAp/AotAjTLDkNGgSzjywtYHxfC1owXW1Yik+b9TZ8hfZilUVEQW3x
	SJNkAj9mD0xrF/PJTGg9Amvsn3RPNfAtNdXoZt5JXZVidfTXrNSAiqfcFBEAWnOlKT5FoVVQuH8NF
	HhdleJp3mx3X5TWZPwtvcwmrjU5Ap8qbUOW3SqrgajnoFXyoCO5FS/41y7htmHkw+UXkCG+VVed3e
	dhIrGkDA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvL4-00000005HYN-1MCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de6490e74so18631785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412757; x=1758017557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
        b=h36xjATp3uztVej7amELW0B0pOxY/xslTq+DUcGH9TMivsucY0xu/uf10sMOqX+ZBI
         secIz/T1YlRu1A/jwpNpV2nARJYI8gEshOrFriVWeXGvkQ/ukCvwAtaq+lYAKUQXvsUu
         nurcnlCRdYs6RqlmJduxwcyc/+qkA6fR8e4RIqjX+nOClHsbCa8Y0DcoWUUGWlO0UbzI
         uNAEOsW5ZaNhzKMoOLmsQx7eZCOfLVWebQ3fPyMPa8uFenrMckcu5qBIYcUY15/MYm3V
         ONyb3l72k41HDpza0vBpwi2QfeAgqVDNpJZwfSwWMbzz6AMzJHAcQ7J0980xkf2/7pQ7
         6Uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412757; x=1758017557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
        b=K4y3DPWfHIj/Kg5Qa9PV+OTwgZtPIRIiSjpivnLsC8h1Omq9HvLKCbiECKzu8y8RZv
         m5aHKLBEgRutsjs0Vt+0Moj7UTvFu3zVDH/nRAt8rk5yM8xo+bkQeYU1l3UpFwWHTiEC
         EBOSSNp37HlLH6HRjLpFpQQJtrX2bb9jU1uNi+r0kvANTkFE/lGtWPqyUZlCnTUpzi5F
         wli23Lv1ANaTC3hYv4PiHrINnVQOoxee2KbKrHDs7Y+lm+slqC/qDB1S6r4s9tlP5eMw
         Au1/Vee/kmFVski11jcEiWCoyvxS15CcFyBq4hT+a/qXWAVvg1KyY015JGjlrnle6R8b
         oxxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7X8MHb14OBeBTw6+pUBw8nuhSl/iTYouwI9V09O+EgnD2H4VUtT/mlWWL3Cxlrv3gbUmUag6kXwCVFrG7pScR@lists.infradead.org
X-Gm-Message-State: AOJu0YzCdEBtmxvxnoUPsTDhZWMNOioroL/FZCERmvqd0qs08ZXbU13/
	ergOxV/j38Ey9XaqdT+sJxJh5Vbw2yRn1j1SPfxgcVRIXwRk9jZy0lVX
X-Gm-Gg: ASbGnctSPIDrs0EvbaUZgr3KL9oxsi6s1wM0LNTOD6lZLwoOj35mOzmhQYClQC7msyb
	7qaFgnh6vM3OvHzCd1aMW/XL8eDQ35nMH8sbJNZ3hh+OFnLyH5YNZXhkB7ZcGnKshJU6+jy5RZK
	ovix3tghHRfuryoqqE6Q3DI9N0rue9mPY6nv7+hyE9LDBrnCsFN3DFHeHRx+0ly3wr1RSiLNc2q
	mTrWk6hm2+ONrrilhQuuxfDGSMBDRXpTqkkFbnwA4jjHi3ERLny9dFrb00GhMO11HcjhSNyFhVy
	yh8jGLXkxwO0MDD0wFwV1dYXxvr2MRb5VcTksTBMF+16L57D9eKHcR7LaE18ymclTLP5fDjRTXV
	PoTmZG/fApv7CS64ufMql/TC//ejNplSzkGAjxkR8320s3OW9uK0S8D3ayItBfmZd1IvHBBmrXp
	yy5OdJ34uIChKkjFs=
X-Google-Smtp-Source: AGHT+IHKOV/tD2Z3OucLG0PdmljH+LI/bDbmIWYAmtOmyF/7Dm5UNviLw/7AZ2HS1Z+3OaIscmV+Mw==
X-Received: by 2002:a05:600c:154f:b0:45b:7f72:340 with SMTP id 5b1f17b1804b1-45dec73107dmr27260045e9.25.1757412756628;
        Tue, 09 Sep 2025 03:12:36 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddd47b6easm150506865e9.18.2025.09.09.03.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:36 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:18 +0200
Subject: [PATCH v6 11/20] arm64: dts: st: add DDR channel to
 stm32mp257f-ev1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-11-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111238_722040_F5403EC1 
X-CRM114-Status: GOOD (  10.40  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits DDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 836b1958ce65..c4223f06396a 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -41,6 +41,13 @@ pad_clk: pad-clk {
 		};
 	};
 
+	ddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,ddr4-channel";
+		io-width = <32>;
+	};
+
 	imx335_2v9: regulator-2v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx335-avdd";

-- 
2.43.0


