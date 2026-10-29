Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A3060A2604
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cOh2OnFQ;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NB4DG1V3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=; b=cOh2OnFQ1/DhGuGKIOS9u1OK4O
	WqX7g8VG2MYANgjdYNUXQ99nG3RGqPwSpavs1qCsJq2qaxvbZaPPOg/IYPGiyAHVZ1ZjHwRj/kdhH
	PI0HAZDBRxmcHZG34qpOZax5S56UmZkpDLJ/rVyVVFiyUZJgBVKi6ZjTLgQcxsFaPyGGtfU/jf6WT
	1wYxsSrsjmQ8P+zJ+D/zveySxSAtYgxS42s8rs73IUAw3WzW5OZhgIpD48MiVWbzRA35V/X9XhEiw
	MfMuXRtq66/CD4Oy2kHhf185KvZ4VszrStvKaffkgjUVMuivS7MgUYHn6uHCxcoN0NrQig0myC0Q6
	/Gsww48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXcp-0000000APTv-3wm6;
	Thu, 29 Oct 2026 21:25:31 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXcm-0000000APSl-0xhT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:29 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so5189a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309125; x=1793913925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
        b=I7NSDljOydP6U14J9KrH/SdgDWXxg8telPYfuAi/QaEeSWJk3dFozDTK0XdQHLZC67
         o4DSuiqGepI2YRDxVOHAb0vno5U9vKQyq0tPtb1RI85fnA04yjAPTnGfltH2I/pNCPvP
         MsPM6PQxdEy8fbQygurosemrnwJzHMzijcvLMTGKqodEzummuB4ABnLHgJEam2UMPtvL
         IzAVXA4J1ih3KpIBghJsHWZYiW4LvPdixKUjENGIn9uIYljEpFitQrt+UfWpgiZU0xcU
         KLI7QnKBjLaaT+hgZ0sniSmcqZamVYP50Wmgi0VvDpLYQ7knjmJoQ3yopGsWgONmwhzs
         AYOw==
X-Forwarded-Encrypted: i=1; AKwUvBz70/+k0vHcCXUlmM+Modwl0dRhd+vhEl7CZzayxTf5qQbR/t04S6jXAZwMj+FcmBdSlvI21MGxL5XK4QNyM56t@lists.infradead.org
X-Gm-Message-State: AFq9FYL8hulSX35PBEzDq6S8ox335XnhI74c6ppATQNd42Zf+9mv6MuX
	iREx9Giji3aoySzKMjGaaMtARyO0DIYiz1hKNWHpWljX0St1Wo1qZs22vBrz/OAADkr4I6xpCJ4
	4kFO4GwUrDegcyjIb3p0nXhwlQsiv0YyVUDJbVZfj4+xGB11ipXO/FzmI+ARPtZa8YkapT5XrdZ
	Yq1JegTQMAoXSxCkEuq4jhrKK40OsQiMoJRE0d/QXK/b3dnyQ1uumHGwiuc5M0JdVBFWEIkVkR3
	EdMt3FFIAo+hNLdcONI9mHd/vk38GSRhI6urA==
X-Gm-Gg: AYBFou065TKC8zqNseKPL4aOCn5/N4uQuelufZ4k6iylqCAdoq8QZGa8+TQv8jDJjlx
	FieU8vXeSnk4TKBYUMVx374ww7A/LFQ6tvWSEC34uNGU2nauZApoLItahzvQpToW575VUUJgfEJ
	medCEpT/5Lp2cYidFZg7Nr08uczB4oWHhroyzyohRJ8YEMgp2egHPJFwcw8oyHXa3BqNCMjN3fs
	w7P27GgMS+cCzHrLvMO9F/5/ZSxYBezQDYMxZVQfxWAnHDzfoOlr3DrVWcEEYzgr2ZaR5Vwf2oZ
	6eJjpsItWINq1OrLYLkyvHR3YzaHWfdTvBwo7j0oIeoRJodtLc6pEih7KL9nKUJC1mPvu6b8irQ
	lUEslUQ8Dy0L1FMTGPSxp3cC9b/10heIcRw7S4hN2QkUY3F4cCnB3ZtpwBBw6PCt+R0sX6/Nnsf
	69DubjmV+SGIQ6kss15JSkaHchCrImpdvFXIejspiB
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr217839a91.4.1793309125434;
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e84adc9sm2678128a91.5.2026.10.29.14.25.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bebff9fcaso1974406d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309124; x=1793913924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
        b=NB4DG1V3RR+1YIMILhqhOL8/qbtjiKipDYI2HsbZIJVhMUuIQ/AdveQj5/xzJxvjTG
         W4UemSx7Nm/KRhkCIQrG5RxKnUvTUOHA7ILVpGn7EagtcAHgxAE513HGVRyV5Q9c3eIb
         EzlcEE8XUJOWTVUOJckZvMV+JSB46yzEcWGbI=
X-Forwarded-Encrypted: i=1; AKwUvBzy9S9FEt7T0Uyn9PIqMX3Z/MUXkuG2atQNRhk2M1bMZDIXB9/fFVRFqZIya7g3zrM5QabLg+fuuL5VuIZz3xGV@lists.infradead.org
X-Received: by 2002:a05:6214:ca2:b0:91b:d948:c415 with SMTP id 6a1803df08f44-91ca4b78b78mr3774396d6.44.1793309124154;
        Thu, 29 Oct 2026 14:25:24 -0700 (PDT)
X-Received: by 2002:a05:6214:ca2:b0:91b:d948:c415 with SMTP id 6a1803df08f44-91ca4b78b78mr3774056d6.44.1793309123730;
        Thu, 29 Oct 2026 14:25:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:23 -0700 (PDT)
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
Subject: [PATCH v4 0/6] Fix SATA support for NSP SoCs
Date: Thu, 29 Oct 2026 14:25:07 -0700
Message-ID: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142528_296420_064DCF15 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Changes in v4:

- move entire allOf to the bottom, before "unevaluatedProperties" per
  Krzysztof's feedback

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

 .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |  7 ++-
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |  5 ++
 drivers/ata/ahci_brcm.c                       | 36 ++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +-
 5 files changed, 85 insertions(+), 25 deletions(-)

-- 
2.53.0


