Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23296606CEE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1C/G/KQT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lhf2+XQX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=; b=1C/G/KQT10hKGXPJiw941XZDe1
	BmEPtW6AUUnKxN/zf8uGEoY9NkQZpd5cLUyNO7zou6rG2hBYxowCcRa/dhPHzIkuKvJj/bX3Vjyct
	Deib304qeY3UJR/OJ/1ySZMoGzW0D266cohzjC8rf7cdvIVqlPce5Q579dcKnToWn4LSLUThHLaJ1
	t3k6r/OZmJSHvDXrCqP8m3Rrsbi0eBH27uBmzfWpVq4Zf7CGaDOC93ob0yJvr13UM6HHkx9fwt+o9
	/Ox7UAuLRdu9r3oj21+6c0CWSo09kmE0NqHYi8c9Pty5GJrKWeK6996mAoMt4os0YuWJTqjcR1YkV
	wzMgFUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5e-0000000HV8m-0utL;
	Mon, 02 Nov 2026 17:45:02 +0000
Received: from mail-dy2-x00.google.com ([2607:f8b0:4864:36::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5b-0000000HV7n-44H7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:01 +0000
Received: by mail-dy2-x00.google.com with SMTP id 5a478bee46e88-327b1d5824fso3084248eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641499; x=1794246299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
        b=Lhf2+XQXPVTNeV+Utj/j+i6o1NcqmSKGPNNSB+JYUznM3UjfZ1sn5O7YeKtzGEcnSZ
         Ks5yPKwhErsZDuyqEu78lZSIQdyRuAwItZeos2Qw3qU/WCbygwrOyi+CEQksaYfdxI/w
         S292IFF/jCY2YashqVwl1y+dJBjINox8cOmHpkgHD9NvS63P13i6fCT0aKM2h6knJgB2
         xO/Nzo7wxjkifcoNR90e28KEQ1nrOtxdHp4PZ8dfk0mslGt7Gi6DyqYkxyQkLcBhylby
         YwdHV1CukQTnEyzbLpurAhOqw2T8jsKdHWKlRUTkHkhr9wZOah49nBQE6I4SeaLcPJgv
         UfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641499; x=1794246299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
        b=dWFmIudd1oDLcOp0nuDw/J2k5+iPfvkZC9NtD6KjZONwS+Tk5KvxqCUpcRGsZINg9i
         /OTFEtazDgbNSrI4MFqGosfJv92OqtPuknX4Oqn6pCsnWW0dwFW1lfyA0Visr/Olmh7s
         llB9qNq9s31Rc8GDzlyVF5lB0EZFhBJYF1XaT7Feysp8tkMBM6UCgnMIY+quc5yC76pm
         8QyIyukubXSMX9AUqPeN0N0mKx5CENdiiZBmUtrZYwTvAjA0HvMgKfZ/oii+fVTJQRUg
         pOz2xxBqzPPL5GPIYtNqC0H6HyegonXWHW1ZvM8CuRj12OklQ186/6wWN/UWiUQ724wv
         4xAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQvvnEvmH5E3j20WcdTd4Wx/dJ37Ai/0nCBEgtE0vMwVxtnFWZJEGk6QOsgufwdhST2bBvW4idTQ9qoPpAczRZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9moZYgRHeNuKnPMYUPn/TdhdHLZGciU1cVA60/bwsykeIXO3lA
	wOi+OsuA7zoxS6yPqIpDfzmXP3c/pjFsbt7riwyqh+Lj9ZkrKnLJ1+Or
X-Gm-Gg: AYBFou3dC4hZbCBj+xYhZ8/S9ev1AzzJrEROpcA6qC3ms4YauhCpHU54cMve83u+Yss
	63hou8lm6dRJkISUGKvNYCRi7zpygJ8NWZSEYxXUw7aUSwkw+tbGwGnYg7PCQteTdv3kjgNWCnP
	lQ0uzLjrNixlrYFfVe6vQeNlspSas/9xFkifkGMq7MdYuezBWIuQNr6/VZctvJl+hn4ScjLG+fH
	iTtO3oUyDYHuDJfNEj2yWEAsEHtxsi2yER+y4L1PWgP3HKDP9wTcLHsTaZ/Ar5ut+eTLBwWOyCb
	cLe406hPtWFBX5en1nnM48niKA0U12F6cSzF/KExtt03rT080NbjFHS80A4wAWIrXUch3oZSoHC
	onTtdRu7fWeFMAvxAkmgH3OAfx5vOWU/64JVMTfwUXIPBeXbGPEQ1WbmS+GbhP4CeQ7Re+FXO+u
	bKx+yk4005tDC3kOOShasqK+/3+go3Pva8y/ZFwWuDMZT/NbiA8mKIfYplgjO9WpQbd+AqE5a26
	70So3GZ3YA8HGHVfGLFB2lzQjFwTmtIwUudRQDNHmU3lQJmomMg9OS9iywrSE7FK4ZAxvYIZLZs
	Dr/ZfrY/8mgbc6TFRkTARfjZF/g=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr17419811eec.28.1793641498907;
        Mon, 02 Nov 2026 09:44:58 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:58 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Tue,  3 Nov 2026 01:44:44 +0800
Message-ID: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094500_003074_D90F24DD 
X-CRM114-Status: GOOD (  16.29  )
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

Changes since v1:
- Patch 5 (USB OTG power): Reworked the power tree based on the schematic.
  Instead of tying usb2phy0_otg directly to the boost, model the OR-ed
  5V_OUT rail explicitly. Add vbat, 5v_boost, and 5v_out nodes, and fix
  the vin-supply of vcc5v0_usb30_otg0 to depend on 5v_out. Drop the
  incorrect phy-supply change on usb2phy0_otg.
- Patch 6 (modem power): New patch. Fix vcc3v4_rf vin-supply from
  vccin_5v to vcc_syson so the M.2 B-Key modem does not lose power
  when the board runs on battery.

Changes since v2:
- Patch 5: Fixed vbat min/max mismatch (both set to 3.7V) to satisfy the
  fixed-regulator constraints.
- Patch 5: Fixed vcc5v0_usb30_otg0 to depend on regulator_5v_out instead
  of bypassing it.
- Patch 6: Updated commit message to clarify this is a topology
  correction rather than a runtime hardware switch fix, as both rails
  are always-on.
- Cover letter: updated the summary for Patch 6.

===

This series fixes three classes of board-level issues found while
bringing up several RK3568 boards.

The first four patches address GMAC clock parents. On these boards the
DTS lists SCLK_GMACx in assigned-clocks but only provides a parent for
SCLK_GMACx_RX_TX, so SCLK_GMACx keeps whatever parent the bootloader or
the hardware reset left. Add CLK_MACx_2TOP explicitly so the GMAC main
clock always comes from the internal source. BPI-R2 Pro additionally
describes clock_in_out wrongly ("input" while the port is a fixed-link
with no external 125 MHz clock); switch it to "output" to match the
hardware. On RK3568 clock_in_out does not change the hardware clock
routing today, so that part is a description fix.

Patch 5 fixes USB OTG power on the Ariaboard Photonicat. On battery
power the USB port is dead because the 5V_OUT rail (which feeds the USB
load switch) relies on a boost converter that is not enabled. Add the
vbat, 5v_boost, and 5v_out regulator nodes to model the OR-ed power
path from the schematic, restoring USB host functionality on battery.

Patch 6 fixes the M.2 B-Key modem power supply topology on the same
board. The vcc3v4_rf regulator was incorrectly modeled as supplied by
vccin_5v (external DC). Correct it to vcc_syson per the schematic to
accurately reflect the hardware power tree.
---
Coia Prant (6):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
  arm64: dts: rockchip: fix modem power supply topology on Photonicat

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 +-
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 +-
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 53 +++++++++++++++++--
 4 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.47.3


