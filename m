Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C666CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGt91+dMFFcqLfhyCWmDaNG3xcM0Hx0F3rWqydEivn4=; b=UumZTCjwY9+gqrd43iwfAlSJCV
	88rBJbCh7pRukXdvwJisxeQ6AzANU2MkEJgL3bvAYQiPpF8j8MpcGkO0Dv/fj5p0O2rV9jMC5vWTQ
	3g7S3Iu0vELe4DgJjg1nnLXaA7Gn1tsMyDhWPOEnFcAb8181U89QEC67ebN2yfPD5hKuhobi4zflF
	aBK1iJZa3WYoU3F2WVE6+qMzvTrVPtJ30dFLyORhjNdVw3LSYaWRk6m0WL1HHsYsxcdjI4X++O5EF
	9lsqEd+YkRffcDK4xfvrC9ipKuWeqZt3KMcES4DqlcEQNMfxDhB91vqWRYR8sLeFinvQx+a1+DlEL
	s98JTheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQcS-00000008OAR-0opG;
	Wed, 10 Jun 2026 21:37:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQcQ-00000008OAJ-1HNO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 21:37:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F5CF43A0C;
	Wed, 10 Jun 2026 21:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492EE1F00893;
	Wed, 10 Jun 2026 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781127469;
	bh=nGt91+dMFFcqLfhyCWmDaNG3xcM0Hx0F3rWqydEivn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Om5A2xhl5KwVp7mPn4hdvC5BfS1Z1hCnc2M3RhRXShuh+nrBcISslrhzOMPjZaheT
	 ID1Wj0ln+ZYyUZTrl2XwAUjgn8dQ753KtuRZt6eSTtB/FtOqwp8nm0fZ7OYNEF5a6t
	 R/2xLwDU3aETqJzhCoBwa8JlgvO9C8mXaSlUY3zLe6Z9YRNqWcTQ0KCEfS8uqQPxxD
	 3jewCyTQJoWlsiVXJuUdUiceVWri2BK97aJ6MtLLV/5rDzBKsA2dTYMOw/RRNaTs6k
	 Z3vAtR/HNhuxx6xKqKY35t8typHgL9T//E7f8QUcE53+kjqRBnT38d+mrGNmlD0u1i
	 QYiC1309FD/9A==
Date: Wed, 10 Jun 2026 23:37:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-i2c@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] i2c: mxs: add missing kernel-doc for struct
 mxs_i2c_dev members
Message-ID: <ainZEIfM6-cJxzO6@zenone.zhora.eu>
References: <20260603031135.289302-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603031135.289302-1-rosenp@gmail.com>
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

Hi Rosen,

On Tue, Jun 02, 2026 at 08:11:35PM -0700, Rosen Penev wrote:
> Add kernel-doc documentation for the struct members that were previously
> undocumented. This fixes warnings when building with W=1 and ensures
> the struct is fully documented per kernel-doc conventions.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi

