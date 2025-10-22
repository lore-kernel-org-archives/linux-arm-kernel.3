Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0314BCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCs00lhyhbWrXa7fhzTDxXwryuxOd9gwLFu1tW+rovk=; b=wBge2LSSVcuvJ+//6/cfcevBuH
	D+1lsAH6LZbIzS12caZHbEbYALAeQSFl48UPQM2P2bucPI3/8iUb87q08b2fyI8os/JrT3X1XWGc5
	/UAYnwtCkqzLYxALpmuQ/OhMyKW2KVKCAgIiWkSgAMUVhDvjoxdItix1BZ8fmQOwIB1+ftqbSheSm
	RPxVnPHRimJ+OHP+/ybCVDagiDZlDnPSyMU67knPCJ1mCk1tlofAuAx8llYsziktd0f2hjggR1Bcn
	0UEy7gI+p/hZGYkBSA+HkuyPZdZHBKBtgw3AK2sy+jc5aQyn+UN60HQmNsfuyoyMvdLv4LNb0IysR
	bKnrjdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ61-000000033FM-27z7;
	Wed, 22 Oct 2025 13:41:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ5z-000000033EE-208Z;
	Wed, 22 Oct 2025 13:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PCs00lhyhbWrXa7fhzTDxXwryuxOd9gwLFu1tW+rovk=; b=lgNlMfX5T3EHM/QsdFw5JG91G5
	cUCXlIdV+csWoz1E/ATKhZa4YDvZgb579i+flsXZsR4h2ZbILgPlYzfiBDtSpMZUcGtFHKB6l0lPf
	tigqk3C8OYdSappZ8Fb/+YVcuJvGZk06GFav78vM+rh6/Bu24Tjv74DKwwYxGtlozGgBmKNWevymU
	W/9PtK8dYJP0QkXBCdLbKfau5tyKzfkgJbNPi6xdzg23YmhKVQejjKYSZbRzBUma2qnW9Qe+aaO6L
	q5ZbhnfDe/3vFTiBj1zTOZBiDjT8di/N1ciT2GBPOWvUzd+ThBS9pYxuV8mPR5UOOvXtLy28oao2W
	7WOeQBaQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYEG-00000000az4-3742;
	Wed, 22 Oct 2025 12:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PCs00lhyhbWrXa7fhzTDxXwryuxOd9gwLFu1tW+rovk=; b=IDClc6YIeFAX8fgwnqct8rslOP
	y70rq1E7sHy9ju9j/Ppo7/omqQq/uJHLjzUoZpZOS6yU7yIRLPbpy3v8bKqVit3u5XfN/QZdri5Dz
	dc6OwbhmqcJw4s7VmRyvj8vKcL7q6aav3IKgunRuGmA6Rj+/f1oWLITmx1tBxSCxyKMA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBZ5r-00BlUq-BO; Wed, 22 Oct 2025 15:41:35 +0200
Date: Wed, 22 Oct 2025 15:41:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: net: snps,dwmac: Sync list of Rockchip
 compatibles
Message-ID: <e2274dff-83eb-4908-834d-b77b3e2d1a60@lunn.ch>
References: <20251021224357.195015-1-heiko@sntech.de>
 <20251021224357.195015-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021224357.195015-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_134612_863850_0CB70EF9 
X-CRM114-Status: UNSURE (   9.62  )
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

On Wed, Oct 22, 2025 at 12:43:55AM +0200, Heiko Stuebner wrote:
> A number of dwmac variants from Rockchip SoCs have turned up in the
> Rockchip-specific binding, but not in the main list in snps,dwmac.yaml
> which as the comment indicates is needed for accurate matching.
> 
> So add the missing rk3528, rk3568 and rv1126 to the main list.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

