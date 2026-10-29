Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8nZeMBU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIiaLXMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qOF7wYrSiLyxDI9TfUlCsobhSuSMPq8w6f3swfnWMZk=; b=Z8nZeMBUY85yCH/ECl0RLxDEic
	HOZYbSuTcRsKw0o9sB+RhFWajFabU5tLJhkG7XQ968S+seUHClYdS6vgxNhFCQ8x0djVvnjqQb9H+
	jiu9t2BngMrmIf7o9NwiCTe8gZKj1XA7pm0Fk2smRxurK5p1aHYPcCmLHwoOuHYiXLadU2X7gmDUL
	LDEptoQZMdDlQba/1ooMytCqL862K2PxHBDphIbZo/X9G4AmJpa5Ed2UOzV5FVkgQmF1yHMTa1P3y
	EFRb4tMsnPD3GiXn5SdtvqdppjZjNpKRe5VbAx83YrfUKSobKAOPQzXgSksEhJcjDd0VZxBwL9H2f
	k6CVbOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN25-00000008vFi-31xx;
	Thu, 29 Oct 2026 10:06:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN22-00000008vDW-1uod
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:06:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso16952475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268408; x=1793873208; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qOF7wYrSiLyxDI9TfUlCsobhSuSMPq8w6f3swfnWMZk=;
        b=nIiaLXMUl9kkwJua/WRZYe01bn5OIhNa+TDvdHnruRgscPA72h1i2dDve4cgFT0aQ2
         IQzUY/cw/Y6VMYobtryQMKfg3LOrQIUdEjc3FRRweXgTOdesayeq1/w6ObbPK17y+Fkd
         3MTl41YmNCxqtzpIZtHJoexauGT0VwADZSRWkfGA5P6B+g3jxsNU4orPMoyy96JpiDC6
         VC8FD1i3lxsKSQKlyk//mzC6S7KGOb8qDoUiT3Dh4ZQ6DY9WMifdUSv1A+BiN3HXDqPL
         K3xcgI+k8VlBRxMD+h26rLTZZ1fRtPlmL8pgRxRPGVhdeqNfofJmMRA+deC9NVnFfV1g
         64Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268408; x=1793873208;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOF7wYrSiLyxDI9TfUlCsobhSuSMPq8w6f3swfnWMZk=;
        b=J1RNSHKSw+Vq2fFqfPLT5RXzKtMZJLe+8+1ieQvgibQHmyokUgPt/GzSeII/jeBvdW
         +3DluVAYjs5mdvKfQuewaKvdt2s8NDoomL+YwKkdg90ivPtXk/Y5Ok5S2+hhzzm3WtBZ
         iuAyVZ2ZwB9lvMP2ncbhJA6TSSCz0PPHblR1Vm2VZPU8F8WWMj9HjMCtkAevwJyJGXi+
         QRrMTCl82iiftKMJGN4QFfhWjSqLV3+w89SMuWDNlciLEng4Qi2rUKlskq+ByN7v76sT
         MLEzDbd1I1PNnp0x8wxggJ2Bu5UD6MdWb3SCMMf1USjfMPdfLvEFFCK/dDS+e4nF1X3Y
         /fbQ==
X-Gm-Message-State: AFq9FYIxvMergbpPKYDRrh01z0nnKB8VGhNmqifHAk0ERSdVOh/vainC
	OniThMX7ly0nSR5WptRAE7owuf+KXxfMHIda+KPLwIH0M4RehcFC93J0
X-Gm-Gg: AYBFou1DzIMNrcqWQxfH17TZKPEgN2S0zG231tjS1vPFYBNJ6MTu7RH7Dg4JsLu+rCw
	PAnbJtjkbIHPfCdt1449e7d7pYOQpOgIGKh1OGq9j9KK1HNC6G/GPG3U5+yVuibpxwBr+V/bENe
	FbTjPNjckC+YquQ22vqF6MAyYNQ0uoMegBIblVrhgrOrVpRdCHsUhsSz6Xv0JV53oA+ic6FPBYL
	ic1QF7GW6tBTwVvJY3IdE3FiXVXrPu/j0frEHahvKKzVMO/R06UfQUjghmTf85IBPWzn4OmZPMY
	QJj7vj0b33Fx/67aXWscTHjPb5N8tchagEcZoYN5FWrLMFDQ2eRoWOUJcz/30W5KHWd73nEVgKx
	yYAozp7vqDV7gNJv2m/F/CQjjYYCu75f/31wpihwcW+Wy+62T19ipEDNIVr8D9LQMEykIdDxQOF
	5n07MCIeshlc3jWaLHOVM/bY1yPC2tuhPp0oqzdimXKMYrT85/wJ4ibIIsFyRcX7zc0cK1BPC+4
	nmWWEJ+lrKErIcQ5rOm02dW9JExRdb1qzfFfMAJjIyZ6wsmNO+TfuqVQJ9nSKRFeNf5MUDuwMWJ
	XDTW1sRIPZZW7tPsyIYYj+eg+FQ2W25t9AfB9KTEsWrT8hQA16eEuWYWM8m/DYSMEsUPGYSy/qv
	UU81t0+t5
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr117257515e9.10.1793268407430;
        Thu, 29 Oct 2026 03:06:47 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:46 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Subject: [PATCH 0/4] Suspend-to-RAM fixes for RK3588 + SPI-connected RK806
 PMIC, enable PMIC sleep on RK3588 Tiger
