Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B3EEF329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH6ybdXkzaVXMrrHozlgm+ziJkBJftpAx4qVi+qmy9M=; b=utzE0duZhtiqy+mJobG4poRddJ
	tIslqMZStnkjqap9SMK7jssL3XSHK+ad70T3pvf8080B0XYy/Mg+7H85MzdfMR21v1NFflRG0wlcg
	xhFlaV68BCwwE2FEDvF97oJGZvod2rYUNbxvbGkKywpFQHH5TGAm9PJ7H6JY01K0OzCRaW3GHxOQ1
	z3S0WyHFlntNIU3vrGz5zKP7NHN5u2GOzqOekXEsrjWr8h3/4Fnqxsk52M11pRz+ompZ0qsbGC28N
	xHPrtPQDsdsd6yIVMxUiFQteJfHACEssrMwSGSOWRzQpF1kQ82jVWty5Q517vJANXG8mbg00Vyazp
	EdYankTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4NI-00000001Eg1-1Z2M;
	Thu, 05 Mar 2026 08:48:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4NF-00000001EfS-2Q8S;
	Thu, 05 Mar 2026 08:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 016CB41A2F;
	Thu,  5 Mar 2026 08:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3A3C116C6;
	Thu,  5 Mar 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772700480;
	bh=BH6ybdXkzaVXMrrHozlgm+ziJkBJftpAx4qVi+qmy9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/3v/oYcUBE3aE5PiEgCy2QIotZuEEqmuKW4jpaRLD1s10J7qbDh6G/QBN4I701jg
	 MfVrlSA9zgYQzwJgwyG6uBxRdMBzSwiynp8pMx3rktw4Up5d75WZCNsUWJ8jPxkekG
	 vH4a9LDTpegRrrfoIqcORjjsxFzA7jzFJLDfcNbVxWvUqfnJaoA03L4NrIKmy4TKsn
	 Y0Ony1W2C/+YrAUspTnX1sCWqjGBrzqmBEQZA6n6Pb69rFxsTnSJ+IvLUB96jYs1LT
	 9baJJAVZnTt6I2cdEHwy6NSpufzKp29ZBVLwOFimtY/xFwSjMFkqipdYLs2VFW8TCr
	 3z44Tcyuf7Gsg==
Date: Thu, 5 Mar 2026 09:47:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bayi Cheng <bayi.cheng@mediatek.com>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
Message-ID: <20260305-glaring-unicorn-of-purring-2cc5b6@quoll>
References: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_004801_650922_03F10AC4 
X-CRM114-Status: UNSURE (   8.05  )
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

On Thu, Mar 05, 2026 at 10:27:36AM +0800, Meiker Gao wrote:
> Update mediatek,spi-mtk-nor.yaml to add conditional clock and

Also commit msg is incorrect - you are not adding clock bindings.

And there is no user of this, so entire patch is pointless and should
not be sent. We don't take unused bindings.

Best regards,
Krzysztof


