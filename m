Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623A6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjDPXrs+zzYZW1yqvvmbPXKx/SyU09v9UIvfMCfLWik=; b=j41WQmCK29FQJB+yo868BjKwOu
	gUazTp2QL4KxzpWzZwdBvMNcj4IrJVGQly+iQHAhxjdrPD4KCw9lyh5sswX05L2ml+TB1DKFII4iZ
	UL6b9ENRWkTNND5MBG6F8zthfoYVFPeIEEf9gaB9p6gIGEk7jXh5yNZW0YOVx/oXYtfX545yEiaS/
	pryw93bp7Prd+mgOVaEEQWjUQQmdwMQecIuykT2OsJcGL9YTAbSWb5ySKijpj6BuAVpA0+/sM/ghS
	jRyrCmt4RXsvQScY6u8usdlrqwvVYQR0ZsilwGiSOfhoOLWMl8ihfOxiIU/yEK7McM7VSCLGOqEwB
	fm5QhqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYefn-00000001TKX-1OqM;
	Mon, 07 Jul 2025 05:45:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYech-00000001Ssl-0PhF;
	Mon, 07 Jul 2025 05:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8675C46179;
	Mon,  7 Jul 2025 05:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA5EC4CEF4;
	Mon,  7 Jul 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751866958;
	bh=DYxEwke6KQfAip5v2Jtz2Vpn6CF/js+HUrRQ9qzGcvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYcuETOeDFCBCzio5Luj3iLUeQLKqO/4YJ1FYL51lb8F6z4FScS+B5tMnBlkGb9yP
	 5Mpfej0WC0NLKucQ356U0gDdjukScfT9PYSkMWfSwx4gZncxmpOCjHoNJg61j0NWsO
	 aAGd4L5BUsSj57XbmIzaW/1O9ZArSNS6czEXW6URDSIi/cJ44ylnOBp1EYe5Lv7Rh8
	 lp1v2kAYD6dsgyz3FvizlRcsBl/I0FJLiKvJjMVl+/v1vJqRYIzJZUrqI9NVHVezBL
	 9PSM4lSFImsSeG/Yd3d7I6xw2wUTLhPwWxagCH/XScIHGIJI/WZ76JEhntsIZ9Y2W8
	 UnJ/ARQ9SWzRA==
Date: Mon, 7 Jul 2025 07:42:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp binding
Message-ID: <20250707-amazing-catfish-of-reward-f4c5ba@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-2-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-2-shangyao.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_224239_154242_A947BC74 
X-CRM114-Status: UNSURE (   9.76  )
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

On Mon, Jul 07, 2025 at 09:31:42AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.

Missing SoB, missing checkpatch.

> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-camisp.yaml
>   - Split bindings into four separate patches (one per YAML file)
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>

Apply this patch and see by yourself.

This wasn't tested either, so I will skip review.

Best regards,
Krzysztof


