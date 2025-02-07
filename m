Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB669C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJez20VszaxXxj16JRKu4nw9gm00N8RRdq6k9u0AALs=; b=Mek0+8nO6QHVSsc+0u4aooXc6a
	MLLoLpsiSj5F6aueFJFc9wDzQ2SmySMCP6Kn7K47whOPFn8j4xDiaPmSM9BOy52wnT6alR9vxdft5
	W75R5kOKzmqjJmbRmiJ20SF4IILEfuLUd6EcTZc5PqMGlsg3s+A9KjeuBvvf0Sk3FlO5rWsh5ax3r
	v2w5rS7Gecc2y29VTY8ZAdLzvH3cM4DUDeKehaJeQAOHB5cIMb8m/1ExW6p7/UKqN3OPV1bPpBSwb
	64uOvyi471soH+y5fBt0qHjkQ+w0ak5JpTByVCAvw1jk9EPF0YNMMkoH2TchE1+2msENgqL/oS9kQ
	GLziWRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTN0-0000000Am9H-4AE7;
	Fri, 07 Feb 2025 18:46:31 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRtl-0000000ARZZ-1pCx;
	Fri, 07 Feb 2025 17:12:14 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738948331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJez20VszaxXxj16JRKu4nw9gm00N8RRdq6k9u0AALs=;
	b=V5/suE0s6oboVud4LDBpamVYDrXqsi8RJPxWLTE2+OK9RWMpYDTiGsmDcSVqaI3eWFAz4h
	4gKGUmUH0lriTYz6mztqG53hyQadYcUVIBq2OfILB90liak70DL9Rk2OiSI6CNflipScd4
	PPtIqyvwPkfP1Zuioojr8i7tFgGcbscIdQubYhwO5xrQRUH5PnZ9BI4/15+h4fJgqKGn0R
	Pumgn53Y2HSZ5pOkiIZTp0SEz3u2zWAcnMMpru4gbCFn3V9mEpMCoZobzcoZuq8ETUuAyQ
	1BoJc/fDRKh6YHfHIUmZ0NvUcRB1pep8rK/8vX/P6b7ICZdmZVXZMjqq8Bzq6A==
Date: Fri, 07 Feb 2025 18:12:10 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maximilian Weigand <mweigand@mweigand.net>, Marek Kraus <gamiee@pine64.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
In-Reply-To: <D7MD194WS7UL.FT324IUB9BIA@cknow.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
 <502523554b482a2e10d85d37761932a0@manjaro.org>
 <D7MD194WS7UL.FT324IUB9BIA@cknow.org>
Message-ID: <97df4fc0db4bf43a2a3f2d4d110e3105@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_091213_636150_B7374344 
X-CRM114-Status: GOOD (  16.37  )
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

On 2025-02-07 17:39, Diederik de Haas wrote:
> On Fri Feb 7, 2025 at 4:01 PM CET, Dragan Simic wrote:
>> On 2025-02-07 12:11, Diederik de Haas wrote:
>>> Add the recommended chassis-type root node property so userspace can
>>> request the form factor and adjust their behavior accordingly.
>>> 
>>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>>> Link:
>>> https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node
>> 
>> Maybe the Link tag should be converted into a "[1]" reference?
>> To me, this is more like a reference for this DT addition.
>> 
>> In general, references can also be placed closer to the contents
>> they back up, which isn't possible with Link tags, but of course
>> that doesn't matter much in this case.
> 
> I generally use the "[1]" format when linking to specific claims, which
> I could've done wrt the "recommended". But I considered this a general
> background link and then I prefer to do it via a Link tag.
> 
> If requested by a maintainer I'll change it ofc, but otherwise I prefer
> to keep it as is.

Indeed, in this case it's pretty much irrelevant which format is used.
In fact, it may look nicer to use a Link tag, because there are only
a few lines in the patch description in total. :)

My comment was more about longer commit/patch descriptions with multiple
references, which should benefit from placing references closer to the
backed-up contents using the "[*]" layout, instead of relying on Link
tags to bunch it all together at the end of the description.

