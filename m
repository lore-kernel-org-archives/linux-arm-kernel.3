Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD2AC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSIn/MMHo9l2O61f64bYzH+PmebmlvN0mXOQ6ee/ER8=; b=ad68NYDar/Ie8Fyz7JyhBJWHOP
	Fzq5uDX/tKEqOhJ9dXHE2T0hq9HjclMaZkWwvz8MlCX1YHGQjTq4AdAfilaqYAy3lh03MCqezujNU
	S5o5VD02vOE2+HTRw3dFBhNiHoY2mDh18lFQi4YyR8Owhkg4dCV2P4Z7g8IpGF9TbRrKM84w/iwXF
	MphcRRI4S8Wb1XKuPobCmei3MnXwo9LncLqTEfVCgASeWO7YAbPaMfg55ZJ/CATTQEUIydFor1Rjw
	sfOqDo2xtNK8aqfXkTSZjM6H4Wj23A/IiYyec9ixJL2BMnb5pvaM8japwa4D7L7UA3EWYWYQpyXKv
	wf/nRO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7YC-0000000EIl8-2heR;
	Sat, 19 Jul 2025 13:24:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7L3-0000000EHs6-0sws
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 13:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90BDC41A10;
	Sat, 19 Jul 2025 13:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95A9C4CEE3;
	Sat, 19 Jul 2025 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752930652;
	bh=rSTIGzJE4AZYfml7shVbzMPVYvWAf8JVrO1QpxdZuh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZrsEDcQp7EjPt8b6W+QExMsYf8U6TiOGHeo8WXIbgH3bzxNijIviTLT+bMd6S3pt
	 RILQ5JwahYtLFDFypUEGy3nX0D+ebLT1JvykCytL2c/wJSdt7e1r4zSQTrVokRiv0G
	 PosLZ2kDExIbc8isbgk8KmCur2leHVapofN+WITyYx4dxvsIHUZubAEFwk8X6NVqCw
	 v8uvPrEE1Q8bW/JRa8qlpYWaeNzgUg6VLsdP3aF6kLeIUnDDG4JsV1J0/P5kXxMFYe
	 7rMlTWu6xCKpeW6v5Qn65qPBlaNbUzn2yhabpGqKqOfemEn0azOOyDsH3Xz3Kqj72a
	 eZSu1Kp86Kvhw==
Message-ID: <43aaf42a-6756-4133-8422-03ab99a59d19@kernel.org>
Date: Sat, 19 Jul 2025 15:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_061053_277741_8984D658 
X-CRM114-Status: UNSURE (   6.94  )
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

On 10.06.25 15:45, Nick Chan wrote:
> The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
> the existing driver so add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Hi Andi,

I think usually this dt-binding change adding new compatibles should go 
through your tree.

If you want to I can also take it together with the other dts changes 
though.


Best,


Sven




