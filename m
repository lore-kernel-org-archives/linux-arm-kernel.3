Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BCDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6qENTBoUqfBlAkVJr7+smRplTABvNAzBcqZCjWQKHQ=; b=dyZQsYu/uwTxRVzYo+ha7Jn9B9
	AcELRuK2UvfVqY1tKQaXQta+ec/puOPwXCYsDdoW3ROFzM/Q8Ag8x2FqAxXtoajEOnP0VTBsDeTMP
	7bFwUYPpJod7zWMqlhPpRCE4tV+thSfsjq1juxiaVjQ6B864hetk17to8GzfZFWI64F1lZFvBbygl
	twvSLFeVoJuD9C3M/mbBIiK8Lfppw95o92t0IUNPKKE1OFEpU2hjiDyaozeFf5nAN/o8M5SwqWQYT
	b8k2bvxHo0Zr6KpQwVXDDsYZOGsZAIfSJ9WNeLVskzcZDFnDcuMUGjISKr4arWrvVRJls4uhqA4IR
	PkZUNEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeP8-0000000HGaO-2FqY;
	Thu, 12 Dec 2024 08:18:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeO4-0000000HGRJ-3h9d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C9405C5F4D;
	Thu, 12 Dec 2024 08:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6253CC4CECE;
	Thu, 12 Dec 2024 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733991451;
	bh=k0FKOuDzgEVL7PpLLyql5QGBAf1lpNggxg9A2Cs/6gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dU8i6Qv6AHW8QJDEe6c/rZc4kMHxuZ/sXsid0haVKb6BqAg2fZzGn/HILsGnBXLDk
	 JKhwLrxrVxoTts/73qlTnAUTUUmNZGpkTEKJNx/ugh70oRkCtMcIV1av4UgQeOayMW
	 PrwN8vGoH3uJY1YzeZpcanLDgEmNu3CvlA6zvP8IH3C56jGxQt+TeuJ8EzDgThGchc
	 q83iE1qlRAxAPDRTGvtMx97lwtVvogqMi5HuDJaiuD7XpUp8KmPVNIWYomP/FPhye1
	 GOzdlA4HUqcC17Ovv8gRefokYwG6r98t2ktCmWs3Vz7pmIf87Oz+Bu/hu5m/fcPr2l
	 fYLQcaO/y0Jng==
Date: Thu, 12 Dec 2024 09:17:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Wanner <ryan.wanner@microchip.com>
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
Message-ID: <s77ndnhfnpssi4hynbf5n2ylkrhftnlfu37km5vpqbeb552w47@fhklcvdnwasa>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
 <20241210164638.GA3770349-robh@kernel.org>
 <fb11338b-986f-4a9a-a0dd-e8f4e63941aa@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb11338b-986f-4a9a-a0dd-e8f4e63941aa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001732_964196_C5EFE1BC 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: Rob Herring <robh@kernel.org>, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-spi@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2024 at 08:25:32AM -0700, Ryan Wanner wrote:
> On 12/10/24 09:46, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Fri, Dec 06, 2024 at 12:59:52PM -0700, Ryan.Wanner@microchip.com wrote:
> >> From: Dharma Balasubiramani <dharma.b@microchip.com>
> >>
> >> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> >> since the SAMA7D65 PMC shares the same properties and clock requirements
> >> as the SAMA7G5.
> >>
> >> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> >> the clocks property for sama7d65 SoC.
> >>
> >> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> >> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> > 
> > Missing Conor's ack.
> I removed the ack because I have changed the original patch that was
> acked. Should the ack not have been removed even though the original
> patch as been changed?

Nothing in changelog says about changes to this patch. Nothing also
mentions dropping acks.

Please read:

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


