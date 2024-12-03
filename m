Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C316E77166
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Trjg3XKf8XqrRAptBiCMnEb1A1gMqUUnkTHFyr8IYgU=; b=yusTJFCalK0MU/EGzgR4I9RCbV
	caED8auleasieLpqauf+434CPZwCKf8wrgvTYGczpQ50i8npa5Zrv3xT/wsHyenxPqlNpjlS+f+zS
	ymer/hJ/z7fAoKSMpXmqqU+TIcHYQQVtY0ut07gd+bzwt2VhG1DWeAhkJzcU446uw40v5Zql2a8d8
	YfKZO87jOsLYZ0u3mocL51CMcpR2y6x170b4+KSZQLGaDJrITm00p5mYb8UcmLt2GUyFnVh44oCgl
	gYAowsGmTsqTL1FU/jHSTms5QiJ0p73+kCPQmjNLZWy6MfIbsoZTJySpwEIlUhtoUJnHK08WkIJ8t
	r4zWDiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIcaM-0000000B3vh-182t;
	Tue, 03 Dec 2024 23:45:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIcZL-0000000B3pN-09p5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 23:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Trjg3XKf8XqrRAptBiCMnEb1A1gMqUUnkTHFyr8IYgU=; b=RBwVJBx4eTvXad3B9AgWHtxAKF
	L0MFHpiHDRc3fe0yt5G9T1dsxQwyq3K5It/Mb0oGr6dij8VDaRLU9HvwJCNWu0b0Vxv8sQrsKvKs7
	aSTbqwE5AJVe7d8Ah5s76os1KEjZot+xsYG/xh/0QPWWN7sfkJzfZXhw2DXQXpExR4Dg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIcZH-00F95z-3V; Wed, 04 Dec 2024 00:44:35 +0100
Date: Wed, 4 Dec 2024 00:44:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Message-ID: <560369d3-e37c-4c44-86df-a0b81c899f9a@lunn.ch>
References: <20241203233717.185016-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203233717.185016-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_154439_074432_C07A8EBD 
X-CRM114-Status: UNSURE (   7.63  )
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

On Tue, Dec 03, 2024 at 03:37:17PM -0800, Rosen Penev wrote:
> nvmem-layout is a more flexible replacement for nvmem-cells.

Do you have this reference board? How did you test this patch?

	Andrew

