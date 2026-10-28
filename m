Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8BE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rtoQ/lN4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QF5aoh41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Xdd791neb7+DgspUqeY+rUJCS1GBwC2Im7bccJPreSc=; b=rtoQ/lN4mKt4C1OiwwcVo5BPsz
	J/zjYRqC1MTZTzv7ygaNQ3912gMDpm93y0kHRU3x0ZjYrcmgTEOi4iJRso9+7ZEexIT87GOWqBbrd
	yp6raevLAHbawhhH311Zs0MD/+y4ghkKvnqb72fy0XFXci5LIK0gModG2cDbcsDHBypUGmRIHiY04
	NbIYmhvhc5Ir0NAnzYAcXwCNgBAsO+JqiORFz95UtG1en3Qh9ea/4R4Ugqe/j68EqVsery57/2U5h
	qVF8yBcgTl56C3IQIgU1D6SdR35H48BV6u823PvLcjrzEX8J6Ij9gvFODyTTiCwKHNYpXAspA8xdf
	sNLTFAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsfN-000000062g8-0Hhm;
	Wed, 28 Oct 2026 01:41:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsfK-000000062fD-278h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 01:41:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3402465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 18:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793151679; x=1793756479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xdd791neb7+DgspUqeY+rUJCS1GBwC2Im7bccJPreSc=;
        b=QF5aoh41CDkeIggNlor7zjYjTm7sESd7mb98bjYhfgFdcLX7NwMV1VZVr64lNSuJq2
         spogu+G9KVVddjMDml8NI65IioyjTP0E3Sr8+iur2HYDmqCs9Tvh7uUptFHfpSWjdlfW
         7OCUMMY7XuAr9oOLLqvlXx1puXGPQET9PPACR6Qfz5KEuQmxbg4bB0psT9QfQjJhTlSr
         Jq0enzNUuHwIIJ2uMjH/kK+UTElhv7LX6ycJHfIF1y3MKDfVV84gVhKWzUIZw7GaPIvd
         PcUK5hx+BKSbqcMRrQBIA+KXSAk+vEKHwbTjA8GaSsfWOznQjo4RD0j+Bgpsf9WgH+Fk
         x79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151679; x=1793756479;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xdd791neb7+DgspUqeY+rUJCS1GBwC2Im7bccJPreSc=;
        b=v5Lro6nwfsweL+nRd4dT3o0LVtYfmbNdjzm4zRFHGDjIzyZhjD7q2UOo0iNvNZigfz
         2NmmEdxHEygA7ls+raXIFcKglOm6dR0swb1Y6kgpO2FbEYI1tNFEYvg6EtjDTmaYvJtX
         hRYLeeo91GX3FYcljjD2EN+DhngEJTpnkdlcINMDT0o9EMMK2vkEBCTOlKq/Yqj2zwN1
         BvFKvx7ygGZr/8QluNHLxk57//VlqTo0yItl0HlcTaOZXRl64SztGrHB5PPyrvF7fFK2
         8ijfn8p0IN0vA8HKc2xeONFQK/JNMnW0UHV13fNJB0WlJoqz2o/A9oW8pw2oe5x17GtE
         3hPg==
X-Forwarded-Encrypted: i=1; AKwUvBxW7QuJMF+seTAw7bRIbk+1A3CU6uVyuOJkM7aZu8kZQtAohidq4El7kj9Xhe/39OY06lYyAp8kGmRH9dDrwAJx@lists.infradead.org
X-Gm-Message-State: AFq9FYLwhAByXqoLlewzShtzQ4kqZOrEUvno4q7ylkQrpo3cFpyD7od/
	L2KW81BWhrm1oSY/U9UCBNOkb5c/JYVxzmn5X9krpEEvsW/BKXh6J0u3
