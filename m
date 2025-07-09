Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4512FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR/VHVIGZbdziFP4wdziyYFpTeZxPxWQvBTZzaHY1rk=; b=UTtiEwtt2n8Cr8IH5CA1TPjYu3
	Rp5JwEEb0e/X+WHO+8H02ySJgSiIZJu3876S+KtUufMGr1flJDjnK36fn7iUyIFt5ixbxaoj6pV/j
	2JamqevWj8enWVEpH/z5rB8H+rJEEfVOhLG7DmlFLwswTAH2dXt2Yb3+mbfij/LZvkO+NFlpzahz4
	540OHOWL7A36M1KtvdJ25kGF60knuTl+0VvA6VP7K5IblMPZHcjzLfwlh4YRJXyLg4yNMv8KCWe/C
	uExNozS8UyBQW7HWo5hypFJgsbVVUNXnrVH/dhVYh81bSDnRQnHBSYQvNcCB50NWumLalJfdBzUZP
	0yBldbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRtI-00000008Hqt-2EAm;
	Wed, 09 Jul 2025 10:19:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQ9i-00000007y5S-1iE1;
	Wed, 09 Jul 2025 08:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D207161455;
	Wed,  9 Jul 2025 08:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F19C4CEEF;
	Wed,  9 Jul 2025 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049673;
	bh=JQ1+Vm+0K0y8h9HijNHayqn7WMa42BU+nZE0V6oZ0Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m9C1zRrngUo+zKh1qz9o/lGUIhk+lgLUAzXQ1p4p7yV42CMp2UU43uCVuuof5vfDM
	 8UWVAh5dA0DKSUY1z8GCEf++dqYgg2kRO7zkXKOli2vGTngBMpk8RJQoNoAwDOXSft
	 Fm6lPLk+svrUkXC2uBZOEZUUnj8VSpdgoxgmZmUHxkcI1ELJOHrI/zOFPUz+Fcyv7V
	 YYJfeyB8msSWd43v4A7z3fRG7RbuuCwnaD1XcdOl5zzQIq1sBv8H7aPAx0vAS1DR8D
	 Sk/Ox8R/6ALoIRhA8JygHl0O9vdAnAxSW/vKtm8hr2huo8222T5tAGx21WKx7n1coP
	 2rOFj9FsmFR6A==
Date: Wed, 9 Jul 2025 10:27:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, s.hauer@pengutronix.de, 
	zhiyong.tao@mediatek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: Add support for MT7981
Message-ID: <20250709-industrious-marigold-snake-5a3eb5@krzk-bin>
References: <20250708220405.1072393-1-olek2@wp.pl>
 <20250708220405.1072393-2-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708220405.1072393-2-olek2@wp.pl>
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

On Wed, Jul 09, 2025 at 12:04:03AM +0200, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> Add compatible string for mt7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


