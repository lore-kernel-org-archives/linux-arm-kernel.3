Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62278CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmBkesNmuLNvUJn5rrwSRud7R4UXCLNjjmtNsb00ATk=; b=fVHBndfyIiqkZ12QabXJ2TIJ3j
	lP83jP65M+esnpFMjMIhblEuJ9RtiZEE4QTGE5ncDwHpil7bPx0G/4/ZHbqTK6U0eIkn91waMirZK
	uh4q8xK8zwZ9DBOE8xo0ggssuKRzrpK0cya39NLSS/zMK7qrJkU6eGw6TxHFE1HN54KsjTPbl4f7f
	dNpxrv4J9xsoEwbswT7fDcBXfAP6t07QTr3jkBlLNW/624JSr05yrpaN3/IuKgSBSiXs7UR/ETDwq
	cPOShGG9C9PyQto3rLfKOCEHI7BH8nYfHsQFGiFD8AVgMBKT2jUXnrHi2fucpLxxieMtWFjkU3kdE
	hweqge1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJqU-00000007UPL-1c6Q;
	Wed, 24 Jun 2026 09:24:34 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJqQ-00000007UOZ-4BPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:24:33 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ABE3220078;
	Wed, 24 Jun 2026 11:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782293066;
	bh=pmBkesNmuLNvUJn5rrwSRud7R4UXCLNjjmtNsb00ATk=; h=From:To:Subject;
	b=zJqFV6vLGI/4MsUw1JuuF4VfY0/aHTgm4za771PD3OyLAKzSgRzGvVU2RNdTj8sP+
	 8uaVnVdzFPvCezbAT5qoztkC+sL0fFwOtiAcNUgr52XroELvyObJd8dAIHpUVbRJVE
	 kowxnSJ2rZ3lawvQdt44T2ggJsI65W6QSSf92GTji6GK9bdLtnt9aYwzebIVu3XmZc
	 l0r9YpmxixJw38js4ET5+rRA4EvvonMPnlwBTdMXmf4L3JOkVDc+jFjukeV9PBQsHj
	 w+QevUTrn7Avtb5kV8OCem2WNOVbdGitwRlQYgKpaxTeRv8bqMB7No018XI3K+O0Pp
	 D1kV7z4BCdebg==
Date: Wed, 24 Jun 2026 11:24:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org,
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com,
	sam@ravnborg.org, leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
Message-ID: <20260624092420.GA10665@francesco-nb>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022431_955019_CCE6DAD7 
X-CRM114-Status: UNSURE (   7.36  )
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

On Tue, Jun 23, 2026 at 04:57:36PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> This series adds device tree overlays for Toradex Capacitive 
> Touch Display 10.1" LVDS V2 on Verdin AM62.
> 
> The display addition covers two interface types:
> 
> - Native OLDI (LVDS)
> - DSI-to-LVDS adapter based on the SN65DSI84
> 
> The Opto Logic vendor prefix and panel binding for the SCX1001511GGC49 is
> also added.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


