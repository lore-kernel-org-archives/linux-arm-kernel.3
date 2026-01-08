Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C226D14893
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 05:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbN0xXbu2Yat5/DqybzT3Ivmx4aLPskHLX3kZsD1fb8=; b=xHf9oUE+rZ2ut/gqG/F3wkbhCz
	3jgpPWee++WAY1zMeH4KR0ZjEuHx+ipiMYcei8Drps9JgxQxLGHvYpnE9WWx2vgylds1S2xQWYt+Z
	asTMTrdycMGaH4yUWlw+v/q+JFrOI0nmO9rNxJLrPKYWmM0gfwB01W72U3NKS7bIFMRnfIvswdRmf
	uz0a4JROLFhWYCJIoFgdAcTplhyqaobmMUER0Ey7xy8LldEDhq7R6rxa/mexrC2rvVTKVbIQHYU4p
	ePZpZ8ZSjDQi/mnhX2QKRSxtrd4PxZYN7VANc1icOSafoPNZhg0PBIxAtj6Grvj3uq0yaBGSyUINW
	gxKqRIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiNw-0000000Fw1e-3pLD;
	Thu, 08 Jan 2026 05:16:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiNu-0000000Fw1K-11VD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 05:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767849392;
	bh=xbN0xXbu2Yat5/DqybzT3Ivmx4aLPskHLX3kZsD1fb8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=F5jtziWg0rSiH6DROhn/PXN89zytE/z+yPwV0oPFfKgUnQ3SHMUHptKi9LCijrQ17
	 fXYlztKVDmcVJDg6Jqz5xLfx8BxKRYJzXRhrYnzFCeEv3luTHqU4DrqhrA0WzOAWwS
	 gx8p7/Ugn3QYSHLyak6VwjP0D1cmljeJDSQ9mt47l+lsWxowNVtl9gtZ9orjCpvRdJ
	 7S/+LewZzqJaAKOC1ogBKet4GO4jqOIH+Fg5u8Su0lZTZtCOMmUdwAdUvr1ZLfb6Ze
	 5QLEXLXt84t8SzFzf+Rs9PjzMRLzitkIjj70KTvByBB5IQ8kO2GegLAipzti9yB3Dj
	 qlD/Ebq2AhQgg==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 888CD79F8C;
	Thu,  8 Jan 2026 13:16:31 +0800 (AWST)
Message-ID: <a9e75f46a69e86c2d555065f251b9ece3050827e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add compatible for
 Facebook Anacapa BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Shen <sjg168@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 peter.shen@amd.com, 	colin.huang2@amd.com, KKrzysztof Kozlowski
 <krzk@kernel.org>
Date: Thu, 08 Jan 2026 15:46:31 +1030
In-Reply-To: <20251219091632.1598603-2-sjg168@gmail.com>
References: <20251219091632.1598603-1-sjg168@gmail.com>
	 <20251219091632.1598603-2-sjg168@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_211634_485512_F7DA5E08 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi Peter,

On Fri, 2025-12-19 at 17:16 +0800, Peter Shen wrote:
> This patch adds the compatible string for the Facebook Anacapa BMC
> which uses an Aspeed AST2600 SoC. This is required before adding
> the board's device tree source file.
>=20
> Signed-off-by: Peter Shen <sjg168@gmail.com>
> Acked-by: KKrzysztof Kozlowski <krzk@kernel.org>

I've fixed up this tag and the misspelling of Krzysztof's name along
with it while applying the series.

It's important that you actually insert the tag provided[1] and not
invent some other one.

Please fix your workflow so this isn't a problem in the future.

I suggest using b4 (and `b4 trailers --update`) if you're not already:

https://b4.docs.kernel.org/

Andrew

[1]: https://lore.kernel.org/linux-aspeed/259e917f-0570-40d6-983f-bfe9d7744=
4a7@kernel.org/

