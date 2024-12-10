Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF08E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hDnVsAT1ysEAlpRd227HZyjhDtqfOYV3AfL1852RHQ=; b=PX/kMKk7LOnMkJS9Mr2OA/6Cna
	kcSVv4AAMdCR0EepDXk1akU0PPnAB39ckGih8D1FoDjTmJCuK7mRKeaIW7sWtfg4VnEAQmvVzDQ1F
	aEApAi+PN1WBRb56rZkDHv6A0BI9wisUHK9th6CReJ//aq7Xsbt0hG8BaxS6gMmBc6aoUdaRR9FhL
	WAwYVfc4PguVHVXgcdX2VV5MxgAIkFuYCICRwM5Fsdky6nw5ERO4hk2PGGmKD1Du9TUxO8sMKU91W
	6GTutjjK8hxC35/DwWQvjOCSxFmPSorsglDpmAkA2gYEuRdYU+nSF8Uw+ykDcG8x2TKNSaP00FO3u
	jOp8wFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9IT-0000000D64I-4AQK;
	Tue, 10 Dec 2024 23:05:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9HQ-0000000D5qA-2CVt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 23:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 700AB5C5D9C;
	Tue, 10 Dec 2024 23:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDE1C4CED6;
	Tue, 10 Dec 2024 23:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871875;
	bh=xQCH/hk9rXI/a+iW/gD9HalgHRqZY+5qDViVohCJxM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xj3XEYld2AI2Cm7U9K1ji/zd5s8p7v9lpfG8nUQN8gPvQLJLiDi/ZpS3BSMKRuQfn
	 7jsHvT4xWOhXCM8tmGJ9JPT3yMZGxhgFD6yPgJhqoRwrW1qPhD7FItzN/vWn47nhjI
	 VFyGeVe1Pq+1nAllJfobDOr6R9KdpCc7G44erwIfiVKf4iZBcqj+rTIcZ/Nw29U10F
	 uG3dnXhVn5kLJOohCk5azbez4ND5JHVdU76HHaSN1abBJ/ipN7pzI8gth+BP5lwaKw
	 cizgW+9FvhoLvQvy2zSLllOJaxHW6j3ByJAW05R9GLfWmjMKcYvqOJtOlBuUBTeeJV
	 ThD6hc6wkLR9A==
Date: Tue, 10 Dec 2024 17:04:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Enric Balletbo <eballetb@redhat.com>, devicetree@vger.kernel.org,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alberto Ruiz <aruizrui@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <173387187278.766456.7689697615269440552.robh@kernel.org>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206070955.1503412-2-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150436_607555_52BE3698 
X-CRM114-Status: GOOD (  10.69  )
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


On Fri, 06 Dec 2024 09:09:52 +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
> 
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
> 
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


