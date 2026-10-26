Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74691606C227
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wa+l61aF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLleNbsv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=; b=wa+l61aFzBr3ie
	86F/O2gUajHx/x9x8MkfPpCRO8rn1S/f603htugF4AVku1bK4M0NKqDKip1pWW/J6nBwBE2Z3dpKR
	mYrZ4/nS+aciq8kHNw5n7IbJxdwXvvVu1bV+B7KZO4vTBU0I1xAvntpZ+uy1Xv/S9PEmuSR7udKpz
	Oq/og2GwkkSAx/FKnS+3gEGJ5wN4JotMZjWnYnCLIPXOLLJm7C5srzU59sddzC66GRs6SAWhOMhsu
	2DK/F68dF93ragabeXWaFjqMPFa2hu+5zUCn4l4Gp/01y1Duc+okXTPyhIYzUOCN8DB8wynUYxdz8
	HR0U+o65H8GLDh3SCXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSj-000000029aD-071H;
	Mon, 26 Oct 2026 09:57:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSb-000000029Oz-2VtZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so16510505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008664; x=1793613464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
        b=SLleNbsvVObGb0AbyCwQUCLrfkdfC5dWMhoyqQ7O++ox0tv4DfN8LVcaP0ubb0Ips/
         QpKw5LrbIV1c0Iae8+5kcXk/DoP/sF/ioXCy4M12fAaIEEEtMYTSMtMydiqURcpOFZZO
         aISMaMd6lFolNJzxRrN6Jvh5h6+uv2ugFbcS6KQKZaPNtJbHx6IQKBZs1D/igStvPptu
         FngzZexAAxC/NzG7TAPsAnw2SSAzfVfqqohWNrCnQpqnb2IVQO86kZJ1o/kzEYPcKymR
         3BM+DxCk0GVztHngdF2j72NJxSyt6RuGL1Wvz15ISg7v5W4PTpOPd+YmX5gsJv7X7mcY
         p+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008664; x=1793613464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcffSPuimDSKjJ+Q27cp2ryrVy584pPTd3AryXWHadY=;
        b=sq+iXpGRPFGeiSspUrDZ6lAHL2PXfHj+tAe3CYMfSXoyff1yjEhppSHlz0FQ7xV1tP
         W2SagNM79kfm0XiQHUeiltKL5EFHSlQ5r8wMmRugnaRH8T06lyPb2VxaZE74+YqMtYW4
         xiFNT2dAQslLiGej8nRMW/zAZ59mMYfygBKMKyanliXZBoqEukOQMYcWRbQHhMdVgpNW
         fRXC0V/KudUSbY3UMZ4G9E+TAWSN7mI1sF9QPooTrcbP5a/J8W1FlBamsa0+Z7pnOUoq
         GI+WiGZaiygpILy8urCDlCTqd2gqbc9OWJF+4+dN6nwKohNg8UU+JgDiYjVs+Z9/fk7i
         Yn0w==
X-Forwarded-Encrypted: i=1; AKwUvBwSfEpD0dMjxWbKoe6O4X+0JoU46USiVzeF9eQAfJFxUP/EVW3LZmztm/oRzgfuNK74FCNme1Jg78o2t9TZ60Fu@lists.infradead.org
X-Gm-Message-State: AFq9FYLq1tqJ0LI8d/V14OFB0NmKBr18XFww+7FYqdypGGjw6l3WHrM2
	jyOCX23wKlVI8cb4I4IA9ud+/udaao69pv3w0lOstvDIjfRpZbHcf1Tp
X-Gm-Gg: AYBFou1Tw1lm7ObiIWRngptw7NtDPyh0wIkI/5qXwtxEFqg5vK9QlEwTiqQDe5rVtnK
	hcYQL12SdGRw/CBt18szai68FUvwph/S5HWq71oW0s/imTUKEVcMJw+Z1wWEg7hq9me5zcHtkv1
	vLLu17KLBqXl5A2LoSNw3zBKGJUDvTY7tUfoLOamRtO6c40p94tMu8NY+HDIPu1lqCmaKFnTZUf
	0ErghsOfua7otk/MZfw5otuq4WUvOI4215yxE9h927C241D2DHygHinHOyz1dRWrdiZbxjNKNtf
	hZTEZxjxPS25fbr97Gb2rxkgzDnizDMO8PU0eW9hHgh8ooI/+bk5wl9yt0GUdmm3RA+8MLXoNhV
	dS8H28lxjiMdDOKwIRpntaccSFuxzdZLTiUmfbhoKpbW5uQP0WbPrB689o+3k1bIW56GeaGGFu8
	fCDjHuO8tK0PLNyTTsiGafoXaG9kbBJBgukBmtf6BtVBIOUmlr+lRW6Fkrn3Uk9rP3gbhWB4ueL
	kXsMVefNRzVUim+JUBkL8BXbzEHDXvcltiN6Zr194oWSMIL3qDbXdlLed/Re9FNj9pliwgYdLWZ
	0uROButq9dj/AA5R5KirLW3sGyg3V15GymYLk0o2vwkUoQ8XtYy5mdwMAqLB
X-Received: by 2002:a05:600d:82c3:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a51cf1b880mr83369685e9.16.1793008663905;
        Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: airoha: en7581: add nodes for all supported uart and hsuart
Date: Mon, 26 Oct 2026 10:57:13 +0100
Message-ID: <20261026095727.31708-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025745_659881_F37FD145 
X-CRM114-Status: GOOD (  13.10  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add all the nodes to support the existing uart and hsuart present on the
SoC. Also update the compatible for the already defined uart to use the
more specific UART configuration.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 46 +++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 760f0c3e6090..ee1633f01068 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,13 +470,24 @@ fixed-link {
 			};
 		};
 
+		serial@1fbe1000 {
+			compatible = "airoha,an7581-hsuart";
+			reg = <0x0 0x1fbe1000 0x0 0x40>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
 		pbus_csr: syscon@1fbe3400 {
 			compatible = "airoha,en7581-pbus-csr", "syscon";
 			reg = <0x0 0x1fbe3400 0x0 0xff>;
 		};
 
 		uart1: serial@1fbf0000 {
-			compatible = "ns16550";
+			compatible = "airoha,en7523-uart";
 			reg = <0x0 0x1fbf0000 0x0 0x30>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -517,6 +528,39 @@ en7581_pwm: pwm {
 			};
 		};
 
+		serial@1fbf0300 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0300 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
+		serial@1fbf0600 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0600 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
+		serial@1fbf0700 {
+			compatible = "airoha,en7523-uart";
+			reg = <0x0 0x1fbf0700 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <7372800>;
+
+			status = "disabled";
+		};
+
 		i2c0: i2c@1fbf8000 {
 			compatible = "mediatek,mt7621-i2c";
 			reg = <0x0 0x1fbf8000 0x0 0x100>;
-- 
2.55.0


