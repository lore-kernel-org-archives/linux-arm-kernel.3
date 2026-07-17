Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1873EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIvWWTk3vADIlADV5eXwWT0fkY/tKsWP05/vboN1JtA=; b=UPwlR/hyFgUdxk1qKFB8jAYf9b
	GfFxkQMGHwmp2j4k43HdRaf0HKioy0cwNqh/Mc3Y9rAE0z81EXu0MGuKQ2wrhSCjiFT9UOBAru46x
	YewK7LxU9o27Pw4nvrowGHliugUBuGO+H7W6BTnQroRoK2q5zbyftCnQ3TrnuhwNOHvJfW9Dn6ACl
	TjvGHnxScwa4j5ZPF4LKKtE3u7QTjXAvkjoJkgUAARRWPMtBQ3DCAGOa75gOV+YyuqyufygwNMxtM
	zKFsXld+LqeLGdImb2r1WDVFUawcXkOGTE17EAEntVZ92LnU9n9cgQAet53HCXSoHohMiFn63/6i8
	akcMDyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkecM-00000001nDm-3pCF;
	Fri, 17 Jul 2026 09:12:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkecL-00000001nDK-2Dw1;
	Fri, 17 Jul 2026 09:12:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D85240C12;
	Fri, 17 Jul 2026 09:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B337C1F000E9;
	Fri, 17 Jul 2026 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279544;
	bh=bIvWWTk3vADIlADV5eXwWT0fkY/tKsWP05/vboN1JtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TBgjl1gA0sGd0Ba211yJftbOGGUshwvVUqyHXNPpjEJl39nzOWVwFhZ3+eW3mRBA+
	 9BO9zTTEm03cYwlrnYQG8q4wWJRdyNN1BRK6voLL/bBtt4mWbReJyxoTCG7lty15Zr
	 Qnqd9huJoSBvaRiAFXLvFWGmmTOQ4uY0bbUQaRcJwKWuhHkWgXoR+X7HBPM1aLZJR/
	 frITHKVnppbO9WO269ZIRZt4PH7cA8jR36zg56Y1uzRuE2Znd6Z84zfkIbrgpGpksR
	 W9CKgCu1Vj41ml6OPJXbJIuYa5uvRhkIDczGNQ1am89cd2oJOyakQkUDdtuoHtM/AV
	 uoDEcxFXIkjnQ==
Date: Fri, 17 Jul 2026 11:12:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Message-ID: <20260717-slim-fictional-warthog-7dcef2@quoll>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
 <20260716092859.512306-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716092859.512306-2-hrushirajg23@gmail.com>
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

On Thu, Jul 16, 2026 at 02:58:58PM +0530, Hrushiraj Gandhi wrote:
> Document the compatible string for the Vicharak Vaaman, an RK3399-based
> single-board computer.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>

Nothing in cover letter or this changelog explains dependencies and I am
pretty sure this fails tests.

Best regards,
Krzysztof


