Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90DFC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW+1owoXB17P5r64LajIjS3sX8kkAAWkaGx1PzmHB28=; b=13ltdB5H+ck/Tb/nSEn3bGEtBk
	AX1MqEOKnIquMuIeTQtKAIfJSGWnT3boX1lfxRvhbxsi1NmQXgrhK+lhh2mbTW8XB8wVK1Xk7cf+0
	r+F+XHenfDL0elABkfatQ7uOJm89EF7ydNr7WR7Pm3aOQ80H6pQjyoE6cHeXpwMlu7x3T8rDBkANh
	ngmPcEGu+j3/A65NnrwQ32l1KZQmfQXP6JUJe5OWqWUno2FazgBDAGOXV5R51GhroYEqJVqTISQYI
	v96AJKPtJMspfdyX79tbhm9Qofb3yw2g5fceAGO0kdTpg4wIONuRN3b+4EA6IwH2FwwM5fxEbm0X5
	4xFVKw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQ3h-00000008mdE-33ZI;
	Wed, 25 Jun 2025 13:21:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMrr-00000008EDj-38F0;
	Wed, 25 Jun 2025 09:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750845393;
	bh=4xm4c13qx8idD1PxG/L3wpwYyNMMWRmKlcFlDq52U5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WdXpS5PPPTIiIaoqFVj5y1vTb//tmgQC2R/tV/xLrxtk3pU8M0Eh7cdaIqJF7Wyss
	 kJeB3crnj6hiXOnmidIzo7ag7KxtJcE/ZCUY8Z2he8A4y2257zSIgmlhLSGnmY9BwX
	 +m7p00yI191UDTo1b/8B7IDPl/rUEtZsjpYwIV1LbnukwMIheKzc53cMCpCeqhd8gC
	 Hn0fKvoXtXeBflrQJyP8iTKiLUAUUVHlgzBQFPQfPGNd5p6lmd8VG1pBcRNTzza+Ey
	 m2RlNlgKWCVIuHY5RYeZQcgUyAjwfKAonV7qo62XWD7ct2NeYB/28CnPDLReXZ9Ubv
	 sZC1xdcMPCyIQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D4D317E10C7;
	Wed, 25 Jun 2025 11:56:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20250520-en7581-net-v1-1-5317f8e829ad@kernel.org>
References: <20250520-en7581-net-v1-1-5317f8e829ad@kernel.org>
Subject: Re: [PATCH] arm64: dts: airoha: en7581: Add ethernet nodes to
 EN7581 SoC evaluation board
Message-Id: <175084539329.84221.11886997318219077095.b4-ty@collabora.com>
Date: Wed, 25 Jun 2025 11:56:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_025635_934771_D30BF7F9 
X-CRM114-Status: UNSURE (   5.57  )
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

On Tue, 20 May 2025 15:41:35 +0200, Lorenzo Bianconi wrote:
> Introduce ethernet controller nodes to EN7581 SoC and EN7581 evaluation
> board.
> 
> 

Applied to v6.16-next/dts64, thanks!

[1/1] arm64: dts: airoha: en7581: Add ethernet nodes to EN7581 SoC evaluation board
      commit: a40b35819ba9fce0e942bd89600cbd78da8304f0

Cheers,
Angelo



