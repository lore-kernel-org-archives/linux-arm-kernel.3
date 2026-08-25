Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5330C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SX3XLtrazkTuCQ/ilBaxmWP2RaJblskG7NlcD6dvfo=; b=ueWARe9pP19Hvi3rhO8VRIUr4d
	L80Lwyxps1bot+qaoR7JQnmS2NeoqjexVZc0wveAjlJktGxTOGojufKuJLHG8Fv4RzgHRbsT4uJDR
	oZcKyuoZ33YruLGVy8/ph33KASu6KDoZOw2AtMDncEZO4iVKTEKixCcYW/Ez3rXrmteZThX3lowEA
	D/gOOdtozB3UmgiR9jbs/LsJURyP4aZd8KAidwfwaqY9lQmwJtbQi7KGC3aIoL3kYPZeDZwQ2ETZP
	TNlfPAACyvqf+izklpdxiu8AjhofOlG/qKXCMjBQ/gkbXQImU8r47a1yDzoSoK5tUi3QD8U2TIj88
	NmeZNtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykHo-00000000D7R-2Tgx;
	Tue, 25 Aug 2026 06:05:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykHl-00000000D6n-2qc2;
	Tue, 25 Aug 2026 06:05:27 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:c31d:3341:ef05:614a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5363F2EC;
	Tue, 25 Aug 2026 08:03:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787637837;
	bh=5SX3XLtrazkTuCQ/ilBaxmWP2RaJblskG7NlcD6dvfo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mXM4HMQ0bmP4BxzGxcvQ5bzXkBDgV6ANdQeKF6Xv0flXww8U5mX+isjVZIhXgaPqJ
	 5hRy5al5QzHjy/Zxjc0XUakNZhTNC9fHuLxfEMqb+HcOffX2jiUlst2mnAXqABZUSu
	 AuS2shD/vBUc6OO7gN9x874A3sUuITWBDdBom3rY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c2ed44e5-ed5c-41f7-a782-57c82968495e@kernel.org>
References: <20260824090406.3695880-1-paul.elder@ideasonboard.com> <20260824090406.3695880-2-paul.elder@ideasonboard.com> <c2ed44e5-ed5c-41f7-a782-57c82968495e@kernel.org>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: Add rockchip rkisp2 bindings
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: michael.riesch@collabora.com, xuhf@rock-chips.com, stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, laurent.pinchart@ideasonboard.com
Date: Tue, 25 Aug 2026 15:05:17 +0900
Message-ID: <178763791744.3620719.5831445737928843099@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_230525_867110_BAC7B00E 
X-CRM114-Status: GOOD (  20.48  )
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

Hi Krzysztof,

Quoting Krzysztof Kozlowski (2026-08-24 19:52:26)
> On 24/08/2026 11:03, Paul Elder wrote:
> > Add documentation for the Rockchip rkisp2 bindings. This is meant to
> > support multiple versions of Rockchip ISPs going forward, including the
> > 2.x series and 3.x series. The current version only adds the compatible
> > for the RK3588, which is a 3.0.
> >=20
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>=20
> Testing is disabled for some time but it's not really a reason to opt out.
>=20
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.

I did not use b4 but I did use scripts/get_maintainer.pl via --cc-cmd on git
send-email. Is that not expected to work?

> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
>=20
> Please kindly resend and include all necessary To/Cc entries.
>=20
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L23

Indeed I missed that, my bad.


Paul

>=20
>=20
> Best regards,
> Krzysztof

