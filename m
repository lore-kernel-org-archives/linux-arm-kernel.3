Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86066E94121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwBZxpCaFO3kUvrX85vdgmNyaQbYLslUE5uX4Ja7X6A=; b=2EKBWXt6bLhM6tdygV0fS/EFIK
	sOPoV0eglFQ9g5pODU1Y47L5PhSaBcGIAJKDMEhFUZXHQGJT1m2Qq0ovrghw/14atADxpd5064iiS
	hdCMOxXPx4Se7hOsOmJZEK0hnKoZiJHArpWSYTVRx/6apqcfYN2yhFGIvqhVnGraPotWyIIK3hjlT
	Pe8vG3DEleWnPXH9VsACiz5UeR4PRrD7PF3ilPx8cMEXFHI/VCKYgZkTDonFzK74Fbtbsd1Ej8nfG
	pa+PdJMnt9CTiGSXoyeGK0EZWSB2PRNyGnMNAG1d7OQeYC/reUp5HnVu2U+U+c0N328DbGtZGbgyL
	7Rcv7TYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaJW-00000004tSg-3ztF;
	Tue, 30 Dec 2025 14:03:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaJV-00000004tSY-1kXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3C7160010;
	Tue, 30 Dec 2025 14:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7FDC4CEFB;
	Tue, 30 Dec 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767103384;
	bh=raQ+aIj5zTbQo9xbxfVUWk8ldDoS4WvR8f52e8Z21kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o79gpZfpMKLiCHbQz2Ut031SQXP7gfIxkjF3XNkJE9M6xOs56AdJhQOgY3fPzTFyh
	 XSHOpTnrqeUCoLqZsaaxCKDZIX5rOiek6+z3BgvTkPHZK7KbxAtVuAd45cCp5B+0Fz
	 cBZ9t/XClIJm+rwVqrxcsuyy1VBqhpVciDGgIeJQP55kkqtCsilTf3Abm4TsWUYavg
	 YuzTnXANhJQgeHekn1KCgDLamvv9cDvylyFbikIcs8z6YxUSmR15GdgNSJwCiLf/Fx
	 rvse78zFrovBbzdHKMzHyQRFtW4j1eV9BZi6Nrp538+Ebta4T/iacAq6lRhObMF2Xs
	 hTpRXdkfJqgEw==
Date: Tue, 30 Dec 2025 22:02:55 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: imx: imx6sll-kobo-clara2e add JD9930
 regulator
Message-ID: <aVPbjxxXM4nJt9MS@dragon>
References: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
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

On Tue, Dec 23, 2025 at 10:34:01PM +0100, Andreas Kemnade wrote:
> Andreas Kemnade (2):
>       ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD.
>       ARM: imx_v6_v7_defconfig: enable EPD regulator needed for Kobo Clara 2e

Applied both, thanks!

