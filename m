Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F2FD2D10E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrbXOavI6hhdu7okbs60Hv1KLcrk9A9Fk+yY6A7OFGM=; b=GPq5ogSn6zNNEXGCxstZdjeSC5
	wJ/sNSneW6/sHOIdJF24olaBR++ChPQ3O3jImn/x6NThxUsoGQkiQ/IgjZYv5l2a4+ZR8xhwm32tQ
	wVQotRrIPmqI8NPgCLGXOjGLpQM/e7SkAfwKXKXbf4ye8vVYaI00UEkfJ1GYVGbc4EAXQnd0z8eqx
	vN3EYFXpJAbMcVU5OxxNx+2vGqGTN5/pb30jSvbvL7E5OA/z1pIaqBV3kHvh9CIQu7lKa5Ru7D4pK
	3JkWQW04q0N4ffBc6R4/OSFAcyCNB7arGPXb1gJTccGmTKxA0kjroPSpafUrCh7gAgj5bunzBM9v4
	Y9XtZnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffIj-00000007FGW-2FdU;
	Tue, 13 Jan 2026 14:23:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffIi-00000007FG9-2CKX;
	Tue, 13 Jan 2026 14:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3F316000A;
	Tue, 13 Jan 2026 14:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A1FC116C6;
	Tue, 13 Jan 2026 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314195;
	bh=3hwWDMSYImxtTFTuhPzBiBnGPdsb2QRZw+DjmSuu434=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvqDhf7SpZVQXiVf7n7S78DpkRF/WBp4KpW7zS8/JIHN25h8U1oBUVvAcTKsLUC6J
	 NaU4yO4i0un0UJUnF7mdkD2jKEhm7Gh3U9ggHJLOY7TbmNi4ZMw+CCNKk5f0eLMAjV
	 lRXb6VJUfTxlXSTMkhCGCHTAvLbchj24T/9C3nrYDm7j7sxjszczh7fVPusf1qPtt3
	 rNHdwbuh+7Rl8Qsw2z41Rpzxim8mxzXuw3CeeCQGWZ9qXBrSSaZpFGzsD3PO0rRXrZ
	 ctlyq9Jyzzq2X4FOdfoTABgkmZSjUl5gO8jXiovg7IFkU4V+rsfy4AJ7cJXfM4HCTe
	 Qw48AdtHTx5CQ==
Date: Tue, 13 Jan 2026 15:23:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 1/7] units: Add HZ_PER_GHZ
Message-ID: <aWZVN6bLbqZMu_mY@zenone.zhora.eu>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
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

Hi Andy,

On Mon, Jan 12, 2026 at 02:46:09PM +0100, Andy Shevchenko wrote:
> The is going to be a new user of the HZ_PER_GHZ definition besides
> possibly existing ones. Add that one to the header.
> 
> While at it, split Hz and kHz groups of the multipliers for better
> maintenance and readability.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I'm taking this via i2c if no one is against.

Andi

