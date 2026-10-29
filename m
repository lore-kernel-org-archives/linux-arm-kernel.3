Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MrmAYESo;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JPsQuEou
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=; b=MrmAYESoTWqsqh
	NwdIKedsXN0TfNX+HZOwqRfAIHriJP6i6NFXQiO/xq9L6xzo+F3b4cJIh4lgyKx2Oyc546yaL8IT1
	bKLGu7MGaBPOG7WA/MhF63MW2CGcZ/j6zX7uz5GjdQrSq4QdIrDKskIh+AHhdQSfl9lQ4BFKG/uZ7
	a7VXNnmSI6Y0aG9moK0Zfi5e94MPrJhODzEjeEX4CWz5lttY/CYnGy8FJwV8ZfRxqz00MD87aa6U1
	517eg7sHWTbpUu0nwAzkMCuDgfQ0/xh5cXtBfdZjz3egM52kdGRBRjejxr2SCk4rIIGYK+ytfsxF7
	i4mQHszRArv0NCLVwgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXdO-0000000APqg-0aK0;
	Thu, 29 Oct 2026 21:26:06 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXd0-0000000APZN-21of
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:43 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2e96502e447so639195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309141; x=1793913941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=VH1Bbkfyuc6MVSYeEIW47w62VvvK+THYvRvAkZywPx0cFd49t0TKScASsbTGDZzjYX
         lrdDYsjmAn5dI1siAs5/k8RvlKFoGyXX10Dc4Wc4w9VHUqHPrhQosDxwbPAsdVvwgO1v
         35oRaOXIjfEoxyDMxduC6XpLIEJAvpAvlicg5RkeDnheZW/tpqhFx9QfvpPz0NWU6IOj
         vrHhnlb6avD61tYdCYwDfuDyUsnVsJy07zLW8c9JZ/PqnioYWrqsEupaCHLSaTjf0gI3
         ZsE0eUsbDWAqOSEjzgC9qwcBCMAT8q+cQk0kpl47i+Wzv2zSW1CkU1JNtUtEq1PzOvsW
         0izw==
X-Forwarded-Encrypted: i=1; AKwUvBwA79vEL852BUPvgKpZivWan2jRjNky0AF7s2q71UYARhzMU21gu+ibhUwvd/gcHzTmLlUSoc2xB0mGiY2GW4We@lists.infradead.org
X-Gm-Message-State: AFq9FYIzz5RaaFhq8BO1NKdAdfTzydQKW7kbBGYbNN/uDTex9/aIK91v
	4A+A55PqUfPGtCBnZoBm8UXr5N8BtyEbuq8HHhESs5icVkr5vfKM8m4UZEspE+U8j09pGRbnb28
	FJmptwJu+6RXkGKpbOA5rYkrz7/c2cFDpeUb8qCgXK6zrOJf/CHDcG9FprE+eqAzZI+eJ04GOUl
	oK/HrdHZPh87l9cAKYjmRfv8JbirQYx7ceUPWA59u2eFFeMUSLzeE0zVk4L/djv4B3C1m3wQXvL
	a34DKbzShySzr9iYOP6NGpIzgjO+oMUw+riDg==
X-Gm-Gg: AYBFou3KzmClWrDtsro/VPYaME3wBO+bcuvJj2JQRKXPVxlhw8oAsXXU+stKMo4Tn4w
	4N2dC2UxkT3+6yejahNEargKlGy6hWFQ8T0mMdlV3kHysHFKPmByRPu/XDEChaVOM7cc3nwr7cc
	mpG/vYBm+LwyUUL5oNQysDohFIs1Zp324aRFQ88w9aHoVvFWMGB12eV+EWboKUTZdVM91RB4VCR
	sQtjSfxw7P0XKvUll0YS4KrcRKbslIysVHscFsepKGQMVDYNZ2OewIqipgY9EVn/5orJ0kefOvh
	mbrjHL2LXw5ECwpgmTysMHjCLxJHmQgg4VsQqce9eO8/v2jCTxjEXQSVkoZnko1xwaRzV1JU0NA
	Xp2/oR+hTWfKrhPKlEYpspN1YOQn1uobBJb+XYiiO9Udyo2ezirnzASaw7KShAlIQwAIVu+fOCG
	OJMrWudcU86z22xYXJdKWyoqoXzuJY4cV9bfj8H3kn
X-Received: by 2002:a17:903:384d:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2eb3651a2f8mr5833705ad.51.1793309141018;
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eb36949e46sm121165ad.35.2026.10.29.14.25.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c75523074so1868706d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309139; x=1793913939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=JPsQuEoucqBFG0fYMUKActWjXcnVOFRS63t7lzQlY4FlYdV54g6Tlcyk3xlhx4EkNL
         +HTyi5bF6haHFxjC2c5weRZn2Tn+CQFUY44ICOKqCA35qnl1cQL2CmDCwGnrGziL1D14
         wokMmlBYMl+muzeKdhev9VD6NMhvhvtVZzmkY=
X-Forwarded-Encrypted: i=1; AKwUvBx2Cf8ACN0XyaY6YHpwkz6MAwiud8yR2usq2yJm1T490+wL39P9AGgYfpC8/vijYh2Hj6Ry2GF2UVApGKyazH/L@lists.infradead.org
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr3372256d6.15.1793309138749;
        Thu, 29 Oct 2026 14:25:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr3371906d6.15.1793309138161;
        Thu, 29 Oct 2026 14:25:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
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
Subject: [PATCH v4 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Thu, 29 Oct 2026 14:25:12 -0700
Message-ID: <20261029212513.4126083-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142542_610521_D0FB7949 
X-CRM114-Status: GOOD (  12.43  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


