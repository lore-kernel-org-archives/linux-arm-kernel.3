Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0060E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl+VQMYJUn5QHgUYQoA6wozPv+mNJ3JHc5ZwrQ66GXA=; b=krSar9VBw/Tb8/3GAAZaPzplQL
	DuYd/g9PeUkOioEg7k76i9tND7pNKm4wnvCif0aEXwK0cI4a59b+jMRHMcatGj9aUsMggvPAo1JUJ
	yHX8gvthZsOJDiyBBUNPNkbRBXr7OB4vW/p4C1liQEh3mIYPZFSBrEtMOu1CyShKMZEXHOPE4zDnQ
	dJC4Leld5BVY6B6leVYoJyoBwq3VwYNAsrmGxia9qOrXxWZYqfebuxE8GJUAj4IloZU1N+OJXKGYK
	c+t5xWXiaMFVOabgc/ZXCD0aNt6CP5vG3iFyZ6aVifUDHvzsVHjc7mBRIOltf0AZ74V+kKkUcOSVG
	Ib/D2gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRf-00000007A8L-0vMu;
	Mon, 09 Dec 2024 09:52:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaO3-000000078nB-1Hmz;
	Mon, 09 Dec 2024 09:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40B4B5C57A7;
	Mon,  9 Dec 2024 09:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31B8C4CED1;
	Mon,  9 Dec 2024 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737746;
	bh=y43p1uapSXC5fw7JnaqXHM4i71jrvsqwiDGw3bHTA2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhtR2TC0vGiWpVSG8A097r4XibOSL4QZQ5XbNoI0MtPIYnb8DsbqX7nfOt7/FgKN+
	 +fFfWrFCmNKkBX+6W4V4trV1JxrqKKW4h79PaD+58P3Pz3ykbxtdGgYOoUiI8XgBQY
	 9f8E1EFlAFVJ7o6u0SDu1yO9F3XFZekcP9k67Os+L/f+a6x/MOYwQLflHToYbWC7Fq
	 SNYqL0RTPfrTZyPCs6PvFApCtCstKB9fYfHvjWiVJ6qvfQoemXOK77P8O/SF/Et+OK
	 bbdfUtdEiyMxQ+aRuWe6u7LZvsSJpMxLi9mDq7phcfJYuiaTPHF6WEhhBwA9cYfdWI
	 TU7K4YHRYO3Gw==
Date: Mon, 9 Dec 2024 10:49:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 compatible for mt8390 evk
Message-ID: <mycrs2ekxznwcxkvthamvszftrt5t66shvopn5xpuhaldtsb4g@qv2kpx6yt2mv>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-2-0e955c78c29e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241205-genio700-audio-output-v1-2-0e955c78c29e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014907_381698_E3D3C71D 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, Dec 05, 2024 at 09:13:55AM -0300, N=C3=ADcolas F. R. A. Prado wrote:
> Add a compatible for the MT8390 EVK. It is compatible with
> mediatek,mt8188-mt6359-evb so make that the fallback compatible.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 14 ++++++++=
+-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


