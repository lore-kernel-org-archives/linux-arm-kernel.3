Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0E3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2lIP5RrFHbEUcwnB0QlQKR9Y63SKkkSa/stk/7SZmY=; b=KWf3Ir8LX69OccAhg09lO6k8Wi
	J5OD+7AAZ2fq22t8M8DUQjdL1b7AwQ5ufnQOgsVKt0hYLo9Cz5psWkukURwAVYIYkAGT27bbkx2S4
	C8EQL1hWyrnAkLcRygxhUN2MK6qDAsKW5w9mcbFKPfLqlaQKBwUmU1B57CBNXEqmhMbbYeWpPm2Wf
	cL+XfTjOOr8Pw8jOH1MG+nN9UZZh6ImKQxZ2O2kFKoJVnlhoLPmiLxTtE8JoOFG1uAX0tO14tWaE3
	WCgynj/FwV1Mwlw7LNhmCx89Izuoj2H5hTbLd23n5m7UkySmjhX0RDCH5JAjoe0k5etrbzK1yzfKa
	pGYxCaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR54E-0000000HIcm-05KV;
	Fri, 27 Dec 2024 07:47:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR51B-0000000HI7z-475c;
	Fri, 27 Dec 2024 07:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3A325C5B4A;
	Fri, 27 Dec 2024 07:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534B6C4CED0;
	Fri, 27 Dec 2024 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285461;
	bh=4iGbVgm5OBXB3efPP+XulSFSNwgag6CexiLlxMXb3Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mie6IpnmKJMfCyMtG188dS85JVnSDcZ2Fqh2Qs2oBrqoSONQ9PwtI1Dxa1zf/8y1Q
	 kkqLfeIX8wt1BySWKWnjVrKsVsmmfI+7dsqaBbGaOBXEVuLime6ps7i8PQxA943ALP
	 ZE4/WpXmVI2BTWlPFKjDWQUW4CvEGTqPPUU1VrH2LhpJ4hpn71cDCXioXLkjK76WbX
	 tRIvHZLb/gA4j7aHreglsf8gay43SEFWQGce9XqXQGa+wWV+AWshvQAzLiJDh9fYA8
	 v3peqH6Nw2Wx8yhj0BOCfhQTT03L3008ToRieaLCO0N3UNpg5QLi60Wq3+H008ocu7
	 +xYprbyTdyTHQ==
Date: Fri, 27 Dec 2024 08:44:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org, Tim Lunn <tim@feathertop.org>, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 14/17] dt-bindings: arm: rockchip: Add rk3562 evb2
 board
Message-ID: <witidwqrowob3phqq2xjlja5qzirssfg2ltmejafny7xtcpt5h@huugdobopvxo>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-15-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-15-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_234422_066786_51F8F77D 
X-CRM114-Status: UNSURE (   7.81  )
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

On Tue, Dec 24, 2024 at 05:49:17PM +0800, Kever Yang wrote:
> Add device tree documentation for rk3562-evb2-v10.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - Update in sort order

So this is patchset for ARM SoC? Or for PWM, PCI, USB subsystems?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


