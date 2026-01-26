Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7075FD19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0De7nRlzZgKoNpc7KMRM94XZgm+NHhYXZrrxI/qWjOs=; b=Iu2Rlx7GO36yJR8DlLzWiceH5/
	Qi5073H/8J7/3EImUUtXw/+p/J949S1Le0tx5VVgBaQ5Z3/r+e2iH/ORhoo61h2VEDiLqsPIqdK9K
	rh7axR25R1X0Hn/bvnnNR6Y3QTgA3N/Lb6bDCMV6X6wTACAM0ifyBPhwA1mxlO/qiPdPM/rohER7X
	dFJ3JB1RjKQoV6cOfwLEqbGISwqtT1OhMPLJQcmyzNVX5vuPt0sGb2qE3SU5XtxZIMMD12qTL/Ze+
	Mb7lNUs/0L1tiXt0hHHgcgv5EU3ieGTzOCq3ZWrdHZ/O4XV/IK9C3RmhBk7pVmhG2/BwXTSwiO/94
	MatC6iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQN1-0000000CyEj-1oXC;
	Mon, 26 Jan 2026 17:27:23 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQMx-0000000CyC6-0PSb;
	Mon, 26 Jan 2026 17:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0De7nRlzZgKoNpc7KMRM94XZgm+NHhYXZrrxI/qWjOs=; b=cEIwAccbSRPA7QLojMwx5/yuEI
	TG4qFGSPFjZ5wIfJDB7GeoQfvmyssvUX6dxsG6kaxS1yxnKp30onIrxG7wgGf+HhoXHv+owTdEWGd
	8qHHgwz/a2HMIHxJjt+ozENMgJuPkgJz0MvjoWLiTwwofY3RtnzcbCXDqcqep4zvGC6n80PSF9RYk
	iFNb5/Ro2y4K0+eKSVjWWOAV5cBmlS9iZ/qfCiyI0HcSI75WOuVWuBS/XskmK1vvPgptFNISt1ilk
	LfZH7MY3CVQAZUcrHWwtrt3+ujHuqRyXYWE1KdnCQzWvkvffPD5W/M515MvS4HEv5jJ1VXh3sD52i
	DiqaffJw==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQMr-00A8mi-36; Mon, 26 Jan 2026 18:27:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:38 -0300
Subject: [PATCH v4 2/6] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-2-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Ipw/QvXlOZd12wv1pGCquJWsD6OU8kKbhT5EbVPlBU4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6PdWIgLKW7phUhvdJ6R6PyWSq8aZ3XXhx641
 0jiwpVaNPCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3QAKCRA/8w6Kdoj6
 qj5NB/9KNeLucl/rs8gnnkCbdgPqf0KzP76O/NvCzxKtwAvVviFqV31M8NuvkQrvSdKqQLAdTQN
 kpSJsVtmzk3kQuL3fkJretPiXS+yYWYYbMsDil+9J0Fu7oU4SK3kyXA+71rS7n0FhkxX3WAEQ+E
 7JqM8qaxbKD5YDRWfbHRpxTWVChbMbayQC9id0uLIhTz7FjdodAvQ7olzipqwcLpZBTOEh5RZdn
 4lqEDzPmFH7tkx3VJq8xB8rMP+tgB6J0WtIHCynlAkPjOs0wA1y9BKHMrJwDBycIBRvMrnuq1ns
 0uWBh5wwmCXjXy8iwPIK2P5LMKaeP4NoIaKwj9Ac0I6qk8/3
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092719_144016_2EC2D611 
X-CRM114-Status: UNSURE (   7.93  )
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

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. Document this behavior so that clock
consumers understand they may need to set the rate to minimum before
disabling for meaningful power savings.

Suggested-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666cf6d02baa8be11c 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *hw)
 	u32 state = 0;
 	int ret;
 
+	/*
+	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
+	 * actually power off the clock. To achieve meaningful power consumption
+	 * reduction, consumers need to set the clock rate to minimum before
+	 * disabling it.
+	 */
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
 	if (ret)

-- 
2.52.0


