Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF19E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmVR49NVWZNNcnpKmMK7nd8rZLFsyx86YVVV+Sj9C1w=; b=P5xxOlCOaNsK/K4QI/Zc2eltN9
	XDS2Dy36uRB4n97uTunNd5FYpB3Fi16M0bcRA7jaEPnz2lu57LsIwBcPrxacs4/qRqBs14F315HI+
	z3y6MbGNADGAzHggQ7aytUZpPfVG6ilmNr4xBN9GAcEcZjiVJOEX+3vnSPgLPtBSzKueZ7q4nVPBm
	keD4ry2ui9hjDsK1dNVYNmRgHNN+ifQJf9MhYy1UXiWZKdu02CYp1rSPIBLq+MVJhjHW6tGmVG6wn
	shstI/C1sB9+yvxQj/Jhg612jmc/hEDmRBYkRWUQR58SlhIaU2zxThjSXcArXM0c70gQY+c+tK4VA
	kwSJtkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhQr-00000009yzE-2IVD;
	Mon, 23 Dec 2024 12:21:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgJW-00000009rD2-3CfX;
	Mon, 23 Dec 2024 11:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952168;
	bh=RQaR6wMhKGiIO6pzQn1JHnhIbVM6q3lMhZkslpK+X+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VIdiF7746zCuwnGAF6HeCi8wqd5H+GYN5bEHUXKnoUfvMQ4toop2wbEPMkXvXEcQE
	 qKva7uYI+jFmd+TfuXKe4VelZAUDAPxrY9Ulzl2hITIc7zSw5ooAW9Zf7MQHN9WwdX
	 CCjhZIl6Sa2JgLFNbk1rfJJBj0PcAvNO6fmXETX5hi1lqbWUm4cw3/4041p98MILoh
	 pY8ICRQt7ZZ3dwjzplqxweOozpYrUWcIda8pvAxN2LqhuaiLytzYbQ1M+zF8Hc2PTn
	 A//y+pdRP5JQwwS0UwR0URpQplmbUCclW+mOAa6G7jdfKAw6uItZ1Efi/Byj1Kxq99
	 SeMHhFv2sboQw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2641517E3632;
	Mon, 23 Dec 2024 12:09:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
References: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
Subject: Re: [PATCH 0/2] arm64: defconfig: Configs for MT8188
Message-Id: <173495216807.35164.5807973661855244389.b4-ty@collabora.com>
Date: Mon, 23 Dec 2024 12:09:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_030930_996465_1363D89F 
X-CRM114-Status: UNSURE (   6.68  )
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

On Mon, 16 Dec 2024 16:51:24 -0300, Nícolas F. R. A. Prado wrote:
> This series contains a couple configs needed for MT8188 platforms to get
> working ethernet and sound.
> 
> Tested on the Genio 700 EVK.
> 
> 

Applied to v6.13-next/defconfig, thanks!

[1/2] arm64: defconfig: Enable sound for MT8188
      commit: bf6c63f066b68eacdd43d4f360ac8dcc5110e04e
[2/2] arm64: defconfig: Enable MediaTek DWMAC
      commit: cab316255951188fb2847af04f2123c1ab85dadf

Cheers,
Angelo



