Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35ACE6C610
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QjHyqHq3/QtWY1adbFgvXDLbulCqz3LnK3AngwXCkk=; b=juwX0iElgsE1woXDWLxjFb1SAJ
	BdrHJhBjRewkIYqs1sofakxWPakP1U4UKSQt0IOiOWu3YNhJL+rWlzsiUkltvUu/tFdWTcVtbreM0
	+wBnzL22Ov5o0q+3EogZJjHka8Qfi7uN5+OWsb48IhcvxcInLTDP78eMa0V5NlO1ty+dvBKr5+TAM
	Aw288ICZjOMYfPdVxWhCM7IdCWAB+7Q2GjZNusaRW2Yi+JtZFEW9F9H8nktBKVTZzpU0/gzDc2q1/
	QiYu9HOvjubbOtYr7OcT95/gxwEhog67ALEnJpoxeWxCi6X0dUiHEdAeWcC5G6+tYqDkZ5pL3khXe
	sdn0VriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINZv-00000008Yma-0GKX;
	Tue, 03 Dec 2024 07:44:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINYv-00000008Yfz-0ZXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFA47A4032B;
	Tue,  3 Dec 2024 07:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2450C4CECF;
	Tue,  3 Dec 2024 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211791;
	bh=BTi7Ze0w8np2takrcrnHHLRkx1VFTz7ASEWWSxolVFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfy/CgZU5fDOl0dZmjjB6FDZNtNmb3RybN6OmTPWQD7x5/R8E3qRAdRtbPeHCkQEt
	 dwwXLPIJ+uU1Xs6uVimyriBFO2lGQreDY4/r+vbqmc0obhlGBgu7HrB3fn6HRDiSvy
	 tYxjytFS7ktxmQtLInOGhZ2VvYzoeGFkqKU4wDq2H3DLiftGKugeAd043UYYBKXMZj
	 2XcLbhxGgO8Q4KJRmVMIM5jDbmR9hK7apNi7yaeDceCS98Wqsb9GmLwJ1Gp8M5ba7s
	 7oAr85tQycBAHNeGT8CW/bZdQqQEgeXjzhM/ureln3wzoogOEQXgTlZBQFQos+/ogc
	 5VpZvf5+XXu6Q==
Date: Tue, 3 Dec 2024 08:43:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: soc: renesas: Move R8A779G0 White Hawk
 up
Message-ID: <kqwisxsh64am76mmb5b4cxp7nhmsxafadvnkckadeywsvz6iqj@iyeo5sztpdrf>
References: <cover.1733156661.git.geert+renesas@glider.be>
 <d553ef4b1f969f72e384f274d42ac7a62fe45fd4.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d553ef4b1f969f72e384f274d42ac7a62fe45fd4.1733156661.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_234313_238008_924ECDC3 
X-CRM114-Status: GOOD (  10.07  )
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

On Mon, Dec 02, 2024 at 05:30:07PM +0100, Geert Uytterhoeven wrote:
> Move the R8A779G0-only White Hawk board stack section up, just below the
> R8A779G0-only White Hawk CPU section, to improve sort order.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


