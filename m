Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/PNCb6o;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUfbaStJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/lG80DLNu6POZT4VDpp/wyuZACJ7GhkljhIS7mjm8QI=; b=r/PNCb6ocaXP92kX+exsVldvj9
	2lHfmDOTBhddNWxliY6yOAM1l3DAlyqfFB6rMOCm/wfTKqwnjzUmkNdMUnriN2kuy9OVQAXTFH1wX
	iVePV6QiFwmMM9wlEi2Y+SNB5vnvA1SCsJnf8ILQdeApKWoR8S1/JvX8PzQKxmWc+phRA/12rDC57
	W/UN2xfYXlt7U4Fvwa37vsx3shX0oPcRjRMyl+IF51RbmdKH/+Lyv70yUuPGujyNBqdROX+AHPlrf
	/zMdAsz/51y4326FJGWRQxcD3OB1/7+9Rc2zt/aVSKN64hMx5w+J8lFoQkPlanP1NrzGp11e41NH1
	aSbUUV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrxf-000000060CM-1ISB;
	Wed, 28 Oct 2026 00:56:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrxZ-000000060AA-0iwM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 00:56:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so4309675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793148966; x=1793753766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lG80DLNu6POZT4VDpp/wyuZACJ7GhkljhIS7mjm8QI=;
        b=YUfbaStJSGfm4s/zAyKEosKB49rgtO1TSHDCirTacZgdDtf4t3ElhEJJa44IvLPEQH
         1nHYLQojZp7KedFTY6yfsPBYOzlud4tY5iKk47WZH8w/3vRqsuYcLvjstv7gF73ftbVB
         kBnr3UjiB+n+LZMq3Q5BjFt3+e5c4wAYtH7WlQLmmDpiLqlQf1RkxINWoBg1lwax93oz
         bawuXSOkXSt1+h9b9JbwrqmQwwdsdHeC3gQvsLn/7IWO5PtIXFxDbl4ENAb2HFkJ5/Sc
         t3MAMQ6bqW5mGfal82wvJi3lSt6MszzIlPJGh8+V9KkJ7d9y4jZgOSAc66UL0gLNSTCU
         0Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793148966; x=1793753766;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lG80DLNu6POZT4VDpp/wyuZACJ7GhkljhIS7mjm8QI=;
        b=umpbqwJegvLilrwBn0d99nV+H24eadcmKDC3AOqhuhSOUM7OygWr38dbkGONssgGD3
         na3bt7Kz3f617AeIGU/YtiGiSTMAN68tRoM8vh5gH+1OWFi947/JK1GCgdlAAbe4a3cn
         UW+yYGbP80g940qdPUExL9rOUAeeZIAh7iAIiWh0QnGdG/bbrHcIT/gAcUieAALk73De
         G4PtZ7xgZAS6nyIp4ttF0lOS91S+NAJchslFonV8vBGVeYa7VDWQbBiz+Ms0AXpiiCtP
         J9+FhDWRGavwwKyt/BNEODw0usNRRbrjqLjxCuRcMm3qzw9JX+Ed/7JEfPl7p7UeVn57
         0dsw==
X-Forwarded-Encrypted: i=1; AKwUvBxcugpK7OaDemZu6Tk1RQoon3pw3qi9Jnx/9EvKcwbjNhuL6q4msB0c1W0TRODO4DbdLAFo6VDpEOq5wTpKdH3f@lists.infradead.org
X-Gm-Message-State: AFq9FYLEFyVmmzSz3exTm8VjTjA4yvYiThIZipeacaWigrtmkSBEE4zD
	uoAJ+Ej0O4WjDxzkvCXtGCivMrfOuaUQpv5uYM1IsbEBbnLCe5Imr31M
X-Gm-Gg: AYBFou37d5KhC0EHQbeJSAyRz6CuokTP82Kjes2nvj+1K8aDHRkuS4VHN9fAb0uqg8b
	pKZP5GqEVLYL9sXsExO47CI3oh9M0/SaQtz19JZk2vXw67PW0iJcJ2qPSGwk1AEYrQk8gq9dJq6
	NiL+k+LdNMKnlZZ044NFpFmkKb8k2WanK0ucp9JaWVZYB4frOhtsquNyT2GL7Ebno8ZVrufVucQ
	KzKLU80ZrtzIHS7GI7JwJEfkreqfVaUFUxF838jQ+N5yQ0Jckd8TMq/txX+qAa1eNcKvnGK+5ei
	EOW3xLzZoBOpBxc1YV/dOtTH56y8cn3lB+IYetJWL2q4LG2SySt1PLs+8HLjMgIxaBB39C/3Ur8
	4KkhNrHrhK4elCal6lHB8aNdpLowq13r65Sl2mt0k5AzVXExqoq64ZYWGSnowrLarnNSg6rQ0Ku
	RH0ou1CQ86Vz/XgkwzJuTRnm5IzPaGKEsFb6uYPoc+yCeUICSDBDAO13b5lZY2W3zr1jNN328FF
	AH3uMAxOCjRZatgt1eJWyJk6OVD6elarWZmb9GxVHroiTC3qS7ncoaCzj81Nx9jQdpdxM5+7nfA
	4Ii4FUhQpqBaxATBIp3e8yi8Jo8zoeO2x1kdh2iO8+fgXk1YRwfHw4AIYNW80yyPXRtxkyNw2hP
	9qfNKK0ahsrC1RP+LGpND5LVti4XNkcLEVjFfnHhGAqTD1DI=
