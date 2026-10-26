Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oHfkl56r;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OF30xOfj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=; b=oHfkl56r5M1I2G
	gnDFxXbIcZY4hrN6dwODTuU2RRyGvcZBFimIoLp1DWCyyStWj3ToMAaPooYOd6J3cjn6iMHUIC7mg
	r3MeKQE+4DLH2v205n0QnnbukD2xtuHhD429T8egGC95EOfGJN0QV3tN1H5cdYMd6xLjqSedNLTak
	1EBd216+fJlOVUkVWtZFSI7Ud8KCOR+JZFzc1s0bRV9A2lGF0ekgTaC9sjSPc0ha21o5MaXa0edfY
	Jyd4tarNyGcOFeX2mCDpVGBcmRDUyDLqTUkwbL8mSZrvv9/tEd3BEHoyBxAq1l49ZU/rxOLwWOt9g
	jDGY91xakdM/ZBFsNw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPSF-000000034nX-2KKn;
	Mon, 26 Oct 2026 18:29:55 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRx-000000034b4-1T4u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:38 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1881509a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039377; x=1793644177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=kAnfEOW8dKFJIHT4EcsZ7mDBh0a8OsA+yjx3TJE4iEKlkJTRD55VveH5dGVKL4WZvE
         AeVbL+tsTMcSX+0yz2lnvVAYg7JKIc8WTvz45zXvRlorb03y8YhAt83OegjUwrraRLFY
         HKbAkGcZJ25WcNdhFp3qcLRiHnAbo6+VCcqn8kjMQX73+WzOzsjlX7JYyHaURrV3AGiX
         uOjjohCGqU6R3p+pXJ+mvrf5iK3snDudJbGG/sGM7ER/WXDezydVIZuG5aDtOYUj2L17
         35yubfd9M+gKU72DMqT1Z5nFjYva3w1+6x5YAlToDHf65NOrTEbQ3jVJm8bZYKQ45XwE
         lPVg==
X-Forwarded-Encrypted: i=1; AKwUvBzm8ASFMTFC7zWdHP3nhKSIEdvV2IX+jGLg+s4tHNcNj23hTTEK1Pv9jiByDbS+h5STpDKLcFnp80r56qhB549i@lists.infradead.org
X-Gm-Message-State: AFq9FYJE+UTvdCYEmRPkwjEN/rgMBYtL/1+CRPLQ2vZ1xxJpc3jDMIpw
	lIGyrSi622F0Cnhv2R3EqDheR1TBggS2SWuDYzMnTtBFAMXlVqAiUYmTeepEM9nMPEfOeN/MpnU
	mv2SJXves1lQ2bKrlsqy3+vCrLtTeDIQgzfvq8saohLkscIWMeUayBfLOXoE1nflcZkZeuhfd8W
	Fi2FxTQXIA7lKOwIfBJmtyzr72+yHWhYCqhwPVJ3dtWdjA7QFP1ML8f72FobBZ76sHspJGBDaQS
	akUZPSpdK0sEZdmXuWUdFg4lrTUBX/AW270Cg==
X-Gm-Gg: AYBFou23qMy+FM5OUD3DEqih6A+Im1Attj2CmyHy6pObnKzvEaC9adoYaRYyxViLO0T
	hc1BVuQ4YWg4XwXQul/+97x5/WlsCkiWcyi/D77qOzII6plBrzkN0KLvB7R4bA8dE1gvQY0zg/U
	p32v0W86/P4vPntq1RkLFiFPryJoM4cK4We4my6RV4F+YdI1NkdlUgmIebuycPVw1LUVcZPpRd2
	SGtrE0JuYtIFHkluX5ipInlgqZqRSNtgE7ELg9oe2i0GSvYD3lqMgyO03n3DTyDnBeUXa7KduQy
	qB8x/O60KOC7hLdeU0F+oYYSdO+hfXW1atXyFF6FXYLmqWENVcw6C1If4dxoOHzdN/dCXVopP3H
	uhFgPEyR5Nms7fs1+2Ywsfc92dgc7otqqVUOIVYOtwRyQefBtZFMSr60atSq7Rhs7L4Iwr5TDjf
	GE7gua+GJwKA42FH2ZpipLqfV6L3Py7tsf/buGkZrT
X-Received: by 2002:a17:90b:1b01:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3adead249fcmr6478304a91.29.1793039376621;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4063d1e9sm261143a91.7.2026.10.26.11.29.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3692c5b061bso16945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039375; x=1793644175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=OF30xOfjK68hVmlUCp2F7myTbxMjQ/dycS1GOivEz4cpKsVwb8ToQ6TZEGSzHKHSej
         BLLEaVKjtXWSJCELeAu7YQg+/v4EgtsRW33VGSQKD0ZqXOCeh0Um81rapM4EJ6kY1Kbm
         FYVX6fr57Q9Ut/XYb20RtN0S5WqpkPA/UtHXg=
X-Forwarded-Encrypted: i=1; AKwUvBzbCPviGdR83LrgAWaj3qNwij5XngLc6CqIFTujYcv72sVhvHEXZ1XgXl0uuFhpjmPjslOkA/IF8mEInGluYbxf@lists.infradead.org
X-Received: by 2002:a05:7301:6189:20b0:369:f291:49da with SMTP id 5a478bee46e88-369f2914cd0mr8027365eec.40.1793039374741;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
X-Received: by 2002:a05:7301:6189:20b0:369:f291:49da with SMTP id 5a478bee46e88-369f2914cd0mr8027323eec.40.1793039374121;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 26 Oct 2026 11:28:55 -0700
Message-ID: <20261026182856.3168686-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_112937_440817_09A49998 
X-CRM114-Status: GOOD (  12.73  )
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

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0


