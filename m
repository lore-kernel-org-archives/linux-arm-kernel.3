Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA87F9B608
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWShHqAw4U1uydaiXNZxk2uNajr8xD5Ld6tysqlIMiI=; b=xRvKw/iEwrxOEDMx3RzfitNgbp
	PaScvR52/oPzCWfw77QLavksIPanX1aKAAC4VCB2P4FLa9t5U3EWGFJIXFlhMoAvem0vcdZw/Ggh8
	cLQxbsdD8PRRem2pKyzhxVdMo3vLVQ6mh0CpgJ+mzscyLtkUKLlD42kI5j6Zp4ozxmJNJR8fSiw27
	Wqi3kUpGIs6t06Ua8HLXxAnbed8kDjjLJSbLO2GowfY6hlxXwqPfIpqWMghAIdUmdt+JlyzB1MBjK
	jxQ4E9NcPhEA3qrhpEjgAaLahT8BHe7Wma3IFZ2Z6ekpom+myTRABp1D+ggkLkrRyzaJeGxH4h4VQ
	tLOY8LQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUVV-00000009vMD-0dH5;
	Wed, 22 Apr 2026 10:08:33 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUVN-00000009vJS-34w7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:08:27 +0000
Date: Wed, 22 Apr 2026 10:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776852501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWShHqAw4U1uydaiXNZxk2uNajr8xD5Ld6tysqlIMiI=;
	b=fvCqhW9J1GeX5Xa9UNtlR8L0Uhx9BDqLHq8lNurRvJ6qjFJz+uWUwvNm+vFXpD5lfI3PRm
	gwGQJMq7UdP1c9kt6OgnIzoaO1Fenx5MnUUZmNo2mkzOHofdFmhnC7ob7+aHH2qeOMYBv7
	RVncjzTRe2PFiiTGdDlrh1AuFijBOi8phSYH2unXhOugPcKQ1ljrEZhOS7jydHY5STkDCf
	xFL7jduRVdserRUDj1IXe+lp22zi7qScot+HppBgleSN1Q5Gz13NFODx5N05RmohDZWHQK
	fV8Ze2qcRDsWxhmp7pd5hrFhJyV4HvL2QEyDRuBCWk3uKMUjE6JyxKAmhlqUeg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for Amediatech X98Q
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at> <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdw45o.mk8sa216w5vw@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_030826_359144_B4BF5348 
X-CRM114-Status: UNSURE (   8.93  )
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

On Wed, 22 Apr 2026 09:58, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Add dts enabling core hardware for the Amediatech X98Q TV box.
>
>The board features:
>- Amlogic S905W2 (Meson S4) SoC
>- 1 GiB RAM (2 GiB variants exist)
>- eMMC and microSD card slot
>- SDIO-based WiFi module (unsupported)
>- RMII Ethernet with internal PHY
>- IR receiver and UART console
>- Status LED
>
>Enabled peripherals:
>- eMMC (HS200)
>- SD card interface
>- SDIO bus (WiFi, no driver yet)
>- Ethernet (RMII)
>- UART_B
>- IR receiver
>- PWM-controlled CPU regulator
>- PWM and Fixed regulators for core and IO rails
>
>Known limitations:
>- No support for the onboard WiFi module
>- Missing multimedia (HDMI/audio)
>
>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 2 files changed, 250 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
><...>
>+&sd {
>+	status = "okay";
>+	pinctrl-0 = <&sdcard_pins>;
>+	pinctrl-1 = <&sdcard_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+	bus-width = <4>;
>+	cap-sd-highspeed;
>+	max-frequency = <50000000>;
>+	disable-wp;
>+
>+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
>+
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddao_3v3>;
>+};
>+
>+     /*
>+      * Wireless SDIO Module (Amlogic W150S1)
>+      * Note: There is no driver for this at the moment.
>+      */
>+

I didn't mean to indent, just to align the '*'.
Sorry it wasn't clear.

>+&sdio {
>+	status = "okay";
>+	pinctrl-0 = <&sdio_pins>;
>+	pinctrl-1 = <&sdio_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+	#address-cells = <1>;
>+	#size-cells = <0>;
>+	bus-width = <4>;
>+	cap-sd-highspeed;
>+	sd-uhs-sdr50;
>+	sd-uhs-sdr104;
>+	max-frequency = <200000000>;
>+	non-removable;
>+	disable-wp;
>+
>+	no-sd;
>+	no-mmc;
>+	mmc-pwrseq = <&sdio_pwrseq>;
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddio_ao1v8>;
>+};
>+
>+&uart_b {
>+	status = "okay";
>+};
>-- 
>2.53.0

--
Best regards,
Ferass

