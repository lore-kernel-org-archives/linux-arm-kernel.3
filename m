Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KOno4m+/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qIlwnSuw;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cl6AHYLJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=; b=KOno4m+/9HalXn
	S6Vrrj346pCQ91pEblTnl5yK0e2uBN0DcwPZPNLZtRNAQof4f6oIdSlw7Gy10Ju662k/EYypK85h5
	dJ3CBaohZWc7DyqzfQ6L0RpPEmUwHD22j4bYuZhT8XqpgS3FZPg1L9SQ93XXhk6aWEZzXfRmqUOln
	IuDmkPJYri1gNuLG/oeIvqA+XpZjYB+Xxu1mB4CLUHA10yxwfcMgc89yqkxC0qNa167P86Sz0jFEX
	DfS6hCnmiXzb6DfShfZOBKRMMaPV+xqwBUohOG9bmhGvYMT3yj4wW7zmN8o7kcry1sEYC53bixI+B
	UTkOF1vxUW9euotcBEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGw-0000000E6Ju-0aGW;
	Thu, 22 Oct 2026 12:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGk-0000000E6DX-38qG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 12:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=; b=qIlwnSuwoXE+o8nGFqTCq5JBvz
	9I93l0fA2A4IzpEevDqer2fbnylxhYT5PM4VTJq9fjHc7aDLI6e53NbShhd+ds+COBIMaoN/kCCWf
	s0jxhLFZ0BjbKDSQfn9Eehl7uqeVwxWM/v3se3z8U7RfefkV79/vc1IrhJ5qdJ8p52Whsf3kjk+h3
	GEb7llCrVcM3A9uFrHeUPZaiCOKmqrdwwQD7iwpthuhbpLKx6XLqpWACgLs0e4/4s0jt4ocbv4Cfe
	6ORh6GeJfYcjnUu0KLQqnqWI8bR3HuiEquhSuex1Y7+sJJ1cY9X/Jcjxtq28roNfHxSoZGHvtNQzG
	wM3Wp3jQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGe-000000077OY-1JHi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3783325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673493; x=1793278293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=cl6AHYLJx98ovq+g0IW8kUA4N1abfZQDv6+bF/ku63GxHRrzQl94i57xv9Wt0Vd+o1
         Hwzwy4bIWdHJ7qtrluzExCrRkg/pC9JCnqj9F7IX0ITvILp/xX3haE/X0y17+XEa6Sns
         U6TN/OMC1zEqd7jazpJow5WPEPx7Da/Wd7B/Ys0cmx/iRzqg7Rc12xUXk7VDAba9Vscu
         sR+HJlSiUOAeuGg8dO8xjfWiBEiYqM6umvLcEIkJM9Y8I2UUjrIm4OyZ8Gno4Pi4nIi5
         OQgf4JwQEl+PMLdIYOWX/YrNsV2NIGSF3Y/2jAmi7CQrarbb1kHs9YR/DN7gdsDDhM5G
         RizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673493; x=1793278293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=BfqiAx246gH0p8xU9TTJOJhdprTNzdeT6hbPuyugS0V8c3juimXc7TOXcqIAT7Up5h
         BMYCOwPRJfc82WTlDBbumv7iBi173NFLvr/2tJno4/rEBJVLVgCPPwVm81G5+WTHI+1G
         5xaqmA59bW3NX8DEsMPMM+RbtLgRW2HiMIrUl8iP2hpYuTam64k+jSVC2oLoWN6t5Fby
         EjZsOf5Zdh7SW+f4t6cJaG9av7POaiNCBd5BrgidRXpn311dm4pQUHaxTJNnAeNXr8Co
         lOHtPw3riYBVBPwPyOn2xUYuv687uK0sYQ6EymWpf5l1zMZIY4O3J0H85VzGOBleKBE4
         6hcQ==
X-Forwarded-Encrypted: i=1; AKwUvByLT5KKbGZiGJkmchG/I657e9T4PB1+wyyjkvuflsVl5bBZ+1/qJPsDQMWyCAwmLSeCRHiuCuLQX8DxZbYDYfTn@lists.infradead.org
X-Gm-Message-State: AFq9FYKLasaXomwthfwOoEvIEC/qGVWmnF3Jc8m5ItDUZ9rQcbmXDLX1
	dIcpoLqFW84xcu8rIZpbIt7lpMvbPyVi43pahDMH/0f1uVtwHoXf4ewl
X-Gm-Gg: AYBFou16qAvbmFzbUBb3HtVeB70JmG7Tb//kKjZQzn+lQfCnQhEiJWIkmY348QvJcBR
	+SErHmb0ZMDBwDtaYFUDy5lQ5LSfdhhkaBkra7bRW+zw0B7wLzRpJVhk+LNOmrTta7ArGwXeqEP
	N/yy/w+AycnI79RXGt4JwKXin1LPh1bP9QVrtNBgGCANKU8wC3Y6XVg7Fknsnxnwojp4+Rw5V8W
	W741L07t8Nuf78rCwz86EhWk1vEQ/R2W6aKJFHNRdGAG5bKSbGMefJeh+0UoAJvug4HTjTgS/2K
	mvw5a71TZ6Qmkow3T4mLYpLM1uOeEMpeImIwbwcygNX4Z5Z6u/1jKTQxfaPT3G8KSH+Em5q8LrV
	000AaOZt2YqIbv0p0SMb+DR7veCz03p0NlygCrth9T+AbYiO45GnMSM4B3MLfRUYU6q5iq9lTYQ
	CIYJdsi3EZB3WasQqziMkxIBMYOuVBFaOjqX69RCxYo4h4pm/fjPkDu/bhCsFLfmPMQ8nNO0mLX
	/BXWQCMBN0AhCOYAuysKkZHhcQ848wkvR5TWOlKDRT+PhGTNrKMGsccIfudHfsfLtGpFnfeW0n8
	dFetDz6fLNyz5GetH032aeCXkR8LKYnpb8pc3BwS7NMR7qFbNKdRC0c=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr105959715e9.7.1792673492547;
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:08 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-4-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135137_335510_65915750 
X-CRM114-Status: GOOD (  10.50  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX95 Development Board device tree to provide a ready-to-use
DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b8f497c5c6e..18d4ed73eba0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -985,12 +985,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 

-- 
2.43.0


