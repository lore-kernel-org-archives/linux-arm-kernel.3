Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55988E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QseikrHexHr+syNqpoXevhFH4Q2S9ND42L/sqHWrGQE=; b=PKwYb6atLrvMJHY4Qmi/evcesO
	6Ri4G6b9NAKKyNbFr+wJ7Ngu6jw/HM+/rZqedhcsS10sxYT7tbZ1xizjQ2P5niyQtoNH/WJf/dzsu
	WOK57wiJPodmKg5dJOLB3ItOLnS0yIwbdrWatmYu7vba1wwPpdR3ucJcmlQNeJvFDYCzQGWpAWzap
	8I4k2Nq3rGE/oY2eWKEU64N7/iYZhOQH6tbvJeLWHQwbn3Kr/s+CorUFc+xAQfDqalP9G4ZTM3hn7
	J1TgxlvWIX4dAb5DI1tForDGfLrDGCM1UHMou7Vu93bkZ2Qv7inho4kXfy+iP2biQn3swQ18xCcIf
	y0aCLfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk9E-0000000Bmjn-2G6y;
	Wed, 04 Dec 2024 07:50:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk8D-0000000BmRi-3X8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 07:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 214F05C68F3;
	Wed,  4 Dec 2024 07:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED3DC4CEDD;
	Wed,  4 Dec 2024 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298548;
	bh=Uv4AEBem5p3ILCtxEiA/PBEr39M+KjuXZK2WDr5w2Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l87DamSl/LiTYktt19I6sgilBWeDp9nUJXLA4jl6hK95i2YBP+Gf0pGTCygpxY/pu
	 6Yjm4yuBriQUleF2QIhuo3wW83ItX8Aep/KG7WrkAIt6ilSGSypO1+jeLX9WP+eWCo
	 4DKH0liW97lOdHyROlnBZwLKkvubrTD5hWnPhlVkquFY1IiGKMpIKqfEtUb/M5X3fP
	 XOmptQ9qUt3p/p00plAwRGbAylBHZhZnReFqUmaqEhHmCjIdCQl/xP5NcA4+vx5tAl
	 tMP0PI0xeVZpiQoOkJYDUGqKmLVqmygpiVO4yWSMQrTZSXMSR/2wbmFjk5P2092EMF
	 D3QM9WPS1funQ==
Date: Wed, 4 Dec 2024 08:49:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen Chen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com, 
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <2a47hwrbl3r6h5umwikt7bd7rp3njj6wnlo5e67f5kl6zhaq7g@cnolynoswb37>
References: <20241204021014.5083-1-mjchen0829@gmail.com>
 <20241204021014.5083-3-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204021014.5083-3-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_234909_918824_6063FD71 
X-CRM114-Status: UNSURE (   8.69  )
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

On Wed, Dec 04, 2024 at 02:10:14AM +0000, Ming-Jen Chen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>


Repeating same comment third or fourth time is a waste of my time.

NAK.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Best regards,
Krzysztof


