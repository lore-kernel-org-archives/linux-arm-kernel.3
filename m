Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE42C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M58RpA4bCeeCl3AORbGOjEIwjSHSeOh6hGZ/du2O3yI=; b=4dhlVfc9xK3o7i+jxX1o7naB0M
	GhU8Ef2SErXYmIEe9fxDFXm7d26ndBeWZDb9dgQRaHdG+0YxdWsvdnnOgb8TO8bOxmBR0ypTS/d5u
	//63ySF/10Db8XuQaEiPYsh5MP/hkY9yqp9JoDXCCg5pzCIvb0dpG/lt0oPQPl0VFY7f0oTvtYRfK
	KXZNzSEAMKe4EHBOyTEmqZAdZpUk+fKQO+28BY94mTEce9fvRq0TgLdEAez6E/qb9VkrTetW6t6dy
	JJJ38skaxYFHzRJq39QEBHt8iiF4B3+8gc9QMouks1EALIifkbMPzYDVgfrEENFh4TqsvC36vqWkO
	M+aoqBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndzH-00000007XpJ-0Swe;
	Thu, 27 Feb 2025 13:31:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndsr-00000007WWK-2juT;
	Thu, 27 Feb 2025 13:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M58RpA4bCeeCl3AORbGOjEIwjSHSeOh6hGZ/du2O3yI=; b=RC2kRLg5QXYW/pNaLYGNM8YFUa
	89kmtLgjEtoWL5PNpA7p57TVC85FBvooUHcyy0BbHvsLlnh6wA66T1NvnKuU41EIvbCXWcfXLGh0X
	/XoHdaZmlBWlKt8CwHK9oKiU4k6hp7CiLG69FUDH5+YXyQBGdxJA+X8LIr/fGyLjNfHuM8Bqrt8Xg
	HTydLqRJxLp1UOybjNp8KPRxGPIBWhp2eE8ZVMd/GnA0ywAPuU4jTz2jFvIz9ty+9eHxo13HEiUld
	Q3OD0rYkwV3ldOVbynkWL9i3MOsRcErbwwmfmxQwDGoIsNcopelW3pG+JhtVo/XNgXO4W7Wmn13E0
	VEgs0+OA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndso-00000003mls-2G9V;
	Thu, 27 Feb 2025 13:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740662693;
	bh=AJjwwKgwMjC0SHvP8uGYEB65jk8pzela6cd/RTnaqyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0QoHOnX0vfIw3O2gfZkLHAuREA7zqlhfAXRUqRTnz3tMmR/P6bX01jtVhZhiSNsb
	 KTMNTR1tfU2FzIvyQqXfXlCtiViHA2xQpirTrCZasgyrGvdKZe5VP1H7H5QZcOx4HJ
	 qj4S4fh5MzByO2uVP/AZyX0b/VihXBMYEfYMfhMmGi/oSFuTszR36M2WAYkjGeWBHO
	 xddc5dHCgX1E2TaUKfH3JVOLFbsBUXNmMNbgIlNXkSpCEKvs64nGWwgq0QvrUI0Uh5
	 sXITq27v9U+ngQ2VQ4Ry3NHafY+G5CHE39/9I3E0ijvX33261CBk7246U5tf21hAWv
	 lpAppYbIn3Ijw==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E41517E0880;
	Thu, 27 Feb 2025 14:24:48 +0100 (CET)
Date: Thu, 27 Feb 2025 10:24:46 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	parkeryang <Parker.Yang@mediatek.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8188: avoid uninitialized variable use
Message-ID: <34a4f185-f4a8-4055-bfe6-68be9a3a7a89@notapiano>
References: <20250227131939.1040168-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227131939.1040168-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_132458_828309_FD2E01E4 
X-CRM114-Status: GOOD (  10.59  )
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

On Thu, Feb 27, 2025 at 02:19:01PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 'msk' variable has no initialization:
> 
> sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:311:4: error: variable 'msk' is uninitialized when used here [-Werror,-Wuninitialized]
>   311 |                         msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
>       |                         ^~~
> 
> Set it to zero before the loop.
> 
> Fixes: c1e42ec04197 ("ASoC: mediatek: mt8188: Add support for DMIC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Sorry about the delay, I was about to send this myself.

Thanks,
Nícolas

