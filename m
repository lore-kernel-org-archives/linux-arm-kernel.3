Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D01CE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3T23VwLvb4RJ8/kTgwnlkTkdmAFUNpCY9/Rb/v3zNQU=; b=mFEYqBlf44NNH2IrBwIfYuBYFj
	l2KufG8BhiaqGMUaOcwUh8lrcWtyqKfVi2o5c+O6E5v4eRUpKOyoDzwbNazIGATOMeLGsyw11fKli
	AED/3KMZRaGrerHCTe3BGSBhewxu5zg6R+b+inyHPJ5qymTlKoMjX8i8TpTa416qslDX74xkLrALT
	ydHkLFwLeBgXOFUGHkYsbAMckiH60p2OXjofHzJjf8UEZefe6lHUWg3dbJLBVSEa4Y4Mc28fsa+HR
	hKPZe+mkWdXwMs++WzZRa7a1fsol87aYIR2Y8gclMjtcl2LEi1zdRzPz2CNBCoUfarhWqG1bukyi6
	oa7/Rd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjwD-0000000BjSh-0X5z;
	Wed, 04 Dec 2024 07:36:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjvC-0000000BjMf-29Fl;
	Wed, 04 Dec 2024 07:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D182A4156E;
	Wed,  4 Dec 2024 07:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B0CC4CED1;
	Wed,  4 Dec 2024 07:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733297740;
	bh=en/j+2A6Gs06WxgQsDr+80HBb8Vp8sTiMeBxY16I3o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvsfcRlEzlaEF8nigmjLJnGG5aZr5IKqy2ac31Z0eTETrFO10BKzreLOFxeM5DnfX
	 R0vDcmMZN3HA/Chn93mwdxs2MFx7RFyPvREl9n6WRhzKMJRzc3ogRmu734zMJNFEPG
	 YieZfxsC4zHg9cPEEVwOUbMvReH2OfNJEjg0IMLXhig4xzXAPJUCG2FcwEgxZfdql4
	 PUaKTsOMxfdgjhRFnLrSRqhyUyk5roWfE+P8/9qDtTVQBY34bFT++DLsuLFT7n/d6w
	 LuHFeuaUr247O2ZxM/mfo4AYvB4jJ6hRTqCQvgElTS0PC8SjV2qLuTFqwmny9oXtZU
	 06fFhlEcVNQvQ==
Date: Wed, 4 Dec 2024 08:35:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202110045.22084-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_233542_613226_2A0C1AE4 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v5 (so not adding RB from Rob given in v4):
> - do not use MTK_DRIVE_8mA in example
> - add _0 functions for pwm
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


