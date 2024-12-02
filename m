Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6010D10DCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01FuAxltFboSgbkGDbFpTK6260zYPeJejN9Ld7/Oa+I=; b=o6t9fYjiCNKtDq07ySfXoBJXJe
	7Tw7sgE0JqkIYLEVNWL2mKcbT004rKZ0jlt5Pk+r4I+PGKGmJ5++hPnVGBVE6rinDHhrLYMbjdi6f
	Ofkczunhuit8DCAa5Qw37fcoE81BbgcFZZwJFIIJvQAEsPBMc+msnCjIwCxghtqaQLFLid5SeVPL+
	ISoDtpxiZJ4iYDBC1wz8i+r2DgWhVzsMmXs3N20oW1no8+ZV+BVN1AI6wSjMNng/imUO5Fn3g6gAG
	5OOcW2BfSE1PF9w97vbM1bZNb9o5J1hM4v2f2Vc78XCLh36+PtxB/9XEDyJLUCyHflt5sdu1JhdkR
	qEX3yydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI22O-00000005SG8-0mlo;
	Mon, 02 Dec 2024 08:44:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI21P-00000005S6K-0U1w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03141A40E28;
	Mon,  2 Dec 2024 08:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6750DC4CED2;
	Mon,  2 Dec 2024 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733128990;
	bh=01FuAxltFboSgbkGDbFpTK6260zYPeJejN9Ld7/Oa+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BewmDXEjnik5rDyz7I6LePOM/9876awp5O+bowTeGJFPpI+WurDcm8Av4gBQF9uXH
	 VlfYobB5syMpKVVkF9UsYzbkQCdU0LOb+vxL75Xs0bEAtqzlRdhU/bzvLbcdPGicB5
	 GMgddUnKfPjcr/zMwjKBsK3jK+9hZYXtvf0/WjMtn/fjrl5ohTwgpdkHzWUVnHyX/O
	 XmG6RQNBLAOT2ouAyTbwMuz1FMYCwwTLtDvJiR7iUNtZmRjEkqt41uO5oYJgHGhR5z
	 VEfcVmaZqc0E089XUHEoN7Y/TXiKgqANYQxx6OCfhyFOyyS0eMqlV3Phc+9d06lg87
	 kKHxUmaQEfkcA==
Date: Mon, 2 Dec 2024 09:43:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: apple: Add T2 devices
Message-ID: <5ap2q5ok2jsqvft3puha6n4wmdc6tjtr5r52qdvblpiqz6t5ak@oas4a3vdikox>
References: <20241201161942.36027-1-towinchenmi@gmail.com>
 <20241201161942.36027-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241201161942.36027-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_004311_217158_363CD367 
X-CRM114-Status: UNSURE (   6.83  )
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

On Mon, Dec 02, 2024 at 12:18:41AM +0800, Nick Chan wrote:
> This adds the following apple,t8012 based platforms:


"Add"
Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


