Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022EACA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHn7wxvSQuT/oR3PuJ247KporjRyI8VkwtbENkxjTCk=; b=mZMnwORfojnjbmvAkTrq22XERs
	g3xPTlCxKG2xGVNm6fH1K18II/UXwilJMjnq4pb26Ggyc71PwvV5D6oFuPBIwCaYFn/oq4UN1Yg5n
	jTOy2eApcAyCaDSYklzi4ta9GcXG7exuTYNY3aWFaTNO59A7pfwlay1Xydr0bJDFMlejXQNg2TOEa
	t7qCZjG9GdcXZJo3sxbaPkBCvXYrjlomfTWwXeWV7jTmoGu/5iKaVZZK2mNZJKtCrCfSt9SQYuwSa
	/S00VpnInK6CCnwHmCvP8sU6gYwsiSGuczSxYEPkfCGsTs2rDi5CE5iVupJsTjfkYAyK34lhwP+uP
	E2XQKaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZy-0000000BVGH-3QGM;
	Mon, 22 Sep 2025 20:56:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZx-0000000BVFB-2h2a;
	Mon, 22 Sep 2025 20:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F333B60243;
	Mon, 22 Sep 2025 20:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B59EC116C6;
	Mon, 22 Sep 2025 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574568;
	bh=lA0I4opGxZhQyjvHJkWoV1rrN874cWsCfYAyg+K+GmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Le7ez/gbtNl0rwXZOciHgorHo1T/mjXDa7Sqb5DGeFMvXPlU1fXY7fFL2EXP4MATJ
	 k4JMAcimAtW56q5h4mEmqv+lZ7CZZgAfTMJPq4aENh/BvRSFtwSmovxi4P8pPlTQuk
	 Uo39ZFhQv7ro1ce9AbxBovRAWMH/wfbZOoqsUozJgkGTwVCv7uasDxxOF/3mzKnTjb
	 wdaO43fS/kAsageKBUaOl9+vxC7Xby2vxT+TqWKiWvTqSfmMTlG1g2BPm4KSMUpM9y
	 dU2JSUWyjRb/o8hIhp8fsaBlxgADVXWQyHTpLwAEe9WsK0J2CKHrbLhz3fVHIF7Hm4
	 P8tbpW1uO6SuQ==
Date: Mon, 22 Sep 2025 15:56:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tianling Shen <cnsztl@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R76S
Message-ID: <175857456614.1309030.10386435757239530357.robh@kernel.org>
References: <20250922091509.2695565-1-cnsztl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922091509.2695565-1-cnsztl@gmail.com>
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


On Mon, 22 Sep 2025 17:15:08 +0800, Tianling Shen wrote:
> The NanoPi R76S (as "R76S") is an open-sourced mini IoT gateway
> device with two 2.5G, designed and developed by FriendlyElec.
> 
> Add devicetree binding documentation for the FriendlyElec NanoPi R76S
> board.
> 
> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