X-Gm-Gg: AYBFou1BF5dwFPYBTHn9pJGnEr67QBMDSXfTRm/Iv8IvRFlprOAK/WoosSLnb0CTNmC
	69iLondgEa6fX2uYKHOVFLgRM5CLkcyhS7awy4m5NrbnIxddFXqPlXbPHsssNnMSuNYj/xCnnzY
	HA+SwnVdCmyoxdybvgVJj1+YiR+Y2bhiaIjIN4StSRmWbPuOAlRI8RSGzYQxoN+llyrqHxh1O/o
	p5kKJmduMyqvmL9LQT1yO6ZWy0YJA2e+1L+06dvhj9W851yTtmPoCwctAZ+Y31L63g4xsgSmVN2
	w0TBWWSz9d0Qxyt0HmxI6eSwnRyZbbc1xoTzwpe8SbEf3bZ93PI4ieBFeWC5wbI6pyDNeSNAH7r
	71e8h1YuEpzyiyAseP3CHmsEitTYHJzgPzd129clSKzV7OIunIawkmlpmqpiGuyidmDzAkSzyVs
	GQRrVhyqgRUhmrgHp0WOtgz9V19IFJhnx4nDePrYSw1CRo+XA3D0UVGzAyo8s54jaij7GUfkPTO
	aps7pRo1A1qEI/+fwnY1zPGcuJgRc8ncmSXN0m9/3hUqfqzkXAPMMqfF6dhbQtUnatLNoUtun+I
	82xKH6mo/JlQiD2MFFlLsSaF53ybvhyG6ki9LX2GhNehFDFBBv1TV4ZUDWixnaznK9piUqBuoiA
	Ua7HZx4B9WPp57lpCFDIx0nmYnJyux4951RuI9sL21Rx3kw==
X-Received: by 2002:a05:600c:1da8:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a966c3ffd7mr15596435e9.23.1793151679407;
        Tue, 27 Oct 2026 18:41:19 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9792269a7sm9089645e9.12.2026.10.27.18.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:41:18 -0700 (PDT)
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
Subject: [PATCH v4] PCI: rockchip: Don't lengthen PERST# when power is already valid
Date: Wed, 28 Oct 2026 01:41:16 +0000
Message-ID: <20261028014116.2432425-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_184122_620867_8E3B40E7 
X-CRM114-Status: GOOD (  42.59  )
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

That one sleep was carrying three separate CEM requirements, though, and
only one of them is about power:

  T_PVPERL      100 ms   power stable before PERST# inactive
  T_PERST-CLK   100 us   REFCLK stable before PERST# inactive
  T_PERST       100 us   minimum PERST# active time

Sleeping 100 ms immediately before the de-assert satisfies all three at
once, so dropping it outright gives up two that do still apply here.
Old power does not imply an old REFCLK: rockchip_pcie_init_port() runs
phy_init() and phy_power_on() on every probe and every resume whatever
the regulators were doing, and that is where the 100 MHz reference
clock PLL is configured and locked. So T_PERST-CLK restarts each time
even on a board whose supplies have been up for seconds, and between
the PLL lock poll at the end of rockchip_pcie_init_port() and the
de-assert there are only a handful of APB register accesses -- that
poll also reads before it sleeps, so a PLL already locked on the first
read adds no delay at all. On the resume path, where PERST# is asserted
at the top of rockchip_pcie_host_init_port() instead of at GPIO
acquisition, nothing holds T_PERST either.

Measured, with function_graph tracing across three re-probes of the host
driver, from the lane 0 phy_power_on() returning -- it returns only after
the PLL has relocked at 100 MHz, so that is when REFCLK is stable -- to
the gpiod_set_value_cansleep() that releases PERST#:

  72 us, 107 us, 75 us

against the 100 us T_PERST-CLK requires, and ftrace's own per-function
overhead inflates all three (ktime_get() shows up as 1.2 us in the same
traces). So without this patch's fallback the requirement is missed on
this board most of the time. The pulse itself measured 898-1032 us in
the same traces, which agrees with the in-driver ktime figure above and
is comfortably clear of T_PERST at probe.

