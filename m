Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6B10ED665
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1rdzzunSchyQ3T4E1DcyZcD1R+I0Ejy9cW//FTvuag=; b=Y6CPbFTn9HrY616YHQ51cx7G2b
	GRv95/SeWAWFVe0N1M+R2PoJ2vAtmcAwa6us9F4+yV5AQrAnFml2hR2Fjy8C16tW2lVUKRkqiQKQF
	DQLQNuNoJS/+Rfl6ZSjMGnKwEtM1p/hZVgp5EdPYWr4zgI2mSduToxzmKdlSjSGTm3QCWIE/vCXQR
	E6Nvefdf7IJkTJ8NI7QuUCILn4jVVf1fckfBpSyG6CaoghSQjx/TyCrSYVW527yCPtWqGajZhWkzN
	NnXPirVLUzTaCr5LtwNpsZDewLDWBnvUwG0o39vTSWltAxwCWrQ+yE+uLBYsl3XMOCdySJN4WMCIQ
	gUQTOrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66Dh-00000007Luu-3zSx;
	Fri, 27 Mar 2026 12:23:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66Dd-00000007Ltr-0fco
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 12:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w1rdzzunSchyQ3T4E1DcyZcD1R+I0Ejy9cW//FTvuag=; b=Bu8wuiHGz+wXebcfkw0D4AyHSm
	5MpNsVItDtU8PvajKceX4scCsH0RX7JPSv6dZ7vXu5Nh2tl0NMcL4QodLfNkLIKZYMfNblzGv6grR
	J6gK46u6PPLOVI6Aa0eNk/GmKEsGqwAl5A3g6D1Nqb+VEuOLaU6QzR2LS/xXK6tG6uxU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w66DR-00DecS-5X; Fri, 27 Mar 2026 13:23:05 +0100
Date: Fri, 27 Mar 2026 13:23:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert
 armada-380-mpcore-soc-ctrl to DT Schema
Message-ID: <cfe455ed-990b-4097-a53c-641282071480@lunn.ch>
References: <20260327114653.593582-1-padmashreess2006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327114653.593582-1-padmashreess2006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_052317_217826_381F67B9 
X-CRM114-Status: UNSURE (   7.99  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 27, 2026 at 05:16:53PM +0530, Padmashree S S wrote:
> Convert armada-380-mpcore-soc-ctrl to DT schema

You have already been asked once to slow down. Please don't ignore
Reviewers/Maintainer comments.

Please don't post new versions of a patch within 24 hours. And 24
hours can be too fast, particularly at the weekend.

> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---

Here, under the --- you should indicate what changed since the last
version of the patch.

	Andrew

