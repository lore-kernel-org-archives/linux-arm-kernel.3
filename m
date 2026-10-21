Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85190606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkidSSma;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuAsiKDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aafQ9iCPHSVe3sQfOa/qU9zZlkpiMt393ivgSciYmVQ=; b=FkidSSmaIJVBCeJy7nFZ3WbeEl
	Eeo7LF4nkjp92D0BTXkke+tfi30MkFOLTAkRoYAy1u7t6aXWBW1S7EhZ1TkdDQSl9n0EN4q5y0q7g
	DbpS4Tsl39cNSm5aGhprhYzUfmupYmZraf/CXjgjSD3FB16Vjt6jBAoNEf6H4B8pIunoyRYmjy+/6
	it+a3/s06uHW7tPHlQPcAWKeLK933ixXH0tDjMAfJj7irrPGRp+LSFDXHtg5Kw7OSNzj8s91aMvhJ
	S9T23d0W8bJaQBlZofgHzRYSmEfygXY6SQaEVYITeUKgG8CSqBYMsVa12tR7egG4Doprlj84Dth+D
	jU1MIvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTjZ-0000000BcqB-0MEt;
	Wed, 21 Oct 2026 10:39:49 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTjW-0000000Bcpk-0x7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:39:47 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so426592e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579185; x=1793183985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aafQ9iCPHSVe3sQfOa/qU9zZlkpiMt393ivgSciYmVQ=;
        b=ZuAsiKDNa92qCb1ZqSlmkwuvcLG67UsPY3xACxHpRirev/b28EPSjScc5wZuXoH/Qk
         jK7dvGDbtkveY6z1rRokMxLC0bQZ++CUN3fl9uJAoAKsGjx1cng+Vk5iNo+37VGHBMmE
         FBzuRDGWEu1s9iDgy7QoLytqGt8oSkWdN/DlepUpTbvQW3d32C7/F594ejibqmTGtCdc
         EujDk7XmtTc9XJYBVhxKvyiVBhShY8lh3BV0SJrJELj7eqae3aG7DQmD1mVLH1fDeuy0
         jniIoXSvlbpU0g6VT6wQLnVmBR5YnlwA2uC0Xuhu8UaLsFjqCBt5U1Cb2Hqd0pZnK7ix
         96xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579185; x=1793183985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aafQ9iCPHSVe3sQfOa/qU9zZlkpiMt393ivgSciYmVQ=;
        b=AZMijAKgNmolTrKri9MLFMoXkmmS138j3M/PSyvWSA4aYZKpd+41uiJ4fYfbTHIenR
         yceJ9D1WgGIOJPet8KOzM07vU/oampIN55VWUYK+akGUEwhH4AQFbcLuPt7sAY9yMyIr
         Tjimo8JmPob7oqcwd6IrLjTTSZQY0iKwnX9UgPjE5FjkyW2/QcPAH2TJIm0bocxTGV/E
         ol4hC+g3g3iAlpCknc4j1rKSLap1JB3iUllRg7AZOgZ0S2m3OcEYy0Phds6dzm+4u4XR
         VB4SVmEXH8IvyWeGL2QsDDev2ZVE7HBkVC4avvfndQznY6mOZJGwP3uTgZkxVfiIj6HM
         LQQw==
X-Forwarded-Encrypted: i=1; AKwUvBzgOCW0moBPAa9LAHf08vPl/IGUD9o+3wAwCYiHngOmC35/M9sfE2XOjgYlp2FY+XxGGloUhQtnQG25jiS7Eg3d@lists.infradead.org
X-Gm-Message-State: AFq9FYLdRYHNIULmbVUQmOYh7xW6Jrp9FzCbF3VK1s+J+tAy6JE9t8hL
	TTgFOU2igey4bMpzKMiAgKluDvoxQiwKqVvUTR6qEBEKpBwNoFqaVtMc
X-Gm-Gg: AYBFou2j6w9ZZdltNf0O/ty+DBO4cstJOrYUXoxX3indJNIXXbo87ojSMA+LMXy8ANT
	jY5B9j4+/57fNiPkMtrOxTaeSku15aq5hQSCiAEmdQiqfh9D2vDIK+8SM8s7fUiYq9UepknRXIG
	1Ai1zmMIhd0R0qWpalCBF2vqbcYV9UvSpr2sarrGhpwpADFGrV+AeMWXgAAiuEP+nM4UpI/EdBW
	xKCWDjOyrdKNhmM67vfvVPmfkZO90YytjjgJ9icv8NB0TqMU04ekgabX/RP1izXvdzGZarddfWg
	E+hXhDvaTo98oRm1IUxCY8ZgvIf0/7C0I7NY/311/DFJkJMvvlGYVFkiC4ml/opvEWgptLzns5x
	f2kRx7SCEWi6GPCniXHevBmy1FQzu29cquFePh7mvMzt4KR0CZ0YLOZbrGp877ya9FR83UOKeuD
	FVXT1tySa0wz3DQR68r8LMfj97nfxVIjXc+npFGAGdw9r7EtLXXJC7CbPlOcBi3jiiCEwD3iSIl
	KGRw/0SjMSzsEqmDHer5Jm3k+cA6oieott3Bqz8ROCTCW/e8pmoR2O7ZNmYLdWTngjeP/fX4MWc
	uFOiYpTB
