Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59759E6F09F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zhEumOHdvOS21Q8dxhsdUIxoXJSndybq5PrMkA1LBU=; b=Rp45k3KEgPW6lDPaP6Nj10fRAV
	D9BrqRhE9sjTMZGgoO0y2MI/wJ5Z1PcLlzgolSyT27RhoAeqC024VCOQyPE++hOhwe3nzGcR5l9K3
	qryM12KImVnmEV2NfjITsZvBGp3G+D/PTkwYrv/1j8q5K6c6zc/jy77rkMybpfYk0PuOdkRqJ0j5X
	0QZcAlzI+SGn1tZxKQIoPdRkg2K/Tnem2tIPhWMMtdW+Z8sotFghGsy+y31B6fZSqB6YKC1P5w+sI
	9RAgcZXbPgPykqaoCfrVSEBP3uwdlQ/FyuFe7R3dfWeDd0PGvz2hGcxaNTCeM07LXAg3LjXssMFAZ
	71gZYJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5FE-0000000Fl2Q-1UAL;
	Tue, 23 Dec 2025 16:28:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5FB-0000000Fl21-31GQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 16:28:18 +0000
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D969182E;
	Tue, 23 Dec 2025 17:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766507284;
	bh=1F2Zj+2njSt5moO8g4iGnH+134BmLjJduhFI1MxZQIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+qbUMU3hgOB1+QcSutEoG0hGWuDWUahwdRdFj4iuM7C9uu6y1XByC4DvM7qCKHrF
	 D3qcdBj9rYE8aT1pWbsWEGrzwhsKPh70nbs2sq/qjJ59hv40EdOLl8vh1f09chPLZZ
	 U0F0wI3wpfvn3xwhf49X3ndFpt+b8f+Cgmn1LG5g=
Date: Tue, 23 Dec 2025 18:27:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
Message-ID: <20251223162756.GA25011@pendragon.ideasonboard.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223150256.GI9817@pendragon.ideasonboard.com>
 <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_082817_926023_116470E3 
X-CRM114-Status: GOOD (  25.59  )
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

On Tue, Dec 23, 2025 at 04:32:02PM +0100, Krzysztof Kozlowski wrote:
> On 23/12/2025 16:02, Laurent Pinchart wrote:
> > On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
> >> It is already documented but people still send noticeable amount of
> >> patches ignoring the rule - get_maintainers.pl does not work on
> >> arm64/configs/defconfig or any other shared ARM defconfig.
> >>
> >> Be more explicit, that one must not rely on typical/simple approach
> >> here for getting To/Cc list.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> ---
> >>
> >> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
> >> ---
> >>  Documentation/process/maintainer-soc.rst | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> >> index 3ba886f52a51..014c639022b2 100644
> >> --- a/Documentation/process/maintainer-soc.rst
> >> +++ b/Documentation/process/maintainer-soc.rst
> >> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
> >>  
> >>  All typical platform related patches should be sent via SoC submaintainers
> >>  (platform-specific maintainers).  This includes also changes to per-platform or
> >> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
> >> -addresses in such case).
> >> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
> >> +correct addresses for the shared defconfig, so ignore its output and manually
> >> +create CC-list based on MAINTAINERS file or use something like
> >> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
> > 
> > I fear this will be another piece of documentation that people won't
> > read. It would be more effective to implement custom logic in
> > get_maintainer.pl (or at least output an informative message).
> 
> Part of the logic is already there, but I will not grow that - I don't
> want to touch Perl code. It's pretty obvious the tool should be do it,
> so feel free to fix it.

Even if I knew perl, I'd have no time :-)

> No point however to stop proper documentation.

-- 
Regards,

Laurent Pinchart

