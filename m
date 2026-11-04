Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBD606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQtV+Ee2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D4Y9onBd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=; b=lQtV+Ee2IzPcb7IkP6MM+2xW3A
	7lqyZOQzhN27SfQhutd2wD3Fk/Jd4u1LR4m+Fgajab05NxGelKs0zFq1ubNyJ/roFS03DJFH9xxEB
	Fx2pwJCun5sRBICRebv2MYXkJ6IaSTg3XtNzoRt/tp2q+9FSMbo292hyw91Cbk+vaf9sejdJIJaET
	eJckDZEKNE312TNAZJDtErwPSw4MaziRMsIwCVUAloaUsV+RASb7ue0zpCuCZYmbXqX2AyR0rCPmq
	FuziDwYIbG8Vo5SFohCgAKbUI1UL2Pzaqmly4Aphha4nwLO1WaqFKB0YTm0TKXPLI6ZTekJJXNmBl
	FKnSpumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe76-000000062bm-1zea;
	Wed, 04 Nov 2026 16:45:28 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe72-000000062Xp-0u74
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:45:27 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1931ff67a29so595576c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810723; x=1794415523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
        b=D4Y9onBd0jVUw0QJgdPypTZ3P73NX3GE/7E7q4sXtZs71tEgp4xsV7aMoJFeXVbrf7
         i1nhwv2FnrsPaa5cX5hwNm+XIv0royF+7NYGjQE/1LaKv86TSceXzHEXdxSS4A9GdPKF
         1arol3EpldBqEYQYO87XtGNNJ5J1Zbi9JPJ8bs+qPVTEmyvuKZHC6miSjzk79l7zw26T
         Ha7k7mZ6y3jEMMuKmpgqAJQJTBK2aTQblNxfRgJWjFSrMa8kWYf9KtY+tn6vCvg9jBBI
         mMN8fo68RjfI9c2Jnu8OW0EDvdIWWgU6uGxzTipotX45+jLYIui/4cpPcArY/9jBRPUn
         /pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810723; x=1794415523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
        b=WqDJ1ra5UzxKJNhzCwbEdC6Oa9Z3TlJx6SWyTsY3f5+a++6mYux0+Qc5TAGeRRWVeB
         B625kg/DtKFMcRRU2Ug47VsR6r8+h/E/A1hZSCdOAvqNrGYSgYp6FxAaoQhfUvMfrXPc
         CLF+5+2rCHPqFO8T+4cFne3iylmlAnC2WgaJIvuuL4q3HZxLcFSKqNRMrI2Z02MOrca4
         ZNGdqizeg/glUAgaeHfNXSDi4C1+IdWjEnLtHSRfEUGcmzl9Ku9t0en2GGwGD++MBjBJ
         lBrnhPEsOufATxr7TuREcwof1bm8pYoFzHQEO8FtKskH6zLR+7bpqIJLAAkhJzxynwEm
         HyuQ==
X-Forwarded-Encrypted: i=1; AKwUvBywH1B2pFXDp0g1PgP0JlLw6UmndHvDvogpaIqXnz2oOeOwljpHzg1LlR7/lCS4xh7BSAB+NuecQwTbgRjDflz2@lists.infradead.org
X-Gm-Message-State: APuU4Z+8NCDmjxE3ku74B/xFNV2fThGw4yKcpdQCviqsqkK1AW8do4kQ
	Ybvt35ymOWMG89/yZj4FqmQDbq0m87XYxy4fTzdcNKnNXvBMgW+6WVK/
X-Gm-Gg: AYBFou3mgMIz4/I357Gsg141iZ3IQLQEkUBcmBvmxJ5n4c+G6zNCKo8bBOOOwN6KtQr
	kSW6GZCKVdOhww7Kq4L9+8/4pTRaTflwi+r/r3tlWGGwyKpnxZJhYMfm2cVnH2VJuv/tA4/0UkN
	CcigbQxuHwv+zXuytH34G0Hp7zh/TRc/g9P8/odZwXx/mWqIeT3a71KD8ZSGH9iMAKtfJ5PvQoa
	YIv90WXKOE2vVCbLa4mJnQKTohGwbNYXoSKw+4es1PHC8WjyOP98Bpiu2EaUtiQ7ORKad/zEEE1
	Xo6ZumAdAUD65aUkrAuEFIutIBE34zlBuFGbR/A1N0j5J2MYKhH9z82MVOpit3YISgAdZ16pMeH
	/gH0MJ908tPkN8r8E2caGcnSFiva7zVy+lYicyIIVd5Mwou5ZUgdSgf7mPyHDBdi+f/00yptOew
	jztyTtboB8jah2/dZ0JL00jIFnbNGCZgzj6pjO4Ah0SZrYuMgkIdgucON2rLPGi3TUe6GayDvai
	ElvWc3h5Wvd11sK99kprHvHtoXVzmq6h+bgAa9Vop60PKZrGYkZAfMcE+ExziHS4dNufwPyN/wH
	8oCuyjQVYd1f58y/9p0p+ZbCjbkD5S0yd6qLEalERiUHGWghOugizvD5745ZrXhJwHbiVLltmh1
	iWQP5xrUgGIzqR/8Oq31ZyBjLfXsURXe3N5qtivYSttF8Kum6qB4wGXIr6uaLDEOhTrinXDc1eh
	3MEIfDVw0IWuoGENW+XoL+uTBVP9EpmhQ4UGGmOkAYCK7RbDDgoyRQOZgBkClyl64=
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr25419815eec.1.1793810722385;
        Wed, 04 Nov 2026 08:45:22 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Wed,  4 Nov 2026 22:14:59 +0530
Message-ID: <20261104164510.105359-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_084524_264164_33EBA663 
X-CRM114-Status: GOOD (  11.42  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver sizes its channel array for 10 fixed and 21 external PL
channels, but accepts external channel nodes numbered 20 to 50, and it
never checks the remaining room while filling the array. Channels 20 to
29 are the fixed ones, so listing them adds duplicates and overflows
the array.

Patch 1 limits the external channels in the binding to 30-50, as Sai
pointed out. Patch 2 does the same in the driver and adds the bounds
checks from v2.

Changes in v3:
- New patch 1: limit the binding to channels 30-50 (Sai)
- Patch 2: only accept channels 30-50, so a channel node can no longer
  duplicate a fixed channel (Sai), and add a static_assert() that
  ams_pl_channels[] holds the fixed plus the external channels
- Patch 2: rework the commit message around the duplicate channels
- Rebase on fixes-togreg (now on 7.4-rc1)

v2: https://lore.kernel.org/all/20261023185652.195025-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have ZynqMP hardware. dt_binding_check
passes, and rejects a channel@25 node in the example.

Arnav Kapoor (2):
  dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to
    30-50
  iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels

 .../bindings/iio/adc/xlnx,zynqmp-ams.yaml     |  7 ++-
 drivers/iio/adc/xilinx-ams.c                  | 57 +++++++++++++++----
 2 files changed, 50 insertions(+), 14 deletions(-)


base-commit: c293f0db308fe76a0a9b0f6674cd2dea149b03aa
-- 
2.53.0


