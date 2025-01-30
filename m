Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A399FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdrHi2E0nQIxRkc5BdurLOMYa8fC3b3do4LQUWIG/Wg=; b=P7YU6QphUIDc3xpTEYM7dnBtOx
	RVVauxjJAC5zA4Wt0VPMrN0YHrRycfu5RObB6C4FQyqkeEQtTyET//S6K0tJpz15TFy59XRDLPwzZ
	9PtTk9UUAhK2aBOYuKwH9G76wQHpx+edpmouBfAWAdxwmN7brvUUe6Od8wQfIJBL+nOO4rpg70+1H
	jIFeu6v1EGl4PSiDmYkU7THxeAiOZyWKk1xJPcP+KU9VWKz+e8AoFzH4HCL5c1QnqM3NKsEXtLSyR
	YQqICuwob+mYdqp3vAtZORM4k43T2DWKM8yq/w0AL9eU11u75yS3SmfUGimhMf7D8inFaPl+aNOSL
	fFq9niGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde2D-00000009n7h-0tyd;
	Thu, 30 Jan 2025 23:33:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde0t-00000009mzU-2OOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A566A42560;
	Thu, 30 Jan 2025 23:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D7CC4CED2;
	Thu, 30 Jan 2025 23:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738279918;
	bh=FD1DT8h4F86wuJYVhooiMYuxZz8NzchzLHbeU8uZCZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cj4NZCSfSnfYYpdidLQRma6/5LiCAhXXUzjlXVCt9EwmfZHs6Xbz0wyRKHySlbKw+
	 cW8sD0FynkolXzPRAYWkK3yFnXTXd0MaA9UkgNnrqFQ+JQeJtMAHUsBzacESG+113W
	 0ELmi/tXuZoi7gqkl7pCdI7+VGnsvJLHxBzx3znyIKIiseP+xe1nXAeihQlwwHUm5q
	 gj5M7RK/ySWbblznVyN+8eLjdPDnHBaNOnOsgySJtv6Nnb/pl+SSOHU5m8WcM0BeJd
	 smy1mVCxS1uKFsU6LFy4mhKhRBNJU7vnWoMENxCxnBh4VC8LsZkUURD2xOsaFfP3Jg
	 6DMhOg5w8z4kg==
Date: Thu, 30 Jan 2025 17:31:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 01/16] dt-bindings: mfd: syscon: add
 microchip,sama7d65-ddr3phy
Message-ID: <173827991640.1868148.3213096504696184504.robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <01181325b16c78ac50b8bab3f178b14e8f417892.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01181325b16c78ac50b8bab3f178b14e8f417892.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153159_677078_0398CCCA 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 30 Jan 2025 10:33:41 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 DDR3phy compatible to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


