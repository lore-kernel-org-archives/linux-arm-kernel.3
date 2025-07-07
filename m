Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0C9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faMG3KOJI24qj9tayEJhj7H4RhfyRIdIOzKr5Q+ZN6w=; b=loIypnxAgcwE5Q1prhCP9EkdBE
	Shmenj7ib1yRQq8Lo/RSKVb6vrgMtW4A8pdai2AuqheRgKmU8hU8fe987CMf2cphTRIcsGYWz0WLw
	tNw7Y+gpGclRml0sD+GOGTYx8jnyTRG/937ikhhIgaM54QrHrOgNyoWuMwkX9IwI5YE/TxYg0o0Hp
	xWEqClF4IIsyRaMIjZ7Wl7wSO46C7ugBmgQmj2BfqOQMuG0Oaa6jHnrZORmeViaUKez0qscqa/b2O
	g4lJ36GymgAvqwReBYt4NGKxTOZhXIFXjLi7n2MQl47Ag8L17HwWEMw300c5LGghiAaqjWK8IN7gy
	DwbBE08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYemd-00000001U28-2vwL;
	Mon, 07 Jul 2025 05:52:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYei9-00000001TaW-0xto;
	Mon, 07 Jul 2025 05:48:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE3E943BAC;
	Mon,  7 Jul 2025 05:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAE0C4CEF5;
	Mon,  7 Jul 2025 05:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867296;
	bh=z9QN/N6kVsbMUbthlPPWA6t1axlzGJzBvA+FmlSX6dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HiN2X4IbQMeCVFIN1EgzFwjzH6PHJWykCp4CPCcUiCBdjfaR9tKeBzT8JCaMPeEQZ
	 UJZLeAFSPfiuwfRZQ8g8epxpxJ+yMgUlqNI2Bk8wEfcOYhS+C8IKLJCi/Q6vQPkj0P
	 OhPQoWGI3VBJNpK/XDVosYT4m8BIvCE18EKQX9GuUhyVg6VFroW0SvOg/PD89Fl0qJ
	 j+ao529CPlRJLzlT47K6WX8Ste2z/iq+gxO2kBAA7GS6k5tf2j4ZOnu+ENqyqwmafz
	 G8JaQMMz/vQL7fFMr6TH7Oc1PmYhLOZHzyc/R1HN7i61XepWAJDxYZsbAkjU0UURcP
	 0PvOlaXwIdxMw==
Date: Mon, 7 Jul 2025 07:48:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 03/13] dt-bindings: media: mediatek: add cam-raw
 binding
Message-ID: <20250707-crazy-loon-of-refinement-feef9e@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-4-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-4-shangyao.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_224817_301272_3290D9E4 
X-CRM114-Status: UNSURE (   9.77  )
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

On Mon, Jul 07, 2025 at 09:31:44AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-raw.yaml
>   - Various fixes per review comments

Which fixes? This is way too vague, considering how buggy and poor this
code is. Where was v1 of this?

Best regards,
Krzysztof


