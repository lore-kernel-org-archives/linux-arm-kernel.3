Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC4C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyfrV6IPcu9aYnh7T4e1n7N5xbj+4GI4NND7Tjzrj/w=; b=t7L4TBiME7gDLph8zwIbXOAZ7g
	L5HZ6Jrmkee1qqKYPcFNsf5KAvDoLErtKZCBEDBKZD+P+jcYufXYLrIhkkQrD1cZFDZlpNCf+SCqR
	rLSbV5gvHn7nLospLKctMowzlcj/Q/vWBIBmOYu4ZpZ6nV9E8bvS6r2YJc3+5+Cxvss5ipNadZrr2
	gZAXOUv4BgrPasE9eRWfLJJ+diW0btK2cpUmintHPKf6pxkEmIPHwBcws9e4xLUtR+ZB+uPrdBsuq
	mY9X4u25t3KWRIzpv/UTrKUIzsOTCMf4uzfT5Vz/KqDG6L1AU9Y4URfy4Md3b9KLNirV8+Gv6I7Ig
	uxjfLySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCeM-0000000G1h2-0VeZ;
	Fri, 24 Jul 2026 09:57:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCeK-0000000G1gu-2mDv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:57:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56AF840F24;
	Fri, 24 Jul 2026 09:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A01F000E9;
	Fri, 24 Jul 2026 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887020;
	bh=jyfrV6IPcu9aYnh7T4e1n7N5xbj+4GI4NND7Tjzrj/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ee1OCH5XZOCRkCkmSTJ92KBA78L5d/rE7iiYMsVSBojZtNn2AcPdDADImGQM4neEM
	 opp0N/azuu++khI/wIZV/HZp+BCYmGbevYr6/qE6w6JqW94eoXMG6FrrYwgaS++BNG
	 FKSFML9UFlZAeWFCfcfZz/FsXRgONHFdZ9mpXfkw17hXbvcwylH0BgDvcZ/m2zUGid
	 udMbTeIOyhpCa9219KiBtgiTk3CmIuyHJH1RDsKrbcwoxI7hWH8hf4Uca6LG47BYJO
	 hlzgxazQxS2bcQntp/ZbBTDXgVindye6lhkEg9qgwFGS5GpDowO8pbQROm70SODey1
	 HH0FanAJ+FOKw==
Date: Fri, 24 Jul 2026 11:56:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
	Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: input/ts/zinitix: document mode 0
Message-ID: <20260724-lemon-bird-of-opposition-e9dc7e@quoll>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-4-f6df7d86a878@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-zinitix-modes-v1-4-f6df7d86a878@disroot.org>
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

On Fri, Jul 24, 2026 at 12:54:06AM +0530, Kaustabh Chakraborty wrote:
> Zinitix touchscreens support three modes, numbered 0 to 2. These modes
> differ based on their event report schema.
> 
> The devicetree schema does not mention mode 0, thus does not consider it
> as a valid state. Add it.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


