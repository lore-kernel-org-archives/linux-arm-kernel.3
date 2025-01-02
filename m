Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD8BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6hEI7kx07brNGco3zUyQa7aElptoApNRUtcNC4rTTU=; b=btJIc50s+DCBQVQJopscfliQ90
	SoykyckqLE2PRW+xahCGhoPvwxpxStqX8sERsWz85fGr+zm+Fs+4u/fG54/PFbtVDV5nklqQYCUeK
	B31cISbbavb4Eobq0hMd8GXRm9jR98Yv1w3dYpExNPQN18NYPjMeufukQBz0xE8uQmK1DHJ2FdU0t
	8hAaPElMUox8LYNWIlfgEUugTHlBFKFN/gPLSBfWaEoNyNqrriuU8ngwrWWT3rObfgdrQyulwY9hb
	hNeNamBOxjCIlSWh7irkSZMNwXyC6Xvp/ZBhETdRDw66gpyNiRaf/PjBxDK1co/+5G+gElQ1Oq7Ku
	DhOg/HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKen-0000000AOeJ-3Oly;
	Thu, 02 Jan 2025 12:50:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKas-0000000ANcr-20AZ;
	Thu, 02 Jan 2025 12:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821988;
	bh=sNS3yO4duFHIJRGQLLIdmw3fGnjbVp3Puh6hUmcVeLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pomt4eUa/WHnuD2B2I+BFseG7nzSeZyxrXCk+zoGdYWDHFfQ22aCQCJj5O0MDuXvF
	 f3cWCSkIGrZ6Zrw9/6EoQFA8Oab/gKk+z3aqX4T30VeVRnpORu0l+b2kwHlQQVRH8E
	 jtN+RfccmX7et3iRNxM4a5SFYbrD/D7lt2RjypmK/OBSMUTF77aUOrck/om3Yl+Gjc
	 zWvTcCgvnbMP3TyMfKOE50OTBcswYSTsKoPHBE6AO5UKdWMY8M1mgZqTrwlMxAG2vx
	 TWDsjbauB9RgHos/O4DQZOSeeBwtTSQdOwttQT9gaco8qk2RrorYRRaZfZhDMI1193
	 AyW4/SSusDiew==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F47317E1570;
	Thu,  2 Jan 2025 13:46:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241220163838.114786-1-linux@fw-web.de>
References: <20241220163838.114786-1-linux@fw-web.de>
Subject: Re: [PATCH v8 0/2] Add Pmic to Bpi-R4
Message-Id: <173582198832.163596.11661703686589074708.b4-ty@collabora.com>
Date: Thu, 02 Jan 2025 13:46:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044630_703226_58270F4C 
X-CRM114-Status: UNSURE (   8.43  )
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

On Fri, 20 Dec 2024 17:38:34 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> After these 2 Patches are dropped from my dts-series [1] i verified these
> with mtk and changed based on this.
> 
> The problem was that voltages from BUCK4 and LDO were not matching the
> voltages from schematic.
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A PMIC
      commit: 32dfd25b2f7b8073d016aea12e9c1b7612aa3daa
[2/2] arm64: dts: mediatek: mt7988a-bpi-r4: Add proc-supply for cpus
      commit: 2798f51df86eefd8584557c9b9ee10f92c674849

Cheers,
Angelo



