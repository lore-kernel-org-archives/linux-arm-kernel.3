Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB81E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRJUF7mofvchnjcKOdLStL+3WXxzRtiugAo8D2e5y70=; b=JG1xyZynD8DnJtNCLEzonGP02t
	BnY1uRirl/1pDoUElcY2eD6SMrcbsGHsnvbt0PcbjsgyiOrTIT9ynBWgrDGwdKf+gwEb9ea4Z6M7a
	KQWBQb8IEFzerYvAWM/jRR38gpI3MA3mQGoz4OC5ZHzzUmo5fAXwFH+7OCUvAFpEQzCYUfUKY71md
	LK+0kub2hfgiz/sJ2ZVYU+b3nhUOkDnkaQHzULgfQ3Fn4Lx/r0IkXR9hCAH3Ak/bijG3wMxt10FS3
	X/K8bCbL9MFQJFiyIb4vOu6t7A8bXg4kf/e/PlxMaqngNKX2KPCEaJQBSs2XUBvf98G9dozDBNIu8
	+vdfIQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg1h-0000000HaKB-43tE;
	Thu, 12 Dec 2024 10:02:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLg0S-0000000Ha7m-32cl;
	Thu, 12 Dec 2024 10:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997674;
	bh=OWSgiEhJaL+pZfcPCTTqqXIPHvYHJbsF2A/UC232kCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KR1COHTirNAVAEP+sJvz3kUWoahJNZ4x8TIuQ2oIXEMRbWzRnJNlJIo2zX87IAd9D
	 O29iQLQIX2Any5WF2Q5PCcuwMiN1AocR4UBHcBT3rzzTKx3bRNvi/F/7KdK/5N6Wib
	 cpmcZGhrSh8L+O2HrkFRTYRT292NGyU/35+4O7sH2Gf5wMdx6VDiAdchYYQllFH1iO
	 WLO9cLT/pfazH1jGiMaMV3asT8tUQIDhRDi83RXHXIj1+KDx47GoRZACtVC7nC8YwS
	 0MWT4kiK7yx2Lk5CAKWLP2C75v0KVutoddBiXq41FXevGYqs2mL6J9rlqJRLldEDrg
	 koBG75WZ821/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DCE7617E35F2;
	Thu, 12 Dec 2024 11:01:13 +0100 (CET)
Message-ID: <ba964eb1-324f-40f2-a5e3-7acd441cd218@collabora.com>
Date: Thu, 12 Dec 2024 11:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Add
 sound output support
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 Aary Patil <aary.patil@mediatek.com>,
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
 parkeryang <Parker.Yang@mediatek.com>
References: <20241210-genio700-audio-output-v2-0-c50886ae0be2@collabora.com>
 <20241210-genio700-audio-output-v2-2-c50886ae0be2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241210-genio700-audio-output-v2-2-c50886ae0be2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_020116_927692_2459804A 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 10/12/24 21:54, Nícolas F. R. A. Prado ha scritto:
> Describe all the components to get sound output working on the two audio
> jacks, Earphone and Speaker, present on the Genio 700 EVK board with the
> audio DSP enabled.
> 
> Co-developed-by: Aary Patil <aary.patil@mediatek.com>
> Signed-off-by: Aary Patil <aary.patil@mediatek.com>
> Co-developed-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
> Signed-off-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
> Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



