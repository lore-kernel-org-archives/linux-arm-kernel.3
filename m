Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F869D0BB6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQz6HpkhajWciuXUr9DVFYcunt3Wc5svpWB97T3q07w=; b=43N+fYddJG6QC8QqMu8kEYzx3+
	d5+TBhm3SQ404YjDoONu1eJ+ndm9LCWSy/r9/xdaH6GtihDJ9qA6wu9uK7n/erLbd9VZCBVDRK/n2
	hsgs81VU0JW4X9JVxy+lMyjBkIn58OK6pRomb+mS3v3txnqM4BkbnBjXzcw+vV25kSn0PFdSMumGk
	65/gS89o9gAUCuXrNNvrrljm+ypCEXxfg5/8RAwLWtA6QUYY501PPxMC5FlcxA7yi7IVrWPvIYsGu
	qnX0RlrK6WAdwdXrh4xaI++6kF3i/63GMHcuOfI/6B3GZkMVHVQaB3QVFWV7z7YXJ6/hnhmQ2DfR+
	zMLoLSDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3slR-0000000HCJC-0KpS;
	Thu, 24 Oct 2024 08:00:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sVX-0000000H8fC-34kJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CB86A4519A;
	Thu, 24 Oct 2024 07:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF3EC4CEC7;
	Thu, 24 Oct 2024 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755826;
	bh=xGloYUIr9BnQMqcdFoaA2UZZH0AY/XssM163tcYBg7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuFMu51GRf+YOj2DUrc/ayF2QplfjPci809MRlf9K4RsquoAf8K6vjb8JBtxZMm7n
	 6pR5d6zyGm8bqV3J6uU+BTLycfmZWao+vPxjcu1Zy44CblEV1sWze0yX7bTluYyX1c
	 Oqu1vpRnbJUM6G6PxZo4UWhfB71jczq1WpTBFyzLlqBlRDQrIIcIZkdkzTolobZVvh
	 pCrD3p0ePeZAg3NqwDk6/zEr4NZFfOh3zsPXimr7CM5V1wWJjiMYToIsW40bO7aOHg
	 85I2y0LOO0Hy6tXMLFuUzyIs9mWWyyq+/eH8aj+QmF1aLTxGZnfQfNwBY7Yj8w8MWf
	 9hB0VWMJo2fKA==
Date: Thu, 24 Oct 2024 09:43:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 3/3] ARM: dts: imx6qdl-apalis: Change to
 "adi,force-bt656-4"
Message-ID: <5qukgvhiszyyqoetl7go47qen27uwnq5mhgwz4lejdgyhyupkb@i2dre4tovzqh>
References: <20241023144206.1099622-1-festevam@gmail.com>
 <20241023144206.1099622-3-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023144206.1099622-3-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_004347_875838_50A5E3D3 
X-CRM114-Status: GOOD (  13.45  )
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

On Wed, Oct 23, 2024 at 11:42:06AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to adv7180.yaml, the correct property name is
> "adi,force-bt656-4".
> 
> Update it accordingly to fix several dt-schema warnings:
> 
> adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: ...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

This will affect other users of this DTS, which we try to avoid. Some
sort of analysis if this is used in BSD would be useful.

Best regards,
Krzysztof


