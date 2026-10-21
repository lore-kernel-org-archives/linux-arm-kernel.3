Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA92606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gEVLkSqJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KT/cScKc;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=UJMM4Kzc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCYl/cG9mX38DVQ9PrBsJRE3D7JHxtZQpczintLIVfc=; b=gEVLkSqJgnDWjbB1hjvK5iWu7s
	P0646HDohIDqGnJD3LvSHCv4NlS5IKnJaGl2j1lPxG1E/rxq4RkaBF2yBJ2xtWhC0ohG4M7nqi3Gy
	2W0Y6j8C9+gvioXy4FI+u1sFkARLutHWwcH7Okm6/hUGsI4FtPdeAKkU0y4RLGuszkZTv+VCe4mnf
	33ZPBCOhSghyaW2cKTqqRNSGFDmMfJlUnpfdkENHx2ae4Ydi+2K34h+UXQT3zAtUvOzfcv6sGy7cC
	oHDhFzyDyy3gPMrdBBI7Tcw4/iuIUQmph3aHhuIRNX60zM0/h/wjJzWNQmIIUCXL5blFFLTHBUIp4
	nJYgWXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZc3-0000000CUfw-153o;
	Wed, 21 Oct 2026 16:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZbh-0000000CUUc-0rja;
	Wed, 21 Oct 2026 16:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vCYl/cG9mX38DVQ9PrBsJRE3D7JHxtZQpczintLIVfc=; b=KT/cScKcSBB+p/peUPbmG+Bpv4
	1tvjmMN3MTqZ18XJKaRzdSHwmgGPck6ecrHMMSdJxFSKoLi6OIUnlPTk5ZRamzBZZ46tYnHdmu3A6
	D2npblh3qocHnF7uiQPXPXxsGQfxF8gdY+ZkAAO2HyvOkwamg7t/8E8p0Pzvi2yCB/eJWZGpN9lno
	PbLrcKyUb59kVk78Rh7eSgkATg266SnDvrEBR46oX/woWlRzJQHJl2hkRbBqo+Ou5edSjMF2zHz+1
	grYO/6fu4YKC6hvEzVySxxmnr5lIaRu0dtxRQHemWXmvO9L0Qc+nuRIM6cobShGOKJoHSDUOGqB2T
	6Dk9dzOA==;
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJZbe-000000062tc-0yCW;
	Wed, 21 Oct 2026 16:56:04 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5EDCCC0000E4;
	Wed, 21 Oct 2026 09:55:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5EDCCC0000E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792601758;
	bh=AjIbc+URFeF2b/ujubFUnYivbl6fayG3tnEmJ0uSfys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJMM4KzcKDBfnLZzk6Kii5ri3Pfnz4lE2ofyzcP4XPweStUUapd76sDXDhgzpflJZ
	 q+/tJPCD+tLF/afHDtl1ExCi86DUgn/odnIi+0tVCOj5R5T8tCoqjrO6wFDJlxiXC+
	 uWq/SJOFmtqdK5jsRkSReempvrlOIdlAGVn9q8Ek=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2DCE4A8A;
	Wed, 21 Oct 2026 09:55:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
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
	linux-kernel@vger.kernel.org (open list),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH 5/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Wed, 21 Oct 2026 09:55:52 -0700
Message-ID: <20261021165555.652102-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021165555.652102-1-florian.fainelli@broadcom.com>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_175602_479617_55AF436C 
X-CRM114-Status: GOOD (  11.97  )
X-Spam-Score: -2.8 (--)
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

Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
remain enabled, but the disabled controller leaves the eSATA ports
unavailable.

With explicit IDM clock/reset setup and the corrected shared PHY
register aperture in place, enable the controller on BCM958625HR.

This enablement has been build and schema checked. Cold-boot and eSATA
I/O validation on HR hardware are still required to establish whether
the original hang is resolved.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..3e86f3c2593a 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	status = "okay";
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0


