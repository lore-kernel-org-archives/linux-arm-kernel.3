Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AABCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCPpnT6CUqEY7GoVJxhhOsw1DCasMs8tnUxRwp0k/aY=; b=dsGCapKNfaG3GArnloszQ3AH1v
	VPBDsUDINlRsPIIattYkE+sA8t9JEFyFh2AbtnZsFkboOPTJdAMLH+GT3CuC/f5uXGFNchXvn9YmY
	Lvs1uOYslmVxUNB/9VOrGkNORX5IKOvpqrsbOPNj6bLJQvFmEH2O0REgPf4Dz0GU7TDJwcQygvPdW
	Egq4AQqhK9M5Iy5GANgOTtXgENjfCGmzW7XfHPdn5NPEWxw1vyWS9WFhYAhUEx+uVzYZVt5sTqFZU
	hc31SgAKLihsJGyYnDUFVEALYwhEMQd3shcMh48P6UgezvAOToAZfJFQGQGcDQkz5PQpVBeUp6hqa
	c4+3NI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ExY-0000000CksP-3goA;
	Mon, 13 Oct 2025 09:35:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ExV-0000000Ckqs-16WP;
	Mon, 13 Oct 2025 09:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348111;
	bh=bfL1IYH8BibJ2nPO35tm/brwL9jRYOHCupbnViHgTC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UpVspcs4NU8hEVtlvhlE1NG6P7p/g37hclIOwLocxIHsvonh58l/41Rf5XG4DsIhG
	 oLa2EFnlFn1Hw4vaJ7w3X4vlcBB5FEMa6fVOC3YIgkKvAL/U2U+7P7L4EB6Eai44+b
	 FOnWTzFFGqU6LoeW+lJsWd+aOT4U232HRCWtj0QhuIHI56D0imH0XLxBQMmnoH+vrC
	 LS+ESbNd06VYGmO3i6D4fe/BDJ5zCU1FLIhW9zci8vpoMHnXFUfoDF03r25PpU8atR
	 qCdhXhPE8Je+zjbdARsXceQqtcwoEI3IVX3mIBt4iq3wufVYEt0vmK2sHZXaAcO6Hq
	 LBWkVCGCmcUkA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00B3E17E0523;
	Mon, 13 Oct 2025 11:35:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, daniel@makrotopia.org, 
 Bryan Hinton <bryan@bryanhinton.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250922035828.2941327-1-bryan@bryanhinton.com>
References: <20250922035828.2941327-1-bryan@bryanhinton.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: mt7981/openwrt-one: UART labels and
 console
Message-Id: <176034811095.21265.12249221887009507081.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:35:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023513_459817_0494A3CD 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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

On Sun, 21 Sep 2025 22:58:08 -0500, Bryan Hinton wrote:
> This series makes two small updates for MT7981:
> 
> - Patch 1/2: Add stable labels (uart0, uart1, uart2) in the SoC dtsi so
>   that board dts files can reference them directly.
> - Patch 2/2: Update the OpenWrt One board dts to define serial0 alias,
>   set chosen stdout-path, and enable uart0.
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
      commit: c0a824edb6bf694a2d5a9eede29e1628f093cb22
[2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200
      commit: 36712c5cf980980139bd8f7b84b1b6daec068857

Cheers,
Angelo



