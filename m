Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F42EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw8WhWkHK3lnhaIlVdXRR/S7ZtamTnvSRl9cgTSdWzA=; b=eJnuGobyk7Cnr3GvEQrSp9Nhw6
	FiUcssHiGIBRapJwvYzeJQQQToG7uUUKzSoQ1OsIzr/4/1Cbzc5VwAIbgEPP8goXium1dD9ZuHwLz
	wV0kz6/H+jaRmP7koOGm4mGAOIFFxfL5myCsTMuXxGybFJ7FopwAKEee5GSwZAH5mp9vvAHmvD9a9
	Na4bJb0qsBP7viJd0vXkuFfgDuQU+7YWZTgT4p0MGpamadlRqNmx5HrIMnY+J5Wv/u59Q/BS46g3d
	hejCWxqyb964is3oGl54sgJ92BeAwh1Z/3fd8RjehTTdfVl0sHzHzFRJTlZ2Q1QNe/noyMRnucTrK
	/1usUTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweK8-00000002kJI-2z4N;
	Mon, 24 Mar 2025 09:42:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweEZ-00000002jTi-0HRU;
	Mon, 24 Mar 2025 09:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6388B438F1;
	Mon, 24 Mar 2025 09:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F010DC4CEDD;
	Mon, 24 Mar 2025 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742808998;
	bh=PJzZLmVcfVBTyYixEnKzvpzn4eT4hlh6iQAK6VQBE3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IepI6eE/HrjMOv4BkqvK3/BA94amIdm+TWEoIBz/29IkPA7bNK6NAJaZW0AqnHDPv
	 E4DZfUi67CT3+W30Fcdi9b8cf/GuDyljgLmaUgAubP4QHh9eUAf2nXn4oru0jIgW5i
	 bup58hM18Mwfzcuh12bXP3ZdJClglMQfD7Dm7Vv3r85ViIUfbrhwbhyNT3Byc93tPm
	 Dpzw445pZKzm6AH9RlR3Tr3EVOuxOzOI1GWpmz6G0ATNakDTlSfft7dJnTrCK07M/O
	 VuWaiy9WlSgfakHBSZxq/uiDCRo7p02Ro261R8eadCg59G/JbtXuKYKMmF4nyhtxRd
	 i0VFiGWVlB8hg==
Date: Mon, 24 Mar 2025 10:36:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com, 
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 04/15] dt-bindings: display: mediatek: add BLENDER
 yaml for MT8196
Message-ID: <20250324-vigilant-vagabond-earthworm-b4e2c9@krzk-bin>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-5-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-5-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023639_122532_520CF03C 
X-CRM114-Status: UNSURE (   7.18  )
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

On Fri, Mar 21, 2025 at 05:33:33PM +0800, paul-pl.chen wrote:
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Why did you add here blank line? Random changes happening...

> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ovl0_blender0: blender@328d0000 {
> +            compatible = "mediatek,mt8196-blender";
> +            reg = <0 0x328d0000 0 0x1000>;
> +            clocks = <&ovlsys_config_clk 29>;

With fixed code:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


