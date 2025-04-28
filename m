Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9019BC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlkfpiiiIXxsB3aodHr1+NjmmokSlAI7VNh135fP0KE=; b=nUldIj8Wfx2MtOz36ZimVkfiSU
	KUO0edkx/IBvgpOsWp9QqBT24Rzm8ANka6Ft22Yc+1gA3SU/hgd+pmK9EgisES9vN1NkKEBMjKZSw
	2Bi8GRBwxvX/mSWOg+Q4/yuHneSDbegEvf6/B7G4kMH0RQGHHWhbKmC9ACBhW8DXNKotMn1gw/oXg
	EgjgxQWW16TR73HoSQzDcXEIXldYjzPSiWn/0q1eQOQfNz5gDFTIex80sjBhqx41Fd+BPEgSN2mL6
	vguJuwiHzfaa8W9O/0XZUS2VUrDefOk+zjSBxoJxMj/5G1TevaRBQ2NpT3xOERU72j/9E0o8PJdeO
	EPPckVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9J9b-00000005HzY-1VtJ;
	Mon, 28 Apr 2025 07:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Iqy-00000005EsG-1LOD;
	Mon, 28 Apr 2025 07:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RlkfpiiiIXxsB3aodHr1+NjmmokSlAI7VNh135fP0KE=; b=aJTHGXE4LofHmKaPAdLB7nlm/o
	TcXjeXhWs+DfeN+y7FFetR9wEfrvF2MkWEbn0pV5dvAqRQPLr2nDH9t1H2Rnw5pPp0Qu850A3NJ+D
	gi0VX6Y3g1ouu/xwD4PxXJSK37eL2rl+d9HaAvbO49swYc8z/LZLlinhBcVYGHK+Gd+AehLINnE/h
	yV+qS1MyFcmAzWpGzAeOTcZG6htm546lX6um0givS4rXYPwy7cN1xbr57ssU6OJa6oytEDBEa74lq
	jutK7XCuDnkFM4Q/SX/cvdPTcoiIF3YdXPsdhoyKxiSd2/DR+G+nFKjkDB+YX8X1dNwIJnyfxolFf
	CKgZX7/w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Iqv-0000000Ca1O-0t9z;
	Mon, 28 Apr 2025 07:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 183FF4361F;
	Mon, 28 Apr 2025 07:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F53C4CEE4;
	Mon, 28 Apr 2025 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825070;
	bh=l2Q0gVsxUqyisBJ2iI60NbNxaAxhgA/lnFVxrp9bRkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8mUjBEX3qghyYxxSLaMxhfEAUelgqIa9poC9QElj8JHQ+ydGZJfRC4p7TfqmBb0N
	 o1/MTx3M6+coi8AxWIslo93Bb66PERi7D9k44xGPLZflp8SD5SWrvyMFBXbGk+WCJs
	 5MmxyH+s+Dzdhr8pi3xbMM98IsTSVDLXUm7vGUiTHxrZJhb6++yPoRHTWhNKadFQdS
	 c9Vm3ENcA8+LgKdrPlT6Lk3wnWvvd2XrrkS/oLPGvot1Fy/zIfXyG/2SuSpCDzxvQ/
	 c3bXW3WNYvT8+G456CTP8Zoqd3jY0dFsxdKmFlY+e0uPH/EXcaeAjOH71LillOekLR
	 kRsa2sUwZednA==
Date: Mon, 28 Apr 2025 09:24:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 01/13] ASoC: dt-bindings: Convert MT8173 AFE binding
 to dt-schema
Message-ID: <20250428-remarkable-authentic-mink-74cef6@kuoka>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_082433_546621_DE3D39D2 
X-CRM114-Status: GOOD (  11.13  )
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

On Thu, Apr 24, 2025 at 06:24:55PM GMT, Chen-Yu Tsai wrote:
> Convert the MT8173 AFE (audio frontend) binding from text to dt-schema
> in YAML. "clocks" is added to the list of required properties to match
> "clock-names". And the example was slightly fixed up in style. Otherwise
> everything is as before.
> 
> A contributer and maintainer for a recently added MediaTek audio binding
> was chosen instead of the original submitter.
> 
> Cc: Trevor Wu <trevor.wu@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../sound/mediatek,mt8173-afe-pcm.yaml        | 87 +++++++++++++++++++
>  .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ----------

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


