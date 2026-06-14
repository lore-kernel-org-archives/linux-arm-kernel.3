Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFCACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JM9nQpWmXqoX/eAkM6+OEne4H6FBJgDy7rxA2wS4HM=; b=ISFG8RBlVlan7zcEuSYubKHySe
	BT/MIvy5GdA4wEVYUV7o9OLvC6/eiPZYgLkWlp4i8DtKfWNmwSbNmMR9gZOHjKyHmn3XPbSKnrJDz
	t8RFPiIs3giRteKQih2ALXEHdlebRsBHYUM5taC3/Xa6oDR4RkMm8dlt8/Jb4I7XkRURXLylvD2Ja
	oy/cKEsqiG4LZ/RiY9xHOM+1JAmyPnSh1EC1EUMfe3d7PkCN7RUwlkWbhfngBPnU3huRPsLTqXlIS
	X5Nw+q6JusXgRp2CzATkq3aYubqJp2bPKl0AwciZibpwyVo9UF9b4MBm4Wmwafp1SSQPx8blZOC+V
	aekeonuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYtG9-0000000DKsT-31kb;
	Sun, 14 Jun 2026 22:24:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYtG7-0000000DKsF-3Ryl;
	Sun, 14 Jun 2026 22:24:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EE99442F8;
	Sun, 14 Jun 2026 22:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1201F000E9;
	Sun, 14 Jun 2026 22:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781475890;
	bh=4JM9nQpWmXqoX/eAkM6+OEne4H6FBJgDy7rxA2wS4HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CtEtALnfbZB8tN1Te+X2hEQnPLousvOYpOZBX4AjGSYcYcjWVGeeS82pomOC4+dQT
	 2qv3QHRkPkYxU+Wh7T0kMIL0AKTiCYlutlmONQi7kH0oQ7LDp+jyWEf/BFWjp41Tk8
	 Eqvn13Q8w8j6C49OjbDcjG7KhNDa2SED6O7+JAopyX+b6UpiIPa21GKT7DRg6bYHcP
	 hiEWADS8aM2wR6j7/A+56eJLXuPsegheCZcZH3GRs8Fyc0ivRd9rOk+WZI0GPqcPxF
	 icROupolpxboqBAL8XVZpM/AJ2zduVBzMf3cAX3WiyFN3hOSIQaQKjXtF67PwVo4bk
	 RnJDUjc973C8w==
Date: Mon, 15 Jun 2026 00:24:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 2/8] dt-bindings: i2c: amlogic: Add compatible for T7
 SOC
Message-ID: <ai8qCJ89VzH7YaNL@zenone.zhora.eu>
References: <20260603-add-mcu-fan-khadas-vim4-v7-0-594ba8a965d8@aliel.fr>
 <20260603-add-mcu-fan-khadas-vim4-v7-2-594ba8a965d8@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-add-mcu-fan-khadas-vim4-v7-2-594ba8a965d8@aliel.fr>
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

Hi Ronald,

On Wed, Jun 03, 2026 at 08:05:24PM +0200, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 SOC compatible which fallback to AXG compatible.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

