Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59314606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b8/0AyDQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOFJpJi6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N6S8HybbmBQD7ksOwNPFIV9dg/XgtnCtP4j4VV6tQZY=; b=b8/0AyDQzc0oVhMaNp1sERArCc
	BaVt6AGXZT3j+Wqne6IMTIIsWam0CetB672CSpxwPM3lm6d65PSmPSGQqZyW611fm5pMTPWdBYACf
	/S52XzvCMC2H60GcW+Rv6soc6k/IfU3eE1G4PA9lPbuSndCEmtcTRlLRXArbGxfU22TQ1HrKqtAGx
	tpB04XTOb+HmgyLn4KfaOcJSsZGkZOCvoPrSiss9/zja1aYK6Ala/zXAI2rhnJblfQy1h0/RXX12l
	9Siae/dIUVGwV87/DmRZ7VUFS1hzIrP5vQaHLo46EjeRa0W+nNhk7ZFaKtIvKU7eDImy9m47lHZd4
	zO80Guaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4E7-0000000AaN6-2T6E;
	Thu, 05 Nov 2026 20:38:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4E1-0000000AaLC-340H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:38:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2245067a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911099; x=1794515899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6S8HybbmBQD7ksOwNPFIV9dg/XgtnCtP4j4VV6tQZY=;
        b=EOFJpJi6/aAC+q3omt5kFnH6cci5e0HEhtmTNuShaGCUonElDBP1nl5s9CNSYb+415
         K8oKzfHVLUk78YjFECAdtIdFPQs7du2mA42FlyIb9QKoctL3nI7qSFMIlt4x/yDS0iLn
         TeQdm3X33sRBFw4346+Nr+OLYNKR29qDQ/yjCqLPxg0sbvyp4Mu+WF9MgXpKNpBFc5Cr
         Ui8cbD6+a52QpaUi0RkvTkc1jfw/UGSv6avcpwM2JSlaPzRSC8r1QRXUnAzhnOtsuJLF
         MZ7gBZ6+DJBtzTxcJRe/DdNc2xAwrVm41SoXePy9U+MS6nJDhsEOh/3adRrLoBRY6dEs
         mF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911099; x=1794515899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6S8HybbmBQD7ksOwNPFIV9dg/XgtnCtP4j4VV6tQZY=;
        b=dS5KbNQrv+ajrrFBF4V+oM6MdN69cQEzZEC4EYMiGl+namW5eR92z6LKaDnZeUXv6A
         CwQF/bOWAWUazzSDRvQcw1jBSD1lSMt7V9DBrXazRut838JdOhkcpF+dlDbHvwdx9hqx
         ZChh4YSMaK74Rc3EYJi/UtLbf0JFUP/O7INEYI1pIhu6q2NO1k+PXD6zuqVnAjfA39+w
         K6npUawcniEtanmlYwS+a+rKZHPuqs4eAY2C1Y1HH7imKiqmwa+ZU4IevqQPwrRQyhH+
         LdW08p6F/j7cEaHBuiKG3VxEGVhO+13LmJPhdSYfi7LISTXjwmLr6IcS2Um6sWizzVRa
         s4RA==
X-Forwarded-Encrypted: i=1; AKwUvBzJeTSW7q6CIo4/9aH2OQc6SPJ1wKRb28CLdMIUZ90MfpqQ5aPhPyI3cSzBdJK76TRrFkEfwAWOK1opqfJhBofU@lists.infradead.org
X-Gm-Message-State: APuU4Z/7SIMR0aWQ4c03VPzJRL2EzG3JOVSmhrUv6lkR1lre02dDWgEC
	RohhaAjNigCy+onK0QOqQp6voRhOS2W+R01RtVIyOwr7hV1lQ/dp2lUu
