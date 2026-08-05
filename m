Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB10CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtFogd9Yw/S+y2ZZkzMQdnH2xhJ3MBW6Yho0E6kCH+g=; b=i9wZbEZDHVVQoTYgrUZG9lx7jK
	ErbEhgPCYZJ8LZjexdeMRB+lVviTOJhcltJtiUekZqMDMiSYOzw5Kd/T+8Vc4ZmBspUdd/KJgCWj4
	det6Ep8IInzTlCs24XS8T2OjNOEksqayP4TkLIZHxTkUzr1+rrSKhWugWUAG+F71DHQ2Q4yWhh0tk
	A1fcdJ56eSb7fo1JilF030kTAJRFhLpTwQXtmWdPpmt9MdD0LrtfKkXBmggelFd3a9c2G8dtJSwIu
	aa2ZqKodu7zRpU557CaJEePs/YdiK9Hc3ZhYqkkHUsHQCNF2K6BgHwjo/D7j5F1ay8rjCADmaLonx
	bq1hYIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcWG-000000044hd-3Oj2;
	Wed, 05 Aug 2026 14:22:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcWF-000000044h0-1SgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:22:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AA6F60A6A;
	Wed,  5 Aug 2026 14:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE4F1F00A3A;
	Wed,  5 Aug 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939774;
	bh=vtFogd9Yw/S+y2ZZkzMQdnH2xhJ3MBW6Yho0E6kCH+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlbWjj7+sINUO1Vw7fwnR0Cx5BAwf8PlFf5lX9PNVakRSfI32KlCDwEexX5uuoXVT
	 MnrBciX8ueqmC7Mw4+SlQ73lWMr6xgzOkOukG7jeTmeSaovYh5m1w7FJyZcNiIdjC4
	 eTV3UgeB1TUWlWmPnoH4GWLDPgAy2//IDMCU8vXSMj55Ubmnh9qOuTfw5zVoWwV/Ip
	 ln5k5fMEjGiVZ+XKTt5xh2+rd5yQBz/ZzOE9Ns2z5DXGRvs4kLrZX3wW/QXUS9ywK2
	 KdwN3zbnQsNb0kIOEx9UkCxxWol4+0cozvECvFUzHd+wEQd6B3OvsJx3LnRXxLElZf
	 EB1HxzkWn5vAw==
Date: Wed, 5 Aug 2026 09:22:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
Message-ID: <178593977246.792405.15302040660276543988.robh@kernel.org>
References: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
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


On Fri, 31 Jul 2026 18:09:52 +0200, Jerome Brunet wrote:
> The A733 NMI controller is compatible with the A523 one. Add an
> A733-specific compatible string, with the A523 as fallback.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


