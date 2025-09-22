Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45449CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAfxSjU6OqGA7afGIh6x1r/TE5BivKUNagsL5O8Etik=; b=tfrfQqLtOIdCQaHWXK8oW9duou
	Gh/FyUdJXCttiXTVSr/indRcvvgqhkCKeOI8xOcnw9krA9rQSy2yK4jTn0BeeYa5ecH/7dJc3+gAb
	7LBbETxZyrbv2HmGqD2jnteVw6Vb5G1Q+v8kpcifZoPMvO4HVoobe82P5X9T6rlURNZHmSXMelici
	Rn5ICQ4Kgtca1HzEyZELkCAftPA5O9zAXkxLa5jq5aGP2MpgXnNehhZJVCYQwgue6VvD0kOoLtbmi
	LpHOFuw/El2Po4WJVZTHCqmxqT+sRWnvxrSY4OJSkhVHd22LuENBqVigXyBNNV84im0F5ItxwLqlb
	7TFXd7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0id4-0000000AqU6-0Rum;
	Mon, 22 Sep 2025 15:39:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0id2-0000000AqTK-042o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DAEA43E1D;
	Mon, 22 Sep 2025 15:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61BFC4CEF0;
	Mon, 22 Sep 2025 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555538;
	bh=FBWDbjZfsMysPb0xcoGWF64MTI0r+fWrLs6ifIU3x0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUmRw1gESZaZOwHKqmiaPk930EhWUHUpcYJcLamtYfE9PStoI6+9qpbvoGloczY8O
	 XkJBP+tKpbzpqrTbXxIENGg40CpLqOo6mfu4ARI7JGb0lOLMh6GgLkbNfq5gGzN4m1
	 ZkjzrpxXmTNQ/GvRsm+bBxjvyTGuKBY5eqRmm8zxthD/aOjlH3QMYbngVxS10PGmdx
	 +SsQIgN6yp6lm+EanBfIeakIyB42WGZd5nKF4uEgSg1CqbWDKN1A1KnBajvOdL0IZ/
	 c9GEt6IZROwXyE2Tfn/Db1Pr2vvk+UVh8UQR8OPOMART4JIyl8PIMJ9vwgodzX9v3p
	 4FYuaPAQFcqpg==
Date: Mon, 22 Sep 2025 10:38:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: input: document Samsung A552
 touchscreen controller
Message-ID: <175855553663.6246.2974787430902564373.robh@kernel.org>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083900_072195_D258547C 
X-CRM114-Status: GOOD (  10.26  )
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


On Sun, 14 Sep 2025 16:44:56 +0300, Ivaylo Ivanov wrote:
> Document the Samsung A552 touchscreen controller, present in devices like
> the Samsung Galaxy S7.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../input/touchscreen/samsung,s6sa552.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


