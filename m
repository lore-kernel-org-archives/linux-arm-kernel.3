Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EOXFMVC6+7oiTirA0ot5v+5pSqEybCdk9aXbZ9tQ+0=; b=MBI8YkyZTcZd3+hZntDw5RTUhp
	zk8nuym7b2WU5WhXnb628NLQIQxJD8ucR7D4VFo5sjFlT/xEglOxyMjqSr+zSIntveTa7HQgEtPLA
	gMtlg9ef18OzLh/JDYto5fqEvux8cVH1XuPalhEFumuRcyeCxhozDjMN4BNzD6FrFF+GjHSekiJPD
	m1EiHVFTWjUqXTxHNmTr/ackV2jtpZKWjMS+KMfsQLj4cPVM27S6lsIXCE+EZuZmrF2DdTWwV+WMk
	WPmwoON3votuHTVozRB/p7pkSpwlnv9yvxjRPchGniioLH9wwvhld0HIvEETfjzafSlLDZPXHwnan
	E7Gz35Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEQS-00000002USJ-23O6;
	Mon, 03 Mar 2025 22:38:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEOa-00000002TtE-3tIx;
	Mon, 03 Mar 2025 22:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5EOXFMVC6+7oiTirA0ot5v+5pSqEybCdk9aXbZ9tQ+0=; b=JNfuVWDFIye54QW5L2Yg44pbby
	+ehzxUfqV3vdBNYpO2rmcVeZ6SiaSvoJHG8/uemnPHagfcxEat8dO9RPml2Ku8RyM6w2oaY512unK
	zCQBrHyPSzT7BakWFT5j67mA6afkF4APHp8VSw3L0UcNVLSuqi8nigmyjL0nW3bG3E9WTjRhU4Vhx
	AhilD1kh9ztYP5FIRQqanbfm0XcunNe8LtskZ/el5U+DbvKADL2i4GDAFaY8cQWdaqI4FjAh512gt
	FLZOd36yxWaosHknsnz/rY0FT4JknB6OkBXD4g/WuieP/m+xKu3LKkMNi7BThx7X9FmFgd6FW6+ne
	8aYZT8Bg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpEOT-0005wL-Ig; Mon, 03 Mar 2025 23:36:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org,
	chris@z9.de
Subject: Re: [PATCH v2 0/2] Slightly improve hardware description of Pine64 RockPro64
Date: Mon,  3 Mar 2025 23:36:10 +0100
Message-ID: <174104113599.8946.16805724674396090918.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1740941097.git.dsimic@manjaro.org>
References: <cover.1740941097.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_143620_962534_95CCC859 
X-CRM114-Status: GOOD (  12.80  )
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


On Sun, 02 Mar 2025 19:48:02 +0100, Dragan Simic wrote:
> This is a small series that introduces small improvements to the way
> Pine64 RockPro64 [1] single-board-computer is described in the DT files.
> This applies to both production-run revisions of the RockPro64.
> 
> The introduced improvements boil down to eliminating some warnings from
> the kernel log, by adding a previously undefined regulator and by adding
> some previously missing references to the regulators.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
      commit: bd1c959f37f384b477f51572331b0dc828bd009a
[2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board dtsi
      commit: 64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b

I've moved the pcie12v supply up one line.
While in a mathematical sense it's true 12 > 3.3, we're sorting
alphabetical, so it's 1?? < 3?? .

And yes I sympathize with 3.3 < 12, but also have come to appreciate not
having overly many special cases :-)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

