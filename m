Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66C0CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTF97Kd6W3WUQyV9EptgWTJTCL8FDvW643/bkmmD2vA=; b=W/in2P8D5mt3mjsnaIIyqTkmSm
	ybUzraZqkoCQJDb2JCivfes8yrFyQIUrwx6amX6wkOp6r2FK1hBjQaaPkhUzXASe0VbjEGRQs5ItG
	WcgYqR8RhNFVI3MTmcqt7bN7S5Gkf+hd2xesCmjZ/2HFSM+0sKlrqP28cO6wbfl59vhLrKZe17pfz
	J6JUasg3mGhWsLyeOjUwNiZAPVGqD64AwswIWQlgRiBcB72R2EsOyY0Own6fWDb7CHbSbyj9OdMXN
	SHOfA4HvwRtn7vlpb4Uu8fjhHPHwXQNzT3VnUCeo+wqJ//aobs+8rzbFBxsTHunFsK5RZfsXM/bQ3
	fJFTm9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtzJ-00000005O5c-0K5j;
	Tue, 09 Jun 2026 10:47:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtzI-00000005O5K-1fvC;
	Tue, 09 Jun 2026 10:47:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B19760172;
	Tue,  9 Jun 2026 10:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A921F00893;
	Tue,  9 Jun 2026 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002035;
	bh=aTF97Kd6W3WUQyV9EptgWTJTCL8FDvW643/bkmmD2vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAjmjkmNUGQASADxrO2i+LYGgcDEblBlP4n0z7h7XGH+P88yCHs0mTyqdpq90dp8u
	 yQ6CGj58rgXsrPku93d5gF3xgZwfL4KX+yvcZuxab7Pm6I/Mck/k/usA7h3NMJIeLH
	 EGqazf43XlTOdNjjij+a3uwHaT8Hl9Ltyg+5ggyEIwOwb4U0Lv1YTMKpxHXO3sB9hM
	 hPT9VDF50xUXSeg6TpTuHucDwiWyKPIvWlLuiM9dySh7NmfyguKcFUy39Bfs8iuFs4
	 iPoqNQhGPGNw3fpnCN4DIK3bdMrq2f2KmD+2qrcL7PM1urOiBNaKm9t9VT5EGKhmZt
	 NQujfkgTJ6flg==
Date: Tue, 9 Jun 2026 12:47:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
Message-ID: <20260609-daffy-hot-chihuahua-a3cd23@quoll>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
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

On Mon, Jun 01, 2026 at 11:12:20AM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.2
> 
> for you to fetch changes up to 9897c586b09f79ebcf2e67a888743c046b20d254:
> 
>   arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T (2026-05-25 10:43:10 +0200)
> 
> ----------------------------------------------------------------
> MediaTek ARM64 DeviceTree updates
> 
> This adds improvements for already supported SoCs and devices.

Thanks, applied

Best regards,
Krzysztof


