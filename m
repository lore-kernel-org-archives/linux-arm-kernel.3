Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2048606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWkqa3Cd;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFv4QHiK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ka89UtZDZKnkm7Vp8tcJBEWC86uaK+V/dQmn2ZcqXc8=; b=sWkqa3CdMYDPJa+5UH7CUM0zGd
	satM3/qXpWjW7mK+We0RHCowxa4vAsPevbqovBlJspGk+YKbRcxAN5zcEUTBeCkrnfAsTuXcrU8LE
	9kVDBTU0wU4+LBOBFMBouXYPKS4mkkOBobOs8WyDyh27alH9qXTQVP4yFLvdWZvkXkK1r8tGM+cMo
	skNcLbTa9EcO7/5pW1fzteYXDzRi+Hgldx9Ev8gIooIDe8X3dZnZFXyEa1OeRuifYwP3GlHVlfs/d
	7rQgmHFq9dlhBJI0DTq4mAKQ9fQDLAs6I+Q34In6cOuSK6yOd2ndrUSHLkgQ/6s+EKWdFCr0S1Z+A
	jsKxaOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWf-0000000Evx0-2ppJ;
	Sun, 01 Nov 2026 21:55:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWd-0000000EvvY-2lFR;
	Sun, 01 Nov 2026 21:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69338601FF;
	Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570138;
	b=grzsl3taCHDlAbqK7AE7jHB/BSenkXWu8ND7B2xB8AUbH5LsQuTYJupGAXMxI3XDaVBh
	 /HnQ/xVzQ9e9fMYH8jq9bNww8zm12kIcU6W3yOs3jNYzyPhPDIGJGBOZREyg7KXVuPxf6
	 +3uPH3I56HWD6hN4pOvbdoHdGnGUetjyo1VbjJJLzByS56xnvuZqO5UEHdpFBj3C5+vFT
	 Iy9M+ivJCqsu85tKPeym9+HDh0MplVeQjBH+UHmnAwYDy9VPEL0Mkpi0sKT7vY+yP4CvQ
	 GNUjjqVxADgenIihXaNoaTaDuc+b/aE+1l9IxQj1ycH7A5MeANC6lbhhHqRmISIndHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570138;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Ka89UtZDZKnkm7Vp8tcJBEWC86uaK+V/dQmn2ZcqXc8=;
	b=ciOfeeRQt2jC1NgoVTgRUx5UDuk+qFZFMRWkCbtA2AVhpCeAaEnKd2MQvOeUUr96Kf0j
	 j2MpjtLv+PE8d4gd9cQvxocsROH70a+Pj2x4b8YMzfx9HNdtACiSS4R6N7bGe2rytlHNo
	 asoUE+PSS2da5nFQow2LIyazhq45Q/JFDBLBr1q7j3SC1NEWSRlMOTtPidn9ITd4axRZJ
	 eRrzCzeaKkDYe8DMiR0F+OSYrr5rPByH1gftpPHHUCdQkF5ujcwvqds3OTn+3bDRRNh1D
	 WOHOCvLiKWJobKM1/bvEK1mIfH6xsj9lhzVPOaBfhpgJAzVctZdPTg2ueQx4GjWq4KA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ECE01F000C1;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570138;
	bh=Ka89UtZDZKnkm7Vp8tcJBEWC86uaK+V/dQmn2ZcqXc8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=KFv4QHiK9Wq9+dtNCtVbL5S56e9AWqFmmS9gM+3nLGihtEO6Bp0oOfh2NRhYxJ8BK
	 bHUWpxZEg0hddaw9PPODHCcQdAk9J7M2/iVrzw8yvaUmD3g7wSY7HOB7kXLXttfQHE
	 muoup37fVGCxqoACezTmwUYMWZTBU9RQQnz1a18qIuEvi1zksCzL/Ifi6hji/3Wv4/
	 tYtIdqkQTaCtBEVFd4CrrXA+dIV5iVUrpE2E6RCa/9b2yDsxQJqSW1i1WeIUUrcGab
	 ub7mZx2vSjzN/aqTb1bU/08gVWP+fWfoergkq7MxBWvv97LfBRBI8WFGsSGHgI6XBs
	 T8lBBRfT/swBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D481146290;
	Sun,  1 Nov 2026 21:55:36 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v2 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and
 improvements
Date: Sun, 01 Nov 2026 22:55:18 +0100
Message-Id: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V0bU2nPIqu/A/DAsoAY+wjLTYaw
 r8LuHZ5knvPWVjEQBjZNVtYwESRnN1AnjKmp9aOyKnfmEkhK6HkhdvWOk/cVJyMDy6hQTtHXta
 F1qoTtYaSbWcfcKD3Ib43P46v7oF63m37YqI4u/A5ygn23REBAcW/SAIuOCrIBwXYFX1+G01Lz
 7N2hjXrun4BvvIHD84AAAA=
X-Change-ID: 20260729-nanopi-m6-improvements-584cc7b08c15
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=2308;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=Z+SfRe4fp/DxdMUhi/Z0MvVrWIpYybLtZkdy3R3z0kk=;
 b=+sE670vEICeBu231TaMLM2TkQ1lJHsPZXbXjkd/oJc9VPF5gyNUwU3QhQtpT94MK21T0UrGqX
 5N7giBeUMinBhFcvkeDb7lfCn1kKs9SNtZ4bLnLU9o+17qkhC7u4ch9
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series contains a few fixes and miscellaneous improvements
for the NanoPi 6 series of boards.

Patch 1 fixes the voltage range on the SDMMC regulator.
Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
Patch 3 adds an IIO HWMON device to monitor the input voltage.
Patch 4 moves a regulator that only exist R6 boards to the correct dtsi.
Patch 5-9 renames DT names to match the schematics signals/nets.

If patch 5-9 is just considered churn I'll drop them. These are more
nice to have and just makes it easier to cross-reference DT and
schematics.

Schematics for the boards can be found here:
M6: https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF
R6C: https://wiki.friendlyelec.com/wiki/images/f/f7/NanoPi_R6C_2302_SCH.PDF
R6S: https://wiki.friendlyelec.com/wiki/images/2/2f/NanoPi_R6S_2208_SCH.PDF

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Changes in v2:
- Add schematic links to cover letter to ease review
- Renamed rtl8211f node to gmac
- Add R-b tags from Shawn Lin
- Rebased on v7.4-rc1
- Link to v1: https://patch.msgid.link/20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com

---
Joachim Eastwood (9):
      arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max voltage
      arm64: dts: rockchip: rk3588s-nanopi: enable mmc-hs400 and add supplies
      arm64: dts: rockchip: rk3588s-nanopi: add voltage iio-hwmon device
      arm64: dts: rockchip: rk3588s-nanopi: move vcc_3v3_s0 to nanopi-r6
      arm64: dts: rockchip: rk3588s-nanopi: rename sd power pin
      arm64: dts: rockchip: rk3588s-nanopi: rename usb host power pin
      arm64: dts: rockchip: rk3588s-nanopi: rename gmac1 reset pin
      arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2 power pin
      arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2 power rail

 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 14 ++++--
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++++++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 55 ++++++++++++----------
 3 files changed, 53 insertions(+), 30 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260729-nanopi-m6-improvements-584cc7b08c15

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>



