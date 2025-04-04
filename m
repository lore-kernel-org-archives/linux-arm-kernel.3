Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D61C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjz0Bi8WKyLJqMNsU8m6WOJraIVGFS572EwKtQSmgpI=; b=OzfiYmCwoUt9+3uD4m8HT2lzYp
	MOp/ZBIpy34Elcbl0XVRO33cSpiq72AgUHpyq9iboPaDVGt2mkfbd5vTxhybVqtkyorQhe1gEmveu
	zc/ZxSqdZJvJD7DluAvIfcRM3Na5+lBXO76CTEG4yOrIVlJp5Z9u+A2pkXY06IJRj39NU4AkwqHO6
	G12K9hbkUOaJ722yxcLPQ7lwGyik0Ec/xEUcS7et9UXqS+NOfhBOkIn3UjXjRmcZ/O3nkMQucIsd3
	6a37ManeGE7xu5DY+qwDPXn6O2+h0QjeKAOiKvoqQsMYGR/fqmaYmgsyHCb0sK/eLZKemCD/wkjw1
	AgiS1JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jjC-0000000CHMH-2CT2;
	Fri, 04 Apr 2025 16:17:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jVl-0000000CFeK-040m;
	Fri, 04 Apr 2025 16:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBB8461135;
	Fri,  4 Apr 2025 16:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C565FC4CEDD;
	Fri,  4 Apr 2025 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782596;
	bh=ZeKtbccKAfskNRA51l4MhLz7OC60VEzIqp0CWNxqyYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHMecoa01reZDsWeYeRFKDoHvfVdjbITR0YQzM9FrxVMiEBb8fao+AwhSbaSskVdY
	 tn0O84nyZ8Ca2Fex9WdB6BYhFs2swRBStq71ki/yVyokwEFe8WlW4tLe/B4GvwuKkW
	 KXiBsNQb/KGDDsUE2NUCLFgwPjTmc5ROnyzx8piq1J95K4PXQ2/Zzd28jVcs5UON0V
	 T0QAhQ2musAtZT4tcLK3iUVLfqepa3x8C0c+HemmeScwze3y2i1GvvF/zsJhiKb+1X
	 cncYm1oRwoWq06MZTqN+5Mr8AjHFD+nof9k3F4euGkmwVE4n80vfvjQTMjO09HT8Q5
	 WfvYqpksKft6Q==
Date: Fri, 4 Apr 2025 11:03:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mediatek,mt6779-keypad: Update Mattijs'
 email address
Message-ID: <174378259415.1509225.11221231406789658607.robh@kernel.org>
References: <20250401-mattijs-dts-korg-v1-1-0f8d96bf8a99@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-mattijs-dts-korg-v1-1-0f8d96bf8a99@kernel.org>
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


On Tue, 01 Apr 2025 15:30:37 +0200, Mattijs Korpershoek wrote:
> Update Mattijs Korpershoek's email address to @kernel.org.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