X-Gm-Gg: AYBFou0dio2DR4x3nYe05/1uSAuY4EuwEHZ4CvfIpPsI7RoKhZqzCHHg0PGLAlJfjYq
	Y9C3Hd+5qbO+RIJYRofdxSZBmbZZIx2dBswaVQRdSwTDawU998ObpYbY6n1J8CWiqECKRLCNV9x
	wDnOUQFl59SheRRf7PuAY8pyBUpzhKsHEQqpgdE2fCyxwha31egXdQNYfgm6TuI5QDBidcsg/sJ
	AT4SdXEDgoaQPMGR5hkQ/g4jGvHgdFy3zxCUViRHoCucGN+PIkosV4AbtCW/HBs+ii3OjM2inuS
	h9ypLFyK/RqDJzbPWAgzW6j8WJGE0qBm9nu3c9jaL+1rBoVIHNvIjwFFhI2yUfc3+uT019N1tzv
	Ad3r3VEOJBbgIa3ynm6V5FvRzH5ibsgMAEzdhFmouzO0rDC6303mjrZ7E5Sb6fg11+SDDt6bPVL
	icH2S9csaf1LQ1KIrZu4k5Du0nQ95mDw41sdqloj7TxcM7LUvDGn/07Ftkaef3OGWVvhRqp/ahq
	9ZY+VwARN+rGlztm2LNkZql404UThEc8PSJE8cwTKuD2om3HrGafIzmBX/6ObQpC3RJbLX75oCC
	LKIWwUFlg362qZSNiUvQaoC+90XduzstKpi7Plwx7AvF1blq23npYkwOKSGmG2KVUGuzyiGRE8n
	BU1TN4WjskT/V2X+7flNnpAgzoj4AMgfuECfrBazkbpLCBZmiZRh1BRn5y0jxZ6iXQDgH+TacPL
	sIOy/FzK6wD7XIIrd8GIsFHu2guCp86DKIWKRrsS9xs281+HZah3lgaB8wdTay+6367Is=
X-Received: by 2002:a05:6402:3808:b0:6b4:5d8c:95e2 with SMTP id 4fb4d7f45d1cf-6b597553644mr323041a12.4.1793911099046;
        Thu, 05 Nov 2026 12:38:19 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b57feb668bsm886834a12.13.2026.11.05.12.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:38:18 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH v1 0/2] spi: zynq-qspi: use a flash larger than 16 MiB
Date: Thu,  5 Nov 2026 21:37:32 +0100
Message-ID: <20261105203734.979168-1-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_123823_092137_7B80143A 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Zynq-7000 QSPI controller sends at most 3 address bytes. spi-nor
needs 4-byte addresses for a flash larger than 16 MiB, so on a board
with a 32 MiB W25Q256 (the ADALM-PLUTO+ has one) the probe fails with
-EINVAL and no mtd device appears.

These two patches keep the flash in 3-byte mode and handle an operation
with a 4-byte address inside the controller driver, through the flash's
Extended Address Register (EAR): write enable, write EAR with
addr >> 24, the operation in its 3-byte form, then the EAR back to 0.
The EAR is 0 between operations, so a warm reset leaves the BootROM and
U-Boot in bank 0.

Patch 1 makes the flash readable (every other operation is refused).
Patch 2 adds program and erase, which need the write enable again after
the EAR write, a check of the bank register before the operation, and
waiting for the flash to be idle before the EAR is restored.

Tested on an ADALM-PLUTO+ (Zynq-7010, W25Q256, JEDEC id ef4019) with
v7.3 plus these patches:
 - the four partitions (mtd0 to mtd3, the last one 30 MiB and crossing
   the 16 MiB bank boundary) read back with the same md5 as on a vendor
   6.12 kernel that handles the 4-byte addresses in spi-nor;
 - the U-Boot environment in mtd1 is written with fw_setenv, survives a
   reboot and is read back;
 - one 64 KiB block in bank 1: erase, program a random pattern, read
   back (equal), restore;
 - 14 MiB (224 erase blocks) in bank 1: erase, program, read back
   (equal), restore; about 110 s each way;
 - a 26 MB firmware image written into the 30 MiB partition from the
   running system and verified byte for byte, after which the board
   boots from QSPI;
 - no driver error in the kernel log during any of it.

Not tested: other flash chips, boards with a flash on another chip
select, or the quad program path with a flash that is not a W25Q256.

Mario Behn (2):
  spi: zynq-qspi: read flash above 16 MiB via the extended address register
  spi: zynq-qspi: program and erase flash above 16 MiB via the EAR

 drivers/spi/spi-zynq-qspi.c | 1 file changed

