Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B54C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArH91frdffOdQcxWygxWviJhRnyFFFtxyckVO+/C0bo=; b=X89fML3PYk1wBbv1QmxvLDkcWj
	KpPHXGtrNpWoXnUvSPlPUNxX9GQmfyssoQSu8M5rJeK+zqoF1k51N7JImxnuedzbR08lVVrC1zOjN
	k6YVx9dXEbYuIYh02wUej+AtdcjUrp6khApG49FO5bRUWa5Nr6aqinquA4loMB2MJ9cfuSvvRSW9w
	Ha4i/oLJgRFNBNkiFG5dg+jokKqovoisXWoRTlQdz5AUyWSjGKfp6mlLKvwuhCySgSWL3M81e+uNH
	JTRa4lMxu/gV4mvwz4r/qSgbliiYqb1tW2HbMS1SUH1wzfcsdGh0COEIjSjFXfkYmhz5tqOLKHYFw
	zvfo9jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ami-00000000Mkz-1sL6;
	Fri, 11 Sep 2026 23:35:56 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amg-00000000MjH-0oxB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:35:55 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-868b3248b2cso356496b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169753; x=1789774553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArH91frdffOdQcxWygxWviJhRnyFFFtxyckVO+/C0bo=;
        b=E1/c+Eg8MU07K2A+hvzva8Q9MYjpQcXuVSHt/WciLd/86WONwcY2+kjKcLgFEyER3Y
         GydHRl7BfIunuthWAzpO9jpYbNx0OU1jm8+UefMQvRB72k9tpc/CM0Hv/0bvG7karw9G
         abPaK9BZbMX+2BdmG3EDXb4AleZY/LrbEAcLTZaXHmkvNsEjtFp8kZeBA5CB+lNkaYtp
         F5b1VV+wLMkZNf7A4HD9w5Km+I5L2frdBpc6FwKx77V9rK4ydfBCqPcy0usa7Nk1oH94
         gR7XzvCSxUjiWUOHRhJWcmvX2WjTb6bqyVFYGd5HWvPrU22/yok0OHM6eKInYXZNEHEw
         OYnA==
X-Forwarded-Encrypted: i=1; AKwUvByjd95At3iVFJljbr9f+R6e1i4z4jAQxkL+wV0DvlNkYC/GSKPkIj2A9DaC7QR+54F9pkoLurd0kRwnijTFoAGD@lists.infradead.org
X-Gm-Message-State: AFuF++lWs95eV6pIMDz7X1XRO/XU255x0slajbDLdLtHK50V6xGmP6DZ
	ZVh889La1nx6gy4a4iL2R5JULvtx1HZ+cBQNm4+B2AhhF+kzq+HdJajhUSRf35TlebqRlEBYgGp
	Br7aaIFPypYOx6WLufpoTJYCgHEz0QqOij3l6tbDPU+8w7JQpo6Fki9wKj1Ze2BL3fZNo/0As2Z
	p67/KvpLZucUwRxQxzvGxAdYx2dHQxj4PFMicG1mHwmGAUPx04TbOlZgFTf6J1pXeuaB9nkijnn
	zyJVyRRTz/UZgGWgEKdCAnGFTb9zDk=
X-Gm-Gg: AYBFou3J3+ylRHn2zuuroQHSo2iZPKVReh1yEeFtgmNhXpIXElO6dcjvv3wKPU4wrUN
	18kNyKw9SCIB8A4wJef8pe/DCNkBxb/pFrktaOVr9V6/gH8fxR2puYvKbaBAajSbVkcKZWBvUkf
	gMOoFWr1753e2qOg8wsEpilnjODkTtjK2cCsNsbH/qElXZYL8LpQSH1v0HJxlv4AjXWIoAm3NK0
	sAP8h07iht97fBXobEZh0kXonY8UjSQ4Ah4ukQNXbaikXoJJkolGAA/8hp1GF6jTzGJlWNE3E6L
	WeFFu7Bghcx4aJvurynUwdnsIDAbJU6irXmT8ZXCJkI86Vz0XWYNaYG5KHoXTm7qSz7BH366djV
	uejyD9DShm1QutvXWT5oTBSjTdCrLVc0URUdNOxK6Q0NM55DL+urfca3t626KAyHWlSAFdwmJwX
	v7N2L8gLSAR5w/sh800L8eCdav+AkC1qfxbt57Uaw=
X-Received: by 2002:a05:6a00:3d42:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-86b3140363cmr9130476b3a.7.1789169753216;
        Fri, 11 Sep 2026 16:35:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86b27ebcaf3sm1180705b3a.6.2026.09.11.16.35.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283df62d68so27391021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169751; x=1789774551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArH91frdffOdQcxWygxWviJhRnyFFFtxyckVO+/C0bo=;
        b=ctOpms8ZGfxDKHsi+GfvhHAeC7f5K4LO5O7ennecm5mhyWllvjU10EWcLttN8bqfxQ
         oX773Gpp2e3b6iXLBN0ZKl6TIzkYQxSgo3vk6hTWAKqfmxwCRPbYnJM1JnGDrWnjHXHs
         weWfiMDORXCp4Hrd6TTcxezg8KdEXpYKZRTYk=
X-Forwarded-Encrypted: i=1; AKwUvBz4RM0wC07U8S2HfN3TOqlgMMMORS1ZbkEyXTjKhkejKKlRMQh9YMjhfQxUOF9fB/emZ/dlBjqWcbEvn/MW+g8c@lists.infradead.org
X-Received: by 2002:a05:622a:164b:b0:530:b2e2:9038 with SMTP id d75a77b69052e-530c87b2e6amr91262971cf.56.1789169751525;
        Fri, 11 Sep 2026 16:35:51 -0700 (PDT)
X-Received: by 2002:a05:622a:164b:b0:530:b2e2:9038 with SMTP id d75a77b69052e-530c87b2e6amr91262541cf.56.1789169751039;
        Fri, 11 Sep 2026 16:35:51 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 03/13] PCI: brcmstb: Add Broadcom quirks macro
Date: Fri, 11 Sep 2026 19:35:28 -0400
Message-Id: <20260911233541.1650895-4-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163554_247565_2CB63BA0 
X-CRM114-Status: GOOD (  13.69  )
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

Introduce a 'BQUIRK()' macro to shorten the calculation of a specific
quirk's value.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 47862569937e..bf002bcf6bd5 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -277,6 +277,9 @@ struct inbound_win {
 	u64 cpu_addr;
 };
 
+/* QUIRKS */
+#define BQUIRK(pcie, quirk)			((pcie)->cfg->quirks & CFG_QUIRK_ ## quirk)
+
 /*
  * The RESCAL block is tied to PCIe controller #1, regardless of the number of
  * controllers, and turning off PCIe controller #1 prevents access to the RESCAL
@@ -1627,7 +1630,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK);
 	writel(tmp, base + HARD_DEBUG(pcie));
 
-	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
+	if (!(BQUIRK(pcie, AVOID_BRIDGE_SHUTDOWN)))
 		/* Shutdown PCIe bridge */
 		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 
-- 
2.34.1


