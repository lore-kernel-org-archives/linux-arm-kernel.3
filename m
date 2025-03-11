Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F3DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ1+8rKJVNBJLNn4WW6hgTofKUADmOpTxiWQXRVpyTY=; b=PQ9zsewgQTh7IoxwF/PBKC4bcs
	SNXabYp7fPDRde772eXtcMxq9xjPCUWlcwdjhyNzBdgVSy9utPRzAS/eEXT/E8v1k0lmEgGYK+q52
	y+Qm/+RULQ051EtveV2Rp6bHjR4QErr1pc7Xu4UabYATF+9nDkowV8Oczni2dv5f6shp0xAYQEH57
	33N10eoVypwqi8yCrXDk2/bXVAXzTKrKIB3RmelystMVfqGoDbCQ79Gd72WO8+7t89Jo1r7fMag64
	2yHzYT5OGSisqkGVMt410dl4D7bneMAJvpoyPhf/JXCQiUF58eubtpf6fy0qAZ6Og9/quGGSr2XLU
	na/UuzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts48R-00000006auq-2mDL;
	Tue, 11 Mar 2025 18:15:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3u0-00000006XdX-0W0G;
	Tue, 11 Mar 2025 18:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B8A55C6864;
	Tue, 11 Mar 2025 17:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A57C4CEE9;
	Tue, 11 Mar 2025 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716027;
	bh=L1Cb7EESZgqFczyBEHcCr+eebvdU5d0Tk4r2MQmfBX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rzo9hpQVVuTQrj2ul6guqj4v7EgzwsUuP+2HHaQphifFX5nbJ15MWW3uZAGzOHxL6
	 oP8Ulrp+ueyCnMb4IJK+2xWIh1ea3fnFBG/zpkMzlZZN8egGOC7MA5wuJgoI3UDSKL
	 R/1670wr6YDhsM4DkjSvo1mzBEQNmyZKsmY0X7twN9QqSMwa3S4FTvZWSR7dyCAF1c
	 AGnXrZVUpGpy1s8e8xeOe5yG3b+1qLCYeaLZfNM1j3m0CD35+JhtJBIn+s3zBARQu1
	 v8L1kOyNYDpOwXGdWcuKnp8EO1UMTIun1VXfuq9Snpi/TsgmUhns4EQ1NIlHAbMTSh
	 rW1ZpgL4rkSsQ==
Date: Tue, 11 Mar 2025 13:00:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add missing
 gpio-ranges property
Message-ID: <174171602460.3890634.5672219037612779159.robh@kernel.org>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
 <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110028_219096_020C0A79 
X-CRM114-Status: UNSURE (   8.44  )
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


On Fri, 07 Mar 2025 18:08:19 +0100, Lorenzo Bianconi wrote:
> Introduce leftover gpio-ranges property for Airoha EN7581 pinctrl binding
> 
> Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


