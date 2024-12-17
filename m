Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F65E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XdHa+Dr544DZty8fODcbtXGQ5K7Zq1Vd6OvELfK5Jg=; b=AO7NNCgqna4aaOwx1o6RmoJ/Wj
	RzhPGeyB7RE7LxOq+YWvYAnshz/KV2boeST+wutt3p9SUuWl0CEWIfPQ8ZbtbCKIWFSJQpzv3nGVA
	kQAfpPDwJmiKryzXQbj7dUd81uxNgjv+xQrW96+rMh3ZhD9lGuL8U/NnHlay7jX1hpo/sUG50bBsW
	tmaGdu+W6iYv6yBBvN1lzeM7dV4JIOdxPdVmkXCtXUNG9931JWexeMo7+R2HvREcqRWpEelbC2JWz
	MMcNRBexffAIZwW5oYqrXp0fiFJP2Yo1dDhEZJCYquh40D8GgCbFuWgPoWEairQi1RMOho72cIvft
	plMArTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUSm-0000000D37P-2Ul7;
	Tue, 17 Dec 2024 10:06:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU8g-0000000CybC-44Rl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:45:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04FE73E;
	Tue, 17 Dec 2024 10:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734428673;
	bh=2eGNr4it5La5zFwKqlI0alnEBzdjh2a45amMsSoLjTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rY8dfRyyCgdvx1c8RZkwkEeBnkbD2AdLaXHCCD/fdzKpnISry8Pg/KVfPCXlKlzj6
	 7yCQzh7V5u9oivMMud8WJMJ11Ho49fMscu9aRKqscpryAFbyVQdcQiwHpzRIyAt1co
	 hVBzlL6c3CxZJdlylFC4n/EXCZ7YjWkQZpXlvHPY=
Date: Tue, 17 Dec 2024 11:45:08 +0200
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
Message-ID: <20241217094508.GD11445@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <d5294015-4790-490e-8136-615039a5c733@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5294015-4790-490e-8136-615039a5c733@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_014515_167843_6DF8F3C4 
X-CRM114-Status: GOOD (  23.96  )
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

On Tue, Dec 17, 2024 at 06:43:22AM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 01:00, yuji2.ishikawa@toshiba.co.jp wrote:
> > Hello Krzysztof
> > 
> > Thank you for your review
> > 
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Monday, November 25, 2024 7:08 PM
> >> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
> >> <yuji2.ishikawa@toshiba.co.jp>; Laurent Pinchart
> >> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
> >> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sakari Ailus
> >> <sakari.ailus@linux.intel.com>; Hans Verkuil <hverkuil-cisco@xs4all.nl>;
> >> iwamatsu nobuhiro(岩松 信洋 ○ＤＩＴＣ□ＤＩＴ○ＯＳＴ)
> >> <nobuhiro1.iwamatsu@toshiba.co.jp>
> >> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> >> Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
> >> Toshiba Visconti Video Input Interface
> >>
> >> On 25/11/2024 10:21, Yuji Ishikawa wrote:
> >>> Adds the Device Tree binding documentation that allows to describe the
> >>> Video Input Interface found in Toshiba Visconti SoCs.
> >>>
> >>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> >>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>
> >> Why this tag stayed and other was removed? What was the reason of tag
> >> removal?
> >>
> > 
> > The stayed tag is due to internal review.
> 
> Did the internal review really happened? How is it that immediately new
> version has internal review without any traces?
> 
> I have doubts this review happened in the context of reviewer's
> statement of oversight.
> 
> > The removed tag is due to code's change (split of csi2rx part) after the last review.
> > If the code is largely changed following the instruction of another reviewer
> > after obtaining the tags, how should the tags be handled?
> 
> Drop all reviews and perform reviews on the list.
> 
> Such internal review appearing afterwards is rather a proof it you are
> adding just the tags to satisfy your process. I have no way to even
> verify whether that person performed any reasonable review or maybe just
> acked your patch.

How do you verify that for public reviews ?

> I cannot even verify that that person understands the
> reviewer's statement of oversight.
> 
> 
> ...
> 
> >>>
> >>> Changelog v11:
> >>> - no change
> >>>
> >>> Changelog v12:
> >>> - remove property "clock-noncontinuous" as VIIF switches both modes
> >>> automatically
> >>> - remove property "link-frequencies" as VIIF does not use the
> >>> information
> >>
> >> Driver does not use or hardware supports only one frequency?
> > 
> > My comment was incorrect.
> > It should be "Driver does not use the information"
> 
> Then this is not that helping. Maybe hardware supports only one frequency?

-- 
Regards,

Laurent Pinchart

