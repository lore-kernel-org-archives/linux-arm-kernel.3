Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D348606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zFUS6Ve3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GtjvBV6C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=; b=zFUS6Ve3eD9FlsvCbPblDHR0Yh
	1LqrWxwgRf1Wx0N0T0P5evszsf+hp+oUSMnyiiwIKtSrmFMftc1B/+K/N4+pLHRMw6BL0K/4PDEH/
	1Zn5J1szmQOEN8No12F08s8MNBqmvPxJlpe0RM+tikAd4pd6LXe2cU15sZomTv6n/BYlPv890Odf4
	xXV2rd8mL94JK/BhIML2qAzfNCDTWSO86pUgCcnQSCtRUZoDRtm+I7HzfIAX8VXYpRH5/2gwHsrXl
	2W6rhWtnVPewY0Uv/YkkQjbpEWa6YPQXnJxuxv5Ef8M903iV2mGBbrpGvfc0cUWuQqDNYuUYlGcXx
	GkvKyvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYBi-00000003iHI-2yhF;
	Tue, 27 Oct 2026 03:49:26 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYBf-00000003iGr-3JvI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:49:25 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36661f953e4so6843681eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 20:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072963; x=1793677763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
        b=GtjvBV6Cd0BkEkXsiGc92nwHGXs67HvI+Ofw6lnzxoKcD89tmJ5no4RLwMRJbkfKJR
         C/6v1r2fAaZ3FqhCk60hObJdkHexN1qFDrVxmm0p0n5UNMA7pvbIwu7nBQhNx5VMQQv8
         gKf4391ZnXHrkrHqejgvkhUzqHbbbNNLVth7lHXGrdiqGlgCisUYHsMpJoDWeWuimAIc
         dn/C7LZ8/0t4eqr//pdD+cOtszcN8l7hqsTf3InCBHA0bp7HgfIvsvinQWWEl+eTMR9g
         xKeM/0V0JdrrxFE4UkzFLrNaFGwG3JwoLev6M79RV/YXWEZPt7RAkHoW8pmsaMzQez/G
         hrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072963; x=1793677763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
        b=KL4O9abebwpsZldvPm+Q06LOqgu5UBtVbaDlbAOW4kgxm6fb5yRkptz0+OebydO/Jg
         iDTCmnwoV4CMecjThRTY+gPIUy+UdWEhK0qXCHqgvqdaYFITSzdeUzDgeQW/jODVddof
         qeaQKQ028V2V8b57qL1hGPUh5rctxdkepHfBleQxI35OnTsdMzcfex7DybFXgiHehdkz
         ldbLXKg7YiS7jNZkfzKzvPrnzKLOP5mcXQM0R49Kv1ZY0Ko0zUFWWuiV+H67uSBbja44
         /uq4Q41kbVJGaLjKtC/GfFkYkjZ4FO4WJkKr0oPVLG8FVFpvmsodAiob/zUM7ikr1K4b
         6S2A==
X-Forwarded-Encrypted: i=1; AKwUvBw4iUpVFN8v/v1BYafnZN4L21vlfQli0WA2fZ2z9ZdVt8J0nEcq0tqq4TbsGgtUN1lh92fU3Pzmlv5N7p+1apKA@lists.infradead.org
X-Gm-Message-State: AFq9FYKciRXnemi4fqBdY5dCOeODQHgrbkFSrt3hmbs/CnvJE9bwG6DP
	x+D/fqZZR6WZX6sL6CDRpqF8lU+LeBf/bBEuZRurzQGtMSA4Cvuc4qvY
X-Gm-Gg: AYBFou0iYDPHH7Dskz7ez0FyD5JKHI3aMEZp0WdYRlPaQDhl+c7jv0KZbb4XHz5aofa
	TXE+ir3VUbiIqgPmHyzthB6rPBXtpmfuACBD2EHPoathgKNragXn2bOaJnWmsGtROuNP5KNNBuJ
	EJwuQPUQdqUgmnU2gkukL65T/ydDy5t7U5RiH8onLX2rZ7Txt21xBFq03TCXHGhL0IiuHjoEVKy
	35n5N+9bnqVfzm0gTfsueK4vLWTJBp0m3b23bZrrR6fU+WLXC2uZ6BF19S64tmnD16Qb1Pd6s58
	v0/iL2o0belFZjW0B08hiL3Qel7gUxNIggBi0JlgYr3kBfV0w1+1ZXZU5fcY3mPIkaVy2YAgqCb
	gbIItHsCbMYZXe0HNvrlliGHJMol4m6Fj/DApuWd0cd4Cv4Ahtk13pJu7167zfdcxqAPbGBkl7J
	KBpkbOqVCMVrm3RT5osYddJ2FIEDEHaNGVi6xQXF4Poq358btVLVa9CqzE/YAxvtwLk38+yuCmd
	Ns8KT7E1Ons3jrz4NeIg9oXmlg/LjtdzTmDexftyqhatMtBOX3XZN8pJmkbKopdcwyLgY177xh3
	bEmVeE/ljTmu3HIv6xYkU/GefGlBDaXp4dxlWrpxQxzh
X-Received: by 2002:a05:7022:f511:b0:1a0:5c85:d1b3 with SMTP id a92af1059eb24-1a05c85e6damr7103884c88.43.1793072962440;
        Mon, 26 Oct 2026 20:49:22 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:22 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:09 +0530
Message-ID: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_204923_833951_02951D19 
X-CRM114-Status: GOOD (  13.44  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the ASRock Rack B650D4U BMC, based on the ASPEED
AST2600. The series adds the board compatible and describes memory,
SPI NOR partitions, UART5, GPIO line names, GFX memory, the I2C7
EEPROM, and MAC0 with its RTL8211F PHY.

Enable both ADC engines with 2.5 V internal references and expose
all sixteen channels through an IIO-to-hwmon bridge. The channel
order is ADC0 channels 0-7 followed by ADC1 channels 0-7.

Changes since v8:
- Enable ADC0 and ADC1 with their reference settings and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.

The other board descriptions from v8 are retained. Andrew Lunn's
Reviewed-by tag remains scoped to the MAC0 and MDIO nodes only.
Fan/PWM support and BMC-ready GPIO policy are outside this series.

Base: aspeed/arm/dt in the BMC maintainer tree
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
Base commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030

Validation:
- Compiled the board DTB with aspeed_g5_defconfig using
  arm-linux-gnueabi-gcc.
- Ran dt_binding_check for arm/aspeed/aspeed.yaml using dtschema
  2026.9, with no diagnostics reported.
- Ran CHECK_DTBS=y for the board DTB. No board-specific errors were
  reported. Two unmatched-schema diagnostics remain for inherited
  aspeed,ast2600-lhc and aspeed,ast2600-i3c-global nodes.

Hardware testing used the same ADC node configuration in a locally
patched OpenBMC image based on Linux 6.18.24. Both engines and the
IIO bridge were available; twelve configured voltage rails returned
readings, including standby rails with the host off. Voltage readings
also recovered after a BMC restart with the host reported on.

The complete DTS on this upstream base has not been boot-tested.
The tested OpenBMC image uses a different flash layout and separate
local power-control and sensor-discovery changes. Consequently, that
image is not a directly reproducible build of this upstream series.
Voltage scaling and sensor publication are userspace configuration
and are not included in these kernel patches.

The patches can be applied with git am on the base above. Anyone
boot-testing them should first adapt their image and bootloader to
the described flash layout; the DTB alone is not a flashable image.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3


