Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25649C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLkYt8K2g1VaB3xoefIpyeks8ye5+GK4kWwHzwMznHY=; b=1sJcDdjO1xsfRucHU4UqJ0UfnK
	jC+b/Tgj0gHqa7fPV2udH3zrWwopsEj6Vty6vUdP77LkikVuWgnwe7x9glHSjF50T9R2tUY92Czv/
	5JNl/q+gMdYMSKRhzwcCPYTqj2Lyi4W/SBT2+E4q/iqlWvbdpznoaTLwxAcaYptqVHkZexXyb2m2F
	zfTy4uxtbfzcFbn1U1OqPCLf/4G9L5b+tyM93mE7e7Im2AuuUy3+wHCe8g4hcg86Q3EtklnI0l15U
	vPuRxjn+hiZCoNcp0oz2rDufsBCpALXV61jk7YuyiWh8Wl/D1E8NNJCdUOmgN7X+CczSkK7+07H0+
	T6GUa/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJi-00000004oaf-3dke;
	Fri, 09 May 2025 20:27:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS9K-00000004WuK-2SfE;
	Fri, 09 May 2025 18:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04E2D61120;
	Fri,  9 May 2025 18:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE1DC4CEE4;
	Fri,  9 May 2025 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814121;
	bh=rXNl2rI5xNfuI6HXSc8aN98KAhrpbaveoKmawlIRVyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ko/IlS0xVBWOVfriGT0Pql7adrijlFjG8e48sTg7SAPaRyv6XakFDDmqZEQYdBbY5
	 45TDKKg7uh0xbO21j59MzKivdrREtpjXOpEhQ6rkqp0cJ8BA+U4nay9yv1zNe3hHet
	 YfARupwBzvdjsDJkuSZgnGaFQ1rj4SX+XKdWs2ZP92RU/9+NVMJoYwRndpTw6bjuuT
	 MFvFnR8xeBJZKe+rDZDspmx6qqKfMLPxm3UD/BdIx2Rs6eJ2wM1NuxcxIS9xTYN/JG
	 Gbb8TgWjs2w1mUL5LPD9I8oQ4hRKGIbaKI5qDqi66yW3DtDcTt5A6R7mFeOyrOQY4k
	 gMAQjB/QF9SEg==
Date: Fri, 9 May 2025 13:08:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power
 domain
Message-ID: <174681411907.3875523.1397658621992836226.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-3-wenst@chromium.org>
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


On Thu, 24 Apr 2025 18:24:56 +0800, Chen-Yu Tsai wrote:
> The audio subsystem sits under a controllable power domain.
> 
> Add it to the binding.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


