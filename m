Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C14606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fJHT+voO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEIcu3nY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=; b=fJHT+voO0xCufR7XqUJaRPZ981
	Z/xW2E6Bqabk2LetySV0zvZmXdOl1m9Iq+LDEOuU9MYRD3BT8VVYgNd4YmbwCOqVdzBfV3y8Fgrky
	o4de/CJ/iZ27n1O7vxT96adwOqMnBJ8SVf61G74Q161kp1WcHAr/TYECRR2McpAg6zEdTZPq9LoAX
	1f6X2dNKtqF30iF2ITbk94rezJ8n3pAYatzMKgpEnOlMtBe3YMYdIz5B2LUN4A4m4Y0RjZzhYB1O4
	I0ZJOwtDoxUNsAhoDSzK2AECdnE8TevzGaoO6t6mb4cBFSn6e1vB47Plh/Jcm38x9ikE9Zq/2IC8f
	Yt5p2EcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlyx-0000000Fhjy-2pNg;
	Mon, 02 Nov 2026 06:57:27 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlyv-0000000FhjU-1Gev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 06:57:26 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-369f33df08eso5389564eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 22:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602643; x=1794207443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
        b=OEIcu3nY727CrRZiCEeGfGXPqT3ZeuluOWTxvDCC6wv7MTRpfRTIbgYxFIyg6elmg5
         Q6STY4KZgsJli+w8v/S/M6/IjUK7nSukmouSRtjV8Jy4bt8axKyyVHBkJKzy91+VI9iA
         cm6vNXITjjuekyPjvgyTT+TtHVcJSimMXKondibAZIEnh2A/0RpHUFrjQ16FKS37ml2c
         XbVu86wd8J7H5jjrKtVX/o0Akz2Si96VsedGlIvZhV1Lc40bJNr4hlvUT1UOzCLnrJ3I
         AmEjV2jgNeyBZgh7ywVPGL0tQG9Fyz7yCo5yJ54+6kHDJ/ICa4QrKwW5XWgL+y/8KcB6
         dNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602643; x=1794207443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
        b=fmN6SeYx4xZ6PNzqB0TNYIkV1vc2HpgwaYGdKRWZVlms1mrJvDc69v5mpfNocFwHtc
         58eVc7NcN0aVqTJYU3znG5jsRxH0ZdQ+UczBZ8CNgPNq278+w/XLmUr2ztEEzeffWjC0
         NgAZwoulNUHdslup0illUWV3aFo9kPZX4zEnPAS0Lr0auCyMhyGV3A+AUGzFRkbOcL5O
         +zuJq253nn41oV8Y++iC8aYqN47oPP2pyzcxjmb3YXg9JMz4OFx4ldjExN8c0PB6UsN3
         yIy0s00N2jSBSsndfIfI0hkCgnT/5bAxG+A384KIJGJ6Ctx5u52dGOW7jFKldpZXVw42
         5hLw==
X-Forwarded-Encrypted: i=1; AKwUvBx0Cd4yA2h6E9RMrgBSsCt6V0+VagYB0fCyewOWanSwImgqWsnOqfP7+4n7C+t2ou6pdOrMoCTTG8qZPkHvUTSZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+V3/PNH6jhHfIJkExWK3xgq4lj9Ok/aFwCbM+iZVpje+TIhd1k
	M56YNwXaS60QNnKTBeolBkzirZ3EroC15u6zDPBkSrnwIMg+om1NhNmu
X-Gm-Gg: AYBFou3kZpYEWtnBs69mm9VLKe4Eyci/hNiFljr8sJO57CWr5K66EwymBKSKeEEnFWZ
	KXBjbYTwdYpC/qdWYdmj8JGdgvXTvADsodItD7PsXAjRfvQeEvR61n7xvcix9NY+awsdbJM6/Lb
	VHaq3GoQfCYGoM5J9t0UQQq71I61aos1RuI4fsc4ti/UWn0o5xzzxqx7ffjGvXT/k9met57/heA
	c+jhrKlsMIcTO4ezUqxIsXTT+kBlMKRxxtDVNq/aglYPR4VGWtA3dG7z8p/fL7Y1i8DWU3ipzXD
	hOhEgeiZUsoD5MNpIqeiZFUtqFmE93LMZ5ZxPKpGS9O4zsQPc5JnIGPMbIXJGj6fEG96h0BP1tI
	sJ/dhsmpqvGTFommgg7VL9CoKsxT0KXmBgcIdaCZo+2Je0ogEQVipUm9Sa4haFZ5tP96B2HGVhb
	X7hOOKBL5p4hRWJ5iUaSeMW3OmWUOgu9VE9jOlOHJsW+Mo/HlfxuweScUiJZL9JH482ZePUzjNf
	nhz7BmbTQEWZTKvrx2H1C2vdp9BHg3I8fHSXBuPNazw6Ajge1TQUnbs/6HPDxPLsszJVyGRKXv/
	JCtegD479LK9sR/GnNRgQM4O3SJ/kclVp6hBb8dwPs3XJ4Ih6jPqNtVLCH+15GsUBA==
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr12430597eec.38.1793602642851;
        Sun, 01 Nov 2026 22:57:22 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm29169317eec.4.2026.11.01.22.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:57:22 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH 0/2] Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 12:26:43 +0530
Message-Id: <20261102065645.121046-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_225725_354925_51886E08 
X-CRM114-Status: GOOD (  13.02  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds device tree support for the ADLINK LEC-iMX95
module on the I-Pi SMARC Plus carrier board.

The series includes:

- Add the ADLINK LEC-iMX95 compatible strings to the Freescale i.MX
  device tree binding.

- Add the common device tree description for the LEC-iMX95 module.

- Add the I-Pi SMARC Plus carrier board device tree.

- Add the new board DTB to the Freescale device tree Makefile.

The module device tree describes the onboard peripherals and interfaces,
while the carrier board device tree describes the carrier-specific
hardware connections.

The device tree has been compiled and validated using DT schema checks.

Hardware: ADLINK LEC-iMX95
Carrier board: I-Pi SMARC Plus
SoC: NXP i.MX95

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

Dinesh kumar v (2):
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 4 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1


