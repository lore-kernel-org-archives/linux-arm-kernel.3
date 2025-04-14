Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C9BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNK4tbSvQf0/jG5oxSYz4fI1SNH3RORlMp6yrXcQtOk=; b=aMOsfVweygUqIjbNydfoxiAi5w
	G+svNtKADAGkJ9cJWSmmbrhb6n7uqis1DBGFf2X85E+vlZZPUscZMGgr3NSFvzX07Aguinp5DNvvn
	Eoq3kqJQgC3FF8nO4RD/DcmbEFLUb6k7XsvmwBX2mhKEOH6oj1AgQFs/GoIv/RxFurxJYKUTcX86E
	9ctoKsEyYnh1EccFy+4AsZCLn3O41PyUGPAYF7FS0AzevnB1//8tMwEsV2moDwU5IVkFjVucWRRuo
	xzmhzfdWi3iU/VaJ/qJ3haiYmsr1hYaIkSByRnWBPqb0aJaTKfUvEBd5jI73GGCgOnVzUvD2Aefac
	1HJEdl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gfp-00000001OY4-0TjC;
	Mon, 14 Apr 2025 10:04:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GV8-00000001M8e-0B4A;
	Mon, 14 Apr 2025 09:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624392;
	bh=7yiHK60DhprzKhGNIX1fruwTLFwzej2Kyqv50AvzX/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UHkhIsaJB6swO6iBEaBg97cIqBfUw5fvjWLH5IqGHi//QVBxpsW6osgfuIUHkMLyL
	 KTkTSJ+prcsD/WgWyCQmzdhQ0wWU+spd5TE24gBHwIhYgflHl2CzGDGJhp/8JtKvJw
	 6NjVQswHTGaAAp+DTQZyUadsZTdr8NNsO20Rtqx6GC3Bp+ewQwnssiVor+iVs5g4c/
	 GHMeuuhXB58VtcBCgAYnAAxfL2Sv7aYB5oM0Wkt/Iqbu7hHAjhp6xQIWL2UIBYKxP9
	 wln6TeLn0Ym0uEbjrp1Q0L8yBSza/otXcJ8pA24BCJAb5jG+W3/+dY5YI/uMs1+dct
	 KVZROnRkw7ugg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23B9617E14EF;
	Mon, 14 Apr 2025 11:53:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
References: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add jack
 detection with accdet
Message-Id: <174462439206.45420.6727023772221653939.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025314_221659_AB5F9703 
X-CRM114-Status: UNSURE (   8.36  )
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

On Tue, 04 Mar 2025 18:43:49 -0300, Nícolas F. R. A. Prado wrote:
> Enable audio jack detection for the Genio 700 and 510 EVK boards. This
> is handled by the MT6359 ACCDET block, which on these boards has the
> HP_EINT pin pulled high and connected to a normally open 3.5mm jack.
> 
> Add a phandle to the accdet in the sound card node so the machine sound
> driver can initialize the accdet.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Add jack detection with accdet
      commit: 691712b065d349bde7d5561aa8e1857d38b7c65a

Cheers,
Angelo



