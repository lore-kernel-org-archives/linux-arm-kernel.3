Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926D7C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeWf0n6Al0hhzHYrDMEs3UBercV+qiIboA0b6K3j6rc=; b=DtVQx9DBKU/ZNQ
	TjKdDNlCqndVKarJZFJKpnvPVZc5xWwkoWRPbt4b2wibqKUu2UU0AVMIjZKVjhuujtYexfbw5l/tO
	Ph+xOozvqAqdABpIBJ3zV8cWykWE+Plb/OkgltGDvmlBufetHX/0wDAnDrUovfwST9vCYznN+kG8E
	jnB6z82Jg91eU1jfnQOed4WaLNYYMVQKY2RxCLbW537SwqgA0Zoa0prLO5GgJ/a+xmlXp+Jb0qGQ3
	wjTbdQZDG2T9hKpiWTZmCajRFIQvtHx0DjNdhUJzs4Dsk3EEs+HM6fQK4/K354I452syVGKEUVQEi
	OkgmiX6ONz8r28E+6GEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZImi-000000071d0-45Qq;
	Wed, 09 Jul 2025 00:35:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIkM-000000070w0-2PiH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 00:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C03A60052;
	Wed,  9 Jul 2025 00:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1780C4CEF8;
	Wed,  9 Jul 2025 00:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752021193;
	bh=aO0tVCOFJa4YP+g3yU1gJ8PgZfd6c5KlcrC0VxtfvfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P2SuFBcNzw/OiSJP0/eIFoTw0bCtJYYUrONy8vBxsvmx/8sd67p43XYQNM0h1NnlG
	 ldaOXl0FlBECKUpxk9ZRixobL+ikY6paxMB5qFzopYjIB67DcrcC9SpHIsBYTvQuqy
	 OyXNm2w0TOrz+zV8v1+7nUvU28DWNNU9rXu815kRprRL3Kvumyu3I8+o3OLk/xcf5C
	 QH2to4KdIddYzjOnGZP91DEOtbEgmqOr3URydRADifr7kGgpY6YG3XpObKzF8mM7pz
	 4YGUlS779KcJO+x4cOKjyk2i1+ABka7m8xGUR1N4i4OdglllkmhdrnPz7snEya5Pmv
	 mVwaW4rV5Zc1g==
Date: Tue, 8 Jul 2025 17:33:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v10 00/11] PRU-ICSSM Ethernet Driver
Message-ID: <20250708173310.5415b635@kernel.org>
In-Reply-To: <20250702140633.1612269-1-parvathi@couthit.com>
References: <20250702140633.1612269-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed,  2 Jul 2025 19:36:22 +0530 Parvathi Pudi wrote:
>  17 files changed, 4957 insertions(+), 4 deletions(-)

Please try to remove some features from the series.
The chances that a maintainer will have time to look thru 5kLoC
in one sitting are quite low.

