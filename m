Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43006C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XwVNG0dQqzbNC40ZR40/7vFNPu5ZB7Ps/ymYHdL+po=; b=hDhGyzUK8fWbc8O9Cx0jsOHJl3
	ji1TU0FLe3K1fwWEQMM7VAnV3YhBvq/YrsaJPn6X3ANZ6lhD8+JS85bOuS3eOSoVH6U/DN26V5NNw
	mI6/Rp7TF56QhNhThbnSLQrLKGmMoM507G/nUdH8LvWRFrBF3MPEaaLoQT5NTH5ojC8D1arX9Cyw9
	+LSokoN40eFnw39ObsDVfifj1ZDeM/iZpHNuG8d/AxZds/VyngYvmEqtxi20s1zi/X0l9zKNbI8or
	cKWMX5ro361l4uqOJoewjCKXmANBES2Zmz3gZ3WXh39HOOLx31ZJ8RYdscS5GVvxkq6frNMWACEGX
	4rgDgpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5O4-000000081Bw-0unD;
	Tue, 10 Jun 2025 20:16:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2CJ-00000007X6I-45x9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42979A514A0;
	Tue, 10 Jun 2025 16:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB19C4CEED;
	Tue, 10 Jun 2025 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574298;
	bh=O2hBNT2vFnfr2GKirm5zT02sWMH4fe9vNHz+wUQLrYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c5BtzaQNc4JDuBf8SjSi1dNIZnnB7X9eMkM1Y6WQwIuEJnpLxFosTWtnX2NMU3tjY
	 fDMHsiY12crShD6NJJmTgZPbeyDlNaKyeQ6q206Mx64XKepiXWcgRqLgumT7DPrO+r
	 WuSuexJ6yNPdL8hK4QJx+ipHA67Q4IyD96nbRTK2FqZfNcSvkuLgaxnw6eDFcp8Uzd
	 QWr9QoHKkj1DfHqqUuN6p1yWKjS9cyUM+1uJwDLdqgzRXlI3ZuX/kvzm9aHynleOJz
	 g+yFJGcoEjITQqMl7sCN7cl49gi/xybiCvQ/awXLXIP8GlYuEEsUQGVa3C0NXP49dI
	 JB+DgTnAmYJAw==
Message-ID: <79b9fa2e-ea04-43f7-8b12-c2cba2a363fb@kernel.org>
Date: Tue, 10 Jun 2025 18:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_095140_080776_E1FECC7C 
X-CRM114-Status: UNSURE (   6.03  )
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

Reviewed-by: Sven Peter <sven@kernel.org>



