Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oU2fmRfi;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gFmjnNpK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=; b=oU2fmRfi+GsKy8
	zHjf8skyD5etEvYFGNVi0Uho+1At+FBoD7BB+/LcW26AAFnf7U1FjCnx4FpSdKC7D6psMcD8nFEVW
	28Rwi4VT5uZwqj3ekb/UipdIvIbWiNJ+SEqTYp5WhVsY8RfHlCLQLNjs+reTCblIi8UQmzr9bqhgg
	SaJThKpiz8cHv2r56JSy8XRoM5nUy3MzK0+0LS1kUvJhBiU8yJj7fTLlZsbWGgjpwCsDwCHR1A7tY
	Erlc3HpM+sdP/OBeKpo5roMjZxc3GwYkRo02wfoOrtaHrInkmk6T3gexX0Zha33uY1ao6X/pu2mO4
	+bWLSDCFmNbFc/xBkCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQDC-000000039aM-1SCO;
	Mon, 26 Oct 2026 19:18:26 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQD2-000000039SP-16Zx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:17 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-2e940d5d2beso12856245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042294; x=1793647094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=i/lNyOyybVchHAjLbJse1YD4eIcEqXHFLGYp7lfj6UxLA3EublzNIfzTRD9CvuxrMn
         kE2Gz96YJqenO9ODMddWxbQMazWqWmgJsNrMP7LGO5puZk10ca+fXCIG3EDjzKq4ILLE
         8GJ0as+DuPLI9eL5Nz6Eo7F8Qys9sScLFiMfkbYn23mnMMt5sUe42lWhR7+rJTCYpZjD
         aAlbmJPbm3BxE9lT1B940nmtEyyckCGwGRe8jyRrAAC8WvMXpfE/pCzNR78/s5nGiVA+
         1lS048bLM0Dcm9Zcc9ekzTIfTCl6WhObieyxXdPg34yLYDGph3ZecuMX3mrmZ5orTVJr
         dc6w==
X-Forwarded-Encrypted: i=1; AKwUvByb3XZgVI3Y+gQELj+6IG2oBE6N6B/al4nhfYehl45DHzQ17aQxyV/UzquvhNBnXlFYxqFwGWF07F93n+Jsc8e7@lists.infradead.org
X-Gm-Message-State: AFq9FYIkxxfDvlJgXgHUXojYwAQhc5CRBmuZ8R74dx0jnRTkzuyXO4v4
	jvHbIIWgj+UgSKLVNpXPr1cDDSHnmIJerDqB5WPBjsGiMhCXS66DO3+FEzJUi9HxVy4zYJzePDR
	Q5tnQGavQ/LwVlExHbKAKSbr3tynX08PcXHegOx7wj0dEMSCxUq1M5XD8vN3ITfw9xtjlI9y2Vh
	EXRv0hIXVBhZvt466hv1oHsn6wUx/oN/gGGSrpguFGeD/ix/l0JqL++rIH+PnQbpiwTdxe0H0/A
	Qw3yLa7wZjc72TkgKon5Y321ZjxburT7FOOag==
X-Gm-Gg: AYBFou1jWr9CKKdyWLNa5UxmhzfXlpx0rYB8DaknDVBJD1nJuQGG+J7CveViMuCF1Z4
	McMzFkZRmJfR3qQBhJ9lxfuL1DFU6WpSaE8eETC7erj970ZEfR17dbzwMKlx3Pwseeb0syu4Xly
	06XE+FXJ3KL6Dew1Gb1R3/lgxqX8Byh7490Ohn4tWV3DuR6HvLkL8BlJl5pJS5V28AJXewF43p7
	NCMYrh3aU5MpwBKqQKduSFMRV9zz/ELILxyN5L2K/EoRc6eOpJsQF4/oXUhrOV/qmC6oqMubzQs
	WLzBebn57SabrDbAD2ATN7oBGJ++d2CfKYHz1X0osq4qa0oWI7gKjPDfiCcSTccPMID6rQ2a9/d
	xj1vqphaNcakNBhDcLFxFeDAn7lvFcKQmZFmmLxyBWSJXOSgjYOLtVrOSN7NnVXITqvBPsiKrSf
	1XfEAT5RGwq+aIeuRmgkhIVGyVDLCvVWcalR3vfWHVccc=
X-Received: by 2002:a17:903:37d0:b0:2e8:4f03:8a4 with SMTP id d9443c01a7336-2ea9c957addmr58886135ad.67.1793042293962;
        Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eae6cad1acsm27665ad.58.2026.10.26.12.18.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b861c0618so54659936d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042292; x=1793647092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=gFmjnNpK2tsiQEtAZUfehDLdp0Xhh/m8nSZYzVYNK3RP+5PXQE7KMFsnNkJP9e0YEZ
         KbbgqlLv+9MmrCnVJZbN/EeTgD3CD/xu1hZXdH/MECxBMmFqYweKagRDVkywpGt/Fjho
         6Qbcbqf0lnT3Ta5BvcTlUReVU8RBDQ3oaNkJ8=
X-Forwarded-Encrypted: i=1; AKwUvByJztEdERhUwnA4D2x7VV82rvB6AWPho3m+QvbuJrDjuF3Y3SDS2ly3UZwtxmtqekRsxJ47qNmSd/C7nR38jimt@lists.infradead.org
X-Received: by 2002:a05:6214:3c8e:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-91c48cd11edmr127063466d6.4.1793042292665;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
X-Received: by 2002:a05:6214:3c8e:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-91c48cd11edmr127062806d6.4.1793042292066;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 26 Oct 2026 12:16:16 -0700
Message-ID: <20261026191618.3178830-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121816_320288_D2AA8E68 
X-CRM114-Status: GOOD (  12.78  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0


