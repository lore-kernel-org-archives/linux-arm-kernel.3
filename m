Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA50606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BxyyA5GS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=QUlWwATN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3OIPKLcYiuutg7RdlUUK1/KmqYOx7B97326xgBZIjk0=; b=BxyyA5GSIYNejq
	E31WsqL/3SXO2pAzsH3A5hjsjmBvxwz/VhSRW1Gx2AISdazFJ+JQc/34qtnYAcnAr0w4xo5H3vjB7
	iKK98/bpUUQkLfeWjUFSpWGSxNqdhSaCPf9yKQKZmcHUVX1RbVU/wF2RMovzLNiAkIauwV7qaUY1R
	O55jS1MNXzqJvvMA8HI4nqF2W7D0d+chE/u6B3yp3WzBl2OD7W4h3Nu759Tj5YkPiGzQ6hLiQwhkW
	uIcq6F2S1RFL/ItPcfzwIMxovdZYNdR0oo9otUuvruTlil9oUR6RXilpfDWCHwWWpgrb28b3Np2lS
	QtMrIyg8ok6/xFMTPOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1xt-00000000iTt-38rm;
	Tue, 03 Nov 2026 00:01:25 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1xq-00000000iTA-1TVn;
	Tue, 03 Nov 2026 00:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793664076; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=bkWR/LKpsBpJDqVotNSMFJ3lO7fc2VkZ/0uWjmlMNmP+3g2MdBFA8d/TAlNtc15P4MevP81wFtg6Q/EzaEG++jMBigTO50TypVXvUTt7Zso3Pumncp4ivKaOkeEc2uA9mTjWmmDuhAgBgeuWK9cThzDHCNi8jbnapQBMf414e38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793664076; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3OIPKLcYiuutg7RdlUUK1/KmqYOx7B97326xgBZIjk0=; 
	b=J00gqz5XSRBoZiUzEHzOrVNNZb4huFV68j1p7/kFmpmtVzC7xLAVM3Ko7owrHl+v5606dZ2pLB5zxWmV/XvkgGHDzhFTdTRoserd3pHYpsDU5lqv1AQSRzoO8OF6pxxQGCjlMiZWwhzFqOAF7esdUyL8Lo9HQKa60Q4AQT7adT4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=QUlWwATNOpgYfP1lTQjqXv4lVMUhKLHBxMVjXnQmme+d+sL37vgNTW/MEPykQ/nn0sJcIjuRj1Sutpwm9mp2oXnAj55+aF2Pcbb8j7fJQjFZgx9uohoygmQyrdLYSSnhgY+aLHnQgLP3nv8AUSuRW4PqyOAlANDU2661m37up+0=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=3OIPKLcYiuutg7RdlUUK1/KmqYOx7B97326xgBZIjk0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793664076408567.6484740014362;
	Tue, 3 Nov 2026 01:01:16 +0100 (CET)
Date: Tue, 03 Nov 2026 02:01:15 +0200
From: Igor Velkov <iav@iav.lv>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
In-Reply-To: <425fde43eebc2ef0ae9003eb2d97660136ef5867.camel@collabora.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
 <425fde43eebc2ef0ae9003eb2d97660136ef5867.camel@collabora.com>
Message-ID: <20261103-rkisp1-pm-drop@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_160122_771160_52783CD1 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026, Nicolas Dufresne wrote:
> though if non of the Rockchip ARCH (32bit and 64bit) can be built
> without PM, then indeed we can drop.

ARCH_ROCKCHIP selects PM on both arm and arm64, so I'm dropping this one
and the same patch for rga.

