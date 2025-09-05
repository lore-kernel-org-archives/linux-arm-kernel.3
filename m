Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B4BCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I81WgKQ2M7UGJuFsGXPK4LDfa5Dg6ztZzyAJg6rjV4Y=; b=zDdVo1IabuVDNEIwCPQIUVq35E
	+aKcgrS9MjEO6pLaXkmOK7/D0jIk7z1e4Pm9I4c5SLD7MRJFFHrv/QpEiYL/FyV/bh3o54y4Gd0MB
	rD5x39V4cABh0jh8boxR+SN0NU9oqxz72qHjxxqF1KgyzDYTM50iD/dugG+asxzSrIEJB5uALKRLx
	8Y/pQv0qka2eyZaWIRrl3uJd7NPGILY/DumT6Svx3cvRcCTkLqTMQOO9bRLNoIPNpEBFo43YIvOlM
	tb23I7RnwNaXrrppz0FZUONCDsu4GCd3v778Bbf9RXX0+nkKQfVGpWe/wJyMj8GJDmlb+jKy2BGx+
	bFjpWU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5K-000000047Fb-3ZSu;
	Fri, 05 Sep 2025 19:26:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuY71-00000002eOW-3K01
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:12:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EC1C152B;
	Fri,  5 Sep 2025 08:12:16 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D62273F6A8;
	Fri,  5 Sep 2025 08:12:22 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:12:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: sun55i-a523-ccu: Add missing
 NPU module clock
Message-ID: <20250905161220.282ad23e@donnerap>
In-Reply-To: <20250830170901.1996227-2-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
	<20250830170901.1996227-2-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_081227_872294_3C5BD805 
X-CRM114-Status: GOOD (  15.97  )
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

On Sun, 31 Aug 2025 01:08:54 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The main clock controller on the A523/T527 has the NPU's module clock.
> It was missing from the original submission, likely because that was
> based on the A523 user manual; the A523 is marketed without the NPU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  include/dt-bindings/clock/sun55i-a523-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/sun55i-a523-ccu.h b/include/dt-bindings/clock/sun55i-a523-ccu.h
> index c8259ac5ada7..54808fcfd556 100644
> --- a/include/dt-bindings/clock/sun55i-a523-ccu.h
> +++ b/include/dt-bindings/clock/sun55i-a523-ccu.h
> @@ -185,5 +185,6 @@
>  #define CLK_FANOUT0		176
>  #define CLK_FANOUT1		177
>  #define CLK_FANOUT2		178
> +#define CLK_NPU			179
>  
>  #endif /* _DT_BINDINGS_CLK_SUN55I_A523_CCU_H_ */


