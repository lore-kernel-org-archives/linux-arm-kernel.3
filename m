Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D34C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3D4nH1p+naF8oioYCdct+bZpmppfDAVKQQ0pBSg6hJg=; b=wusHO1SX8/pMrN1VEeiy7RufKl
	vJR8EzvObmUAg9CtkdUfgA7BzjZOGEe/NRn1J6HoSvPSsPCdl8Liys2wS8pAqMwODhXo1QOYEBzXr
	Bt6x5ZZpaEnQj2rDup7pbGOq9zuuzilPVLGFhyiFfoh5IQ+5GZyBUvgk7Ojl7didZpDAikuNZa/Sf
	kkhhRzikO5iIOPWwt1pse8DrdfPHTE44rgV7gDhZzCd40ZBgEzj+vSTPZuj4Rwutk42+sqwbTLzHH
	QVUwOD3l/DS/7iodMXsc+rEVHgXvxDJ+NfX9gbVKnIbOwK3n61M2gNgxg4k5tIxAvUWL2dRPbkvpQ
	DyBGF6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJvB-0000000CIXg-3e5G;
	Tue, 20 May 2025 10:10:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJW2-0000000CEce-4C1w;
	Tue, 20 May 2025 09:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734245;
	bh=81YVmuYmtevEfhX9x4J6/zHe3QClnYVcSg/NVZegBSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QBUiKiZwaqEouo9eYJQ6b9MM0XPCBI2jnnCyimGiAG8Ulr6txqDgdAnGxC89n/ke6
	 LjiWvj4MUFLUHnenR3Ot+o7YevHG/HAcPXNs4PqXLw+Nq6w2X34NxJ1Fr8uKnIOHcg
	 gvZF/8Ma+GR1k92PS6d4UBI3fxMv1HFytDIfM4SuVopS2VS61oEUb0vseqY+dvu0BL
	 vEYCuoyzb1iSqUxVKPWIV7knIxEG5uPsVuEnszDKj2qqhxZX0e64FUZTe+8+T1VTVq
	 IHA1buGl4nlqICet1BMStUrFoHZAG1o1DzdUi5cFzQCK+L9u/mndtZX7BF44Tkh3zc
	 FH8J8SOWKxT1w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFB4A17E0FE5;
	Tue, 20 May 2025 11:44:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
References: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
Subject: Re: [PATCH] arm64: defconfig: Enable configs for MediaTek Genio
 EVK boards
Message-Id: <174773424476.2901578.7109647684484482687.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:44:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_024407_183464_C067725F 
X-CRM114-Status: UNSURE (   7.89  )
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

On Tue, 13 May 2025 16:59:41 -0400, Nícolas F. R. A. Prado wrote:
> Enable the missing configs to get all devices on the MediaTek Genio
> 1200, 700, 510 and 350 EVK boards probing, as indicated by the DT
> kselftest.
> 
> This includes support for:
> 
> Genio 1200/700/510/350:
> * MT6359/MT6357 PMICs Auxiliary ADC
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: defconfig: Enable configs for MediaTek Genio EVK boards
      (no commit info)

Cheers,
Angelo



