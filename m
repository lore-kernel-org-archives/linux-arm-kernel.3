Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7D8C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7fxo3q5zRvtn6y/SCuAsnMPegqoz8YNRTrlcg1kSc4=; b=LLCGLT52VEu9JOi/vG0ChPawsk
	qH9ew3OoprLOns98q737f7H05gOk/ykdquMTyzp3cIQxZDn/MgP+Ujai4/m8A/HttGLzeC6PiLddB
	n77uLJ1vaPYzCO3qVx/6xdGbPvTD8dVFtt1WF8x+1EZbBYAcfQYfRg4f+mzR1dNZKFt1O5rzf7pe2
	8vZq+ejbBiFllHdmOJV9k0nxV1I+m8dxxyrSSw2Z3xuBFJI/9NPJoWXs+kia6bqoS4+BIdG9kntJJ
	16TvzTmaokh6ybPFxzSFNwBTDGjBG9M2nG/m2bEEeHx/7Wd9NU54jc+Xa1sOs8IH1YqVX1uCEGPrn
	g+GgJuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPT78-0000000BLjj-03q0;
	Wed, 11 Jun 2025 21:36:07 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQy1-0000000AwyO-2LEH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:18:35 +0000
Date: Wed, 11 Jun 2025 15:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749669509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7fxo3q5zRvtn6y/SCuAsnMPegqoz8YNRTrlcg1kSc4=;
	b=xS7/njEYBTGVj+XQys0OeTRvJbIslTpkzVwP5HZTRxG1dr9FteQ84d09ko5aQzmIR54n3Y
	MDvwR8nbAe9EpQ2Y5LgaPu+AapAchfueR9BwT4929UCSiDxhlQ0uwhPe6BM8MkJiVSxmPo
	YsA2PcSqfz+t/FDhUKhJw1mZhUZyRtwGgYp4jGJNZjlg2s1VLv+AWwMIXCuHeMHOl2JiNh
	uXtrZjyfrtju1PPzYae1byKtiCTDgdcHpL/bfKBwGKPZkn+B3DQULbRoMZZ/ihcz9RswGG
	vldfxoVbp5bew0aIPK5Hh22JLynv3hCGDwG819zvrVH+4losBF+2EAvgtbJKGg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Herring <robh@kernel.org>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
Message-ID: <aEnWgbSb77M9zdy3@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_121834_058496_F578E30B 
X-CRM114-Status: UNSURE (   9.96  )
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

> > +              - apple,agx-g13s
> > +              - apple,agx-g13c
> > +              - apple,agx-g13d
> > +          - const: apple,agx-g13x
> 
> I'm assuming the 'x' is a wildcard. The preferred thing to do make one
> of the 3 actual devices the fallback. Typically, the oldest one is
> used.

Yeah, it's something of a family. G13X is an apple codename for these
three chips.

We can do `apple,agx-g13d, apple,agx-g13s` as the compatible list and
omit the g13x compatible. I'm not sure if that's actually better since
we'd continue to use the G13X naming in the driver itself but it's a
minor point either way.

