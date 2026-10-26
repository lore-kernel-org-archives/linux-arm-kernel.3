Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A20606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KfSgX+nY;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qb+u9r8N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=; b=KfSgX+nYJRq2lcScuAnJZTgmFO
	6HDRJDyNkr8ZJ+nDHLdUPD+Qq+zK9RnaBzD2iPfp8elTJKByrsdCIj014Z9s4SDcIlDsHWS0U9Ksi
	ToQcessVPsWK7R5GzFLJ7iT6CV0BJiThKu72Kd+q9hn4DdLxpm6/wjHSzBrWbGsHnffckEy0UB6/+
	EMFB0KM3G8le4IpOpB6Y+ghYBAiLMMz0Ng/uPYVA+WdoKEiwIEUv3biT49gvxcWcJiKj6HIkeDEWt
	17a9Jzf48vv1JPKhaEfZdhSPVatMlfjQQWiuOA89/6gvOYWday5AU8XFx/wxUCCQyZ/KSj6CsPVub
	fI24BLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRq-000000034T7-1DDP;
	Mon, 26 Oct 2026 18:29:30 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRn-000000034Rs-13D0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:28 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2222635a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039365; x=1793644165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
        b=xwV9m2tNhhpJjIE1WKTIsqmKs81+If2jKI1B+1Mg1Gw0DdtvLi7084PufaNf9O5Wci
         klb/Zxncu/lYW/xqastZ1HN0TSh/vQPaurtWPyxmaWNhSq0eNvnOTILWQZut8dTt9PY6
         3fOJDiSvwk8WbJTX3YiPw2K1n8qtPMNLZ9cz84rPn2JsVnU4uL+7ASLyYwyy5rtiiJoW
         W/onhUV8E//tge9JyRxmfPaAhbnG4yQAqR45lfpjl3az/e7L8ZHFijjlj37Y3JUO6YnZ
         fSTt3t5K1klnduiChXQCUBKrabQkiwA3ySzuO/cq2zTq40Zxrl2/N2kWr3Q12Pec8K5e
         h2TQ==
X-Forwarded-Encrypted: i=1; AKwUvByeKZwM369muAI9sYHAZdgDRubG99Vcp5IZZYcUcK78Ddgr2BdfgAdTpuOFMlcKJRYKKcogFxYmTUk3aWiSazL2@lists.infradead.org
X-Gm-Message-State: AFq9FYKLjMS1UHhzWRa1FK0ZiuIVYxOIhFrdS5DaX8nbbzLnzXKtwo2r
	VlmcPdUw1elAcANrsKjU34d3T5uSly5nYtw54slal1b9S2vAFhOe2OYRfPkQTaTjt6++IbuqzUc
	G8QGP89Vy19V+WbbkLYx16SWVrEFtvgqKir+I8cmDKBybsLd8x4bSwTF+kaSSqlVFZXsxsVT0gV
	vshCnt2ol2FNvNpJwajj5sBuoYpHGEwbzpZWgXWHQvZT8wX191s64wHLDPgj+T0bRTD0Ml6DnHP
	sKGcJBso3eodvhJJDOqHPNEBg75x/8DO2I=
X-Gm-Gg: AYBFou012LtnKnNiGBc4VUu7b+vKmRA8W+11Olw8qlXdegCcJYYKjiwu7QEr0RD/fEW
	J7/Bo3ymCMERvuSU9iymngNHgP2lZNr3ArQMpJ2Oz9PnCFmbjNe3siwV9b1x/WuWhzYjTKbNmWH
	Y4wRA+W2lMjfcjwby3AKAc0flgJkMYweWoqAAyDdlCn8cajU9UofSoGkDYg9C0ZXsB8iYYlhBiq
	gIgz2ro4iG6SND0TvCWITTBxS6eBJkwGrYm5jg+wXmkUUQxT44amNnT8/u6It6c5nRvUcwbw7oQ
	moBxofwV6V36sfF8OUTO9NocOuRtqTT//uyHV1b5UbML8MbGyqHM+rfKj5Lm96ISiYy3aBIfkql
	cO1YSLk3RG4mV3l3qQg6fdnVGt6ywgsSGCB73cu4qA/MkmfGWOAl+Y773nxBW4IiFVI+vpy+Dql
	RKQ+iUS55ZuBhNpPZ5X4yKO2edELZ+jGcyniUxP6Go
X-Received: by 2002:a17:90b:224a:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3adeaae8d12mr6061460a91.28.1793039365424;
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adeba45ee7sm3128878a91.1.2026.10.26.11.29.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so9419268eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039364; x=1793644164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
        b=Qb+u9r8NPZrbCbXXaWenb+fDPXPusa4RzKBNVWFkYCIFbaolJVoJ6aF0bi3f8EgsNT
         +k+/qhYcodJikmkfHMWo5JYINrRRBhJkKYWItMNkLm49Klaejnfj2UCkyT2PoimnNuvu
         t3xPtdP9pea7t6gsx+n0tmQT4xVcSTwVGlrls=
X-Forwarded-Encrypted: i=1; AKwUvBzp2QKus4SfsLJM7oG8OKSwik/HImK/zoXTm3O6jk14dD5II2QkvqwQdHSAnfhOTbAsepBYpgs+rniLaykx5BxC@lists.infradead.org
X-Received: by 2002:a05:693c:8943:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-369e84c7e51mr11553940eec.34.1793039363627;
        Mon, 26 Oct 2026 11:29:23 -0700 (PDT)
X-Received: by 2002:a05:693c:8943:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-369e84c7e51mr11553896eec.34.1793039362799;
        Mon, 26 Oct 2026 11:29:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:22 -0700 (PDT)
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
Subject: [PATCH v2 0/6] Fix SATA support for NSP SoCs
Date: Mon, 26 Oct 2026 11:28:50 -0700
Message-ID: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_112927_315946_A672771C 
X-CRM114-Status: GOOD (  13.81  )
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
 drivers/ata/ahci_brcm.c                       | 34 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +--
 5 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.53.0


