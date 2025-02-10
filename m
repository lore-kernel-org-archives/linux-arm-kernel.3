Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A79C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfuBIcq6o6pd5Lky7KHDHxvpQdqj4uIwbsrsWkRv4y8=; b=tV36Di70Zg7VJw+pIIPeAaH1Mb
	IRVsfZ1Vdv11wIN0VPMG6FZskcpgFkHgX3yvAxpvL+emd9jNiJA9Ecyyi40w1i1yvg7ySDA3TL7CH
	UbaJvQ6Q+HDTCvt6Cq/GxELWEVXLsEtbcWbjBkZeswxXVNn6GO3BPISBSXaLaec6c6XT5Qab/TtFC
	Xmxdua9kSQO6uYA5P50918GX8qogZ50bSApTwtKc924ArIbmen9oYN0j488R1mQUGmejnpBdBxVq+
	tlv/TGIjfvXQFHe0yfs2od936AzUgjFYGmE55Is/HnE50LKNjWNg4YYihhdNmhq6Ml/E9GcApKvph
	0OzylDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUQ4-0000000042M-0R2o;
	Mon, 10 Feb 2025 14:05:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUOf-000000003sg-0TdX;
	Mon, 10 Feb 2025 14:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UfuBIcq6o6pd5Lky7KHDHxvpQdqj4uIwbsrsWkRv4y8=; b=2y259NvN7jKxSqKZofA185dq2o
	enK8KcFyHAimIMTX0cygzP3gW5BXHU98khsVCAAw3cZXywfXhHFuWS+YT+2SNZkIzZqjD1NDdnjxD
	XC5fezOqRRhoBDtwcb0zf1mYK2yET2BrphLt10XNzKUTtBYqI6PvzSLJr0kUHwACeXPPESMAlqHbx
	wdX6eR7HNTChazp8xGXMXgXK4Cdfb5wIKTe8dU1DeHp8DUhFyWcFKh5QCVpvjvY1KxH6GXhJ7Y9Uj
	5Vs0G2alSTwv+Hlg17R1mh1SgdKIrd9D8HLgETiH6QQBnQ4AbNQaV2mkJbLnU1zMcYMhwZRiNcnWY
	OPNU8jHQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thUOc-0003Qo-V6; Mon, 10 Feb 2025 15:04:22 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
Date: Mon, 10 Feb 2025 15:04:22 +0100
Message-ID: <870305083.0ifERbkFSE@diego>
In-Reply-To: <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <4315116.iIbC2pHGDl@diego>
 <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_060425_152743_FD45C696 
X-CRM114-Status: GOOD (  25.07  )
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

Hi Mark,

Am Montag, 10. Februar 2025, 14:20:58 MEZ schrieb Mark Brown:
> On Sun, Feb 09, 2025 at 10:10:47PM +0100, Heiko St=C3=BCbner wrote:
> > Am Montag, 20. Januar 2025, 10:01:27 MEZ schrieb Alexey Charkov:
> > > Add a compatible string for SPDIF on RK3588, which is similar to the
> > > one on RK3568.
>=20
> > as the binding is more in the driver-realm, is this patch still
> > somewhere on your radar?
>=20
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so=20
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

With it being 3 weeks since the patch was originally posted, I thought
it might be the time to ask if the binding-patch was still around.

I vaguely do remember you saying in the past that if a patch hasn't
been applied/handled after X time-units, it wouldn't be in your inbox
anymore, but am not sure anymore ;-) .




