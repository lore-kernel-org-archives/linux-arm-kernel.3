Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BECCCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Cmtx7kRed2U7BqgS5jivN6WaQUtTqCZCu6zk3IT+OE=; b=egQeeedm2nJnIz9rAb0GZLUD1O
	HAxS3JGHjtf9T2KiyB5lIja/u3C4ej8SigpqzU7FQ7mVwXHRGc3QlAgk4LNg5/aKl+/B53UAF8xul
	4oo0u45gbYTZ7dp6tQJI3k82eVClXdLq+c394oViLi4DVeG7UOdYRS1LSrei1X0mZTykcAZDKLQcG
	R6MPFzpwsubgWgCYgxZMgGHY5doUvSa4Ij3wnI/whLVGwV1w6UJf/3xU3HpCZQoQZjkf8jYrwruT/
	hVH8/dYFgeeL+LhfOgPndSrJGjWAHR1YGxy/Z2rf8VMqXZLsCb/8mYH1+tjZ9jnbj+wSV7ioJnEIL
	6JPbH0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Cz2-00000002T9m-2nWR;
	Mon, 29 Sep 2025 12:28:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Cz0-00000002T9G-2Fgw;
	Mon, 29 Sep 2025 12:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8Cmtx7kRed2U7BqgS5jivN6WaQUtTqCZCu6zk3IT+OE=; b=vazqFVDwXNelz4Ve1pgiByWgSm
	/ipyxv8z2DlhL7W7eh7ldmKNbmoLN3nhnNL8UbkEbaaCeJFM+2kPm/PjZEEz/VL4LtnNcMmZ7wxE6
	KUNEjsbE7FCtaj7NfiqYJ5W1q886xuLr4PeaYFC4o96ywnLaKitHxnn1gBysLawts/q5Z+YZHYhEJ
	4QzdDx98RectK4GZ9tmHccCgG1e9mZUhd6vBLK1cAnWZ0cGry758XJyFAnckyNEY0UwrVtfS81Eeh
	hsCxG5319lLAWb7HFlWexLE4RHPTZMYzmwFmCx3QqqJ0El29QLZ28QwdKcs+oSUzdksjrQbE/SZsY
	6k197Q3w==;
Received: from e227-076.eduroam.tuwien.ac.at ([128.130.227.76] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v3Cye-000723-2i; Mon, 29 Sep 2025 14:27:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com,
 honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com,
 neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
 pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
 jjm2473@gmail.com, jbx6244@gmail.com, Liangbin Lian <jjm2473@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Mon, 29 Sep 2025 14:27:34 +0200
Message-ID: <14335288.5MRjnR8RnV@phil>
In-Reply-To: <20250929065714.27741-2-jjm2473@gmail.com>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-2-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_052758_597250_2C16A4B4 
X-CRM114-Status: UNSURE (   8.57  )
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

Am Montag, 29. September 2025, 08:57:12 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Liangbin Lian:
> LinkEase is a company focusing on the research and development of
> network equipment and related software and hardware from Shenzhen.
>=20
> Add vendor prefix for it.
>=20
> Signed-off-by: Liangbin Lian <jjm2473@gmail.com>

In v1 this patch received an

Acked-by: Conor Dooley <conor.dooley@microchip.com>



