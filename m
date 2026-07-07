Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/kleJQ9P4AhKsgCRwcIZz+QK3cU3+20xfdwovzQhXs=; b=BjqhyUSAYE02Mzdk/5nK4AuDab
	/I0a8YaxmKmToXHgo9Obr/1GsYiUGgKd+ygSbMIcTJcvZQk8bNHQwk4kkgIRiIQE6ROq7wT98Q6Zj
	4qFDPW8iZNF9DYnUrs0+Sgdm8bg837x1s2MFoVHvfS0/fmrgTn8kAePaelcFx5VAkAwn0/N4Z+y6O
	gU7Uf5+oLKR348tPOE5HncWdjM67w6zMLKHZEepkFiG+ebwFM5bXqYiwQ2WvG4x6HtDFUsqGoegKO
	LBfJ4Kh7tAvtSyPWPYUWmJlB80DvOccLgvHMiAgtU8+/fEDGffm6JFPrTMUo4Tp6tyc0NdBpJXADk
	r75red8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8GC-0000000FPxA-071t;
	Tue, 07 Jul 2026 16:03:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8G9-0000000FPwV-1q0H;
	Tue, 07 Jul 2026 16:02:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9088D60018;
	Tue,  7 Jul 2026 16:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB31F000E9;
	Tue,  7 Jul 2026 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440176;
	bh=U/kleJQ9P4AhKsgCRwcIZz+QK3cU3+20xfdwovzQhXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPbbn0+1zZuyCX0JSye6IHruhLF1bAe8FajcAXIjMeJcJOK9wUAdsBX5ed26Cy/tM
	 2OJXjD2hg2v+rCtrRIgurEjmGsEABzifLbsM4h9c3uCCr3q+foVHo+OVdh9tFdmlk1
	 QCYA4I+Vow3tU7AtC39XH9fwGb2OVNaWkYsYHIT2KPSbv7U2u2uwqJbbkr3uZkoric
	 GQPg7WPNxAjD5rauyGVrJzRYcr13CEtvz6bvsLpZKQiV8bl/ye0qGaMIA5o1XLpQNf
	 /So6HDlaZVpElKEfzVKibnwUtuDRsllr85+pnEB+/1Jj7eN8M1jI4SzjvQu5PRf1W2
	 lLpZVKUINw/2g==
Date: Tue, 7 Jul 2026 11:02:55 -0500
From: Rob Herring <robh@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: heiko@sntech.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <20260707160255.GA3176120-robh@kernel.org>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <20260620053759.9841-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620053759.9841-1-hrushirajg23@gmail.com>
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

On Sat, Jun 20, 2026 at 11:07:59AM +0530, Hrushiraj Gandhi wrote:
> Hi Heiko,
> 
> Just a friendly ping on this series.

How about replying to the sashiko report and/or fixing the issue 
instead of sending a ping?

The .dts file also introduces a new warning:

      1 (rockchip,rk806): Unevaluated properties are not allowed ('rk806_dvs1_null', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)

Please test your changes and send fixes for these.

Rob

