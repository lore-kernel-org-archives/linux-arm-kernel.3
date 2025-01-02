Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1382E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzcQumSoCseEGrz+93Y9a1/D8UYoKB6NTZZLPsLskTM=; b=VoshJscgeV/cej10sjxt9O1x+z
	oUHT+jWOgignIfbksh81qOhEs+Z7U/d3L6tbS4v7v1x8FCN7rk8XnAUGAFHLBCAZjJGlRq8eUS7yi
	xl/xCqZZ64gsOf2ly779oqS6nM5wjm81qvL7WGujGDgytxOKoJJGTj2KpguxSXZ5i4a4Z+r7FC4Cy
	BxV8TuyfPahWU8Kdnfs4pI0xqrgaMvvvcEBT2bdp8Igz//O9QmMJhWIqKrHGmtynjHGoYPk6c+QXp
	jOdmXBd6UKUt2VuP0QjEtmEdznvznlWihxVkMfL4Df9B3vtm5ckBndngZ8oRfZuQlz5ZXMuQhA9Bj
	ikLvynsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHkc-0000000A4qT-3Rm7;
	Thu, 02 Jan 2025 09:44:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHhT-0000000A4IN-3pIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:41:09 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC76275A;
	Thu,  2 Jan 2025 10:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735810816;
	bh=fFwEobIvrp9LyWBkORtJ/uRW7oOSs64PJjo+Ffia/Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3Es2wxpDcrkmTnCTZSFuVAHRGUvGh8Mi1f7KVhkFUiegmVT7Bqf+wqVsGTXV42zM
	 Z6LtfFcI1sib2E92aLcnTFRrRjZ+6ER9cAZZp0oK63oUHfZJ3rmTL96nZDnm+/YdD1
	 x6vNPytQPUNbAjINh8Iu58KZxp3CNaPlI1UwU1P8=
Date: Thu, 2 Jan 2025 11:41:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yuji2.ishikawa@toshiba.co.jp, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	nobuhiro1.iwamatsu@toshiba.co.jp, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Message-ID: <20250102094105.GD554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <d5294015-4790-490e-8136-615039a5c733@kernel.org>
 <20241217094508.GD11445@pendragon.ideasonboard.com>
 <7e50e257-9e13-4d32-8de9-8deb53fd30e4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e50e257-9e13-4d32-8de9-8deb53fd30e4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014108_096659_984C6510 
X-CRM114-Status: GOOD (  26.20  )
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

On Tue, Dec 17, 2024 at 01:51:54PM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:45, Laurent Pinchart wrote:
> > On Tue, Dec 17, 2024 at 06:43:22AM +0100, Krzysztof Kozlowski wrote:
> >> On 17/12/2024 01:00, yuji2.ishikawa@toshiba.co.jp wrote:
> >>> Hello Krzysztof
> >>>
> >>> Thank you for your review
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzk@kernel.org>
> >>>> Sent: Monday, November 25, 2024 7:08 PM
> >>>> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
> >>>> <yuji2.ishikawa@toshiba.co.jp>; Laurent Pinchart
> >>>> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
> >>>> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sakari Ailus
> >>>> <sakari.ailus@linux.intel.com>; Hans Verkuil <hverkuil-cisco@xs4all.nl>;
> >>>> iwamatsu nobuhiro(岩松 信洋 ○ＤＩＴＣ□ＤＩＴ○ＯＳＴ)
> >>>> <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> >>>> Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
> >>>> Toshiba Visconti Video Input Interface
> >>>>
> >>>> On 25/11/2024 10:21, Yuji Ishikawa wrote:
> >>>>> Adds the Device Tree binding documentation that allows to describe the
> >>>>> Video Input Interface found in Toshiba Visconti SoCs.
> >>>>>
> >>>>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> >>>>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>>>
> >>>> Why this tag stayed and other was removed? What was the reason of tag
> >>>> removal?
> >>>>
> >>>
> >>> The stayed tag is due to internal review.
> >>
> >> Did the internal review really happened? How is it that immediately new
> >> version has internal review without any traces?
> >>
> >> I have doubts this review happened in the context of reviewer's
> >> statement of oversight.
> >>
> >>> The removed tag is due to code's change (split of csi2rx part) after the last review.
> >>> If the code is largely changed following the instruction of another reviewer
> >>> after obtaining the tags, how should the tags be handled?
> >>
> >> Drop all reviews and perform reviews on the list.
> >>
> >> Such internal review appearing afterwards is rather a proof it you are
> >> adding just the tags to satisfy your process. I have no way to even
> >> verify whether that person performed any reasonable review or maybe just
> >> acked your patch.
> > 
> > How do you verify that for public reviews ?
> 
> By quality or amount of comments. Or timing. Or reviewing cover letter
> without any feedback on individual patches.
> 
> There are many, many ways. Considering how many companies were adding
> fake manager-review-tags in the past (or fake SoBs), I am pretty picky
> on that.

On the other hand I've heard numerous complains about patches being sent
by new developers from large companies to upstream lists without first
being reviewed internally by more experienced developers. You can't ask
people to review patches internally before submitting them upstream and
at the same time complain about R-b tags coming from internal reviews.

The value of a R-b tag, regardless of whether or not it comes from an
internal review, ultimately depends on the trust you have on the
reviewer. You can take that into account to decide when you consider a
patch to be ready to be merged, or to skip reviewing it if enough
reviewers you trust have looked at it first.

-- 
Regards,

Laurent Pinchart

