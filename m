Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F1DCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/oZBwZNUJHzy5epIabVPY4mFU5VbIVDH+NWWmNIeek=; b=Yp5JGfINbhDhQaBsvSQ3h+LoL3
	ls5kHmpTcpcIjyVBFmGXEWnADT+hDvyq+UI+Lr7VHcjykiyOALFclkSRnhA7MnJx8g1N/CpM9F8w2
	cWFXxdhlE52fuy8yHfjQjAfhkgVyCudmhoeYfi5GXPsX/KeeC6ZLmgOcRrFfhpOdu4SrVMJimZ4s8
	s0wy8lBAnHZry1wCaCtVbrwt6nSaQDqiU1srRFrMCfwtkCiyOBnmYz+K0tKiih00ASqEjPzguT4R6
	xWNfOa/uaJvKbyQo6/wNRCXOj1xH7SPpV4OFo9Mk+beXcvB/czvwhU0cJrOC6t0c2xeUDkffgNOfW
	AeudMNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTBo-0000000FJ50-3uBS;
	Sun, 04 Oct 2026 20:52:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTBl-0000000FJ3n-48yl;
	Sun, 04 Oct 2026 20:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4/oZBwZNUJHzy5epIabVPY4mFU5VbIVDH+NWWmNIeek=; b=wt92fhu357919RTJDNuElokXT5
	M5JjrN8l+xwjMphQUvyIA2LxI+IWLTVbu+nrqFOPKwZ9UnSJk4nZQ17IgIO1YY/bOkTw0cQ5jt4a3
	uUo3MEnb5VqBHNNB9MDEWVCgFMqDfQnEJaBVRAXgOmfgOThnTBwKe3JxpBYt6OVrhnc7/T+n2F9bk
	ROqB+elV0YYVpoz3JafIkbaAtcdyyf10KOs8FjM9UMeuR726hfFLp7ZNG795EXaNsswtDcBP5wB3R
	J+FtjepK3vuoWVNnRfXq3vDD5h4hzdKYgd6QTbqfCG1rro8U6kycPuyY1LiAZFyvvXs3UJFT1yO/V
	bB51AfeQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Sun,  4 Oct 2026 22:51:46 +0200
Message-ID: <179114705963.3265768.14931994624548567445.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_135206_072569_55ECE051 
X-CRM114-Status: GOOD (  11.40  )
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


On Thu, 03 Sep 2026 23:23:12 +0200, Joachim Eastwood wrote:
> This patch series add support for the NanoPi M6. This board is very
> similar to the NanoPi R6C and R6S boards which are already supported.
> 
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
        commit: bd3edfb61ee0b68dc95aa7ddd53cef65b5bdb3f7
[02/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing sdmmc cd pinctrl
        commit: 30fcc62cf5d27fe264145bb743407af62f8ff240
[03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing pcie rst pinctrl
        commit: 1d974afb0ea4e1ffc03535a2b2ae5a84d35738d7
[04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove pull up on rtc int pin
        commit: 2d4c429e561b21c07f95ed41481a5d1062659c9e
[05/12] arm64: dts: rockchip: rk3588s-nanopi-r6: pcie2x1l2: add clkreq
        commit: 3ac1a8d422126ea08f6ce32c0a05e181e08d9299
[06/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove always-on and boot-on from vdd_npu_s0 reg
        commit: 92507cbe7581c519da115128a2ce6930dd9dd6fb
[07/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove useless vcc_3v3_pcie20
        commit: 1faf8018879fc0e4a76958f2122f6ab7aac5957a
[08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add gmac1 phy-supply
        commit: e7fd313ef4e5907a0bd769101de48ae354b7fcca
[09/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove bogus vcc5v0_usb regulator
        commit: 9518c669aa24574445e874c89313a133c276513b
[10/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add comment about gmac phy-mode
        commit: 92b4f18f9a07786f9146788ca5e18cb9469bd1cf
[11/12] arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
        commit: c08257d642ac9d821710852f514577d331a13390
[12/12] arm64: dts: rockchip: add support for NanoPi M6 board
        commit: 2640aea473b463e260ba2f52833e7c1fc2074246

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

