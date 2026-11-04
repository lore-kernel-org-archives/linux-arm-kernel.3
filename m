Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA08606B380
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQpRplLR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=br9qwWLh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdXvz6rH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=; b=LQpRplLRWpmASv
	BntwUVCj+QTFRZ9fDlNwJ6phH1540aKdasOc+xDdVZSi/sBNEEZDFyfgVpxiolV3VttPzdY4SGQ2A
	1wEl+TiaQh8I9qeAB2MkGrtw0uDdj2UUpFcphfPOnWSst8KmZOP/4lh/bA5BEkpGF8VqycQHyxkGJ
	yFvblZHE7wqtcR4nAw9d1DKDZhi4Zu1nI4uSg5jY3i4moqCdpvtxVYZxLtEZDlF8LaeltCjH3wjUG
	rVAp9U8ydWEqbOaxTSqMPfg1+iaU/lvnP5cJdlo2z1NMWvIVFd4d/ghspXksgcoWElRoaZsdQlRYe
	55o7px7SAJYmtjkRMp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0Y-000000076mN-44xD;
	Wed, 04 Nov 2026 21:59:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0W-000000076jQ-3K0T
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Nov 2026 21:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=; b=br9qwWLhKmh6oXbUkmhPzIsdQV
	PPqepHGatE6Pr4kQi+OT2aq+7xZ1TzgmitCzcuQyhZnBaPVfhv2qO5/Ek6S7h7gFP9ZU45MvnBQR6
	CpzB2YpNDhEnCVW56Gw3YnGqH+3Rt/FiS0nJaaKWhArsn1ObbbbHWHBDREMyjAhOsJUhZ51n1QPe/
	FYRhY7o54bE2RCTRTw3kFv5QitJPvTKPrHL6E6TV1Fsy92ilL1vwpBtzn9n+gTlxM8RAsT1r2w+ek
	FOTyD1fXBMIS5BkDgLWJGMkXbzaKnzcvkj7LTZjJqAhtHj2WBy/PY4lT6ssZJ6iHJw4FUxBTx/hE1
	lSkZdXZg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0T-00000002FC7-0GK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:58:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10007405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829535; x=1794434335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
        b=XdXvz6rH5U6RsDurf+pA/VCC+M1R6ICaII5jYBvVGZw+/XRY2mOjfkM1hTw89DsohA
         BgZchxTBsPu2DUHuB0Qkck3p05Zh1+t0Lxhszyda82T3/6rD28X+YulTk3mcffgnvFwN
         iv6nUg8bFkJlIhbAnQLDvcRSnvj/PbMAuYfLZGPaKHcrP9oGmtYbyX9IZWHAfvZIPg1j
         QCIojxa3BSxyJgsHi/SsLpmq6uabVLg0aCra+GLGoctAqWzS9HmY04iOu3WjlDn1fxr+
         Rp/oxUsqC2xU77f/GbsJ1TijhqhtV8HxCvwGF5iQAWIIEeB5ykck2ITh4+IXMEWY4drQ
         YVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829535; x=1794434335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
        b=CWprBj9Ku2gQNtPplpI7cByV0Qu5NQgx4zthf2N7TdjRpejuyBgkmkp2Cgon7qezWi
         d5rLj9HZVyKe9YXZQA2Ol8gBie5AZu+yT+HWcPRbQqVi+nYoKkvqUS960twYWg9S8I8Y
         PumIq2vS+X0Dpe2egNby87ajva3p47kD8vU5ABDyGg471GkdSYtyMwipXMnYj1SXoY7o
         0QVrJOBpwdpV5cpggF8T1iEj3GaVWJIyFl0S2y4jbe9/sBYyRFJ9EYa8EP2+3Gv3teq2
         uBQxrZ07Uon/lTGaq59O7+FcR+r7RJoQnilwzMk2F7XEKFZ30Uql6o7DiTG7Pw8emhx+
         QGrA==
X-Forwarded-Encrypted: i=1; AKwUvBwFh5Tud5bppZSFPBCiaN0HE9DsjhWT7DySmLnHAfB1tNrnlO/7GN0+c5EbRt2Bxr5gxl8ML1hfG/BjqrBrWk1G@lists.infradead.org
X-Gm-Message-State: APuU4Z+kfYFKBXvGbRZrL5GzxhnliQJuL7DOuXXVQGqHY6zRVonUh4qh
	M6QtAXHJi7PKHA/rv+R4OYLxcMD4A7tbFw9mF7XWZGfgHZrbl6/pFw4O
