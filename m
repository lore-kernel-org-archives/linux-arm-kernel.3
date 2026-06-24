Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F785CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KSJA4KQaA75GCA5WKtutSEoOxwFOxLm2qvx+kAWOWo=; b=LQGqvxPW8U1KzNZ1r2BpGVv2cR
	vfffBTfVTbh/rE5q37cB7DP1W/7z/PW06EwvH2vYmtv++Fq2pg1zQmxE8s1+BFsQZVAfkdrhO+L+K
	YA5h/eMehtL2tw8DTT/iyvyw5y0mUOTFFAASxbkNV1hpmBiWCPdciGiBqguY7JyEJFCKr494ykCUg
	5hfvFqFLTux3gtp7lU2tcL0jN6ixNVzZ14FBfS1x35irntdPOzu1F2jYOxhGW9SfHV6iMp6Zoqp3q
	YwyGWBmtcprZQUX6ii8IJVOmHwhrSSLjq2Ax5UJHUNjCsYrBcQEst9mUZXMbm28Gge/kXGc7Njrpp
	bWBnU9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTo3-00000008J80-1gF5;
	Wed, 24 Jun 2026 20:02:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTo0-00000008J7a-3htZ;
	Wed, 24 Jun 2026 20:02:42 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 696961E6;
	Wed, 24 Jun 2026 22:01:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782331319;
	bh=DUKIEE7/NbZR/k8cWAM68518/PZODDzrS+U/d4ruhG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5Qwb1knc4r2eTb764ud9nediE0cB7p1Mt9q0e69aRTQSHkAd7UZJqXVVelzGEarK
	 QlFfXvaJ7RXtTwURcika1vW9uzUE6YjD0fnpv6+B4ZFnfzZhMu6TyA31EiE6TaILkY
	 p3IlZ42+5Jz1Hyxio+3i1dERD8ml8lN9MkmcLqGw=
Date: Wed, 24 Jun 2026 23:02:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <20260624200237.GJ851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624191935.GG851255@killaraus.ideasonboard.com>
 <ajwxcn2LXS8InAjZ@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajwxcn2LXS8InAjZ@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_130241_070913_8FDC2F50 
X-CRM114-Status: GOOD (  19.98  )
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

On Wed, Jun 24, 2026 at 02:35:14PM -0500, Frank Li wrote:
> On Wed, Jun 24, 2026 at 10:19:35PM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> > > Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> > > simplify media code.
> > >
> > > Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> > > rkisp1-dev.c only silience improvement.
> > >
> > > Anyways, *_for_each_*_scoped() already use widely and make code clean.
> > >
> > > Build test only.
> > >
> > > Sakari Ailus:
> > > 	when I try to improve the patch
> > > "Add common helper library for 1-to-1 subdev registration", I found need
> > > camss.c pattern, so I create this small improvement firstly.
> >
> > Those are nice cleanups, thank you.
> >
> > After applying this series, the only left users of the
> > fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
> 
> I already checked previously, two place use it.
> 
> fwnode_graph_get_endpoint_count(), it will go though all endpoints, last
> ep is NULL, which totally equial to scoped() version.
> 
> another one fwnode_graph_get_endpoint_by_id(), which return ep, expect
> caller to call put().
> 
> if use scoped() version, need use no_free_ptr() at return, which make think
> a little bit complex.

It would introduce a tiny bit of extra complexity there, but the
advantage (in my opinion) is that we'll be able to remove the less safe
fwnode_graph_for_each_endpoint() macro.

Now one may argue that the risk of
fwnode_graph_for_each_endpoint_scoped() is returning the iterator
without using no_free_ptr(). I wonder if that would be easier to catch
in static analysis tools than the current pattern that leaks a reference
when exiting the loop early.

> It'd better leave these as it.

-- 
Regards,

Laurent Pinchart

