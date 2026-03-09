Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99182FCA178
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL5b7/rJjDv7Iv2nh5g0KB+9KoKcG6BUATWc4P5+xlY=; b=NgO7u/GiOBQHKqBUuND3vYVifr
	PGsUNl7mri3zGcxogNpeC81LTI+NT8OYLwc49p5Y0Khfr4xlEQ9fuzFAiHI7ir+50tPoH/Gmn9onY
	yj7dSg1GLBCjiuUIEpXhKRPdAkSowHTXdKAi7gMYcnJcHtSXfLo/wQm/u3Lq4G7TLxm0LdHTbK54o
	o1JLsI+2j13c2m/9lpY26ddDmSj8RO3F6Vy1SDjFiKoH5Q26blkB6L7bK5V+l60M0m7W/E03I1DXR
	c9QoxdJJ54QIKrTJo5eDJl3x2fFzFZP5J8nPcPI5jQkoOmyQaaSUdHBlabQecvigwaEBVFi5ly/RS
	iKMLaZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfhB-00000007w3x-2XP7;
	Mon, 09 Mar 2026 18:51:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfh9-00000007w3A-1Ura
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2791740B40;
	Mon,  9 Mar 2026 18:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2249BC2BC9E;
	Mon,  9 Mar 2026 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082268;
	bh=nqYfApOVSSCsS4d7PjZzx+J2r990nk5D5zRmQq7jl0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yt6cP81swpC/co1+qqWoCwlgcaif6JxszzVAaSdXZtwNTR2DNPSCteFVlWYP7aJrs
	 KY4NgwPQ6AmXs6y1RwIJOZNLplhGDvUqfWIf4rdGXziI2qjfypQUDrK/yJoJNaSipu
	 ToXsMcwwOAOXZD4gu/K2MWu+ZedGNu030OEGezLjrZ/Ct2Kd+Do9cA/BjoTA5ZRIi8
	 kRL3Bbqr1uidDIXTvWHLdB9//4y2kU4vThDuM6mjvMIP4kzu88RHMjAtA1G0Au61RP
	 KBqSu5QgDG1vmlRtOS9hFbHejMLzsMr0deWUKGeIE1cL82wlx8RGZ/m7PsgdzzwONB
	 JWyo9JfREJOAA==
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260211-yaml_mfd-v1-2-05cb48bc6f09@nxp.com>
References: <20260211-yaml_mfd-v1-2-05cb48bc6f09@nxp.com>
Subject: Re: (subset) [PATCH 2/3] dt-bindings: mfd: convert
 fsl-imx25-tsadc.txt to yaml format
Message-Id: <177308226486.1639852.9421685432338403845.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 18:51:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_115111_419974_1C2AAE29 
X-CRM114-Status: UNSURE (   7.03  )
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

On Wed, 11 Feb 2026 16:41:05 -0500, Frank Li wrote:
> Convert fsl-imx25-tsadc.txt to yaml format.
> 
> Addtional changes:
> - Add ranges.
> 
> 

Applied, thanks!

[2/3] dt-bindings: mfd: convert fsl-imx25-tsadc.txt to yaml format
      commit: 61b80ec6685a08addd76ea6622636d709e7d989d

--
Lee Jones [李琼斯]


