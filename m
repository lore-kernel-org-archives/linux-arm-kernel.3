Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B561606D81B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cfwjU/Zv;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Wq7bNyJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6lyfZkMaV5efFDaQd+IxuIBt8CTl0E0w6j7qjN8lYSE=; b=cfwjU/ZvYzqT5I8AccfefSY2RR
	vU3zZFBKHZYzb8SOmVq/yT9UFu0+D5dYbN1K5+8Z8OhmutqfOKOClql/jHMpwocGXfb+LFmkOQ1Pe
	veZdgPACoVAZdX7LNO4ayqdxOQy1CQjl+wZI2wtAhCR5rsQ85BzEJ6u+EAcIF6/ik3rFL1dvKCLMM
	0OIchqBpNKkOETRLlOMrfmtS6l9dNsyPgkTK3ejRbEbfvo0aAfNv746nEEdArOaPAEhpHhXIy0SrN
	ibjHJ9VcAZUjUxFdbDDa2cLpX45Dyw6Knp8USNrVWEYiwf+0uW9XuhoyjPa2Wig3i073gqbLH5Xdb
	zc0rtl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTW-0000000C06s-2zl2;
	Fri, 06 Nov 2026 10:47:14 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTR-0000000C03k-1zQ9;
	Fri, 06 Nov 2026 10:47:10 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07F1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:02 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07F1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962023;
	bh=6lyfZkMaV5efFDaQd+IxuIBt8CTl0E0w6j7qjN8lYSE=;
	h=From:To:Cc:Subject:Date;
	b=Wq7bNyJISiqD46Vv+Cx/w4pTAF5EVD47JK+PiaLtg3hRh5M4Ydpm6SyyydhNvAE59
	 vqwskoeRDqCvBUSJiOEqfGTLVy81l0p+dE7kEbNS5YUBRshgF/qq9IQ19qpuZsdwMC
	 /osCFy+pii6znpq6aKE4hLilv8s9/xCP1bsUBiuE=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 00/10] arm64: dts: amlogic: S4 SoC additions and the Amediatech X98Q
Date: Fri,  6 Nov 2026 11:46:49 +0100
Message-ID: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024709_848041_763228D0 
X-CRM114-Status: GOOD (  13.29  )
X-Spam-Score: -4.4 (----)
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

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Patches 2-9 add S4 SoC blocks to meson-s4.dtsi, one feature per patch:
caches, PSCI idle state, S4 secure monitor compatible, Mali GPU, CPU
thermal sensor and zone, GE2D, USB host and AO CEC. Patch 10 adds the
Amediatech X98Q TV box (S905W2) that all of it was tested on; patch 1
its binding.

The board has two USB ports, an SD slot, Ethernet, HDMI, a power LED
and an IR receiver, and no analog audio output. CPU frequency scaling,
audio and the video decoder are left out until their drivers and
bindings are settled; the HDMI display path is not in mainline for S4.

Dependencies (bindings, sent separately):
 - amlogic,meson-s4-sm                     (firmware: meson: sm power-off)
 - amlogic,s4-thermal                      (thermal S4)
 - amlogic,s4-ge2d                         (ge2d binding)
 - amlogic,meson-s4-usb-ctrl, s4-usb2-phy  (usb-ctrl, usb2 phy S4)
 - amlogic,core-phase-degrees              (mmc core phase)
 - wakeup-source on meson-ir, rc-x98q      (meson-ir, rc keytable)
 - amlogic,shared-antenna                  (Bluetooth W1)

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (10):
  dt-bindings: arm: amlogic: add the Amediatech X98Q
  arm64: dts: amlogic: meson-s4: describe the CPU caches
  arm64: dts: amlogic: meson-s4: add the PSCI CPU idle state
  arm64: dts: amlogic: meson-s4: use the S4 secure monitor compatible
  arm64: dts: amlogic: meson-s4: add the Mali GPU
  arm64: dts: amlogic: meson-s4: add the CPU thermal sensor and zone
  arm64: dts: amlogic: meson-s4: add the GE2D
  arm64: dts: amlogic: meson-s4: add the USB host
  arm64: dts: amlogic: meson-s4: add the AO CEC controller
  arm64: dts: amlogic: add the Amediatech X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 310 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 246 +++++++++++++-
 4 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


