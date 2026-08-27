Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058BC61DC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNvvXnZTcToeWcmo8q9ZLG/glHngblgB9JGX2UP3+gE=; b=DgD05CLd7qnOHT2g/AJZGK5ftH
	XFp+UcfRCMabrNUxEpEfSk7BvON+keI45rv/sjPifRT1RsjoDlBodi8PZaV31TCTTqXNiLe/1HsU2
	jFwWZGcytNJhCHdhH7nGdGNS1Gjb2FPQZ/btaniG4QpXfIxOfGt7t1C68P1OnD202jY5jYfKmMOcf
	a7VT3xwfUKPXItZ7PcSjijzqsF1zHZA0mLZ1gi6kltpLyAtoT51Y1+pl9Iq1904kIRh1iEi9HOwn5
	kh3JDqhj8FGSRFraDwmy4+egYkmCEYgtdR6ckAMWbtFAvrI9MLhrN5QkCXIfzAd8NHfKnirMzJ9EW
	RWAhxstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWaQ-00000003lqt-34qm;
	Thu, 27 Aug 2026 09:39:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWaQ-00000003lqb-0uEt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A3CC600DC;
	Thu, 27 Aug 2026 09:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8466D1F000E9;
	Thu, 27 Aug 2026 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787823593;
	bh=yNvvXnZTcToeWcmo8q9ZLG/glHngblgB9JGX2UP3+gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pbs2iwtvEcx323tU36kyX+fTx+qPqKzIlu0xUOApQXJSATiA1jbtfjmydttUPq1Y2
	 rjkcXEIN8273sf6v/1KLqFlnfAzQXIvhC36Mo6KdzrEOa+2YQhIoVP1B8Gt1Ne60m8
	 s/sUeHS/xz69VICrHF21AJNAKzLmVCfQVyQZHzoe+hQrMKc7kW8pPcghkMlDIlN8QA
	 hkdKybaJJJuLTLdP0Ney2RoUgSnBCHbINwCe/qk/qKXjpGKBbKx6uJHHHo04dj8U4a
	 oAEIeBUmAB/4dQMWodWZkrxgrPOa1lBZ/hfZ4Po6p1d1DKzHiFt4yVcsTp98WTRKWa
	 HxPPskxfbEEow==
Date: Thu, 27 Aug 2026 11:39:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
Message-ID: <20260827-angelic-paper-mantis-c5c13f@quoll>
References: <20260819163410.119755-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>
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

On Wed, Aug 19, 2026 at 06:33:52PM +0200, Marek Vasut wrote:
> Document ST UCPD Type-C block. The UCPD integrates the physical
> layer of the Power Delivery (PD), with CC signaling method, for
> operation with Type-C cables. Vbus and Vconn control is performed
> using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Unresolved Sashiko comments.

Best regards,
Krzysztof