X-Received: by 2002:a05:600c:1d1a:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4a966c4111amr12556135e9.17.1793148965902;
        Tue, 27 Oct 2026 17:56:05 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42bb6fsm7698165e9.7.2026.10.27.17.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:56:05 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	iav@iav.lv,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v3] PCI: rockchip: Don't lengthen PERST# when power is already valid
Date: Wed, 28 Oct 2026 00:56:03 +0000
Message-ID: <20261028005603.2399220-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_175609_478173_9E2E2829 
X-CRM114-Status: GOOD (  36.11  )
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

Since commit c47f90be4c89 ("PCI: rockchip-host: Fix
rockchip_pcie_host_init_port() PERST# handling"), a JMicron JMB585
behind an rk3399 root port is almost never enumerated: the link trains
normally, but the endpoint's configuration space never answers. On this
controller a configuration read that gets no usable completion is
reported as an external abort rather than as an all-ones response, so
the machine does not merely miss a device -- it dies with an
asynchronous SError inside rockchip_pcie_rd_conf().

That change added an unconditional msleep(PCIE_T_PVPERL_MS) to
rockchip_pcie_host_init_port(). PERST# is asserted much earlier, when
the line is acquired with GPIOD_OUT_LOW in rockchip_pcie_parse_dt(), so
the sleep lands inside the assertion and widens it. Measuring the pulse
in the driver with a ktime delta across the two gpiod_set_value() calls
gives 1 ms without the sleep and 108 ms with it; msleep(100) rounds up
to roughly 107 ms. This endpoint does not recover from a reset that
long.

To separate the two things that sleep changes -- how long PERST# is held
low, and how long the supplies have been valid when it is released --
both delays were made runtime-adjustable on a single kernel, one before
the assertion and one after it, and the host driver was rebound to
re-run the whole probe:

  before assert   after assert   pulse       trials   enumerated
  0 ms            0 ms            1-11 ms         5        5
  0 ms           10 ms           ~18 ms           3        3
  0 ms           15 ms           24-47 ms         4        4
  0 ms           20 ms           ~28 ms           3        1
  0 ms          100 ms          ~108 ms           4        0
  200 ms          0 ms            6-11 ms         5        5
  200 ms        100 ms          ~108 ms           1        0

Delaying the assertion by 200 ms changes nothing, whether the pulse is
short (5 of 5 either way) or long (0 of 4 and 0 of 1); widening the
pulse is what decides the outcome. vcc3v3_pcie on this board is
regulator-always-on and regulator-boot-on, so in every row above --
the failing ones included -- the supplies have been valid for seconds
by the time the driver probes, and Tpvperl is met whether the wait runs
or not. It therefore cannot be what distinguishes them. What this
endpoint reacts to is the width of the PERST# pulse.

The wait and a short pulse cannot both be had in general: Tpvperl is
counted from the supplies becoming valid to PERST# being de-asserted
(PCIe CEM r5.1, sec. 2.9.2), so on a board that powers the slot at
probe time the assertion does have to last that long. Where the
supplies are already up, though, the requirement is met before PERST#
is ever asserted, and the sleep only widens the pulse.

So record whether the supplies were already enabled before the driver
enabled them, and skip the wait in that case. A supply that is already
on at probe was brought up either by the bootloader or by the regulator
core at boot, both of which precede a PCIe probe by far more than
Tpvperl. When the driver really does bring the rails up the full wait
still happens, as it does if regulator_is_enabled() cannot tell.

The same check is repeated on resume rather than assuming that power
was cycled: suspend calls regulator_disable() on the 0.9V supply, which
only drops a reference, so on a board where that rail is always-on or
shared with another consumer the power stays valid across the cycle.

Skipping the wait only when every supply is already on is strictly more
conservative than what this driver did for years: until the change
cited above there was no Tpvperl wait at all, and PERST# stayed
asserted only for as long as the register writes in between took.

Boot-level counts on the same board agree with the table: unmodified,
the endpoint enumerated on 0 of 84 boots; with this patch, 3 of 3; with
other ways of dropping the same wait, 16 of 16. Each of the three
PERST#-related changes that landed together in v6.11-rc1 was also
reverted individually, and only removing this wait made a difference.
Moving the wait later but still inside the assertion did not help
(0 of 15 boots), which is consistent with the width being what matters.

The measurements were taken on 6.18, but the code in question is
unchanged between v6.11 and v7.2.

Fixes: c47f90be4c89 ("PCI: rockchip-host: Fix rockchip_pcie_host_init_port() PERST# handling")
Cc: stable@vger.kernel.org
Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
v3:
 - Rewrite the commit message. It now leads with the width of the PERST#
   pulse, which is what the endpoint reacts to, and demotes the Tpvperl
   redundancy to the reason the wait can safely be skipped rather than
   the explanation of the failure. Manivannan was right that those are
   two different claims and that only the first one was evidenced.
 - Add the A/B measurement that was missing: one kernel with the delay
   before and after the PERST# assertion independently adjustable, so
   pulse width and power-valid time can be varied separately on the
   same binary. Also note that this board's PCIe supply is always-on,
   so Tpvperl is met in the failing configurations too.
 - Note in the comment that the regulator_enable() calls are kept for the
   reference count and are independent of the Tpvperl question, so the next
   reader does not have to ask it.
 - No functional change from v2.

v2:
 - Re-evaluate the supplies in rockchip_pcie_resume_noirq() instead of
   assuming that the 0.9V rail was really turned off. On a board where
   that rail is always-on or shared, regulator_disable() leaves it on,
   and forcing the wait there would reintroduce on resume exactly the
   failure this patch fixes. Spotted by an automated review of v1.
 - Factor the test into rockchip_pcie_supplies_enabled() now that it
   has two callers.

v1: https://lore.kernel.org/all/20260911104952.4190994-1-ehbello@gmail.com/
v2: https://lore.kernel.org/all/20260911211559.207990-1-ehbello@gmail.com/

diff --git i/drivers/pci/controller/pcie-rockchip-host.c w/drivers/pci/controller/pcie-rockchip-host.c
index d203c48..495428b 100644
--- i/drivers/pci/controller/pcie-rockchip-host.c
+++ w/drivers/pci/controller/pcie-rockchip-host.c
@@ -314,7 +314,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
+	if (!rockchip->supplies_pre_enabled)
+		msleep(PCIE_T_PVPERL_MS);
+
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -609,11 +611,39 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
 	return 0;
 }
 
