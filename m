Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69295606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sGFD8DRK;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gWUj0o1K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ozF3h4aUekaFNOe7DRyg0a3bh7Yt4mQLO1saPU6M4xE=; b=sGFD8DRKkBy574LEmYYSAKU5fh
	9Wbk03wcECzYaKihoPq7dLa70CCVekdqKve1itXiJeYHLbIP8puTQidJ2uQbtahK7GrP2bcMSsS7D
	clBmu9kkkTfQLurP3jkJBQjG26CELf2/ypaK8UNuOZquHtKiRVvUL9N1exhj76rswJ/ocrkpraC9O
	gtTbOXd40/TyT2kv+YHGX7rZwj8m0UwgUp1lj0j7v3AOXtC93rSKRBC+Q4Q89CE3Ab0syGk6T1q2S
	NAtAYxMKTHvyoPKFy91RoaAtp49n7s7cD7MKz6ygGlqhdPqvfwtDrVpd0DJDmQV7XJqHprf/yHjaI
	XV8CUrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1fp-00000000fS0-0RMm;
	Mon, 02 Nov 2026 23:42:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1fm-00000000fQv-3tUF;
	Mon, 02 Nov 2026 23:42:44 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3690BB1A;
	Tue,  3 Nov 2026 00:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793662823;
	bh=wAQ2GsgCD/YQbE45EYrTMRsnhVSS61FPzdNJs1TgxY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWUj0o1Kms6l1VLKnhTo6f94CoPkynqMsMINex1oVsbdXynf0+v1F0br2jDDty1aE
	 xqjTIiVcZmsIirZnG7OlMKxcxxNTLaTgUIpgrhpH2lUXFDHoV/CXIEYtL+g2dAnKU8
	 GWEebUM2t1mKqXLfiWaY1IMeF5eY7em2SfYV2bKE=
Date: Tue, 3 Nov 2026 01:42:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Igor Velkov <iav@iav.lv>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Depend on PM
Message-ID: <20261102234238.GD3559911@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
 <20261102231206.GA3559911@killaraus.ideasonboard.com>
 <20261103-rkisp1-pm-reply-2@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-rkisp1-pm-reply-2@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_154243_118531_1CF6F2B4 
X-CRM114-Status: GOOD (  13.58  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 01:25:45AM +0200, Igor Velkov wrote:
> On Tue, Nov 03, 2026, Laurent Pinchart wrote:
> > What does the driver bind to when running on a system that has PM=n ? On
> > which platform can that happen ?
> 
> None that I can name: the nodes exist only on Rockchip and i.MX8 boards,
> and those select PM. The patch came out of the rkvdec thread, where Nicolas
> pointed out that with PM=n the first MMIO access can hang and asked to
> check similar drivers [1]; rkisp1 and rga had the same pattern. If that
> case is not worth guarding, I'll drop it.

Given that it can't happen on any platform, I don't think the patch is
needed.

> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

-- 
Regards,

Laurent Pinchart

