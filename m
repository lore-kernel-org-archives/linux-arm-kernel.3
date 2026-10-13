Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6C3CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MecLv6GFvp4+3gr2w6VZbEetLAKLCsU7kVY/0VgpTA4=; b=aF/hozlSC/29YER4AZt2DJ6OOz
	W3UprQ5rxdY6w1M/ZKfZsDKgxrB2jmcT3KqmNgulbKZM4WrQ8gR/6YG7bruxT4fp65pdfd0PGUqBJ
	HEFFU+zC00cCJVjntKJOXjtyjuHaNqsliDaU5ToZskn9IC4oF9T2GY1VmLg6LjGgWjUD9cnHqM/kE
	N0f4CwZoYHU2uT8TPVEoO0rjrgE+Y5mDm25h7RGU8MdJmsKL2r7tLF98/sWm2gGc3tKyagn/g+PZF
	NPOjMI8VxE4bIPWNtg8k2dbYPBxmKwVT1hhd/n3TuBsTWEnkyde29Ql5hrCylc/hdpPtUyOVZcvvr
	OgyLnZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGe3j-0000000DCo6-2e1V;
	Tue, 13 Oct 2026 15:04:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGe3h-0000000DCng-4B6U;
	Tue, 13 Oct 2026 15:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671F844008;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4890BC2BCFA;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791903893;
	bh=RUudPQA8z+0LZXJ+57PTH0IevBIz82+0+2DHH7x12zE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FL8q8Bue3gE9cOo8HZBMsBWBv6m9DcuT5pDLg20AJ9AdnXqi85txhDuSPzejuxmww
	 IDxhdvCzxIM2qz7E8umEqegkzSFQ71vzxLwqEuumL8bsCVZWfY7vPfQrdyqtESkiDg
	 fBd3pe9eTjPNy11KW5D4y2byTYz9ted2cxd8v7lA4QgMInJ812bPYu+ftdyCJNN+u6
	 YOcsb0e/hszkbaVERNj5codwqjlWEWADVlKNV3OVZPLlzlsKx05Xo3oDcc4icAUvoB
	 GmGZLab5M0OqJuBr2EA9j2m3MiLR6yyoI1OLRXCade1ue1zn3FSNWXn0JFAk31tOuL
	 IUNGrHPyO92cA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E9ECC6B16;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
Subject: [PATCH v3] Add UNIHIKER M10 V1.2 touchscreen
Date: Tue, 13 Oct 2026 23:04:51 +0800
Message-Id: <20261013-review-self-touchscreen-v3-20261013-v3-0-beec2a35cdb8@crepuse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNIzmoC/02NywrCMBBFf6XM2sE8IKC/Ii6SOLERSSXTh1D67
 yYpisszc7hnBaYcieHcrZBpjhyHVEAfOvC9TXfCeCsMSigjhdRYJVqQ6RlwHCbfs89ECWeNP0f
 SyUjjZFBWQFl6ZQrx3SqX6848uQf5sU5Xw1kmdNkm39fTHjm2SHv9l74Z2LYPnSK9mr8AAAA=
X-Change-ID: 20261013-review-self-touchscreen-v3-20261013-1e9616b1f2a0
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=RUudPQA8z+0LZXJ+57PTH0IevBIz82+0+2DHH7x12zE=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFnnPCbnNOwTXtvaufb8wZBFWvv/vrq2etKkqcfyf9fXd
 /7O5dK80DGRhUGMi8FSTJFltih7+aHmFdfmTmiyg5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqF+1gZGj803hDwqxnPeOJDZcuqryas03xkMWZDaJ1Ar4rJHTqMvIZGSYtiHa
 czeMaZZe74UX1db6Hb6NMtM+KSfDqRp0/1sJdxQYA
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
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
Reply-To: founder@crepuse.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Describe the NS2009 on I2C2 using the existing shared vcc_io regulator,
the validated raw contact threshold and Y-axis inversion.

The NS2009 VDD is connected to the board's common 3.3 V rail, represented
by vcc_io. This connection was verified by continuity measurements
against the exposed 3.3 V header. Additional measurements around the
SD/MMC interface and SoC decoupling capacitors are consistent with the
existing vcc_io supply topology.

Changes since v2:
- Add vdd-supply = <&vcc_io> following the required-VDD binding review and
  V1.2 measurements, without changing the shared regulator's constraints.
- Keep polling operation; the 10-pin package has no separate VREF pin and
  PENIRQ routing remains unestablished.

Dependencies: the submitted common I2C2 v2 patch, based on Rockchip's
v7.4-armsoc/dts64 tree, and the NS2009 v4 vendor-prefix/binding series.

The combined DTS passed schema validation with the pending NS2009 binding.
The v4 driver passed touch and supply-consumer lifecycle tests using a
temporary live-DT vcc_io reference. This final DTB has not been booted.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
Mizuno Miotsuki (1):
      arm64: dts: rockchip: add UNIHIKER M10 V1.2 touchscreen

 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)
---
base-commit: d6c0b613da7796745d9ae71d0d0b87cb48ca25c6
change-id: 20261013-review-self-touchscreen-v3-20261013-1e9616b1f2a0

Best regards,
--  
Mizuno Miotsuki <founder@crepuse.com>



