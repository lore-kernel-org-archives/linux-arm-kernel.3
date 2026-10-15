Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E711DCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvSQ5JjVVzKgDISLgAbOdjr4gi+0+ZX6RQXa0ZWIkc8=; b=Mc1ZGa9li7SU5eqUiNez/8wpas
	IyAzaqIS63x6nlvk/4HgFWRUXG03Nq3Px7sewvx/vI7qQJkO5/BC3uBXlMxgbvCgWY8i5ULhCUiQe
	gfoi6n5JL8T9P4Vq9DJ+k+IvCeP87QL5rKRCnkQfTv/u3yFEFfFoS3OfeBn+FctxDul2V989YjFfs
	R9NHPqzSeQfwbQZE+NnZaCf1inJK2izLud5FLJmc7/aDw6jprFCsLBL8WHdA9Hs9bHZat++qTW0R0
	IuijHRaPBgzRCidhHViX/JpM//RRFg/eJgrkp7Iqks7y2SvqfmFEhDISVjlpcCH+mV/wlypd+mTnP
	RjaCU6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHjA-0000000HGNV-3FS3;
	Thu, 15 Oct 2026 09:26:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHjA-0000000HGNI-2JKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:26:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 501DD43BAF;
	Thu, 15 Oct 2026 09:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF651F000C5;
	Thu, 15 Oct 2026 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056380;
	bh=tvSQ5JjVVzKgDISLgAbOdjr4gi+0+ZX6RQXa0ZWIkc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bMJrhViWLhZbJ+NvzguiAcc8VW3h/jigXnLyoUXisaUxD8i8IEegG8VbYRk8bAmvI
	 xPyo6c1+nk4lKVsF2hAUDb+PtdyqUN/Fnxy9WayhzbS0iJTW4PlfAP/9B0vNJhjKe/
	 AUyCwTRcjDtflS6Lt9P7LJMb4bv66/SMkJFpiYbFUvs811TWP+zogEVznPc/0xr7CO
	 SGzr7sOCisvQzAHmNV3/aA1RnVkpweULE4ebafV1Oqv4/zFIaDpZnje6GMYLJew/kS
	 jbJeqCze3H4tKXwv1POR1N63MB35FBhIXTUqC/5KdL2yk1rFoH/0uYy3NThNrwJ2FF
	 6XJEnIq3KlFmw==
Date: Thu, 15 Oct 2026 11:26:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock
 bindings
Message-ID: <20261015-stereotyped-jellyfish-of-honor-6cb5da@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-5-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:44AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
> topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
> for child nodes inside topcrm.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---

Also:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof


