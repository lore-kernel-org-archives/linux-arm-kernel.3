Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7F6F433CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 22:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKtLLgQn7LEdU3tj2yxTSXVkt9cu7VBxwV+Ko9/LRB4=; b=vac1SvBkkjoiaNabCCXpOtdw7n
	7a6QYV50tVF0at1KxspQbMBpCDc7MSqqoYIWN6TqSmhjeWEX28t4QXwixgcgWuecDCjHMAZC2wpOV
	tOm0/uvMf7hqWfCh+FszzA2Hi9XPHt0PdKcQXzE1N4unYsFdtarGKNiw6B+Lr5Xy0wambbq+Tb+RA
	SsHCX7fSszfFZhCFyhPeJziBkKlJPVr/vHPG2c1hCSYtm7fIrLLCMcR3wFWSyCtk8Aooy5EcKUvxU
	hg047wZF/3wMK74GbVuw7eZZn/n6vnCifGZwYwGnOONK0owxjZPH8iN99FYl/LOAqGdW8pb76tuxi
	2mX+s3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8Zr-00000001gX4-0tkR;
	Wed, 15 Apr 2026 22:19:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8Zo-00000001gWs-3lNu;
	Wed, 15 Apr 2026 22:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBC3060120;
	Wed, 15 Apr 2026 22:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF61C19424;
	Wed, 15 Apr 2026 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291555;
	bh=mRess9A22TiEIHAr1pMNzwfEEnZOrtxnuNvs8DfH/ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRpznHNSJps8tAiOqTCFPPCaloTKdTXsut7aAvF7j4LFJ2yptKptuffjty43Evm0f
	 uQ71Fpo9n0FSNNSHaUbuJpmwYLmC/jkHDkMzv7IbHANU+BuL2stxKwByGu6m9r0zcK
	 HEoEAawskEqfOcisvoR1j2GK+HLR/2R1QX2PEwoG1V8muyst0eN2kqeBaOFRSjTfoY
	 vEfOKAGoGxHgKBaATQvR0JGoCkMP3rIXiJLWnBeUc9QQ3WwjWQykuJhFBA9Jh1R2Ru
	 sr9QV24qrS4EueJALfbGZT7ofJD63BS2cx7shkxu5itm3VB+DEeXIrXm6XvBB8FXhJ
	 eqSWnI7lpe4cA==
Date: Wed, 15 Apr 2026 17:19:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: input: adc-keys: allow all input
 properties
Message-ID: <177629155084.842035.13171332724449829324.robh@kernel.org>
References: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
 <20260408-rock4d-audio-v3-1-49e43c3c2a68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-rock4d-audio-v3-1-49e43c3c2a68@collabora.com>
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


On Wed, 08 Apr 2026 19:49:39 +0200, Nicolas Frattaroli wrote:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.
> 
> Replace "additionalProperties" with "unevaluatedProperties", so that any
> of the properties in the referenced input.yaml schema can be used.
> Consequently, throw out the explicit mention of "linux,code" and extend
> the example to verify.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/input/adc-keys.yaml | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