Date: Thu, 29 Oct 2026 11:06:22 +0100
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAa42oC/z2NQQrCMBREr1L+2oEk1lq8iriwyVj/JpZ8DULp3
 Q0KLt/MY2YVY1GanLpVCquaPnIDv+sk3q95JjQ1luDC4F0YkVjx1JkF9YgeSyH+3S+3ly3MCVM
 Pv58GRjemEA/SJpt90/f37nzZtg9J1T2zfgAAAA==
X-Change-ID: 20261028-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-13b6ec08d2c5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=4078;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=whpYEratljGVTl7QjkhsaCvIr2bv7FesbGf4wTNyJws=;
 b=Yjo1Vrkco613l9dyLnzMqeGxox5caUTel5ElHqC2L6eZEKaikGN7q43RGAGZwNloLUj1zWdDJ
 d8fDrN+nWEGBzxgvmtwK4wP6dL1VSzL/h4dTP33hHfLhLImeky8gg6B
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_030650_535672_72AF93BE 
X-CRM114-Status: GOOD (  20.97  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series, together with a few out-of-tree patches (see below), makes
suspend-to-RAM on RK3588-Tiger work, down to a power consumption of
about 0.4 W. Patches 1-3 apply to all boards with an RK806 PMIC
connected via SPI, which includes most RK3588 boards.

Patch 1 ("Input: rk805-pwrkey - enable the wakeup interrupt during system suspend")
arms the power key interrupt as a wakeup source, so that the
power key can wake up the system. This is done in the regular suspend
phase, because the SPI bus to the PMIC can no longer be used in the
noirq phase.

Patch 2 ("mfd: rk8xx-core: keep the PMIC interrupt disabled during system suspend")
keeps the PMIC interrupt disabled across system suspend, so that its
handler does not run before the bus to the PMIC has resumed.

Patch 3 ("mfd: rk8xx-spi: add system sleep PM ops")
hooks up the existing rk8xx suspend/resume callbacks for the SPI
variant, which so far lacked them.

Patch 4 ("arm64: dts: rockchip: put the PMIC into sleep mode in suspend on RK3588 Tiger")
configures the RK806 PWRCTRL1 pin on RK3588 Tiger for its sleep
function, so that the regulator suspend states take effect. This lowers
the module's power consumption in suspend-to-RAM from 1.09 W to 0.43 W.

The patches do not depend on each other and can be applied through
their respective trees.

Testing
-------

Tested on RK3588-Tiger on the Haikou baseboard, on top of the v7.4 merge
window (a8530b69fc4dd): 30 consecutive suspend-to-RAM cycles, each woken
up by the PMIC power key, all resumed without errors in the kernel log.
USB devices (a SuperSpeed hub with an Ethernet adapter, and its
High-Speed part) stayed connected across suspend.

Out-of-tree patches
-------------------

To test this series, out-of-tree patches were needed and used:

1) Upstream TF-A does not complete suspend-to-RAM on this board yet, so the
tests used Rockchip's BL31 (rkbin v1.47), configured through a small
out-of-tree driver. The plan is to get suspend working in TF-A instead.

2) The inno-usb2 PHY has to be resumed when its 480 MHz clock is enabled,
otherwise EHCI/OHCI resume hangs. This is addressed by Sebastian
Reichel's inno-usb2 series [1].

3) The GPU and NPU domain supplies were kept always-on. genpd powers
these domains on in the noirq resume phase, when their regulators (on
I2C/SPI) cannot be reached yet. I'm not sure what to do here, yet.

[1] https://lore.kernel.org/linux-phy/20261001-phy-rockchip-inno-usb2-clock-fix-v2-4-e01bf509359e@collabora.com/

Known issues
------------

PCIe devices do not survive resume; this depends on system PM
support in pcie-dw-rockchip [2].

[2] https://lore.kernel.org/r/20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com

Tool use
--------

These patches were developed with an LLM-based coding assistant (Claude
Code). It ran the suspend/resume tests on the hardware, analysed the
kernel logs to find the causes of the failures, and drafted the code
changes and commit messages. I reviewed all changes and tested them as
described above.

Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
Jakob Unterwurzacher (4):
      Input: rk805-pwrkey - enable the wakeup interrupt during system suspend
      mfd: rk8xx-core: keep the PMIC interrupt disabled during system suspend
      mfd: rk8xx-spi: add system sleep PM ops
      arm64: dts: rockchip: put the PMIC into sleep mode in suspend on RK3588 Tiger

 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi |  6 ++--
 drivers/input/misc/rk805-pwrkey.c              | 42 +++++++++++++++++++++++++-
 drivers/mfd/rk8xx-core.c                       | 19 +++++++++++-
 drivers/mfd/rk8xx-spi.c                        |  3 ++
 include/linux/mfd/rk808.h                      |  1 +
 5 files changed, 66 insertions(+), 5 deletions(-)
---
base-commit: 8f6620b65ae2458c36cbc9569a26fc2d777593a3
change-id: 20261028-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-13b6ec08d2c5

Best regards,
--  
Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>


