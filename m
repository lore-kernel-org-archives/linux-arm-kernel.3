Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1742BC98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlD0YDSE04Y+5bJskt4+hQwN0h9rXzRpXfuOy5CeM8M=; b=fneF7BiVOtQtcYvebbv6C8fgwu
	7ELlsK0fAB/tdp6GIj4jRoHajDBYCWoTv+MSIf7c7x+IeZZwZoDijn4yaan89HxQKeImFthk/hUY5
	9pmCenJrBFQQ+kp4Nl60MM9qFrD0Beof6q5LYiHrbkM4AfhYEDTljwQLf/J5/tTwpwDTaPryxHnYX
	SaIjytTQJsSwQK08bQ9Z3u6FbdJdrXe7YYgr6LrefEZuYI5aXQz9/rstNfqKBvkZL09gmfKKcjpBy
	cqMkSt1CJ3ghHGnipkLSittdDHlZAsCZSJni1du30siOABMPvDE7WCswQa8TDv6+Hhki0UPydyfPp
	YIgDbL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATaM-0000000FXCs-3NA9;
	Sat, 26 Sep 2026 14:41:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATaJ-0000000FXCP-1Vk6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:41:04 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D413B5;
	Sat, 26 Sep 2026 16:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790433552;
	bh=E9yMgEo6STLiVrzfsMVu1vPUXzCzM+z5oz0S/J8IlK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRG/h3bUkX4dzx7hUD6d5wd88e8sMpED/LDWWwnwO2PE9G0VD8XIbWKad7IEqcK1u
	 M+XDzTyQAJylGTfrVdngChYYWbTuTl7DaBJ14mvbaqVla2OhA63oWdaAAmUaiLUf+9
	 7s45fSeEUIPAk5cflmvjDN9MgKK3wHn7ToHLSjhU=
Date: Sat, 26 Sep 2026 17:40:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Message-ID: <20260926144058.GB764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
 <arfW_sncBRNsyP4L@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arfW_sncBRNsyP4L@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_074103_574824_91023D14 
X-CRM114-Status: GOOD (  14.63  )
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

On Sat, Sep 26, 2026 at 05:30:22PM +0300, Sakari Ailus wrote:
> Hi Rishikesh,
> 
> On Fri, Sep 25, 2026 at 06:59:55PM +0530, Rishikesh Donadkar wrote:
> > From: Jai Luthra <j-luthra@ti.com>
> > 
> > Some camera sensors now use an expanded CFA pattern to capture near-IR
> > light along with the visible spectrum (R,G,B). This allows capturing
> > light in both low-light and day-light scenarios using the same sensor.
> > 
> > Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
> > here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
> > are the same, but half the B and R pixels are replaced with Ir. Thus
> > instead of having 4 total phases, we now have 8 total phases or
> > re-arrangements of this pattern.
> > 
> > Co-developed-by: Rahul T R <r-ravikumar@ti.com>
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> 
> I think we need to use the common raw mbus and pixel formats for the
> patterns that have IR pixels. See
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

That's right, we shouldn't add new CFA-specific media bus codes. They
just don't scale.

> That's mostly pending on userspace support now.
> 
> Can the sensor output Bayer pattern as well?

-- 
Regards,

Laurent Pinchart

