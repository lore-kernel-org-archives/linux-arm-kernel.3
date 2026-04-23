Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2A1F99340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfrbCjB7w88uI2Dj57WhJkGhdKypkR0ANHfG37QWHTA=; b=vggsc6+pq+QXDAzDkn6y5IAMFN
	n2hhmBeVndjHIsc62v3uMblH7bWMt+fr6JAF33r9SnTjzKSbbM+U17J0GjfOsCX33jdNTFSV+DfaG
	kfHc9bm06P5Yc3NFTUdkkmtmfLM9KtuUZc15PcWmswpkXurp9u/+sAi2QLwAkvSw2Bp/yiTwjVybN
	rV3Taj+8VzROcg6FZ1AVWoN89+ZHGl5/fpVw8rorrMm/N6qA54H/Ds4DEGefVO2SSXS2B5+Vl68Qe
	vcRddxgXQKbLEsDbbfVHAyyG7CjaGLdSDs3gxCgHK07jVa/BVoCwHrWqJIgREC6QuKUb8QOaXGoE9
	5IzRE40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFonl-0000000BBKM-0W19;
	Thu, 23 Apr 2026 07:48:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoni-0000000BBJf-1SJy;
	Thu, 23 Apr 2026 07:48:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6044D434DE;
	Thu, 23 Apr 2026 07:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4791C2BCB2;
	Thu, 23 Apr 2026 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776930518;
	bh=6q8zIzEyZvqhWWWK8S5N+7p4Cs/FMvgTjRNWpvfJeBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHd57ItaEmf10jqH349WgU6KbiwNqr9kFRIjKXvp0QDGTrCJn9B61WZPLMOG74YDd
	 iEheuSTiX08B/dO7G2M+SdhsXgyfUWZEDLc0zOnxg5WCjNhRMfdeFxA82AVG+Ng+2O
	 cWlBrsTZ5qB8qOkEi3QhNCD81y6z4Cdwb0szzhQXNUvhMwrEHmEwUBXOS7ln6fQr7y
	 h8hf1qm68trGq73rPVt81u2JV99TmNuwt8+3E6IK8ZL/ybT7Fb7O3H5dv01IrjDfXf
	 hDe1gu0vsYGnZNIF4Gt76laJ+3AGQncsQ7WFAnLpSk2UnPwF0iV7Qc03iHuwx4fQnB
	 8T0TolAYS5CKA==
Date: Thu, 23 Apr 2026 09:48:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd
 to DT Schema
Message-ID: <20260423-scrupulous-stoat-of-perception-0a3d9b@quoll>
References: <20260421193858.347258-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421193858.347258-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_004842_401233_541ECA48 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Apr 21, 2026 at 08:38:35PM +0100, Luca Leonardo Scorcia wrote:
> +title: Mediatek ALSA BT SCO CVSD/MSBC Driver

s/Driver//

> +
> +maintainers:
> +  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mtk-btcvsd-snd
> +
> +  reg:
> +    minItems: 2

Drop

> +    maxItems: 2

and actually drop this too and list the items with description - PKV and
SRAM_BANK2 regions

> +
> +  reg-names:
> +    items:
> +      - const: pkv
> +      - const: sram-bank2

Old binding did not have reg-names and nothing in commit msg explains
changes done to the binding.

To remind: if you change the binding, you must mention it and explain
WHY.

I don't see any use of that, so why did you add it?

Best regards,
Krzysztof


