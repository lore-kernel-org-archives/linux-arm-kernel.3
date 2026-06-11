Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DB7CD98D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Mj84MHRpXBohUBJnwrZGqmrt19z2ndsx48TqvGHQGY=; b=4Kexo4hxlyx4Mr
	eRf+Lg9+73ei2d5m4OR5kNFb77pGxMGNR2UTEyep1f2W/FX2cxlGaJnij1aFbBxj71rn/bl0Olg/E
	a4/19aXP3dkEICzpfgp0wo66jIPrq/54nnbrF1s26PiVhORM1ITIeEmYY5NVsPn/cfQx3ye+rtD27
	UodM1O0MJy2ets6fIS1ZdWlJr4TqtkKHCPlIb7GJIGGon6hz0NXEOEYDz0FN8FoJyg17cUos39Pln
	v+nlMu2vNDulAPFNO4Z/FjKm5q0cwFmoQw/oinXleAsL50+3JA6PyPZWGblSsP5F1zmXmwZigdloj
	hSeDtpqSQiOmGQMnVMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbLm-000000095NA-2Rfp;
	Thu, 11 Jun 2026 09:05:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbLk-000000095Mi-1ors
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:05:21 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8419ab3a297so3459698b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168719; x=1781773519; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mj84MHRpXBohUBJnwrZGqmrt19z2ndsx48TqvGHQGY=;
        b=Aour8iE0XEy1RqpiqR5A3cPTU2wyp10avhRyFPvoUSYRX5aH8MXvw4ypaMkMi7oTGH
         NkErGcdzWwiCC1hnTAWIbpuKrDh2a67PNkvlumJzjmVYL1c93S8u/nQTV76/GooCxf8e
         5vfMWMSOTvtg3gXm7A0TUjI++j/vsInW0hDSBcK6ETrBtuaaEN9hYCX0V2ZZ5/wjuRZL
         uZxikxCQCcCK0uVRn+jrer72ik93xkMOKp1h7TwQExPxYMy6auuXxcR93quyLSF4AGoE
         DeO+hKQER6cOaK7OB3jw+rk8NtokWZ3pj01y7yyk/DO7K2ILQVweiEuThH4JwiJdxrce
         dHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168719; x=1781773519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Mj84MHRpXBohUBJnwrZGqmrt19z2ndsx48TqvGHQGY=;
        b=l9LBjSVlHk3FyIMZ6EDyWVWiwhNLd585fBzO3ENE31ZTPWd4zUio4uHb0T4lf86b6p
         r7apBaYH7SieA6XO+W3EYSmx3KvB929j4hGZ+ni9F04mdc7xKxb3cecLUKcF9XCYInUD
         nvgsFTbrXYq04BFGrY6yW+sScSeY80crLSukBOsciP5/ix4XVUAR/xSAWfYw5CrK3baO
         8xI+vQLmznJrDV4q4WCjYtzk8YCTPL1Dj5QYuWTQFNJ0EP4g+/PTrxQinNcjhbz3dk7i
         nZ/Bi0w3Ml+h7ikg/w0oNLHu+piQqd2G58cXCljOZta6b3De10rLJnRmytS5SYsHpA4A
         JgyA==
X-Forwarded-Encrypted: i=1; AFNElJ96qw4Y/T8j/75Pa59kbK0D7GdDbDAZ6qX60aHg7uvbLi4sDrDwytRAqpmoFXVETeZ6gcrYKnPkwqb5AhaLr5do@lists.infradead.org
X-Gm-Message-State: AOJu0YzitnO8IiAVDLIRZvQWophiNKsSDPp77KRhsUtzeZjuIb/pOgH/
	Wc7bMOLQBrOP8Q5i6gCRQ2aPX/Z38PkB5C3Uof34hl9MUqbMGJykDGP3
X-Gm-Gg: Acq92OGQxu+63AwO2ax2v18llyPWuH+QeFOSOhgYxdKq6ThCS+J83h3whhh4LiW+Kca
	AiHbLaAfri3qNOe5RaCfSxuMGU4EAdFHCLN5q3rL3HYn9a1ne/H5hpe4+3VXZRT8o8FrtgEYwwf
	iTPvDnKmecgFHMSlsE7+zcMCm8uUaT9ld/GD4cf5RsAu8oEQoRk4IdZFuUxc1Vk73ID5yi1Uhxg
	dPy1PulHbws5P2UCLXmq6hYwpHI2tphNkKMGtRAgZpjojqe/AYW+PEasvRFsXYXepLGotGF46YU
	dLQYU6/NOe7n8yfP1rh8ir9FWc1Ur1bpr4RfQ+9PBpVqz4DY1lHofPhNZjhxfKpyi8X7QE0OgxJ
	1n3X1oQaTX2ewrVpg9WDR14s2m4JEtUsaKcazVoH5ilPbTNfXUIJLBHEkCesuL4XIA/Qbqa3d+J
	fhSj0F6KdoJOC4jM67GyIlgU+YRlH/ELtLjX4EPmE1V+Yk40u9ZA4KjX2TY19NYuIoQ8qg9i1kW
	g==
