Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C044C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx+fUKVt2xcgM4AXqeWo30ZvJHZ5oUe4mgCMZs2Ib4I=; b=hpCJ+2TsZ9WzJ+tmubfmFHrUM+
	hLEL6p33FC1mlXxL1HAE5RNP9eMFhp/eGFO1w7OzL58bf85XH2cTQxlbWfq4ZlWSwgxP0MG37Id5M
	1WhJJ7HIUEheXLWffzXlDg42/QEqNqCDPHP5x6xBIf0JIa/Jp5FgGDt0AB+NWo1Btm+sb0W2KK0v0
	aic0xuCLhXicuW1h5NovBywFK77uuC8k8ARB6wjxJGzP+JfX+Y5STlhkB+nHEmH89s+tGNItBpcyE
	OZpVjVwQYzR+GmmYim2MZDUGPGdse4ocZSUGqMNyLrTBpROnipZYVN4cjJljk33Mw9Mwtga5aYTUw
	3pwHRYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5N58-00000000sYb-1kgv;
	Sat, 12 Sep 2026 12:43:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5N56-00000000sY1-2A6d;
	Sat, 12 Sep 2026 12:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Qx+fUKVt2xcgM4AXqeWo30ZvJHZ5oUe4mgCMZs2Ib4I=; b=xs/Q4DQsfVQAYnSajVZ9VPl5M/
	CO8s9jx0rE3iJiDwjN4CSU4eNZTQ5nWtNV5y6UynVokfabqNdfHdPb+YFFGuNDkmj12KY6kxC0nBD
	S8rkU+0f0LxMVAKcOnMjA6J6truz5dYt2ROSz/+ezYIPvXglplaIzEmcvi3pdgQyclzycHv9/ftaa
	tBd3de4pBPecLX34DTgaCYyTqh0c97URXySXHV9piVTcY1RHtpbNsWUXs8O023ynHxYzvru0nk6d1
	iJpsP0jJtjACtGNtxtqQ7u1lPpGZ8YnCFEsS4HIEFrSLLmbvea0bongXyNdVnlxmIG5bYEtROfayp
	EDc4CK9A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 ricardo@pardini.net
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v5 1/7] dt-bindings: net: add Realtek RTL8125 PCIe Ethernet
Date: Sat, 12 Sep 2026 14:43:28 +0200
Message-ID: <1971659.CQOukoFCf9@phil>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-1-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-1-c1b9e5f10cd6@pardini.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_054344_554638_EE8D90DB 
X-CRM114-Status: GOOD (  11.15  )
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

Am Donnerstag, 10. September 2026, 22:07:51 Mitteleurop=C3=A4ische Sommerze=
it schrieb Ricardo Pardini via B4 Relay:
> From: Ricardo Pardini <ricardo@pardini.net>
>=20
> Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
> controller. As a PCIe device, its "pci10ec,8125" compatible is the
> Open Firmware spelling auto-derived from its PCI-SIG vendor/device IDs
> and is already covered by the generic dtschema pci-device.yaml. The
> compatible itself therefore needs no binding to be valid.
>=20
> A dedicated binding is needed because board DTs describe these
> soldered function nodes in order to attach ethernet-controller
> properties to them: a placeholder local-mac-address that the bootloader
> fills in today, and potentially nvmem-cells, phy-handle, etc. in the
> future. This binding references ethernet-controller.yaml so those
> properties are validated on the RTL8125 PCI function nodes.
>=20
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>

this needs to go through the network tree I think and their processes
are heavily automated, so this should be sent separately.

Heiko



