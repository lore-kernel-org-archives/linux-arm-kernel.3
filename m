Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B58CFA74D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPsqcevIgTno6vu61sURJjbVQM3tSWJ1lNvB7e9wHBc=; b=0sBWsQSQmh05D+oSJ0sqqrvwCh
	qVW5OPTraDQ2Ow3oQu1o9ZCXEknt8VEHIhf6yyLF6jL+fxhuGCMwF0b7GcgRn+BWRXS4j2+IdmHy1
	EtTb0JxFTDh6oXo/6v9AL7uHMfArH8HK2tloEUC8kNGPnKAlENuHD/ki9fFbUbEriqOxo809nWLa+
	sJGheQlubcHYKvzvWLysEL6A/fBp4gLInAgcAoM0KJwpLIQuWT5ncKJLjBa8hP60MSyt5uagzwMtd
	1cD1a7JNiWalchp/HYzls7gTCopIGhNGB1nB8y1rqR+Sc9oxhWuaGRNHEorHrDJ9pN6AaQWmbu+KN
	exGSKLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMaV-000000084nP-2L2G;
	Fri, 21 Nov 2025 08:33:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMaS-000000084ma-2AH9;
	Fri, 21 Nov 2025 08:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B68A7417FA;
	Fri, 21 Nov 2025 08:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148F9C4CEF1;
	Fri, 21 Nov 2025 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763714027;
	bh=ZPsqcevIgTno6vu61sURJjbVQM3tSWJ1lNvB7e9wHBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKYrCbdmILd20DSPNECohEACj0WcBraX+chq8+yzib/0dKy0Gq1NkEubAh6fHXnff
	 ijW+rFE1aQ8KsBgPKJ+tOe0NWzwD8aeoVFXyNuLc50nWCHz0VpCr1iCU7X426n2LdT
	 icXUWBeBjedtN79zTrZzdMUK8XyErobP7SPGXQDMm5WYFsYdfjJRG2S5EZ4zxXV7nr
	 SUsSqB5qr2ZDqYZMPbicz8SFyMDpaxV3N59m5AfKld9IAr9JtmX/Ehdx5n7jkq8T6q
	 hEzJa5i4O7Zamk7LtAXKgE49J2H5x0hPhG7LM7FRvDLGg6WgZ4mvFSTDEI1VY6wHqD
	 jOeapskdpqWjA==
Date: Fri, 21 Nov 2025 09:33:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960
 YAML
Message-ID: <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121054537.25796-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_003348_576841_6CA38E72 
X-CRM114-Status: UNSURE (   9.44  )
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

On Fri, Nov 21, 2025 at 06:44:59AM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.

I don't see WM8690 nowhere in the binding, so that's a bit confusing. It
feels like you mention here entire sound card description but binding is
for specific component (AFE).

Well, anyway, probably not worth to resend, so:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


