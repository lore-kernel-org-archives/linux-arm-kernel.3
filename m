Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B8FCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWviE1yMvHLhkB5BCuKaIarIxybmd6mECKtXviPVDVY=; b=3Nhf879Tk0DOzD5K4pz4oaH6EV
	fhDkwlbdS/26+Q5Em7bwShI2Mfm799mNtC5BMZnTUEa6csMvxyLM9UUHQZt/eY+4+e1tA0ydyhDj7
	UaucW4KM7o7w16iPbTht5+o1tzI0euBHW+UYXbdymmJ7FPceYIRxd/ncMtoaEiNPezf4EwjBy8DBt
	Wz3feSJJFZxZyOpvR6NlSECZTFhUKbUwHNNJxYK/ltORlsc64vS4sx0Kpv4exn3fF/Cqg8tkEg8W2
	0phTsowxlXdbE+4keQoTCja0nNZpQavPlUi8LBPhnhTx2xZdrKwh8n3Q3uRSwj2a+/+v4HPZ9ukVV
	ceceyL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcI5c-00000007K3B-3SR9;
	Wed, 24 Jun 2026 07:32:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcI5b-00000007K2y-1RRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:32:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E851F42A08;
	Wed, 24 Jun 2026 07:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D571F000E9;
	Wed, 24 Jun 2026 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286322;
	bh=mWviE1yMvHLhkB5BCuKaIarIxybmd6mECKtXviPVDVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr5jEiw0IxQOcSzhu7R9Gc18bkc1txlnW6lTh5h9COJPIAI+cu9wR2ySRTHd5exfS
	 ODNGGEihd2k2221+eLgXQc8i/vjqrhFfvT8y9M6amgVKfhfHlk109lOfPPcl4NDMDD
	 ejrP8nBVjGIOvBdBF4vKnYVKf7Zr3lerFMLYKfVUXnNzSk3rZyohWk5cVLQaVG5AEC
	 M6ut9csUuCQTZTBhLo6qkpGtAW+bJfMwFJqebh4HcYAP4lXKQPc+IYCYhqWuE8yRZP
	 C1GlUdNvKQz5Xv4ipL0M54c2SakMn1JkwMcOtcpFvtO7N6yvu3a+kZBLEgAfFhxB6A
	 BZvo2Tveiw39A==
Date: Wed, 24 Jun 2026 09:31:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Barnabas Czeman <barnabas.czeman@mainlining.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Message-ID: <20260624-crafty-wildcat-of-protection-4f6cee@quoll>
References: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, Jun 23, 2026 at 09:30:51AM +0200, Krzysztof Kozlowski wrote:
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
> Kodali.  There are no new messages from them via other email addresses,
> so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
> clocks, because he looks at other Samsung clock hardware and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I missed here:
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>

Best regards,
Krzysztof


