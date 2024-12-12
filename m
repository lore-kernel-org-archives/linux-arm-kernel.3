Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C67E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL0MNhxh03d+1ccZDymnbDEc6rmGXhMxn0rTLHkDQKE=; b=wru5eTQhakY+lz7AOZ3lcjOdMC
	qqe+lEIrR8v0l+ZEprWqGCi8ZBSPoJlw7AHNNZ5SKi0lEkMuxZnxouu7d1v+vUsThUXP7VN5Uo96V
	floSHhSCSHHZhfqeNvh9oMHuF4De/qyiEbpqwplvrLvK7S4DSZUfcYIk6ksOzH/rOnaPKACmD1Yw7
	Ubrv1NnnJJ97O4+dX6ZxXDqzGzn2SIlqy7QEgH4xOfP/dCAd4prwvibetrC5p/CSfiu0IcjR1gQZq
	V7RDYOpJZAGzkm+FtmfPlHbirsz6jAsEJ8uRU+2QsKobgbRFZcRdboj7uWIOcIau6+hTKVxwc3wfp
	9Jbi6t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg62-0000000Hb0Y-46SD;
	Thu, 12 Dec 2024 10:07:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg3y-0000000Hab7-36se;
	Thu, 12 Dec 2024 10:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997893;
	bh=r4vBtZGzMSY3w44LNP2WSbN/PdhlBAw89h+kvrRSONQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mpVbdCY2Va0Smw/rNAyfLNXZVoH/jmvic4/QBN87YO/il4dDjTmTIxUeqIrZcbWhe
	 KiFlCwNpebrNjrt4b64IFuM8D3ERAK8+2I9q4nejBmdaZZyD9+WodxHqtve1gShgAm
	 09oAF/sCZgTw+UxyigyNNI8sMW2sgMf1OBmsKamG3ETXoltoHj5iU12xADtovxk65/
	 cGPKY4cku6ubJo5DPq3PvF7MPyjw2rwHqNOOsw0AAsiFIfv0NJNcKfBHnG5iZ4/Aa7
	 M2elu+gDn6mlCUaRn8UpL67AvmcjHWyPCmDE+uihqfMaeHfgmL1+DL09Tp+AebD7V9
	 JD3M5oZUxc6kA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81A7317E35F2;
	Thu, 12 Dec 2024 11:04:52 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/8] arm64: dts: mediatek: Drop
 regulator-compatible property
Message-Id: <173399789246.41280.12946526807536049492.b4-ty@collabora.com>
Date: Thu, 12 Dec 2024 11:04:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_020454_953355_D39FF69A 
X-CRM114-Status: UNSURE (   7.68  )
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

On Wed, 11 Dec 2024 13:24:18 +0800, Chen-Yu Tsai wrote:
> This series drops usage of the long deprecated "regulator-compatible"
> property from MediaTek device tree files. The property was introduced
> in 2012, and then subsequently deprecated after two months. It was
> never carried over during the binding YAML conversion.
> 
> Drop the property from the MT6315 regulator binding, and all MediaTek
> device tree files. IMO it should never have been used to begin with.
> This also gets rid of any validation errors [1] related to them.
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[2/8] arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
      commit: a6d5983e40f5d5b219337569cdd269727f5a3e2e
[3/8] arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
      commit: 4b907b3ea5fba240808136cc5599d14b52230b39
[4/8] arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible property
      commit: d1fb968551c8688652b8b817bb081fdc9c25cd48
[5/8] arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible property
      commit: 4dbaa5d5def2c49e44efaa5e796c23d9b904be09
[6/8] arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
      commit: 2a8af9b95f504260a6d8200a11f0ae5c90e9f787
[7/8] arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible property
      commit: ab60442f26b15ba69b210974722a851ed03188ff
[8/8] arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible property
      commit: b99bf07c2c8b3c85c1935ddca2a73bc686f8d847

Cheers,
Angelo



