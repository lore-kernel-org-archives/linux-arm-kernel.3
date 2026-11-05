Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83433606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vi3fZI8C;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwSzU3HM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=; b=vi3fZI8CZG3IICHVO2oDcBc+p1
	jtqnl1mPA6cjRWRR8/sVvQ7Opmryt06shS14PwHNAJ8+ALMZTEBkm789HXwsSAFK4Z7ltGykYve2v
	DKT0Woghcf9SKaZcHYIvlB+R2eLm/LH/3AcKS/yTY5rtV98o/j+JaeELjIy87RPd6gIE0xMcO1Jk8
	HscEMplw4vfIauDEfxT3RybYv7wpgLyoVUtB1HIFIBuqvK4vrxgyTef15Cyi4orsRc4lp/Sl1j1aj
	LRUxfHdRRHOoVqzyaVNsOPs4AlRb2n4doEyNwlIh+yJj9LmM/MVauUxsaL5xc6cF2ihaIHTo/qSCE
	Qq59im2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gM-0000000AgC5-3FAZ;
	Thu, 05 Nov 2026 21:07:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gK-0000000AgAS-2tFp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so2881799a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912852; x=1794517652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=xwSzU3HMS38W7bj18Yn63BGQkzbuSeMZBTIx3yymZXAyc7HZnUYNBLy5V91hqVXm45
         0PidIh0W7w7fn/n5evSaQPi8OnTzz3llX3tAdW1E3LTffy7kjd6dCn5jbZ0GZ9u63qjL
         BhF7y5PEhyKMZi95gRPYnWCLqGQzroQ3k+uRYXrh4bS7ywiSJrogGdYRHYIM35P0dcUG
         Yr0iLsmZniJCuf90QYkLuk89f2IP9wXr0j+JW7tgumOaZki5KyBv6gVF+lhfmjoaa6Lu
         2GYHrjlYeiRoLO32KuxCJ3MCY7KW130lJwsy4sUZOb5DwBPaInFQrl4LWTuuN0wWVEla
         49ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912852; x=1794517652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=pCIk9LWupBx6RLZ9Gcn+R5P7D6LOont1n0Ua3jNQXQPriH1cx1nvQ9jhNntlKcB8Bz
         f+57ht5k98y308eqEZFZBAxxsT85eEcH8AaOyxkouDTvboGHvf55qXb7waWfbqgG31zm
         IDbQ8OBxP1yy+yw56J9IDzep7HaDlu2hfXO1uu8wduguCEAdrQOodw1TvFAgg1ed8iWh
         +OmRfzS19iV4Pv5nT3Kf46v6sgx5wSjbJn8hOB//9QFDCKDDot3/mh5RdVQ9y9XYkIUH
         mM9WQ7AqbyYMIz22SnDsNzesUG0kSk3hv21y/WdO5trWhbOFggbcQaggIJQ/TK+Dm07a
         T/PA==
X-Gm-Message-State: APuU4Z/waFQHLRkzr2qpECIJEx2hzhlkR9ECCZGoe/VWDdNiLtB5zwRL
	/HFzLsyuTW8NwSj5k4AWvwdPD0VkyK0oADh7ZuP/ayGrkdxXCTWoiihd
X-Gm-Gg: AYBFou30lVLOuKgUQr2xpo+rX/aEkrM1+JzYVtQVAMAizqXlHxBTa3dCgNcCbvkcLzQ
	Xit1ouGsxAH4x4HiZ0IjSUJtVTlLuEAUhjwSOhsCJBy5MTjiX6Fg1okT39ofh8sat9hJBQJwLsq
	pXTP0DFj+r5xckPfN4QP96vVWaYS8Bpi8jynCUwe7TfFLIKES/mkYGfUFB4NPMZmk7x3MDwO6w5
	knTwJXcXzo9vUTBgMXus7ndn/mcQ65I0l1pdciZPGEqPjNXXZrsA27KCgUvyLjyxUBwzvH0Rwdd
	S834Fhxj9QwrqO7eu8TeaXK/XGvVAPZ3o0jGKvVqwcrb4rx0SovhgurbD2E0z1Rcm7hBgbIBwrc
	ypCUEi6NhYhQ6nX5704RSwNAURkkg/5/Ynv0ipukioH3K4qFDIeqzC+MbwRJOuuNKgjIGHH8oMs
	PLKtkNyS79pFlJ3OqyM2oVXJa7HrA8B7WpGnPGFUncHXSGQYkiFXEaP8I8VOIRErH/km3fvZl8b
	okiqZsAswIs0/JMA/DYyTwF9ZOkmqeQtErecTPF0CltN9jE5uz5fkVmuIt3ngs3dxkE1sTvK6/0
	rsSrhYJubZwdyBv2SdUYxmbP4ipHRRGAvbXCJUNZFpkPCPbHww==
X-Received: by 2002:a05:6402:13c2:b0:6b4:c971:589d with SMTP id 4fb4d7f45d1cf-6b59780391cmr343744a12.13.1793912852256;
        Thu, 05 Nov 2026 13:07:32 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:31 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: mediatek: Add initial MT6895 and Xiaomi Poco X4 GT support
Date: Fri,  6 Nov 2026 00:05:58 +0300
Message-ID: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130736_752668_35CD1B5A 
X-CRM114-Status: GOOD (  19.73  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for the MediaTek MT6895 (Dimensity
8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console.

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The ramoops driver probes, and the console log survives a watchdog
   reset. The last 30 lines were clean in the final run.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

dt_binding_check, dtbs_check report no issues. checkpatch reports only
the "does MAINTAINERS need updating?" warning for the new files,
which are already covered by the existing F: pattern.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261102.

Alexander Letuchiy (5):
  dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
  dt-bindings: serial: mediatek,uart: Add compatible for MT6895
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
  arm64: dts: mediatek: Add MT6895 SoC
  arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  |  46 +++++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi      | 166 ++++++++++++++++++
 6 files changed, 219 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

-- 
2.56.0


