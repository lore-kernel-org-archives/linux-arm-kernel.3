Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F932E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+UJA2UV6hes6EiSzniGHAOlzpx0LS1dL1tGp/JbEU4=; b=X0JRZIY+bfp1h7HtI5KVnRc/xb
	MHr6N/kBU4KlDvfWs7+TCHzVXg4p4GyLn9F412NQuAu8Y52av5/y1WrZXo+SNB2037Zw2er4fKEMD
	iCE32NmiP88dMOv2nqyHaAZdqJWsIsoIzK11n12hKi0+VAYNsjPPc4p32zfNFHgAfgUXVFyQxPqfM
	DeFHwlpSHxCgjLcaIYnx4IozW7aHLp2fSSAdDmzKVg9jQQvtztDgReHtnD+z81zkrfFWWP64NrsZQ
	qOFYJPJIVCkpGw4sngrmR7RaQDwY6ZHDJChCWUFTmOeo26LmFEtSKX9ZPaOrYfIzu2EH0Na6CdKxx
	YbGl7w2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg88-000000000Og-3gLx;
	Thu, 12 Dec 2024 10:09:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg40-0000000HabW-0Ahi;
	Thu, 12 Dec 2024 10:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997894;
	bh=BJAKUmR3xWQ9qzG9ppN4jAGJ2iMpKpc+JdEgddk4Bxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CMNjt9KrL72tAJutKI5akwTGiPtV6M1Dw//IwYzpHNQ+Bpu+qBxRkFNBlhPrveAYa
	 rBReguwRxy/uMP6x3OxHNW1bh5QK1Yyv9GTx/OlqSaFcw36N/sYEJPFJFSuWbVqwWQ
	 m5J0utModagdtptTLzcd4OUwddtYjuqJWpOjE22FND305Zgabj/g/Dt7w+E2Oft6bX
	 wGSn5T78mWTQCPop8xryfvmYMOR02cAMaID28/TxBw8HypbfxZVuSqiStMFHdILvm4
	 dYCoo/EmQdb4uO41W6Zn+SV+9lnvEijtKbQN6uzirXuEVILHCNhU3++Em5kbNNzGCe
	 ypTIMmExhTaOA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDEF517E35FA;
	Thu, 12 Dec 2024 11:04:53 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 Aary Patil <aary.patil@mediatek.com>, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 parkeryang <Parker.Yang@mediatek.com>
In-Reply-To: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
References: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
Subject: Re: [PATCH v2 0/2] Enable audio output for Genio 700 EVK board
Message-Id: <173399789370.41280.16875335834079584278.b4-ty@collabora.com>
Date: Thu, 12 Dec 2024 11:04:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_020456_245729_5B55A74B 
X-CRM114-Status: UNSURE (   9.83  )
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

On Tue, 10 Dec 2024 17:54:27 -0300, Nícolas F. R. A. Prado wrote:
> This series enables audio output support for the Genio 700 EVK board.
> Patch 1 adds the missing #sound-dai-cells property in the MT6359 node as
> a prerequisite, and patch 2 describes the audio DT nodes to get audio
> output working on the two audio jacks, Earphone and Speaker, present on
> the board.
> 
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] arm64: dts: mt6359: Add #sound-dai-cells property
      commit: 9bc8353be720ca1f9cb6e03825929bc172e1157d
[2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Add sound output support
      commit: b8457716eeee45ed5cb6b8fdc5a5b459f7ebe819

Cheers,
Angelo



