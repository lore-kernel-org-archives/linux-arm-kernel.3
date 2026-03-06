Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C342F01807
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwAdsQmuOnjRz9XhnuPxNU21RV9OB7z4tPjDcPNTFns=; b=Fa9kXkKmbD/0hf6rgGQEcZ2YEz
	9cof6r3FCjvBFxJXXnCyRuRxoblhVBMijredE1NF/6xMmXDVC/9jAW2+ke/qHLwYFx00JNDDc3ByS
	kPjR40mb5yMjKbeP2ROK1W+E9Lba7UfKWijyLwA9D5qqBmlHktq+X3DFUgv8rqAoi7ncs9nV6yvzH
	8DFcqWZbWdOo5QMOi97HZpsNNdiBgyhBu9jIGUkRMfP+Qa27qbAuyPyVNRl0FwAnxd3pUUK1n7x8l
	MOiU1w1DvcyXkIoCnwV9Z9VyYhKca3cMS1abduf02ZL80pkWeftT9GNYpMDUxTGC9GBOOCYT5SuDw
	mFP6NsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ7f-00000003D7M-3zNM;
	Fri, 06 Mar 2026 08:01:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ7b-00000003D6M-3L6n;
	Fri, 06 Mar 2026 08:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 684E244518;
	Fri,  6 Mar 2026 08:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70F1C19425;
	Fri,  6 Mar 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784079;
	bh=z7GuIddY8w4eOeyIOVuf/F2Vpmv/31m+Oo3tvI0XjDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YqReoOJE4FOn31hWw+3JjLNnI20RUEQjLX4i7kquWAVrTFAMsjtpX7gV/k1wA4pGp
	 NwCepZwtgadzvHJlYgeXwVBHhH4MK20usRyAu733RpUjVHDtryMbRwq/guJFDhjNZM
	 UUodwo9alMJcCwFbIR+UUgnlXShPUpcKXCRxw2vXPQphSRbYogS8jqZoUiEgVsHG+v
	 vSZT/ZmBE8mKx8UBjG/idblEV3LL4fIc4CqLiuR38p6ndMxKuDfi9rWdT5px01GBYb
	 q/CvfdhLs2AGqGKXCDCNTLOoRS/AmCiXGScCz8DmKpvnW7K0X2WaD0u8woOtmRpc7F
	 /eRQutuA0LfMA==
Date: Fri, 6 Mar 2026 09:01:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA
 Tablet 10 (Wi-Fi)
Message-ID: <20260306-frisky-colorful-weasel-1af3ea@quoll>
References: <20260305185116.781184-1-akkun11.open@gmail.com>
 <20260305185116.781184-2-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305185116.781184-2-akkun11.open@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_000121_086621_C193F127 
X-CRM114-Status: UNSURE (   8.92  )
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

On Fri, Mar 06, 2026 at 03:51:15AM +0900, Akari Tsuyukusa wrote:
> Add an entry for Lenovo YOGA Tablet 10 (Wi-Fi) tablet board,
> named b8000-f.
> 
> It belongs to Lenovo's "blade" product family, a codename found in the
> stock Android "ro.product.board" property (e.g., "blade10_row_wifi" for
> B8000-F and "blade8_row_3gdata" for B6000-H).
> 
> The "blade" family includes several variants with different screen sizes
> and connectivity:
> 
> YOGA Tablet 8 (8-inch display)
> B6000-F  : Wi-Fi
> B6000-H  : Wi-Fi + 3G (Data only)
> B6000-HV : Wi-Fi + 3G (Voice)
> 
> YOGA Tablet 10 (10-inch display)
> B8000-F  : Wi-Fi
> B8000-H  : Wi-Fi + 3G (Data only)
> 
> These devices feature 1GB of RAM and powered by MediaTek MT8125 or MT8389
> SoC. Since these SoCs are tablet-oriented variants of MT6589,
> they are grouped under the "mediatek,mt6589" compatible string.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


