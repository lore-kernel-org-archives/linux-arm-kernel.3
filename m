Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F702E69E9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 23:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPhXI1CDFbuv3Y+gNMnXPl5Q69OCW4koj3Gtatp1VeQ=; b=N8PIzAp1jsmfj4Skxyxf4z5xan
	9TzLiqhnDRib1xPklHUH+NK7dLU9IfkjGfaK9ThuwR2V/Lwwa+1bkUVFE266XKyAF3g3GSCzNFRrE
	xggW7+vtbwJSDYmw42RjicOIU+2tWkfxoM7zwjmXGM01xXDjwyexdjmGq+DIaJ+uWBgtHu6CyiWD5
	/26NaWFJlksvcF95dXuo5nrjl+TpJp/3T7p2necsXhB27W4+XWCjrVBCzGZCGR5nds58gJTdQo73C
	N/WK8BwBYk8lEzr4XkV/CR4rWLM6Tee8mDlA1qOkhTbQXJ65GXEDwxxeAImp46ThSHTXZOTXxWyEA
	fmClMkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFsB-00000007ipS-30dy;
	Mon, 02 Dec 2024 23:30:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFrB-00000007ifd-2WsM;
	Mon, 02 Dec 2024 23:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rPhXI1CDFbuv3Y+gNMnXPl5Q69OCW4koj3Gtatp1VeQ=; b=CjMHvcoaeS5IvbfSXTb5KDbNVa
	nAJEoQkzlBepwrDgSdXlP5LLllDSpfUcWM90WYG7V2TjIi/5B/YodGpXIZL3CnyGoaOKPgdHT68OP
	wGYrUyqPDjUAGtLia8EGe1GC25Yoc47pk5/dYfodU/za7buHH0L3dLzazJ/2b6yDEbqWCn6OJPZ+k
	Bl2uLS97i89qGPXocx6BLTdwvvs/F4nnWCEk6B8dF417jQsBn6hMyintXCBGJL5wok1vl3b6FEyTR
	O/MroZYGp229LvayRscP7e4c3MnbZlfvAwCUS15vQxFUs26NMJg7qiRZmTpyM15kN7jPxVEY5T6gj
	Fjq1ArDg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tIFr7-0000OB-Gj; Tue, 03 Dec 2024 00:29:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588: add msi-parent for pcie3x4_ep
Date: Tue,  3 Dec 2024 00:29:16 +0100
Message-ID: <173318214613.1403925.10026428339576666444.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120171048.2839621-2-cassel@kernel.org>
References: <20241120171048.2839621-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_152933_637322_71652432 
X-CRM114-Status: GOOD (  12.13  )
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


On Wed, 20 Nov 2024 18:10:49 +0100, Niklas Cassel wrote:
> Add msi-parent for the pcie3x4_ep PCI endpoint node.
> 
> The pcie3x4_ep node should use the same msi-parent as the pcie3x4 node
> (which represents the PCIe controller running in Root Complex mode).
> 
> The GIC ITS can be used to trigger an IRQ on the endpoint when any of
> the endpoint's PCI BARs are written to by the host[1].
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3588: add msi-parent for pcie3x4_ep
      commit: b6f09f497b07008aa65c31341138cecafa78222c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

