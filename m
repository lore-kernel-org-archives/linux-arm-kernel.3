Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E587C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efbu2NA5D6QLgnFAuPproM8NPl2lmI2xs951ZM0COX8=; b=n6f0WICeuo31EDnALVJCYWdtEN
	cQiKyKnOVjmBdQwE7aWCjBn5j4Txo5ch1StBTWvIHt4ERIDEQd0sdnyo1xyuACxnWVLuxOMqpf4YJ
	Z9uf8lud2rfOBEBVs46AVKWjO2NHOAKk16iOzWJXRhN/n8eSXpE4IWeP7O+50X188i/n6lOdeXeed
	9yhHXKXBOIB63Bp3NWfAuXe0Gy4axKH6zvFXD5ttLdj94t5kQXLXjyiJq1PH3vzVZwo7Y+EqdWD+f
	Sv3nJu4Fhf+UzBbNfsuKXrEUk8TwLKHVdwLKbv6MhiSAu+3jGNOWXbt8ZPBs30F5yGQYqU1I4Npd5
	VRv7gCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt8w-0000000FbGB-1zbs;
	Wed, 19 Feb 2025 23:06:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt3D-0000000FZfQ-351W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5590E61147;
	Wed, 19 Feb 2025 23:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABB7C4CED1;
	Wed, 19 Feb 2025 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006018;
	bh=Fm7ii2ab9wmKHnkgzHIKXYVrWpsA7NKpu2v+Av3Ghh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raIXypYFZI9kHKms0Iy1gpDJxZja85zUcLtt4/iedzY/wXqt55qFnkcZmjEPkB5ga
	 NLtetxbVC3/TrBR7e5Qdb0CcXCInXG66fQXmjn6ZRsXqPymT+3JSVfMMontJeM7MYS
	 EgvhE4CRss9oUxw9ev9t97jwvi2vLDDdlYkH/oWegidHL2NDChAydDpWN+R2regoBJ
	 kIPy1h4Q97GI30/COJxkdvh6zfefBIp359ZWAwlR4kneu1pSLr873FkzAdZ80vCcU0
	 6R9f1S/BeLtbMCZTmc/G74oQPy+s8AgpuTlWA1o8uW3ggF7VEdzzFdFdInEAqPUnmu
	 aNV+hrhphurHw==
Date: Wed, 19 Feb 2025 17:00:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 3/8] dt-bindings: dma: atmel: add microchip,sama7d65-dma
Message-ID: <174000601710.3128913.15621337092238580817.robh@kernel.org>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <8b69f0c6d8955790edcdbe5d1e205b43dedb99ff.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b69f0c6d8955790edcdbe5d1e205b43dedb99ff.1739555984.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_150019_825907_F287B1E2 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 14 Feb 2025 11:08:16 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add microchip,sama7d65-dma compatible string to DT bindings
> documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