X-Received: by 2002:a05:6a00:3923:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-843367fac80mr2183974b3a.15.1781168719266;
        Thu, 11 Jun 2026 02:05:19 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8f8f5sm1456306b3a.5.2026.06.11.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:05:18 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v7 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Thu, 11 Jun 2026 17:06:52 +0800
Message-Id: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKx6KmoC/4XO22rDMAyA4Vcpvl6GfJKTXe09xih2LLeGNhlOZ
 jZK3n1uYDRkmF3+An3SjU2UIk3s5XBjiXKc4jiUME8H1p/tcKIm+tJMgNBcCNFkGubPZMUxDnG
 O9nL089R00DkpjPGImpXVj0Qhfq3s23vpc5zmMX2vVzK/T/8BM2+g4QGQI/amtfL1dLXx8tyPV
 3YHs9giqoKIggTeSWe1V2D+IPIXQeBcVhBZEOFd8BatdsrsEfVAVPUTVZAW0AGQVZKrPaIfCEJ
 bQXRBpCHSrg+6dbhHcINwqCC4Itq31HlDLmyRZVl+AFvMVCwRAgAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=BWMEDVmRB9JbQvI3sny8iiY3wE+9xE1sfKpPw+QYZ2g=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKnqvh2zpBy6ioUsMjhQQ/gemnH1NixS0Vhlbn
 xtGQw885NaJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaip6rwAKCRClg0K3CVbE
 gX52B/47PPYv7zShvvHHybO0MT9Nhdz+03SiBForwG1BKHKqGZBOn0tuWkAWgq69eTU4u34zFLo
 xFrbWNBLo03BtOi1GjhQUK6Lpe6uhoNww8ppssf9N3PGXck0PtkjDl/kg9bdmZENALVhp6eCVSX
 XzQr9E5YKmJIOwvEbvIz3nDn8HThBj5DIQ3UsDa8i7h+DeQ8nkqPgPwBXS5Wc5kYZrkdwxjGv/y
 pCF504ZBITKVvNjUo6sRb+Cn9HBO4OviJibv4yAGYEAV4QW/71Fy34yFx571sa4AWsfQRIzp7Nr
 qqHA/ZB7l8u57JjWy0HiIgMOORgDpPvMyXy99cbHHhfV1aJV
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_020520_482979_37E14930 
X-CRM114-Status: GOOD (  12.64  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v7:
- Updated the commit message to include a detailed description of the Ventura2 platform's purpose and its key hardware features.
- Fix comments from Andrew Jeffery:
  * Ensured consistent blank lines to separate child nodes from parent properties and from each other throughout the DTS.
  * Sorted fan nodes in ascending order.
  * Replaced '//' comments with '/* */' block comments.
- Fix feedback from Sashiko AI:
  * Added 'idle-state = <6>;' to the PCA9548 mux on i2c4. 
- Link to v6: https://lore.kernel.org/r/20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com

Changes in v6:
- Addressed automated feedback from Sashiko bot:
  * Clarified comments that io_expander0 and io_expander8 physically share the same interrupt line (Wired-OR) by hardware design.
  * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e, dac@f).
  * Removed unused properties from the adc@48 node.
- Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com

Changes in v5:
- Addressed review comments:
  * Added comments explaining the necessity of 'legacy_' prefixes (hardware label collision), pre-allocated I2C aliases (future expansions), and the 'ledd1' naming convention (schematic alignment).
  * Removed the empty `&mdio0` node to comply with upstream networking subsystem guidelines.
  * Removed the redundant `&peci0` node.
  * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
- Hardware/DT alignment updates:
  * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina230, ti,ina238) to accurately reflect the current board population.
  * Added the secondary flash node (flash@1 labeled "e810") under the &spi2 bus.
- Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com

Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2897 ++++++++++++++++++++
 3 files changed, 2899 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


