Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40CACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmVGn6T1vViFXXhqJ8eml21V/BEYU/5fc2zYPw3E1QQ=; b=RCq7at54BTECV/HEDDt0GkWAFL
	cVfk9Q4aQhtZJJ2lcOgpeCB6ef7q1MUaEtMxUMNgAGNiC/DRWF6AgnfDva34yh/tXEE64r2BH6Iaf
	W3ujVcNbp0Wp9KSiEFDBn4cDvg8t3SU4Y9YZNUYRlandFxazbXwVdhjQl12bsj2ym0nVC6TVeIZjQ
	YZqN4kGVkX33iblTmZ4RiDSXxxxdHg4DjeyzEPCB5jY1W9/Wcf8UsSs7q3uhpEXhOL609hKi5bhkf
	R/4LXqbBOKdKmG3CaZd00NphpOc/lOPZxNzNR2oU0Fqi6ip8LQM+4RTUQ7529++vPp2pEmBVEJ7xr
	+kTyp8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTK-00000004KaY-46yH;
	Sat, 23 Aug 2025 08:19:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXY1-00000003O5H-0OcY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F0645C5BF0;
	Fri, 22 Aug 2025 19:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85280C4CEED;
	Fri, 22 Aug 2025 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891335;
	bh=xgU7037EpdyDMRnXjTxTDjKwrS8kwbSM8eeBoserZHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfLNl9PxlXpIZKzVjyxkyQ6HZXNSJGnrEG4zrh9mbX6tbS81oJOoGBdOh7CoHdJ8p
	 HccHwUyCh8ud7F9XtoYmfIgtYPjx/1o2RFLWdJJDAQGZptq8FhRRtNiJtFtTBzvu9Q
	 IX+0ldBlpbiCclPz1GyfphvtvEG7hv/PwVGQpES9UWE64L9l6A46Kzl5FTgSx8jz9b
	 4wBBXI37n04qLS9ZUX+hUdUdOy7sB3rMJa2/V9UFkuc00a1BJ1OMVlwAGd9ZT4j38h
	 /yjjVM3hoPALD1oFxzFoefkUBclP6G8sZMdO4g14uv6eTBLQykLTCiPXSbGrrTvrRP
	 Sp+GWW9abJZWg==
Date: Fri, 22 Aug 2025 14:35:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: marvell,pxa1908: Add syscon
 compatible to apmu
Message-ID: <175589133410.186782.9795752378497482017.robh@kernel.org>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
 <20250821-pxa1908-genpd-v2-1-eba413edd526@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-pxa1908-genpd-v2-1-eba413edd526@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_123537_172532_53FAE590 
X-CRM114-Status: GOOD (  12.39  )
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


On Thu, 21 Aug 2025 13:17:43 +0200, Duje Mihanović wrote:
> Add required syscon compatible to the APMU controller. This is required
> for the SoC's power domain controller as the registers are shared.
> 
> Also add a #power-domain-cells property as the node will serve as the
> power domain phandle.
> 
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
> ---
> v2:
> - Drop simple-mfd
> - Add #power-domain-cells
> ---
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml | 30 +++++++++++++++++-----
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


