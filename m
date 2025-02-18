Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFdpKfQ7C2W9Oj7VGUvEAY8Fc+y3aBTNrlV82PaCvmg=; b=D6o0KLxzUpQNGh47wOEVNspY4c
	tdGvzohJ5fRTJWnl++RvF6zLtX24GAq2MzirjDje5/1gm8sAgwsXL1/c8y+0W3M+JFRvNDsfq4Ftr
	NERnoauXUc+bEm4rG96P6hqHV54GUGRN++3D72tdBcD0X/HX9b4crSL8Xp7ZzJwepJ/z1ANZBI2TY
	XDZ/ZVuMUKz9xPdpDkAVqbN3Q0Yfi5el9GRnacv/6eUTAh6NLLC6Sz8MW28hKXmwt4GMMKEoq1raI
	t584ku0avzVd5kgwOl42B3+wuygUVfSGWXztkvs8HSE+T99sTErb1VVlprbicfGdhPq93p/vVgU+3
	VnZ7jdKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKBC-00000007a74-3BVz;
	Tue, 18 Feb 2025 09:46:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJwT-00000007Wyj-1vou;
	Tue, 18 Feb 2025 09:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739871060;
	bh=gdM5DQcxZBS/e8r37Ipv9sL8iSC/Cab8RRfz0hlJYAY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dkhD9sbMIGpKOvtK1xiPaRYQQPKmOIj1E8sweMdEoEgwWkrGCtXDBDXUrR//2WNbM
	 0hTENgdFwnXyj+N3ShBPi+KjWrLpo9MmMzOUBZV36NH7PYaX5bWIBL9WPn/PRdMsrx
	 x4AjWsbD54frLEFmDNM8jjWCFIVN9BQm4AakKVRa7Hb8WScedjh8oHjFWLBGf/fzs6
	 ZcJwIyQfiqC34Mh4PfKbTYwdmXZ8GSH6pcrE9Pk0Jh/Plbx3puKKsp6E0k9XeTP2Me
	 Y/2/V/K1WiKdsDdl5A7ioXbfNqEuuMEe3ijyBMXr/CSssfXrHcB6Mo57crE072bnw9
	 2fFkNEwGRrbkw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B758B17E0391;
	Tue, 18 Feb 2025 10:30:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
References: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
Subject: Re: [PATCH 0/2] Add entries for Mediatek MT8370 and MT8390 SoC in
 mtk-socinfo
Message-Id: <173987105966.25011.5338688567610435549.b4-ty@collabora.com>
Date: Tue, 18 Feb 2025 10:30:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013101_646940_51C51690 
X-CRM114-Status: UNSURE (   7.03  )
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

On Mon, 13 Jan 2025 17:13:22 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds two new entries in the mtk-socinfo driver:
> - MT8370AV/AZA (also known as Genio 510)
> - MT8390AV/AZA (also known as Genio 700)
> 
> 

Applied to v6.14-next/soc, thanks!

[1/2] soc: mediatek: mtk-socinfo: Add entry for MT8370AV/AZA Genio 510
      commit: ef09daffcb9b40277de6738941b1812454fbfd74
[2/2] soc: mediatek: mtk-socinfo: Add entry for MT8390AV/AZA Genio 700
      commit: 6b4506d01ad5db5a157ec34a9f3e0a07d6efe578

Cheers,
Angelo