X-Gm-Gg: AYBFou1xg/r0XQvTLJo/6T5lIJ1IZU+cUB3xnC4jNovSy+DRR95CgyPz01B6cO/iB/e
	2mSYoqgJjV0KTPF1kN86aZDZslzLrbWdsJukR+v8g32IUc2uQoVb3X1meyBIBC1CD5ZpcHbcgZC
	3bXLw3bmKV5WX2cjDLI2dYi4ltvgmwHjs55tLtzXL2H778aSe5i6wvPU8vJ/5s6q6j/MbDlTiGG
	GEyZ0+Ma50l0vU318tEluh9Nesw6KAPKqOzcTMPuZVCGGZ/FFudYy74/ulk4kfrqEheZDAb6mPJ
	Kh1iyuSo22dpyZvMRwaT7+YHwoq4P/haYGlz6k0Mv0lA23rvwdrqnwbGavJXojsH/hrcFDW8URT
	N2rLeKFxjT/ops8mOeJ6YgMIHRopXQ4ddmH85lHPvHdGZPijuDl6xESk4HqJA2H3Aih8KDesc+g
	4O/bys6x5iS+cE0OhsufxxpfKrOAVS2hHK1ITstDP44XHhdJUNEFao7QL6YrCVLq4aKixqXliJ6
	K3KVnhq0+nwYOporcs+HfsNvHFiBwS2R/CLzk5B1wIBkse+sVJGt8no2ZdqRje/GcJ3muqPc9hk
	nVgC7TFxa9dnVYVZTBb2ub1yjCgf7l8zrBGPU8yya6lV45jWt7Tu/q1m7Tznq95USDTCu8KY+Mc
	o5cm4GWmBFcnUxFA3anZEvk61gtvf/HQayKBGihqVmEUhiRbH/vQdEtvZCAoWEpbzTSs=
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr393088445e9.18.1793829535234;
        Wed, 04 Nov 2026 13:58:55 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:54 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 2/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Date: Wed,  4 Nov 2026 21:58:47 +0000
Message-ID: <20261104215848.2087944-3-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_215857_098805_93DDA591 
X-CRM114-Status: GOOD (  24.06  )
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

rockchip_pcie_host_init_port() waits T_PVPERL, 100 ms, before releasing
PERST#. The GPIO is acquired with GPIOD_OUT_LOW early in probe, so PERST#
is already asserted when that wait starts, and the wait therefore sets the
reset pulse width as well.

That suits a board which powers the slot at the moment it asserts PERST#,
but endpoints do not agree on what they want. On a ROCK Pi 4C carrying a
JMB585 SATA controller, a pulse that long stops the endpoint answering
configuration reads at all. Measured on that board with a single kernel and
two module parameters, one sleeping before the GPIO is acquired and one in
place of the wait, timing the pulse with a ktime delta across the two
gpiod_set_value() calls:

  pre (ms)  post (ms)  pulse      trials  enumerated
  0         0          1-11 ms    5       5
  0         10         ~18 ms     3       3
  0         15         24-47 ms   4       4
  0         20         ~28 ms     3       1
  0         100        ~108 ms    4       0
  200       0          6-11 ms    5       5
  200       100        ~108 ms    1       0

Delaying the assertion changes nothing, while widening the pulse decides
everything. The slot supply on this board is regulator-always-on, so power
had been valid for seconds in every row above, the failing ones included.

Rather than change the delay for every board, read it from the device tree,
reusing the property names the Rockchip vendor driver already carries for
the dwc-based controllers in pcie-dw-rockchip.c. The default is unchanged,
so a board that describes nothing behaves exactly as before. Whatever the
board asks for, PERST# stays asserted for at least the 100 us minimum the
specification sets, which covers T_PERST and T_PERST-CLK.

Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
Link: https://lore.kernel.org/all/95aeecc0-2794-4cc6-a635-5c042afc1405@rock-chips.com/
Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 26 +++++++++++++++++----
 drivers/pci/controller/pcie-rockchip.h      |  2 ++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bd..5f78cd6 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -24,6 +24,7 @@
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include "../pci.h"
@@ -280,8 +281,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 /**
  * rockchip_pcie_host_init_port - Initialize hardware
  * @rockchip: PCIe port information
+ * @perst_inactive_ms: how long to hold PERST# asserted before releasing it
  */
-static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
+static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip,
+					u32 perst_inactive_ms)
 {
 	struct device *dev = rockchip->dev;
 	int err, i = MAX_LANE_NUM;
@@ -315,7 +318,12 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
+	/*
+	 * PERST# has been asserted since the GPIO was acquired, so this wait
+	 * is also the reset pulse width. Never go below the specification
+	 * minimum, which covers both T_PERST and T_PERST-CLK, each 100 us.
+	 */
+	fsleep(max(perst_inactive_ms * USEC_PER_MSEC, PCIE_T_PERST_CLK_US));
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -587,6 +595,14 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
 	if (IS_ERR(rockchip->vpcie0v9))
 		return PTR_ERR(rockchip->vpcie0v9);
 
+	if (device_property_read_u32(dev, "rockchip,perst-inactive-ms",
+				     &rockchip->perst_inactive_ms))
+		rockchip->perst_inactive_ms = PCIE_T_PVPERL_MS;
+
+	if (device_property_read_u32(dev, "rockchip,s2r-perst-inactive-ms",
+				     &rockchip->s2r_perst_inactive_ms))
+		rockchip->s2r_perst_inactive_ms = rockchip->perst_inactive_ms;
+
 	return 0;
 }
 
@@ -881,7 +897,8 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
 	if (err)
 		goto err_disable_0v9;
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_host_init_port(rockchip,
+					   rockchip->s2r_perst_inactive_ms);
 	if (err)
 		goto err_pcie_resume;
 
@@ -938,7 +955,8 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_set_vpcie;
 	}
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_host_init_port(rockchip,
+					   rockchip->perst_inactive_ms);
 	if (err)
 		goto err_vpcie;
 
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index b5da156..c773f74 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -315,6 +315,8 @@ struct rockchip_pcie {
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
 	struct	regulator *vpcie0v9; /* 0.9V power supply */
 	struct	gpio_desc *perst_gpio;
+	u32	perst_inactive_ms;
+	u32	s2r_perst_inactive_ms;
 	u32	lanes;
 	u8      lanes_map;
 	int	link_gen;
-- 
2.56.0


