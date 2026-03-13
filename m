Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A65105F7AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7HHkVAjauFP4nOKVwiskFY8KobHoNxyIKIpPJJ9LRM=; b=odP1lkIGg4hs2UmCTOZrJvO4u2
	ImS8HR4zEftMUFKOM0EtxwsSZpHC4CZI7Lu5xVZez3ke3zHYsm5tpv2I+/xt+st8abDeDPMAN/DJq
	h979by38R2YUly4GwYAMHxIMFqoaK6PWw/bBnnfBR8EpOgAu1Z/rIfH6czkPoR+PMWtRQvYWGLszw
	oUJ11nzFduBh7QL+R30v/idNpe3Cf+rylnLBZe8SiyZzrjtdwP+QqwEWcK1zQC2l8IKP9+uyYU7nT
	Ih3ajbOEVuGfgf/igQ275PalS2GM3GUNmUewVEFCMVSOmCEjE9XOL6Zzv1HkiDxHBDuZ+qtb6Pp9T
	YQnQXkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12l4-00000000Iwe-19Y5;
	Fri, 13 Mar 2026 13:40:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12l2-00000000Ivi-1csr;
	Fri, 13 Mar 2026 13:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09A5F400AB;
	Fri, 13 Mar 2026 13:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CA4C19421;
	Fri, 13 Mar 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409251;
	bh=3DaMdNDeS8ryATgNdncqNIGuyCoC8k0EIqnGFmQCfds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQwEu7UYURBju4ZAMInC1NM7Ulf/cU/l6txRROzbgE+Zbkj1vsPxYkLaxERfIccBO
	 v0JcgPH50vZCMpjoEs+Rzw70i43QQeWRkOjFlTX2uuJ+FD3iSMHmYLTAgEY+9HW4q7
	 paNc4WMJHiD929D4gXT5xP4/9xwS+bu+EN0nz19ZibpN0Wb7zyx1e2B/hh1NaGx7qX
	 +0vt8KF9UXohnhlhm9tLcH/jzhSU9B4IFbElKTej8aWNrEpJQ7ofBBi6hg9izcSKkt
	 1ScFE3T1VQq9EwaSLNveADCnriZ0eeE1+utDqcAeYmL0dbq6amuWa8Ah9wOzxyDesw
	 u/gxwmxu+ePvA==
Date: Fri, 13 Mar 2026 14:40:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@kernel.org, 
	linusw@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, erin.lo@mediatek.com, 
	zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, 
	seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Subject: Re: [PATCH 5/6] pinctrl: mediatek: mt8188: Fix include guard comment
 in the header
Message-ID: <20260313-classic-chihuahua-of-discussion-043da3@quoll>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-6-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312041533.187553-6-akkun11.open@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_064052_444087_7F1ED864 
X-CRM114-Status: UNSURE (   8.65  )
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

On Thu, Mar 12, 2026 at 01:15:32PM +0900, Akari Tsuyukusa wrote:
> Correct the mismatched macro name in the #endif comment.
> 
> Fixes: 11b918d90aeb ("pinctrl: mediatek: add mt8188 driver")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2 +-

IMO, this change is just churn. Doing this one line per patch is way too
much. Do not send such oneliners for one subsystem as separate patches.


Best regards,
Krzysztof


