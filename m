Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9EBCF6A8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJJ+nrL2N1NJpqKAWTqW94xxzyWqJzLyWrFoyxVz8eo=; b=mpxCA35fmaemRnELWqYYe4mpUt
	dVQE2Xcig/KUQn2F/c1fNVtIC+LxqqFebrlpFVa6srTe8v6/ayyRszxd77Pl5ANKpSyYx8sEP61X4
	Ciuz4PNqd7JEzpA45uhJYKz5BfhwwutUPc+cqBE9m+pmf3mipUKBhdyKh+2DmSqI74M321jiPmXLl
	yAZYNBC4AbK5kyeuzzSRYXoCX/dP8gOWOugDW2cTmrRDuImN1rxTh5UEk41e3qealHXoSq0KpQdaR
	tJEip9iaEx21aUGJrBoKIkcok8IkGKEa9zKV/EQbCxmwBDW0WpGY++eq3t5+bjChgSioFIbeUM9F3
	63uma+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmDU-0000000GQnA-43Sa;
	Thu, 08 Jan 2026 09:22:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmDS-0000000GQlr-0blY;
	Thu, 08 Jan 2026 09:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767864118;
	bh=HJudoobn0KgMRtwSmg9vjOUMp+h8/0xAejDGR9eBhXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gEXcOA7ehA+8VeAHXaIEK8wYSwb8zYkdfoPaXkUN3VCNKy8uF4aI4NeYbH+jMPCZm
	 N2uvIzJ6xH2gexU1FRZbD/DAt3zrqyixkluhyU4NKgnbtwG98pedCBJC0P3cKhe1gt
	 rIymzYG9iKl/PqlXMbYxroOprLCDK2tSlTG2ajh/OACthtM1gyd0F1hOFCk5xfy0Ey
	 nwyNDefPPEDdtrLj7KQdqMwrQC5IbKFZOz4hJrtyT+HCsD/GhFAfXIfR3lcQyPc9aP
	 c6dDkShEgpxcfmYkGkADorGMt6t3QRQXFUnD0+5MnrtTUANzrg/slZezzrmwqW7Rcf
	 9AKC8ADYySc7g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65AEB17E0181;
	Thu,  8 Jan 2026 10:21:58 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20251209-mtk-socinfo-mt8371-v1-1-155a9df851d0@collabora.com>
References: <20251209-mtk-socinfo-mt8371-v1-1-155a9df851d0@collabora.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA
 Genio 520
Message-Id: <176786411835.10140.18238979278102973038.b4-ty@collabora.com>
Date: Thu, 08 Jan 2026 10:21:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_012202_332143_C775C860 
X-CRM114-Status: UNSURE (   5.48  )
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

On Tue, 09 Dec 2025 10:33:20 +0100, Louis-Alexis Eyraud wrote:
> Add an entry for the MT8371 SoC with commercial name Genio 520.
> 
> 

Applied to v6.19-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA Genio 520
      commit: db6dcaeeb60f97ce9765d50035be23c0901d7348

Cheers,
Angelo