So keep a delay, just the applicable one: record whether the supplies
were already enabled before the driver enabled them, and in that case
sleep PCIE_T_PERST_CLK_US instead of PCIE_T_PVPERL_MS. 100 us covers
both remaining symbols -- it is the T_PERST-CLK figure, and it bounds
the pulse from below for T_PERST -- while leaving the pulse three orders
of magnitude short of the 100 ms this endpoint does not survive. A
supply that is already on at probe was brought up either by the
bootloader or by the regulator core at boot, both of which precede a
PCIe probe by far more than T_PVPERL. When the driver really does bring
the rails up the full wait still happens, as it does if
regulator_is_enabled() cannot tell.

The same check is repeated on resume rather than assuming that power
was cycled: suspend calls regulator_disable() on the 0.9V supply, which
only drops a reference, so on a board where that rail is always-on or
shared with another consumer the power stays valid across the cycle.

This ends up more conservative than what the driver did for years:
until the change cited above there was no delay before the de-assert at
all, so on every board neither T_PERST-CLK nor T_PERST had anything
behind them.

Boot-level counts on the same board agree with the table: unmodified,
the endpoint enumerated on 0 of 84 boots; with this patch, 3 of 3; with
other ways of dropping the same wait, 16 of 16. Each of the three
PERST#-related changes that landed together in v6.11-rc1 was also
reverted individually, and only removing this wait made a difference.
Moving the wait later but still inside the assertion did not help
(0 of 15 boots), which is consistent with the width being what matters.

The measurements were taken on 6.18 and predate the PCIE_T_PERST_CLK_US
fallback; 100 us is three orders of magnitude below the threshold the
table shows, so it changes none of the counts. The code in question is
unchanged between v6.11 and v7.2.

Fixes: c47f90be4c89 ("PCI: rockchip-host: Fix rockchip_pcie_host_init_port() PERST# handling")
Cc: stable@vger.kernel.org
Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
v4:
 - Keep a delay before de-asserting PERST# instead of removing it. The
   100 ms msleep was also covering T_PERST-CLK and T_PERST, neither of
   which anything else holds here, so sleep PCIE_T_PERST_CLK_US when the
   Tpvperl wait is skipped. Found by the Sashiko AI review of v3; the
   hardware measurements in the commit message predate it, and 100 us is
   far enough below the threshold they show not to affect them.
 - Say in the commit message which CEM symbol each delay serves, since
   conflating the three is what made v2 and v3 read wrongly.

v3:
 - Rewrote the commit message to lead with the width of the PERST#
   pulse, which is what the endpoint reacts to, and demoted the Tpvperl
   redundancy to the reason the wait can safely be skipped rather than
   the explanation of the failure.
 - Added the A/B measurement: one kernel with the delay before and after
   the assertion independently adjustable, so pulse width and
   power-valid time vary separately on the same binary.

v2:
 - Re-evaluate the supplies in rockchip_pcie_resume_noirq() instead of
   assuming that the 0.9V rail was really turned off. On a board where
   that rail is always-on or shared, regulator_disable() leaves it on,
   and forcing the wait there would reintroduce on resume exactly the
   failure this patch fixes.
 - Factor the test into rockchip_pcie_supplies_enabled() now that it
   has two callers.

v1: https://lore.kernel.org/all/20260911104952.4190994-1-ehbello@gmail.com/
v2: https://lore.kernel.org/all/20260911211559.207990-1-ehbello@gmail.com/
v3: https://lore.kernel.org/all/20261028005603.2399220-1-ehbello@gmail.com/
 drivers/pci/controller/pcie-rockchip-host.c | 41 ++++++++++++++++++++-
 drivers/pci/controller/pcie-rockchip.h      |  1 +
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bd..ebb864c 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -315,7 +315,11 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
+	if (rockchip->supplies_pre_enabled)
+		fsleep(PCIE_T_PERST_CLK_US);
+	else
+		msleep(PCIE_T_PVPERL_MS);
+
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -590,11 +594,39 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
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
@@ -871,6 +903,13 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
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
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index b5da156..9127b55 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -315,6 +315,7 @@ struct rockchip_pcie {
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
 	struct	regulator *vpcie0v9; /* 0.9V power supply */
 	struct	gpio_desc *perst_gpio;
+	bool	supplies_pre_enabled;
 	u32	lanes;
 	u8      lanes_map;
 	int	link_gen;
-- 
2.56.0