X-Received: by 2002:a05:6122:1b8c:b0:5ea:c722:b3a with SMTP id 71dfb90a1353d-5eaebd96736mr504117e0c.7.1792579184449;
        Wed, 21 Oct 2026 03:39:44 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97f0a94sm2630002e0c.11.2026.10.21.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:39:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 07:39:36 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ernest.vanhoecke@toradex.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3tiDOUUYLb8PAq@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_033946_313267_9A6FD72F 
X-CRM114-Status: GOOD (  36.78  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > by an ILITEK ILI251x capacitive touch controller.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > >
> > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > >
> > > why not share one dtso?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > There are two main differences:
> >
> > 1. The mezzanine one uses different backlight controll pins, so here we
> > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > in the one without the mezzanine.
> >
> > 2. The touchscreen GPIO and interrupt pins are also different with the
> > mezzanine board.
> 
> 
> And there are for imx8mm
> https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> 
> https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> 
> Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> work on optimization solution.
> 
> If use nexus connectors, we can share one dtso now if there are not
> clock settings.
> 
> clock patches is close to pick up
> https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> 
> Frank

We tried to make the change to have a single overlay for the boards with and
without the Mezzanine. However, in the current state of nexus connectors, this
can't be done cleanly yet. When trying to describe the hardware at the level it
exists in, following DT guidelines, and using nexus connectors, we still need
two separate overlays to enable the native LVDS with and without the Mezzanine,
so we don't really reduce the maintenance effort.

See the changes at the end of the email, this is the closest we got to a
correct and clean implementation that would allow the usage of a single
overlay.

The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
Ideally, they would be defined in the nexus connector, as shown in the diff.
However, after enabling the connectors in the overlay, the pinctrl groups
remain unclaimed. The reason is that nexus connectors have no driver to claim
the groups.

    root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
    ...
    pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
    pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
    ...

There is nowhere else in the carrier dtsi's where the pinctrls belong.

The pinctrl groups thus need to be added to the touchscreen node defined in the
overlay. However, the pins on the Development Board (which uses the Mezzanine)
are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
and we cannot claim them in the overlay. Because of this, the Mezzanine needs
a different overlay, which doesn't claim any pinctrl.

We like the idea of a single overlay for both carriers, but sadly the nexus
connectors, as they currently are, are not ready to enable this. We therefore
have to move forward normally and once connector support matures, we're happy
to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
and for other modules.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..d73a7e9042ea 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,41 @@
  */

 / {
+	lvds_connector: lvds-mezzanine-connector {
+		compatible = "toradex,lvds-connector";
+		#gpio-cells = <2>;
+		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
+		gpio-map = <0 0 &gpio1 6 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#pwm-cells = <3>;
+		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
+		pwm-map = <0 0 0 &pwm2 0 0 0>;
+		pwm-map-mask = <0x0 0x0 0x0>;
+		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
+	touch_connector: touch-mezzanine-connector {
+		compatible = "toradex,touch-connector";
+		#gpio-cells = <2>;
+		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
+		gpio-map = <0 0 &gpio1 1 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
+		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
+				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-map-mask = <0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 846b36706821..736f034c7550 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -11,6 +11,46 @@
 #include <dt-bindings/leds/common.h>

 / {
+	lvds_connector: lvds-connector {
+		compatible = "toradex,lvds-connector";
+
+		#gpio-cells = <2>;
+		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		gpio-map = <0 0 &gpio5 1 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#pwm-cells = <3>;
+		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
+		pwm-map = <0 0 0 &pwm2 0 0 0>;
+		pwm-map-mask = <0x0 0x0 0x0>;
+		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
+	touch_connector: touch-connector {
+		compatible = "toradex,touch-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+
+		#gpio-cells = <2>;
+		/* LVDS_TOUCH_RESET_CON# - Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		gpio-map = <0 0 &gpio4 30 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		/* LVDS_TOUCH_INT_CON# - Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio4 31 IRQ_TYPE_EDGE_FALLING>,
+				<0 IRQ_TYPE_EDGE_RISING &gpio4 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-map-mask = <0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X14";
@@ -159,6 +199,16 @@ &i2c5 {
 	status = "okay";
 };

+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;  /* SODIMM 44 */
+	};
+};
+
 &lcdif3 {
 	status = "okay";
 };

---

Best regards,
Leonardo

