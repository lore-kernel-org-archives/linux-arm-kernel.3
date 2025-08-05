Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA8EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUORQQgTe7at1SmLU8t2KsBAWogkXqUGJJcAm265+rE=; b=GuHVSI9q+PeRTwk5CxY7mrYdCc
	cQMnPElkq3LgXm8FFRhPDRDIQwpXODs3Xw9h3zf0qmgf/ouovy58ZwZNXFYtXH4aC3N/gLt4h7pYR
	vwk0dp9b4rmcrawxQ3p7Va0VrEUgH0NNHjDqMsUwzWnNoBlGOtdaSEsh4FWdBlqmQsnVTu8K3xvZR
	Dh8lEU3w+8HG3D4AA/O3zakKzZUdn02eU1669xqJtJDTVxO+LrRJWcZtUii+8vTA2KxScCtTExrZv
	LMlEhYbQ4Er5uPBLgqCEC+Si1UnttU/g5370ebF8ANb9GE4DUZgLonG3uKGM7kskNINcsHvuPKp5p
	tMhMybmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBkG-0000000BzEe-2oft;
	Tue, 05 Aug 2025 07:06:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBZC-0000000BxGH-2ZLo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E039345B7B;
	Tue,  5 Aug 2025 06:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36335C4CEF4;
	Tue,  5 Aug 2025 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376873;
	bh=qUORQQgTe7at1SmLU8t2KsBAWogkXqUGJJcAm265+rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNmagF1Q1SJb7ewdJruKJnvQ/LSjCeCTnubSWGHk9vp5q13YCUorVRXxDRsxl3ZD5
	 OkhdVeG8i6Rtxf6lFw/GGZRYhZUWrZQTdlH/5rrqq4VPkfoqcO7UQLjCImtCaOJe0K
	 iiN4LwAC11u2hSbfOkjxC41/w4SvwryBzjPg9BaWIe/bKGZI2zSYjwBDVmCv8VbiMn
	 nAa9a4X/dTl5FEDYnID7dvBEnkFLnyJIJVOzgl9Vlw7iqsnyQvjk81vM27fQFsIt/Q
	 pGHjMJ0K87VK3anNKis15yaDFj1TFNcMoBl7TTrTDWVNCp1mOZhW44l2y8KBWUfPix
	 G8cOHoZtGAPFg==
Date: Tue, 5 Aug 2025 08:54:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, srini@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/15] dt-bindings: nvmem: microchip-otpc: remove stride
 details
Message-ID: <20250805-magic-shrewd-caracara-95dfb8@kuoka>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-7-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-7-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_235434_724014_EA29E8D9 
X-CRM114-Status: UNSURE (   8.32  )
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

On Mon, Aug 04, 2025 at 03:32:10PM +0530, Varshini Rajendran wrote:
> Removed stride details from the bindings header as they are not relevant
> anymore since the access method of OTP packets is changed to TAG
> approach. Update the example binding according to the new changes.

Where?

This was supposed to be one commit.

Best regards,
Krzysztof


