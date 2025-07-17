Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5208FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKrBTwkrVwfZPvqvjHqKS1G/p4nWoVDqm9zF79rJHRg=; b=mXEONddW9Q9p513K+ptjKnOiAk
	D10WR+2JG8BqR8dzKby89uYYcCLWNtDEln0l+CD6yx9t9Gi+A1MIzh8L5OTB2Bu/wgDUEbiVd3XnH
	PaoeNmmtigw2xKSuXGCjz7ex14zUgzWh6Qft435hdrqpd4cYeLNqwnQWIsXWnkQlv3ZIS9wf89EEs
	+1INKyoTaiIymSCtjCETyOrDdTwVR8KGIa4TB2JnQRIajrKTZnHnx5QGrSz1+pgQdxxjq1eYillP+
	D+u5vpMLg+Z/DNDEE7RTQWCa9YQWDoaRLFP6hjhlG3PcVG5sc5HWScCqOR5DROibLSPv/ctogI2cn
	3QOoDsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNma-0000000A7WS-3zyW;
	Thu, 17 Jul 2025 12:32:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMDS-00000009uPx-2skC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0A60A5786B;
	Thu, 17 Jul 2025 10:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B627C4CEE3;
	Thu, 17 Jul 2025 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752749513;
	bh=DT+Earz9rC7xYt/ttAxGNNrU5KKhtK3XYQdn4AthEMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGyRQlIqhP3hPfloIGyIj7fQgWt+g8OKazY2UZhq3eiwCL59NnTIvZa64BTvQJD6q
	 4m8o2ayoNYwcZuXpkhHhYG2c8QZDBAqdvusT9F2D1iClvo6g/+GqyiUkPaWT745P1C
	 b+rjSpsLWIUQAvQaPuuSFAR0nRexrhBEkwAD6Kw3/3VMq2BYTkP/4kogBqd5D6y5HG
	 GDgiSuxLkwXqb/b37oiwWk7UJ/OL6WG++5lbWSzpLJ/fr/+1W1If8+0csevdBFFHt5
	 IfHl17k/+RcdfugMi5jxic8sdb+5wAVpffIQWy4MXpv3EQdvWkRH0oTMO6WQ6X+KMG
	 dsaV/O/n0eiOw==
Date: Thu, 17 Jul 2025 12:51:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, jassisinghbrar@gmail.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, maz@kernel.org, sudeep.holla@arm.com, kajetan.puchalski@arm.com, 
	eballetb@redhat.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v10 9/9] MAINTAINERS: Add CIX SoC maintainer entry
Message-ID: <20250717-subtle-brave-seal-7cef2a@kuoka>
References: <20250717072209.176807-1-peter.chen@cixtech.com>
 <20250717072209.176807-10-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717072209.176807-10-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_035154_797663_EC42990D 
X-CRM114-Status: UNSURE (   8.70  )
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

On Thu, Jul 17, 2025 at 03:22:09PM +0800, Peter Chen wrote:
> Using this entry as the maintainers information for CIX SoCs.
> 
> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
> Changes for v9:
> - Add mailbox driver information
> 
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


