Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45539606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 00:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xy7THq+U;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CVmrRTzW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=; b=xy7THq+UAq9i27PfBiCJZqInaE
	jD8aNpYSLKJIB+iGK/PGLwYsJfEkn+BJ6UnW+79qQaz52rScLzeO8BnIM07T1pNuPTPtIka/fthNB
	ta/SqnlQ1oyo8c0Nj/4dujZTU/ZxQhUvc+lyB9t+jNq61g01T3kwYygeX/5JENLPrkirAV3p3Sb33
	fslQAj4rFPI3pgFhRrB+3bXJ9QQ4kwX9Dbv362vTj/R8Ksq8Gwcjgzj+NuFeK0Z7vsVcZc1SfUVho
	j8mi+hTa61bmgxrIbjNyQpi90oZg+s3z8fE7TEatPgMWVxrMBl4duY+8jKEj2exLaiDXnuwwaLulG
	GFa4+U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL8m2-00000001XgJ-0jST;
	Mon, 26 Oct 2026 00:41:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL8m0-00000001Xfy-1ohT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 00:41:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a208d93758so28078085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 17:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975270; x=1793580070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=CVmrRTzWqefFMwEUObzkIt8/EG4fcgAENZWyLcwjEHu7Kav133S/zydLOtKONbBJOC
         uD40zagMgyOEpxU7Ofxw+vwmTY53pb9sbNU354cPNGeC7G+q1eD7Gzk6t3I92xZT2TeL
         pXS4Nm77kMTC4TR55Y8DIhGnWZpu+8+nm2YB2esDm3KygKwKSRp4G2mGLFpYUKbzSa2q
         9iyHeuqI1hlEtj8KhOz0yfH7Urd4kFtuHRetzaL/kVVLABqvvfaiNt1kpqKLhOG0fBy1
         GPFNJLbYBFGgNJvdQF07Q6eEzT9o3hE6gG8c7jO4ALk64yXDMdj2C9nbghUXX02IaslS
         gyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975270; x=1793580070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=vaHnMEFrlzj/+Fe/ALCWY0YU5mutsBDnvD2vIoVO8FAtHPVhPv/noOa2mex3kSHnSK
         fvDmJWV8mBfpYGpMwuIukT1DQVBfk1hq7yH4xi3O0WFgfVHuFr7AEPJT4GEELamKFI5R
         YyAIg7lTfGI/+sueS8PgLf9eErBIvZwR/bHv/HmqkE97tfea10WNbYMTcfTept0yj5ng
         VCQBt7SPZrh9HjesDxPxYq6pKqfW7bGp/YpgDQoJwTgTi5HJrzY0B1RcWxjgPd2nqVUd
         barRDp9tv/LHHVWnHLKK1vi+pOweRG6RhvBsAlgFY23pYMBu1N65jPUWyqYHLg/kfj4t
         uoPA==
X-Forwarded-Encrypted: i=1; AKwUvByRf2NNUzOdkcGiI3vwU/oPPOMlf0kCAfw72NFav+FqIXRPJmW5eVJsUGH+xWdDEYditCBX5t9tFdNOP+im8+Op@lists.infradead.org
X-Gm-Message-State: AFq9FYL6xjmrTtOmW91yfZUownzIcIrydV8t6C6uodgQJWngnmgBCcA2
	TWZ08kJpNapmyWGBYtZ7tTEQEq7oKHJuoVq2hYM/8xdVwtlv41QaPHK4
X-Gm-Gg: AYBFou3RA21RI7zC1hUdmEdwIWPpkZa8jqsQjsdmf9rXhSPi4qM5Yf1ZExi4aAhkdly
	vA3dsb7bWKY7bg2j9rjbhG2I2nu+K0bj/6Oe+1txPM2y5PpA5pon3jcwfi0+ocIeJlB7F6EqQt2
	E7sNEZ3ghhD36JR7QcOBVYRhHJ5aWbuxcXqNGduqSgcO991MbZIK6Xbrqc0RnWOozJtps9LqjqA
	lFUolStP8Nr/4GfS7Zpsnhnc3rA08Sd1B2YHtXh6hNO091l2zkNQcrZVIGkAHCTnAzPMTWkQTNP
	9nH/ixnABJ6ueL2xy6FJ/LVgjuXGDei+TZHDVxX2VUZPqspbMuogIH/8kL0XCo9A2HL9h282dSg
	YB3wGJpxi5NZFRvaVDBOYBKnFXh0+7D9v66m6nlm+CFLbKBGM0nzfCdpRCT/goExp9QX4fR99Wb
	RV/ZlbNhHd8/pxqEqMAoT0QyWrefXOSG2QtApfIxgThO1muOAmazXwYuGD/6CiwYTbeJ60mYjmE
	pWO6+KRnjKTnblBhwvNNixsp/zIheK2NwbzXjL4ZrWI38N5jxaAap+S2ZQnAc5J0YmrIjYEFE92
	e9sT8+n7XF6WCQ==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr101973045e9.0.1792975270272;
        Sun, 25 Oct 2026 17:41:10 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] sy7636a: power the panel only during updates
Date: Mon, 26 Oct 2026 00:39:11 +0000
Message-ID: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_174112_512629_6A1A9630 
X-CRM114-Status: GOOD (  11.62  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature in the regulator driver instead, as the TPS65185
and FP9931 drivers do, and remove the hwmon driver. Boards that relied
on VCOM staying on mark it always-on. The regulator also switches VCOM
with VCOM_EN, gains VCOM voltage control and binds to the I2C device
directly.

Tested on a PocketBook Verse (B288).

Pablo Mazzini (7):
  ARM: dts: imx: keep the SY7636A VCOM on
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good, then switch VCOM_EN
  regulator: sy7636a: report the temperature
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options

 Documentation/hwmon/index.rst                 |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst         |  26 --
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |   1 +
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   1 +
 arch/arm/configs/imx_v6_v7_defconfig          |   2 -
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/Makefile                        |   1 -
 drivers/hwmon/sy7636a-hwmon.c                 | 102 --------
 drivers/mfd/Kconfig                           |  10 -
 drivers/mfd/simple-mfd-i2c.c                  |  11 -
 drivers/regulator/Kconfig                     |   6 +-
 drivers/regulator/sy7636a-regulator.c         | 240 +++++++++++++++---
 include/linux/mfd/sy7636a.h                   |  34 ---
 13 files changed, 205 insertions(+), 240 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.52.0


