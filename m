Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79DAC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxwy9aPWnsQxiSTTzIXvg8Js+h6g8otBshu+h2tkY9U=; b=STzhvRGo8LP+HIssO4zkc4F+bN
	tEhUbSbnP3hQNleholgkdih9H2sz9gizfaSocYrLzKtA8RXP6+bqZBQgZAyjoadH6NurE+LfXSdtz
	gEZA/D01vXeBXALdEAusk4e+AvVQnRwNDhINIgzQ7V4KZEf0N5wfAOC/mygwB6kFzaWE3oOiYmZJd
	21QE7dYBfrfrTPnmS2CN1yPlwn3l/EZym4RUrOyKb61msXGoFklSOFPR37Kg4CbXqkoV1eZ/khJiP
	NVDgarhfx95icnrOVtZUOwmZgQZqbWZZ6oLVx9If3VLMI9ZwHxB8kU7R8U1TEY99Mmb+pxGp+GEju
	0XdbOOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz1b-0000000FIgo-0Ubg;
	Sat, 17 Jan 2026 05:39:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz1Z-0000000FIgi-3Uw1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 405BA60131;
	Sat, 17 Jan 2026 05:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CC4C4CEF7;
	Sat, 17 Jan 2026 05:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768628341;
	bh=ffjNgoEkUFx0Ov+DoPjdJsmbtQc/m0PgNqHfL7T8fVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzCLtg7RF2u/RhuXIQID61h62qoYrXAU79ubgPuZSHjuvnVRjtkN57NVCr3iETHXr
	 zLottRLn05jEXJncLjdaqfAiB0LDhKqf6Lw8QzyB7cLSNki6Iq7xeaieAoovuGJdz3
	 11eXgResvJDQbD8YjmKkM1DipjFkxSq4df6v9m0nlUnoYL5E/T1b0uP7YD7mTjRfBd
	 F8UnP/FPqXyoJPF3VLnAk4KmXXCQZCGU/o+kEbSXPe82KyiBbuldGqjm9JY566uPON
	 DZxkjoM6UZmyUiqFVKzqqvmiTFjPQTYctKYRHmJawej+zvkph5/dy4T0KQz2DB1Rd4
	 vCuIEBsuvMjIg==
Date: Sat, 17 Jan 2026 13:38:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 0/3] soc: imx: misc clean up and support i.MX9[4,52]
Message-ID: <aWsgcN63ooD0ilSx@dragon>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
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

On Wed, Dec 17, 2025 at 08:42:06PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       soc: imx: Use device-managed APIs for i.MX9
>       soc: imx: Use dev_err_probe() for i.MX9
>       soc: imx: Spport i.MX9[4,52]

Applied all, thanks!

