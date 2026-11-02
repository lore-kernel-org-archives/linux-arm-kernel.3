Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84860850B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o+b+frWg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ofjkyacC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZMfbjzr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=; b=o+b+frWgAOsNR2pt/sNZ+BL/mt
	qqm70sbNn4kW/qGlWF5BhXeDpH/Blgk9rn15h25Nu0FTir2DQlIcSyVJOn33c9HKA5AdTVBsgqkI0
	B7FLdAr0Vnj/0CQPCJIVi8a+ySNAWk9Q+qoK8unGFZGgOAAGSUxel0ExG2E9e7c1fbgsXjSTtpFvP
	NCkLZzz9yQRqkP6Vpdq/3sIVGNL4PlhYHgmV0ByGuuhK7sAbCNbgSuzM9XkvTiyiYfNhDyCVOVDfH
	6+6cpvFbudPfahMeq5h1F6zfc4jDZeLrqsxSA17KnEvzo2o6z18yJ2P6a26iDooeuA55PbVNo7Pgo
	Wsx/Vt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgT-0000000HQYy-06bo;
	Mon, 02 Nov 2026 17:19:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgS-0000000HQYC-0FZL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 17:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=; b=ofjkyacCr6LJl4Py81Jgh1d6Qs
	patsLTfOS1BoT+cg+RCjNBE5RSaCw0NVO5D+h4QfagAr9Oovb8SojLkHEnk4kivr4H6lJRNVWdPE/
	UViuRwP1QLjDTI7mpLk0iOSis2u9rww3AaZ6wrAG3k/VGQdn6HzjxWnp/soqSyOXSg4Sw+gMcbs2f
	EY+6VUUSraRsNc+BlFhd5zX45ngeFlQdnBrq9HMIIpyFTPz5BNDZrcBljtvfgc/dWc2CAjkkHUgzU
	kl1O6BZKsQqyMnbtTTcP1TIDGWj0lT0o9EVMFzb+jpMiDxOSwdpHoPBO9CEArVatea7cpHkY+4sO6
	U4PqDW/Q==;
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgO-00000002s4E-3m3L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:18:58 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so5067587eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639934; x=1794244734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
        b=uZMfbjzrTaB8O2vViMBOjr1qeWD8FXUvgwEhK6NhoIJOhOBuHrwyfY/+THCGGXSVDL
         DL2liCPlzedhG65yToqvmIWqBUkoACPqIKIUlQ6w1qrazuweRp591MdYfLe1R2+ry5hq
         qQF21Qxv7oXzN3fhhS9NVfVgGNF0v9B8U3L6LqKXfD42rjbJLiVCcv7tpjWp6fscJfpH
         c4pb4y9YFLFpvlzymewgifzasMOIAfkMpFuA29yiaWEYeohEnN0q3Ji8Fgg0wzOcwR8f
         ppLxz7Yjvh8cDHeMb79HIOEKc3Mz0agybRootkRobtWdqpfs2CY3BFpcaG4/ykszwEFB
         BbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639934; x=1794244734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
        b=LwaQwLZsYx3u06eZu3nPWLalr/8QyvWqB29TX+Nw/TzxIL7l8Z79gMxSnOPIqjKcTf
         Qlb0MtXxJbwPa7K+QpGfJ53HxsTiVVy6AWHw5G1gTAjtYvc9cqadj9frbpG+ImQEgEoV
         9xirBLKNIiIu+ublMmOzn6rQbj6wcm2LCI7XYglns/ROPq1FIAWdeA8leHxwSA9Kdh6/
         66928U1suUfLMqKbRGXAWDgfAQA/E85Gc1FW7Tl2TvSg8JDHLYB1+/PsNc9kUN2q7UGW
         fjd38eRHVBrEQ65LTOuEnG4C7xOdaT0I8Mo0H/qk2lW1In+7YjqgrhvCIL1F61JAq3w+
         KHuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxppAJFP00mqApgZPCre+eK9IfWvsDVxM2KwexYutk9fnENiwNNVp4s81CBlll2Oa1AHEAlwbZuuuGPtvmeVFv/@lists.infradead.org
X-Gm-Message-State: APuU4Z+cJe9ieT9hS5AcFMu1xZ2xtI6A6tJTDJTDCWHXpCeSL2nKBpD3
	cYvLKFLvXiYSOCyAQrj3vUBozVLBe8jNTIaPA6U3o4t7hKzaVFgkKIiI
X-Gm-Gg: AYBFou2CzRsvPrGTcOP7qeCDSV+gKMBpua6aKUOE8EAJgIiXMUsWN27zi+L1fMfUh74
	AT7ob6ag4kMHeAUQOVFpCRx6r6KdM2AsXv2AvrJFFMzHEv+W2Kko7hcWPgt1+ZcsO3lANEjEC/h
	dg/i9OyEPol5QkIwr9qpuDRyvTrAngjAwVrA3CIJ4YFws4UP4bAUF1wOTG7Eo398+drJY+Cze5U
	AEqvwrYhsFwuYTDdhSPm13OKNwkj9BuNwvwN+BqWbRVhQrl7ZCb2hITVQfQe64PRGAd3CUzQ+ym
	wEoWdvuycq4Ei/06OKuBSY2LLwCbTLMy5CR/A5EZqfNdlym9TTEDrvGFUHpsak8Q8KpaNy5SrDK
	mWqceQvLtM/UscWZ7iMcYZLdDInwGQ7W1AUliZ8+KAzVZQs3BhZQgFCHrFHYUTLouFfvoQHS9La
	gchIuwgpO3dwIm+rHqIKVS24a8Jabw2RqbzAixxZ1wssnVWs/wcY8o1ko4wVrHXUq5vcxUwvid0
	vLsi4ZPeR3K1fQR3PH81jO8KIgJm8PtrOHEpHRELkfZRIx2sRiLYkHpr3MFbWmpsojX99tjpGzg
	kHnvWcTtOn2bLpWAUyptJaDfOVs=
X-Received: by 2002:a05:7301:7e16:b0:361:fd60:3cd2 with SMTP id 5a478bee46e88-36a4232bee6mr15558588eec.10.1793639933915;
        Mon, 02 Nov 2026 09:18:53 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:18:53 -0800 (PST)
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
Subject: [PATCH v2 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Tue,  3 Nov 2026 01:18:32 +0800
Message-ID: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_171857_116971_F2822791 
X-CRM114-Status: GOOD (  16.15  )
X-Spam-Score: -0.2 (/)
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

Patch 6 fixes the M.2 B-Key modem power supply on the same board. The
vcc3v4_rf regulator was incorrectly modeled as supplied by vccin_5v
(external DC), which means the modem would lose power on battery.
Correct it to vcc_syson per the schematic.
---
Coia Prant (6):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
  arm64: dts: rockchip: fix modem power supply on Photonicat

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 +-
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 +-
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 53 +++++++++++++++++--
 4 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.47.3


