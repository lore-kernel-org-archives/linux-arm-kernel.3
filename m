Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0388A10F3DCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovPMVtzWXQQ2HLg0g0ukZhZHLVwjbML60Rxdpk5V1nw=; b=GFiIVkUfxGigh5nRcsp29kM68x
	+1mi/U7TmnhAY/YMVEbm9BsxCyVkHjv2fWb2nIOw9HUYBEoduTTRc752wjDte6A3cpyx1nckaVT5B
	xPFz7nwUxoornuAQkiWzl0arOzk0yj3Il3JcZPqP65afLN63ukpBc4vMbo4fGiACVIje4jHWlmmwL
	LRKj6vkRYKT8JXhW915PAfLwjyzWL9HswWQa5yzCE8ct1o60L5hThf6jw9X19/xqkCEMt3o9vBBSS
	DW3+HIpu0KNZbjC70wzZqIb5zKrQWb8LOe4ogtROrJtuT7k9/jxARdt8mLAlsU9Qjc1lXXgE2raGa
	f6u5QWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Sgu-00000008vps-1fAC;
	Sat, 28 Mar 2026 12:23:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Sgt-00000008vpg-0yWm;
	Sat, 28 Mar 2026 12:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42D7F60008;
	Sat, 28 Mar 2026 12:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64274C4CEF7;
	Sat, 28 Mar 2026 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774700578;
	bh=Mly8B4u7fTwOeSb20IKpa1TiC6F4KcjHsnLcnx0UgTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcz/+6YAHhlvNN8zkv8SgKEkEyCL39Ya/SRpYpqYI6z20GT5IHXyuu6dvHq/A7yT7
	 YRJD5976OaqZxNf1/cCTNERJm1F8Ol589NZZhjvB7xL6C79f9ihePa2bclpA4/Bd9n
	 mn4IR5tkobFPDPXtelyuH9LkB8pUKn0DIsg8lYhqG1xSs5A3cQzpQ/9Iw7BCnzQZtw
	 MANAej57BdfimWpod33B0gEY7buwBc4ofyhv6MGFd4+oSYfXtfvMC1a5J9oSSqALtU
	 o7SPZRs3PgusxdaWnT+2lGVO89x8HN2UIH1Z5px25yvAHO3YkSe16nZ2kQpXTtOqlA
	 LGADZHY6rOoKQ==
Date: Sat, 28 Mar 2026 13:22:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260328-tangible-guppy-of-emphasis-7685f3@quoll>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
 <20260328051630.7937-12-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260328051630.7937-12-yunfei.dong@mediatek.com>
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

On Sat, Mar 28, 2026 at 01:16:21PM +0800, Yunfei Dong wrote:
> Add decoder document in dt-bindings yaml file for mt8196 platform.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)

Still incomplete constraints. If the binding defines flexibly/variable
lists, each device MUST have them constrained.

Or explained WHY NOT in the commit msg. You have entire commit msg to
say something useful explaining unexpected changes, instead of repeating
the subject.

Also, reversed subject prefix:
Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


