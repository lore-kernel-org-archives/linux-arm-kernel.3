Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA52C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DzYck2iY3gy1/nuPm87HEEb2vSk8bAPQlGo4wb7KG0=; b=xQ4lHiw5irMMnaGTkQXnfDkDZn
	RNLwKVb85pWpHat52iiOi02Fm/rjUTvcl1Kr2NQ+uapSnyFoU/cjWBXKviniCK94TAbtyFvvVxbCp
	5wRY+/kOucj5kMJw9YXcnNBFfMnaQZBeqWcB/VrmXRvl+EmHBlBxbJO2HeSbmOuW20XIR0v3KD0nr
	vOcG6Oxg6ifA0ptRD4qIenLp89Kys/xBdNvHXlz1Ux6+81Zm2p2mkEv9Gaos55pA+iYQVg/dny8t1
	mP1nXxaW5r8d8rYYIQoAduksTrkf2QgkyOb2udcJ4JLS93mJpK9oywfUjaf5jUpeM6k/KV05lZwDo
	+/TQAc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yyz-00000005Dbh-35BO;
	Mon, 21 Apr 2025 21:47:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yrM-00000005CHI-2t6v;
	Mon, 21 Apr 2025 21:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD8C06115F;
	Mon, 21 Apr 2025 21:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933B4C4CEE4;
	Mon, 21 Apr 2025 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271563;
	bh=BNmQHNDxjQ4r1bN5ceeqHglF2FJStQxb5I0K3hD/Yjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ygxy/+f+us2VIsWP5tF9hAopq+MBToFgYbuJXY+9OAZ62xLdfcy7CogW4t/3P3/uB
	 4m7zb54u10G2RTiafk68fn/9UwSKh14QcJog8q5fXdB4I21oWXjA1+3dzp46w/r1lU
	 EJItI4Ybm8C7VrX6OecBOw59BfGYJxb9gYd9DlujkGOBZJS8xz3HcvIwteBJIr5wR2
	 Y9ZDxE08Ypi5UF2LR9OXjS6nyc2Q3Kzdrx90GgNl2P16I0FWFLW7UT5BVVKvJVq6+K
	 wa0QoKr5syaYHq+XlqaRr7gd+daNYusEJ1rqynMcR0+84luepNLMrED81T4vAFPGBy
	 GkSexJUmmlxmw==
Date: Mon, 21 Apr 2025 16:39:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenbin.mei@mediatek.com, chaotian.jing@mediatek.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	ulf.hansson@linaro.org, linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200
 MT6893
Message-ID: <174527156151.2973998.9852318001986778818.robh@kernel.org>
References: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
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


On Wed, 16 Apr 2025 14:02:45 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC.
> All of the MMC/SD controllers in this chip are compatible with
> the ones found in MT8183, but do also make use of an optional
> crypto clock when enabling HW disk encryption.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


