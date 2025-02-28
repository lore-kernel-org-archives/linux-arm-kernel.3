Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0196C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsnMnJ5oQhTiVaBacIaReGvSRHczNeHnkjX89RF+c+w=; b=PpUhNJX309mFEJCWgGBHCiBSpp
	8WySw4uVZGbZj0KUF122/37+8qJ6a67EOIyyJe+NpQ5AZ9CdfydHkQ10Wt/CBphocVTyd2bWbODau
	47/28aPBBKQPJL/IfN2KzrfuxHZBWZhUSwI3fT17Vms7dgAMH5KXp8BYWocoLFyuW/bNuePXyTknB
	ZID6ftxiJ+Zb6TpOSsmbIxMWMJc7Z85J+fXCDUIPPVZvOJrDxjHhgU8USwlGPiY8NjZtrm1f15TWM
	fTI2rXuNPQYrc+chio/oNF1tuw/NPHEX4mvG8ES+QgFjYExjBOYXQpjIio1GnluWBFwSdFXpoUxfL
	f4H8oieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7IU-0000000CebT-1OCJ;
	Fri, 28 Feb 2025 20:49:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6ol-0000000CZ0Z-1NtT;
	Fri, 28 Feb 2025 20:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF41C5C69E1;
	Fri, 28 Feb 2025 20:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441AAC4CED6;
	Fri, 28 Feb 2025 20:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773922;
	bh=V2fl3SgaIv/iZpUxldERtVxJc8Gc9wwGAYggoa3JnAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vq8lSCVjYJ7kNomfOpDiDI4zLDvUHCIv4xqmv36beFMQe45Nxc+MG+EhZl0lbl/D0
	 536pdMwmSXRiwwchmYyWwCkilaA41iHeYyyEL8PV+dcBO2DNzjdEHf86YB5zm71YDI
	 ti1pSKJfhhZWlz/819qnQlFTu5kqwSTyuoD+hp8QuXTcQWXxtl20vgea9j6Bop1oTx
	 6M51LvlxxcETRyJB7ZwO4lri73OdAGi5msNk4m+bArV9Je8zMnYPm7taxCoqmqYxST
	 gOHRy9VgFCMXnF4UyTOqZBtiu0waOX+GFZY2yr1/GloKBtvePdaPrCt4xvqvFhWsvZ
	 5B5m9txGc2IGA==
Date: Fri, 28 Feb 2025 14:18:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, heiko@sntech.de,
	linux-pwm@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 10/15] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
Message-ID: <174077391956.3606575.7362792715145083810.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-11-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227111913.2344207-11-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121843_407068_47C15564 
X-CRM114-Status: GOOD (  11.41  )
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


On Thu, 27 Feb 2025 19:19:08 +0800, Kever Yang wrote:
> The PWM core on Rockchip's RK3562 is the same as the one already
> included in RK3328. Extend the binding accordingly to allow
> 
> 	compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
> ---
> 
> Changes in v3:
> - Update the commit message and collect the Acked-by tag.
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


