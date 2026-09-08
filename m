Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D42C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGafLjWZaxlFTTUL0ImDdGT6FHzvJIkporCTsCPLc5U=; b=dzsHKkoVg614eSp6jcxTVwbMqa
	iwO3/fvsBdpAZdzu9p1QxK4kOetWRtS5ogN2I/PsLSrL5LeEjktmWslZXQPKUtVGIz6y/OFmHJVcd
	vX8PNfVkNiF/Yz3gTAYQh4aL839fHbZuqFADxjKUY474G45tvGj9gtL7D5Apu4NDIQv3PyXAURfPe
	bSF7IDM7n4D3LN23fWgakBIDnT0I9X8zFwBgQd62R651EV/Ly1i7fCymPZ509nh5ZLeO3KE9Yu9Uf
	wqk+P6XNOYIR1XRZyWR2AHSm3M2i+x+QTUSW/csWdYnNCH1alnZR9a3ogHCFrElwkwUatOfkehHE6
	JFjxMWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0c-00000008FIG-1luH;
	Tue, 08 Sep 2026 07:12:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0Z-00000008FGo-12qc;
	Tue, 08 Sep 2026 07:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851560;
	bh=n4wzmFF7SsDyV4NZMeMh+gM4T/C/4j3ky2hmtVdkGGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mf305onfTJPNvvfgOwdHkvoBvghccA7/ySxiUmYp91abroTUjTcBkaKszbnMm1E8U
	 BvALBlj4MacvtIc0X6hiwc/e3W8ZKQyxorH8XVQu4SNSYAQKq7QwZHSj6hPKghthQ+
	 J4cmqRDZbcHsmhpyAexZ9dKLUYR8/bqAj4v/R4zi2xWhFSmhWT52PARexug+fsS+bD
	 igJzYrMfZOnkqR94Io70X0ZCmjNRVI03Kj2cwI7PMDScDksTANCo3tb7oiCPvxFt3g
	 gCn2ZYWpHvulRVWpqODLZgKmD5dx1m+WkD5hn6Qh//VMbRCKAQKcqI3+ER0LYqsSGI
	 97Hd9MoRNPD7A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9ED17E0945;
	Tue, 08 Sep 2026 09:12:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Brian Norris <briannorris@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, 
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Julius Werner <jwerner@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
References: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
Message-Id: <178885155954.9724.3253834048320145225.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_001243_454206_E7D70B94 
X-CRM114-Status: UNSURE (   7.85  )
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

On Fri, 04 Sep 2026 16:31:44 -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
      commit: 69c1a4fd5272df1d745d6bcc3c613843ebecec61

Cheers,
Angelo



