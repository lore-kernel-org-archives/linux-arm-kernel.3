Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACB8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1BtLHyAn/6XfAQxLpIVXHKZPmxwUFzlMkj56kNCtQQ=; b=VPTvUh93Rbj87EMzJDwS2lyxtQ
	DtJEVvjsIkPpBJ1mM84MNSwRnjwcB+1KpQmt1JysH9IU2F5OddQb9o9NeuAjRsJvXpmRi9MATVXyv
	HJaH0fFNtSENSwnQ7j63vHQK3KXBNkgz1BghyEFHv9zVh+mDZgLQbs/Li2KVhKzUFuyTgMhflCsUG
	BEDPTWP4SjKJtzQAPJqJcAh2Gk3hVJMxwAAq0f75evS6g7eSWte6PNP0uy9yAUkb7N0e8TAECGBat
	QEhBp4W3MqyVvqToaRAe1NoXH7zTbmCRBjaWe2r1jwAL6iT4aHcG8Y5RwbfC7PmhdYzfH5V0f0j4L
	tYXTAsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSyK-0000000EgCP-3wvb;
	Mon, 27 Oct 2025 19:33:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSyJ-0000000EgCF-14S1;
	Mon, 27 Oct 2025 19:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FDDC6206B;
	Mon, 27 Oct 2025 19:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61E8C4CEFD;
	Mon, 27 Oct 2025 19:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593618;
	bh=uPve+l7+cJjOEfzkb8Q0gunZrnDYl+FrJHFKM+t/nqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5HlgI0mM54pKfQ021GKCv4Dk2osy/WkbrTx1weBaulJibkE20dhmQoF/jAh2n6Il
	 EESQtP0S5rsKorEnXTKHI/d3WUZaZDsLJjiEtZIUmGTTtIOmvyG5QuFYiXzNHbX/56
	 1iMWdpVr2Q5DZvyxTTnpa7CthCbkoB3pvgnY7OeF39p4v6iv4hA4KRUm5gERl/ce7C
	 TlpA2dbApby0cWE/IhRhpkhIupvqAm7pVa1WaFWdWJ3dyM6gIZD47+AWdpZCOTRIXM
	 +Hx4Hc05Jo7L7/mviaz4Nnht2RqWRoujac+6cXjXi3xgU9gCj6+McbIpeTDfSamfcz
	 vWGMWfJhA5Uhw==
Date: Mon, 27 Oct 2025 14:33:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Message-ID: <176159361376.1460089.7581284266775192820.robh@kernel.org>
References: <20251026150358.1078453-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026150358.1078453-1-coiaprant@gmail.com>
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


On Sun, 26 Oct 2025 23:03:56 +0800, Coia Prant wrote:
> Add NineTripod to the vendor prefixes.
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


