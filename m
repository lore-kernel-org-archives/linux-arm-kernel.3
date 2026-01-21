Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65516C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GNMB3FjoeNxpLD3yr2JMnbh0OOReOIXlnt2lZEHitY=; b=GeEDz4sRUyMpTxzCPDNawrh+Ny
	10a9k6jgVQHLrw7KVOwP9TrJdrOz/4h9uhqSa4nalRpkRiw5o5CA4WLOsPPVaA9kyVMdb76k/Qtkn
	4rwMd5OOj6uehzOWZKcrU5/X52BdkxgeT/1wOKidnpqqLnjlsgePqOZQZ8+2ZnXz7vUP6Qnk56u0S
	zKBzcOtktP9zB5R/VNLvyCARKS/5RuZ5EqdPbVKRXaoogQs+2bhjG7kfLLVS7az5y6aXvcTgPvI0n
	0pJZlm+xus3U8KaGZ7ZsoipRU0q/OQxJCwxZilLD4Jt1R4cuoi8byykNkxRnIZLYy0B7pSnhdam6W
	yYaV9TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidC5-00000005wPl-10mT;
	Wed, 21 Jan 2026 18:44:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidC3-00000005wPO-2iPE;
	Wed, 21 Jan 2026 18:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C465C60131;
	Wed, 21 Jan 2026 18:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54ED0C16AAE;
	Wed, 21 Jan 2026 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769021078;
	bh=wZE/s1l1NOJXYc8o2baQjkj9gVvGsCEaAvDmPO+gaMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Frdt+oEUZNmgSY81no4KQ4SWHaX8UV9q6oHzYrTauxwn6EY06LkllofP3ZhTr+5v8
	 s3qASNeWBs96LWLvrVt1n8jlHArExTqSvCXA0uN+tkkXvoW8NBSqIwb0+o7ZrfB294
	 URFXrC4bXefltMQIbSw50mt29gLlL/ZeMoU9VN0ajHO9FjIawX25UrTFxi+8J804Ut
	 ItG1YOEV2/agcMWLyGOEhMZ64XZT2zYSAIMdSSOqSaAtb2PP0FVoDdeqwkHyLXa5nc
	 9ivYlNQk93Vk9Av81NpnRuN7V2S97j+HxQdK7iMwaF0oz858/YWfSsxlte4fApLZzE
	 J5DpSI4aQMNzA==
Date: Wed, 21 Jan 2026 12:44:37 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	matthias.bgg@gmail.com, ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt7622: Add missing clock to
 audio-controller
Message-ID: <20260121184437.GB3842411-robh@kernel.org>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110012.36984-5-angelogioacchino.delregno@collabora.com>
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

On Tue, Jan 13, 2026 at 12:00:11PM +0100, AngeloGioacchino Del Regno wrote:
> Add the missing audio_mrgif_pd clock to the audio-controller node
> to both resolve a dtbs_check warning and ensure that the AFE merge
> interface is clocked while using audio.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