+/*
+ * Tpvperl is counted from the supplies becoming valid, and the driver waits
+ * for it with PERST# asserted, so the wait also lengthens the reset pulse.
+ * Supplies that are already enabled before this driver enables them were
+ * brought up by the bootloader or by the regulator core at boot, both of
+ * which precede this point by far more than Tpvperl, so the requirement is
+ * already met. Treat an error from regulator_is_enabled() as "not known to
+ * be on" so that the caller waits.
+ *
+ * This does not change who owns the supplies: the regulator_enable() calls
+ * below stay, both so that regulator_late_cleanup() cannot switch off a rail
+ * that the bootloader merely left on and so that the regulator_disable() calls
+ * on suspend and in the probe error paths stay balanced. Whether a supply was
+ * already on says only whether Tpvperl has elapsed.
+ */
+static bool rockchip_pcie_supplies_enabled(struct rockchip_pcie *rockchip)
+{
+	return (IS_ERR(rockchip->vpcie12v) ||
+		regulator_is_enabled(rockchip->vpcie12v) > 0) &&
+	       (IS_ERR(rockchip->vpcie3v3) ||
+		regulator_is_enabled(rockchip->vpcie3v3) > 0) &&
+	       regulator_is_enabled(rockchip->vpcie1v8) > 0 &&
+	       regulator_is_enabled(rockchip->vpcie0v9) > 0;
+}
+
 static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
 {
 	struct device *dev = rockchip->dev;
 	int err;
 
+	rockchip->supplies_pre_enabled =
+		rockchip_pcie_supplies_enabled(rockchip);
+
 	if (!IS_ERR(rockchip->vpcie12v)) {
 		err = regulator_enable(rockchip->vpcie12v);
 		if (err) {
@@ -890,6 +920,13 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
 	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
 	int err;
 
+	/*
+	 * Suspend calls regulator_disable() on the 0.9V supply, but on boards
+	 * where it is always-on or shared the rail does not actually drop, so
+	 * re-evaluate instead of assuming that power was cycled.
+	 */
+	rockchip->supplies_pre_enabled = rockchip_pcie_supplies_enabled(rockchip);
+
 	err = regulator_enable(rockchip->vpcie0v9);
 	if (err) {
 		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
diff --git i/drivers/pci/controller/pcie-rockchip.h w/drivers/pci/controller/pcie-rockchip.h
index 3e82a69..e63259a 100644
--- i/drivers/pci/controller/pcie-rockchip.h
+++ w/drivers/pci/controller/pcie-rockchip.h
@@ -318,6 +318,7 @@ struct rockchip_pcie {
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
 	struct	regulator *vpcie0v9; /* 0.9V power supply */
 	struct	gpio_desc *perst_gpio;
+	bool	supplies_pre_enabled;
 	u32	lanes;
 	u8      lanes_map;
 	int	link_gen;

