Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D498108B8E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJrxNw/+aL+0BuRjl1ACbObuyu1lSfs8wVzAXDxiQ1U=; b=lR9GXKO7Z8GF/T0or7N6ity0im
	QpgM1vHxMYKOqbDJuGbwozsVlpn/XsH5zxhCUU8clxDR6zNTpPhsBD6b+EUkCJmgc1obUq7orqFi2
	DMnC4T2rdwU71GFm7AVx5rVfqbjpjjhbCtymn8vOGt2LNK/HhBL2dtNDmkslz3TqLVVLUm6ML11GO
	jz6qLVG00VAC5V5KbVTq9UauAGGn4uTvSERdeIVe4o51wB+jjM5iCYpjc2KC0FuJYcWjkF7oJgvOm
	5/ctXXfPmKfb0qsKUvNXIaYVEbXHNqFOvr1mGhL+xbNmVLoQwoH7N74N8nnn8zTmX2PJS33FN5qWF
	OYAAPAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WcI-0000000CWzL-0hYE;
	Fri, 20 Mar 2026 09:58:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WcF-0000000CWyd-3Gqz;
	Fri, 20 Mar 2026 09:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5134643ADA;
	Fri, 20 Mar 2026 09:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7F9C2BC9E;
	Fri, 20 Mar 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000683;
	bh=1L6FaKlWVqiVcdwohVdMMFyon261Cjq3lHr3YKwAZ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FydBJHmkSOyYupNDmtQB1BqgwWfzi1oX8dSy8M5+py3QkaPDF3iIssauFFK5acpKL
	 oJbh8JFgKWtY0jFtu2B1rfeeSK6flXe9qW53YYw7FgwhSabtGnOozhdWNpo9krtQ5z
	 qbrNfwY4zrGO/MDfvKADE/KWKAWrRpJJklGJcK/KpqKqMsmaAd9XeM7TClcIcXd3K/
	 F7kFnzPAK0Se/DXpD7YMHMPRwQ+tW8Zc+JkYUFYgQq4E3hgznc7EKuiVfBLepBGaRF
	 Fig1NLeD2M28Gtz//3wyMvPpnMtVC6HA65YjLFXieLL/pcMKqeSFG4dV2sBXhtLc2p
	 8cbB4R3yUxsIg==
Date: Fri, 20 Mar 2026 10:58:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] regulator: dt-bindings: mt6359: Add regulator
 supplies
Message-ID: <20260320-masked-saffron-rottweiler-44b5ee@quoll>
References: <20260320072440.2403318-1-wenst@chromium.org>
 <20260320072440.2403318-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320072440.2403318-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_025804_179528_5F8006D7 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, Mar 20, 2026 at 03:24:36PM +0800, Chen-Yu Tsai wrote:
> On the MT6359 each buck regulator has a separate supply. LDOs are split
> into 4 groups with independent supplies. There is also a supply for the
> buck regulator control logic.
> 
> Add descriptions for all of them.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


