Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746BDC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgWct9UeMHk4UFxQ8VlRHLlm0oUzUbQW0gcOeCF6jPk=; b=nB28saQ1GoX0xHYcIVbR01Nusm
	qQdWXhCiG/Eeggm2JCkoWuV5VNYfdkkmte7tLoBVQcWcShXdviGDXpDkJh09JZIg6O/PtCeXpp/YO
	f1IyxQErRo4V5lL2fxwV++uUanBNyETSOVu8Yc7tmsuOd8Jbu02aPz9AO1nEzrySJn/i2M6kSLIlm
	xTsrv+bLWMnRBPEVN/ZDIzykhFqO+Ye/Txsspv44yJAorGYgPmaNiHHBXMJcC4RVfGr69/2gNsKle
	n/Je7HC2aELFVREEzu2BDVFNgX1PQTMwvwlWXQpVdIwgFRAKOvEROA8TUR34E8kk/oJ22xycfrn3n
	RuqhPspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPUe-0000000HYfo-3ECB;
	Thu, 13 Aug 2026 07:04:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPUd-0000000HYfd-0rb4;
	Thu, 13 Aug 2026 07:04:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EECED40764;
	Thu, 13 Aug 2026 07:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A561F000E9;
	Thu, 13 Aug 2026 07:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786604686;
	bh=UgWct9UeMHk4UFxQ8VlRHLlm0oUzUbQW0gcOeCF6jPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D5i0th3pYQMKiwMgNEoa1BpFL/0SSTZCFcvB9XduSctmIHD/XE/DkxQV4Hb7t7a3O
	 jcxUPx+tHbFnXa51HVopZLAEfDmBsjpBtNo3qvptbCeOEEgvKGX2MwwGT9+/1Rwo1r
	 Q+J+xq4+PAlB/1EFWPzaSKkl4bQoY0zvPu9cHv8wDrkV0FU/JNZpAUWOkf3jjPHX+x
	 sv5BgEshyQkr4CuXPXvHydzBfpfl0ZvKdkoLFhbTS8o4N2AZyciqNqqPqU7GsZ5jAG
	 UpJf5rlnBsuOyUvognZ0TKCPqnHlFtH7r9mXCA/fhoukVVrA2FcnkbYsxZXIXRrltP
	 bRrcKN9+xOjKg==
Date: Thu, 13 Aug 2026 09:04:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org, 
	zhangqing@rock-chips.com, royalnet026@gmail.com, alchark@flipper.net, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/10] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
Message-ID: <20260813-apricot-bat-of-vigor-65ba20@quoll>
References: <20260812094106.1391698-1-gahing@gahingwoo.com>
 <20260812094106.1391698-3-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812094106.1391698-3-gahing@gahingwoo.com>
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

On Wed, Aug 12, 2026 at 09:40:57PM +1200, Jiaxing Hu wrote:
> The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
> already describes, but it wires them up differently: two extra CBUF
> clocks, two power domains per core, and a single reset instead of two.
> It also has no NPU SRAM supply.
> 
> Widen the property ranges to cover both, then pin each SoC back to its
> own shape in allOf so nothing loosens for RK3588, and keep sram-supply
> required for rockchip,rk3588-rknn-core only.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


