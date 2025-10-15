Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3251CCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJKRSA2/UrZpBwMZJMLqiGvnJ9vtCKMc8nR4m+Bp2vo=; b=QdiP+JC62paeRtnT5gbEN1Y7Ck
	7ES6YSCy0fN+wNMVn2CGvq0Tk9DMvv9P/aBw1uWZ5UsQwskGCir8X2sq59soFNcYBA5eeSD3ozmGM
	xWUNyoVsVnoUNanS650h0ZEeevOp1C2z1S5+MLQBiUvWJEhL0vCPOR3Vqw1zLbdXbTu9zdLdbfc5b
	X3jAYhs6ikoOmYZJuJ974Fcprciy804WNiht/Im2nJwL/STcRL5nt5OusYlKrsfqj+bHWkgUQBuj6
	cCzgHEBnOpd1WdH1MEqlryoHvxLCgiyrtzXbXPbs5sXZSLYLoiLkML5EKjRZxoAdGi2LhMyBnMx4N
	+KlRG9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99Li-00000002y9d-3xgq;
	Wed, 15 Oct 2025 21:47:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99Lg-00000002y8j-1TuJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BJKRSA2/UrZpBwMZJMLqiGvnJ9vtCKMc8nR4m+Bp2vo=; b=gKFX8OVD4AxfYUMWpmvDKQgeoP
	EfGtlIZLIs+J+AeSD5EwIrheoEEWfjMjayaJIE7qp0j+Qs+pJ27VxQCoBuuuaJW6am9znaAYFSH0n
	BGvFftZl9ZIUyCAqVVF8lYTpQE2Y5NWfFqLV6UpHOJjzd/TdqF9aE5Xj4m/OWzGIVYAw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v99LT-00B548-JQ; Wed, 15 Oct 2025 23:47:43 +0200
Date: Wed, 15 Oct 2025 23:47:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH] ARM: dts: aspeed: fuji-data64: Enable mac3 controller
Message-ID: <b0040541-31e9-4cda-9462-09b4a5622959@lunn.ch>
References: <20251015204840.80070-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015204840.80070-1-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_144756_410556_1582AE21 
X-CRM114-Status: GOOD (  10.97  )
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

On Wed, Oct 15, 2025 at 01:48:37PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> "mac3" controller was removed from the initial version of fuji-data64
> dts because the rgmii setting is incorrect, but dropping mac3 leads to
> regression in the existing fuji platform, because fuji.dts simply
> includes fuji-data64.dts.
> 
> This patch adds mac3 back to fuji-data64.dts to fix the fuji regression,
> and rgmii settings need to be fixed later.
> 
> Fixes: b0f294fdfc3e ("ARM: dts: aspeed: facebook-fuji: Include facebook-fuji-data64.dts")
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Thanks for adding the comment.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

