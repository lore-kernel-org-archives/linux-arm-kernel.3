Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9765DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SABbFY/qxErVZKPMyB1FiC66VI0bD9AFwxwVAuQIfBQ=; b=CR3IOKTaL/9JQz9g7BbVfWtygA
	TWxsD7CN1UYSE2cv/BhHxoFkfNxvVx7vt3D4wFdUO7A7t5QltjxxUA2APuX7j6zy14EvlS3PonHHy
	ApdwMTfDMPfmnFhCCpHoWSHcVzPTjoIeBwuGx1CE33iE57pLpw+PAeHNUh1WZUKfyUSbQeqB4U+Kv
	NqlUyAKn2f8DCAlMWq3+HIhIZqjwP3T/KAszNvNOMvDsNDneL25KYQnpY9W3wlWOWrmdyQyfp8C+N
	URAS2J4ClC3TFiujgzxGektmBDTQ5SJKT/iq3oi62CVEmc9xS03kv5+ni0JLSr0lQz24wiMhe+3y8
	4HZKSmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrEV-0000000Gaah-3TMU;
	Tue, 25 Feb 2025 09:28:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqpn-0000000GUwC-24AC;
	Tue, 25 Feb 2025 09:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474153;
	bh=N8EaBkB/oPq7vbJ2oYiO1rXY0iEuTlwI6ZV3Cw7DVEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QF3FdlHDy94YWVjPk/9NE/OltIQBeouYkO2vfUTC5NKlTWXRsS2fpVAlOW1aIeD8t
	 jXD19h7+uauWWYnNm7S5DbAH77kgKfg8fMSz/2aeh3cey2MHkgNV3YEH5KvyiOZWxN
	 wQnXbAZPTZFDtnICeAE/dUQuUgsAmov6ReQOWLFclwQhcov8pOEMysz0r+4CZiUC5X
	 iLrUZLYswO6MJA4OIz2pYM28NEGEONkpCiCyBGjn4ikaPeKFHmk7j5CVQ8rYg1A4BJ
	 zXqnby+lUGwX1gf16AMSB4UnoSsEfrmdZsQISJkWXifKzPoyd3k7yVpIc6uoLaAONb
	 o/hGgNj5tI4uQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4297D17E0CFA;
	Tue, 25 Feb 2025 10:02:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Chris-qj chen <chris-qj.chen@mediatek.com>
In-Reply-To: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
References: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add ports property
Message-Id: <174047415218.19243.9815306970624641790.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:02:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010235_724412_BA32814C 
X-CRM114-Status: UNSURE (   5.78  )
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

On Thu, 20 Feb 2025 22:22:30 +0800, Macpaul Lin wrote:
> Define the ports property in the mediatek,mtu3 device tree binding schema.
> Include definitions for port@0 and port@1, specifying their roles as
> High Speed (HS) and Super Speed (SS) data buses, respectively.
> 
> 

Applied to v6.14-next/dts64, thanks!

[1/1] dt-bindings: usb: mtu3: Add ports property
      commit: 3aeff53c57c86981f9920e4d5ae7d00b7d62a671

Cheers,
Angelo



