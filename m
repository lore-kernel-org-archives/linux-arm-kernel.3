Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3E606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Jbnozhw;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EBaGc+D3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=; b=4JbnozhwHt79XKTfHLezJ91GBY
	hTKUCai4FRkGzWW5TrXMFGz29B2gCOOoAgwkaBK2I9zhmRDruRutyA0kUwF99DZEPThzj5km3Xdbu
	h61FRS+ZXm67V/TQ7N0Hf6qsBgEmTJmFvi9NGFBB6hHjg6GL7k4c63WD/o49gA/Yhh2Jvrbv35OXX
	ayx4ZFzeTKbFkiiXFbHUJzmJM43LM0Qw3A4qgoMye0ytR23naIJ6gXGRZqv0vrIwbLcZb+lkM0MKu
	IlZQIVi2QT37x6tSMi+SgLzY+dU8sQqMF+HlaV9iUxosfoONu+j8TVzLurQmNXI0A1EXVQ2qeoi7S
	pI+F3rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCt-000000039Lu-0tDx;
	Mon, 26 Oct 2026 19:18:07 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCq-000000039Kt-2EJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:05 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cd69954c755so2255879a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042283; x=1793647083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
        b=GQyalfxkNgCKi3XPpt1AcUeKPtmu3WY/0cK3ajnDv1e85VttwVP3nKg9AnF88t2Zna
         AYS4Dtqx9YonP2agAg173APtcDtWeIj4xk1wLgO3eXQ8zHGQpKUhfaLsQjZVQ7SNFX9Z
         T3fMsyYV3FWYinuyKS+HGgPxJ5MkzL5u78wMw5+5ymYj+txYy8TkqU7zJ8rYfmDlkBwe
         ZVv7ZyZnlk3uSs9NVfuNRe+CTF+y/FYO1RObRujb2z4pulxI2hLjg/WHxFEIcLuE9nzh
         PL1CideMeTsmeott5yheT4UxcSlmQxOgcWVG85L0H2uHZs41xGpi1AHPTWC0JECb6r25
         Wwgg==
X-Forwarded-Encrypted: i=1; AKwUvBwZgTsjLOfNDsIQ/syE/NOPaOa8/MIysxRO+fdzC1VGRMv3fl60ZpwpwvrOang71FBGtlcd9LN/KlU5rM8SLJ1q@lists.infradead.org
X-Gm-Message-State: AFq9FYI5UwUnGor6xgYOpsaujhpeZsuqjdZCZWUxSsaYtuz1KipBZQdo
	JZHo2/cYF3N4f9et3TO5CqSY2k/Ii+/TPUdB/kJFXXAModb+8y86ylyxLYKBs4zy3WBXFSjuEPX
	RdBUHKtKmSGmeCiHjxxyiLxIbJhRWlyB/TBdmyOQHSHJN8b1XDx7BcGrdBrUWFq33ZdtIrkC2gI
	qbmPNADKKeHQO2L5SPRYyL9a6n6R5ykTU3e7LcZKMO/X7SwhB0D7Dxw1chcpyvdHRIW9SWIetUN
	Qr/Pl+BRW0hvf7QQi/CkX/2tvt8f0gux7zjCw==
X-Gm-Gg: AYBFou2ST6ddZrx4TdM54jlbwdXvXBMrFhvzDZOmE3fKxpq3Js5dL0QhrR/5ICMcJjK
	Fes5kiNrUbcjodte8BDOOISUc5oxyPbzJHMWOLeGQ98/oV9weBP+KyDh6NhjW9wesSKS0iSfMsP
	VsRDZEseYNOrHhynMXxneAURdLlQnhopbllOnJDDTbZHOmfcz5jA16Pn/7rtT238itGxmRK4aK5
	Nbx5EqAPuAqSeArlawXARptZ+8Vn/9HgAF4D/qFf3wkh1pibONiCvsCGuoL/15XDcSpFpk/coSa
	a+hszhjhHdoVFF/5lsRcjG6s/Wn/3JPUuvf+xsiiJ/dtOZ2pjWYcWDnEvBOCmaMJXToCOWbExeL
	lJTana2Qu5o3qxpJOGuReStxfSTup1JeYfHZgJEmvl8xoT4yFwkZyuP3fDG4ehlGp/km3BnHien
	MqIC54pWlNvdLs+xxuEmgzMVEJly7jC9KeX4WC34yJ
X-Received: by 2002:a17:90b:6c7:b0:3ac:9d26:551d with SMTP id 98e67ed59e1d1-3adeb10f4cfmr6380532a91.50.1793042282804;
        Mon, 26 Oct 2026 12:18:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dbad7sm333637a91.2.2026.10.26.12.18.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9195c59ac8cso65855806d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042282; x=1793647082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
        b=EBaGc+D3rN+34hiuBVAaNMh9LtXXWnLZ2YFqYEp4yj5FJageb3nsBbyHG9L/ChT28P
         f/nPKvM1e0egKmE+OW2NHJjLFGzI72Z2y6XSPZXPI91/TAXvyXqSaxJTAE08ny/HCiQa
         PhFH56xrDMirRKUyfs59fnL95quTGRF+tDe9A=
X-Forwarded-Encrypted: i=1; AKwUvBzbgXwL/EHKHN2SfByQWjCCLnyf5GnWaisT41ttLIqqVz3ydDPqrRnzyeCxquilWg6R3YEiWoBcIZWop35v7Qyq@lists.infradead.org
X-Received: by 2002:ac8:5f82:0:b0:536:11c5:1dc1 with SMTP id d75a77b69052e-5383b653983mr109739611cf.76.1793042281632;
        Mon, 26 Oct 2026 12:18:01 -0700 (PDT)
X-Received: by 2002:ac8:5f82:0:b0:536:11c5:1dc1 with SMTP id d75a77b69052e-5383b653983mr109739171cf.76.1793042281166;
        Mon, 26 Oct 2026 12:18:01 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:00 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Fix SATA support for NSP SoCs
Date: Mon, 26 Oct 2026 12:16:12 -0700
Message-ID: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121804_577678_09EE131F 
X-CRM114-Status: GOOD (  13.77  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
which was broken due to a number of things:

- the SATA PHY assumed separate PCB windows when a shared one is used
  for this generation of SoCs
- the clock/reset (IDM) was not being configured by the driver which
  meant that depending upon what the boot loader did, or did not, we
  could have had the AHCI controller still in reset by then
- on some reference boards, the AHCI controller is not DMA coherent,
  assuming so leads to all sorts of timeouts, data corruption, etc.

Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
keen on having Damien merge all of those via his tree if acceptable by
the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Thanks!

Changes in v3:

- actually submit the addressed feedback

Changes in v2:

- addressed Damien's comment: comment line too long, imbalanced IDM call
  sequence in suspend/resume compared to probe

Florian Fainelli (6):
  phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
  dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
  ata: ahci_brcm: Initialize the NSP interface clock and reset
  ARM: dts: broadcom: Add the NSP SATA IDM registers
  ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
  ARM: dts: broadcom: Enable SATA on BCM958625HR

 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++-
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |  7 ++--
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |  5 +++
 drivers/ata/ahci_brcm.c                       | 36 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +--
 5 files changed, 67 insertions(+), 6 deletions(-)

-- 
2.53.0


