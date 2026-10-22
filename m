Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3960A2620
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bSQFOWQG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5EBfAQj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=; b=bSQFOWQGt66/JL
	AaH1fRPqbXuIU2mFtAgNXkVBMYP/IU4outZj04KVLe8Zhd1wSvTltCDMMqOKaaFi3eD+4O/QVe69V
	9ifh3MCdoiveq1Bvc3ytAl18HVE9IY35SXbVr7eMR8kZ6pH3DpGAEoz0xJjrIuh6hay10HoMSVUtN
	7elQ1QJ59YqyVtcNPBHYy2OLuBY3G+tedkZHrzhDcqFmeWXbcuRDOpK1TNvu1VZZoOAbX+Zt42JDl
	JtWpWUZ5aKucKqIvYYzOXq+MVasZQZzIPe5dmy4N2yZw8744UuVtGhQLA5EC9Vd+lmFqApHhJrShK
	nvhcm7IraQlA2PvRDPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUQ-0000000EGuO-2Le0;
	Thu, 22 Oct 2026 14:09:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUG-0000000EGp6-39Kz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:09:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso15920315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678183; x=1793282983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=n5EBfAQjqi/ykmSBn2v2yB1J6MgrSEZTxm3knR3MkXI3P4LATLGzk5DL1c7crbRQxm
         o2KUsdymspjWr3wOo1/pzg4dRfdq8fLM0pXsJTw19IOv7fekneI4mHgOf0gAqgr6tZGS
         6YFwxNf0MU+ZI3Tk+ZZwpyKLhkrK4Iezf021sVj2NDtfUVjcgfpnO0S6zzO4jnxgYgPd
         AKQ9ZeKTN68YxSomP3/AOgE08qgyNS4iz+FzPSQnDOcsXN65tapzUq3Fd3e0GSzLytBl
         djDo36YzaN05pLburx3ZXNschxOkP/uMdMgDuGLV44OxpBqN5WAE9ZtH//iEMGi4gQHy
         iCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678183; x=1793282983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=VnEWhUH2PNkICHvCdclR8UiIKB973y3o1fa76kiY5qWnrkcWn0sTfzOOHhTsWNJ+rr
         ledcYmUFVQpj6S0BO6Sy1BAKkAnzWrNfAlm8XAOm0cWQswenIMv0qvHLoofDNRHBAEKF
         2um8L6GrZBWxM3IuraHX6aASBRaZ54b2pHWult1FjA7h+h8sVGYtEkF3zaOUw2ersrcF
         n2u+3j6xHTe7upiLDBTxKrupv4UXzsnPXPn5dRP1ZBL5CmDNSmDHYpx+/H1bqsswKwXP
         6S8TU+ULHhXYVN9ijj8Af/je3iEqt0fflwtkxPDKfZEi52vns9BzjxRcMk6D1EpcPw/U
         5e8g==
X-Forwarded-Encrypted: i=1; AKwUvBxriuB4PmDyfECd9Byv8kCxljd9kSuREdl03mwX/GCCnz3Jqgoe+3daeWIfzlj3J4ldmkPofTNGX+d79F5GlMUi@lists.infradead.org
X-Gm-Message-State: AFq9FYKYC4XuhoGKUTsYE02m3Gohy48Fyt6zqcyDmWk1gIKsIbHnQBvc
	mNY7p6IloZvrxYkRf2d64OEMNfQangIa6FvWFSRkvinTGn8xHFbLH0C4
X-Gm-Gg: AYBFou2fzD2wiaHgMwcGcAK0pbp7mwPPVjO8KaPGG73Z9XWYFgvHm4gppYcvhNuIIDT
	qovkB3BF+2KZgmftA7tSdLGXPTEcI8Q1JBYbT9X5XQXTCKE5T+vj1gusf2cel8WG3J8gCoJkQYF
	heNMmhLT2BHXu8AdmZ9Eu0KjAO13RRiE9pxZsrGRvdfVpSVZ8OJ5aNW7ZS+VOBjlCQElD98xDh5
	YiNb1jqc3FFxXvcmVvnJxGxwPq+FYHOE9HgNaHVHYWUXKkihYYurTclpFoLwecoS0+M7KBq3Rqk
	kb1P59wnF4YXee9AgSQZ0tKjzYERmHExhog6TqQ4LlO0yZEYmif3Dcfp4YxEkWR0FQSr7yqE87V
	IX9diftjr/ZsYbyhl6dIgyNSMqSM0sdetSaOpg+HG/4VYDSzOaodL7gCXYMYb6ZNVKofvI3DT9+
	E1M51gQ3bBbaRcLPJIANEVU/7aflzDA+YWJjP/Y0PBA5ydqkmDZVpK78xL3J4L+rSZThs66Vqey
	LcD2Ib5NrFHZilVYFFPpm+od0fattYBmQ36xqC8JsFmkPCNhprIIDRodkqh/9e2IICHD51U1hO8
	k71NMloSv7mdtvhdLcr9it/ykXD7mYEH8Te2xR0cAyGwMRjd8jYnQkI=
X-Received: by 2002:a05:600c:1c09:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1fdafd654mr107712815e9.14.1792678182521;
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:35 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-3-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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
X-CRM114-CacheID: sfid-20261022_070944_834513_BB5EEB29 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -2.1 (--)
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

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX95 Development Board device tree to provide
a ready-to-use DTB for the WiFi SoM variant. Firmware must configure
the UART and its pads for the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5ee9fa583515..f957797d90a6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -982,12 +982,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..9aa4e8b23ceb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -526,7 +526,7 @@ &lpuart1 {
 };
 
 /* Verdin UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0


