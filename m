Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A6FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufNQHB5y1kKuFlwdnfDomVVrFhvpg3bLVr1ubAMonpc=; b=a4FSaPHhuoo2ifrL9qDJkhw3qI
	pkFvO163Q9II1e1tbdN8kr2NVy4/XIKNsMXOIENqA3xZ72k6rHw4W5w5AeZvAxxVgNgVmxJuWPIRh
	Vm20vliRcxuTgU1y1sk9vJ+8wHNOhmTU4YrrGXl0msz9tmBZwvBfClAKV4doUH7koTm4aRgh5FmJl
	So4tM/LaZ2T68O1nba72fRF1QGl+NlCaN37aCfcAxMf3hRPkihFcSbrDxttYJzxmLQ4HylRBAX8Vd
	tGoHYUC5SwAl1jQQGDFfukZ+iZLLpNeuQh2vGHpqyILozZg3y+5qDid96ScBjwr6t/3WyenlO7kjg
	RMiKCT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GYg-00000001N2J-0USg;
	Mon, 14 Apr 2025 09:56:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GV5-00000001M6i-0dLw;
	Mon, 14 Apr 2025 09:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624389;
	bh=IyUJULX3S9F86yY+MBzb6IpODO+Fjku0dWLZ+d6MTyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pgVghn2rFLDSz2CyLBQwjFhctJJpfsFLpIirK4jpP+AeGPiymdfEL2iP4Fk2PPeba
	 pY5I28DN+kiAsRD+Pnmft8ijLjrca0VJJvUjB2iVZKJjbWT0Q4ja9rerpYZAJo9ihX
	 WyUXbJbaRJts2NtDbS9md9M0NpgW51e4eK23bWeeHu6EENQwqTKvpWpgn3dl9O5kP3
	 Qzng0GCgce85ccJSbayvmnKH86ZiDTn5/dEhmS6EOwnsOq7qKcfAr4yJ35ehWyqsj2
	 ss6ZJfDuYkL+oYKQfiVkCHVDDHXaNv2WVmcK3gsYq73UY+rV4MUu+2WGbWwNIW1tsD
	 y7filbTK6suPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF0F717E0B2D;
	Mon, 14 Apr 2025 11:53:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
Subject: Re: [PATCH 0/2] mt8395 evk/radxa-nio-12l Add scp firmware name
Message-Id: <174462438876.45420.17746859867789680611.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025311_361261_FFC1EFE1 
X-CRM114-Status: UNSURE (   6.55  )
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

On Fri, 04 Apr 2025 15:53:08 +0200, Julien Massot wrote:
> Add missing firmware-name property for mt8395 genio-1200-evk and
> radxa-nio-12l.
> 
> To: kernel@collabora.com
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Macpaul Lin <macpaul.lin@mediatek.com>
> To: Ben Lok <ben.lok@mediatek.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: kernel@collabora.com
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      commit: 898b289ac89bcd0c793bb5b894d29599ab447fd5
[2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
      commit: f19d67bbe6cbe375dce9976ad1e9690aaeaa33e1

Cheers,
Angelo



