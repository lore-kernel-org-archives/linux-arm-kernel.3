Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE74E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCdlIu8Fz5MAZjSLkZH6pxo2bb/KOt555SjJQrZc6ls=; b=ybzCCn1RGpVZueUEXptimW/QK0
	3z27H3Gg4AIDSi0zPucZuNquQdC7xv/6gSFj1U71J1G+qX2NnLss+9xhJFv9Eh7yuwKGKlyluzTt9
	0Z2OUKTPn85vm8atLyQnmwuUjK+J+G6tAy1K2+dl1MrTW3l9Nz8ZIUMbaQRU/T6DhsVCqEwLvTtaX
	8zkQFkKROhjbeqfigTmpQ2h8/eZSrAl2Owys7cAZWS3Ma/7CvQXht4SzyV94Jffk+iEYMVh4iVDsh
	Ri0AMf63aMn8Jfns+RbFdh7oAlSsZDUWsUjlhy1ef9FpAkpZDp8O5NT3K9I1hTTgRcB8z0EG9UH7n
	vncAEbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCbQ-00000003hHw-2BKc;
	Mon, 29 Dec 2025 12:44:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCbO-00000003hHj-3Jrq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 12:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01FC76000A;
	Mon, 29 Dec 2025 12:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4551FC4CEF7;
	Mon, 29 Dec 2025 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012237;
	bh=PflFpSdgfw64KNh6dNwM1X7/oaXn62aN7cbcelp7pl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQM28xFlgX1OzrCkpMztchIYsjVjBlrJsoGTmoX/vVGqzoPeRsxKE9dJi5BWR8ebN
	 qomEQqK0bLAhv9a4crOEDCY20ig/Y1PUl0qE6ftbVnvipV60sRmo1jLQXNhXitkfNV
	 CUmlRmKTNdFLQBrjfZOSKLGSm3rNrzvXcQ9loo3ba/D/VuFI5poaCBtP8fcugVXgXI
	 Gprfk3r4518Dz9alFegcxLiMu/LFxRK9mIHKHPx3mIZ+Ouzz4sENSLvrB5Jv9+oLuj
	 Uc46JenoYu/DMzoXnVgTA2+hg7maTgw1JjqntLboudXcFOUKIv/odcgEoKD6W495va
	 33w1XABJd80DA==
Date: Mon, 29 Dec 2025 20:43:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0
 for lpcg indices
Message-ID: <aVJ3g_V_xWStfGHi@dragon>
References: <20251120214318.347483-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120214318.347483-1-Frank.Li@nxp.com>
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

On Thu, Nov 20, 2025 at 04:43:18PM -0500, Frank Li wrote:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

