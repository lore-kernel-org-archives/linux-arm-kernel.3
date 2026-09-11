Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10D6C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JrxdF8t+QTOTmJ7fVNc0ZXDeEsvlNdyHKnTguJqLTM=; b=Lq5bvWqCKg8lTpsU4JssBuZsYg
	MTXUbQo0x0C4X8myZED2X/iymcUdcgOC2a3XgVxJOJDxWNk5Bs1DuJg24MA+jTpCiRHDPwGvlwmTY
	myiwL/a59reFMVcvTqp7s3vRYSix6h41nH5A3IuU4PgVo0cRAhB7zY8NakzojtidVd7tbNxvlNpd2
	uF2t2aSsLHzhUMEPlgbDSShaLUpmL9wZ5gFEOmUXlF8e2U5IXZ2L9s6pyxA/kuHzclxK0xcHEVFNi
	9/NszkvsFj86kVk2DLtueezQNQyO5b63aGlnt5aNuPlVOZ5OWfUUBu0NAYlQ9IeBhrBt2YxMXMjtJ
	xkh0l6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnQ-00000000NHM-0IH2;
	Fri, 11 Sep 2026 23:36:40 +0000
Received: from mail-vk1-xa62.google.com ([2607:f8b0:4864:20::a62])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ams-00000000MrU-0zd4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:07 +0000
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-5c82e6a6a2aso901316e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169765; x=1789774565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JrxdF8t+QTOTmJ7fVNc0ZXDeEsvlNdyHKnTguJqLTM=;
        b=CtPrgvtlHOBj8XzPAQ4e3JRqfcKKY+C/jPHpZb1v+9Zux4PoqA5l7IgEt7UX5Mg4Hp
         KZIT4mHKrWYk1zfLqbLp+d5G0b9DWMzsCncalPU8Xz/cMpyKAmmARhJtY4k3POGpaHhs
         NtxaPJ++nw1cf4VrOBuK6X/8hRdA23ZryieyjvELBqk1MnwXWIKkKQpIGKd8Gm0nW2NN
         TQQ/sapgI1ryGM8dqbCw5kwmGHiw5uCDCXhiMElBCvtJmrlmrhJskgErU6RwYyBgczI7
         +RRXpQA69hiu9voJLiB8lY02lrxKlda7r6U+IsCAB5CETfKRe5fgfW9QtWgIivTe17gJ
         HCMg==
X-Forwarded-Encrypted: i=1; AKwUvByMEs6ELhoMfuf9XQuMOizfaQ17kkQpAAmAIF6A/c4gmEAGA/Aocr0EXSB8hpMgMVjMTwNMHmzuz9rYX3m1shXN@lists.infradead.org
X-Gm-Message-State: AFuF++lYWzEk5D6BLcKexdX+AomCYe1w14JhkfHRnT5LLiVvT3wpWjfQ
	M9KiIYSqp+3Pc/oS6ZBa7+RPM2Pkndy9KXYx/zrHVIsKaEeCdwK9ETgJ02AKMdjUOUAUCwqwAph
	FGNtdNepzu8hRgiVQ9Wl9KrS5oyto2Ji1nL1W44DjMyRvIpL8vrgBybPWYk+INpI4tXecPFT+JT
	Mk8zAmHze3ZOPO2BbIVcFrQNYcDuYrlQgPyppBnO8QyjwdcnQ47IHGxq55or7TX9w/cc/tVNXfp
	rJiJ1qUL65i+BGTTctvzfNmlKfheWw=
X-Gm-Gg: AYBFou2BQd+3PA2LGngwqZVTaCTgfc8TxUG39SBJHyP29fhnaFJx4zMJZZSJ3id1XDi
	HsWmHV1dy0fqTKMXStZK3y1358ITwEdhgxI+EFZn1KQIQbiIsGF4O9gamUEcSzl7BE+gB11bbtG
	Uelxvn4QvIXxDa8WwfSUX9pERpdDR879J2gjzABYBfg1wLGltFpyYxEnmC3eXjXrDKeQh9N7bIc
	TYk7ihcOLYMO7ee3R3FscRZswD1Z3uygtwAPKSR44JOqS2toauMO5SxVo14Kg97CD+gBOcFDnC2
	q+vjyBlHDhJb10mmIRebWv+VFJ98BYTgzOO5B6X24bFG81LNfNGfvmxnfBDGt28QMhXNqwYtAjx
	+Os85wdr7DynlglB5k1vXsS90THViq5fH7g6SdHi1ow1GMZcaP8ozWs2vuVRu
X-Received: by 2002:a05:6102:160f:b0:786:724a:4e94 with SMTP id ada2fe7eead31-795abaef8a8mr642386137.11.1789169764724;
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-982b9c464c0sm991891241.3.2026.09.11.16.36.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ce8ad8002so29176456d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169764; x=1789774564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JrxdF8t+QTOTmJ7fVNc0ZXDeEsvlNdyHKnTguJqLTM=;
        b=GI09op4dY7Tlr7GT6MQjM4r+29jJyyzAkZHnqlDPMhEEoiXP5winT2BOzEMtE2EdIU
         aucK1mkX80HdMBBbj2RW1SExgpIF2lN4splyqXiP5jjN5/PnpytEkUhvAFGQzBceqk5U
         yOG8FtdQ4vQ6/DZo76YSybFUhc0MSLT4fGsXM=
X-Forwarded-Encrypted: i=1; AKwUvBzcTAJmJ72vdsARXsViPzeaxzzpwndQ0Fi/SAk4YCJCDXbgfgXayJdknyUc2HVuzqvAfKakXLu3ho2nQJLrOyzz@lists.infradead.org
X-Received: by 2002:a05:6214:ca8:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-9121d8f1169mr10166876d6.14.1789169764090;
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
X-Received: by 2002:a05:6214:ca8:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-9121d8f1169mr10166536d6.14.1789169763636;
        Fri, 11 Sep 2026 16:36:03 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:02 -0700 (PDT)
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
Subject: [PATCH 09/13] PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
Date: Fri, 11 Sep 2026 19:35:34 -0400
Message-Id: <20260911233541.1650895-10-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163606_283721_4889D9E0 
X-CRM114-Status: GOOD (  13.57  )
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

Declare and assign a quirk where PERST# must be asserted prior to an
internal bus being turned on.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index e2284e114241..dfd703571091 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -296,6 +296,8 @@ struct inbound_win {
 #define CFG_QUIRK_32BIT_PCI_OPS			BIT(3)
 /* PCIe HW does not have an internal bus timer */
 #define CFG_QUIRK_NO_RGR1_TIMER			BIT(4)
+/* PCIe PERST# must be asserted before internal bridge turned on */
+#define CFG_QUIRK_EARLY_PERST_ASSERT		BIT(5)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1159,8 +1161,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	if (ret)
 		return ret;
 
-	/* Ensure that PERST# is asserted; some bootloaders may deassert it. */
-	if (pcie->cfg->soc_base == BCM2711) {
+	if (BQUIRK(pcie, EARLY_PERST_ASSERT)) {
+		/* Ensure that PERST# is asserted; some bootloaders may deassert it. */
 		ret = pcie->cfg->perst_set(pcie, 1);
 		if (ret) {
 			pcie->cfg->bridge_sw_init_set(pcie, 0);
@@ -1965,6 +1967,7 @@ static const struct pcie_cfg_data bcm2711_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.quirks		= CFG_QUIRK_EARLY_PERST_ASSERT,
 };
 
 static const struct pcie_cfg_data bcm2712_cfg = {
-- 
2.34.1


