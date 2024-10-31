Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F21D767E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVGRFXOpY7MsjQSe5Zdbi5FXnlM2Dt4oee4wSjV/btw=; b=V2XmxqMBY6IhRSLURfM1/HAn1n
	75/8LvNgiOpm9mV5ZiIsx3JdYjw0+Fyc2grr/UJBN9sXz735qRPO8MUZbXvpHGBWefPHlyLTFnwgf
	ZpYWiriNDWUbwDsniaq4Bqe5l20EdrNDwoT8VKP/MEUfuBPuyQUTts/k/zWl026gmCt1FaiWALf18
	FE1h/gTPbPjE/ajDYGmuOZ7FjVef7UdgK6U0LFFCWoT0hzUKKjsulgEJmRZVxIsCpF8B4K3v46ZTk
	tSi9OJMuX6NnwL/VoZUHeClCCEXcjcNz0AS56tX7HitVxZsSrl7ihDcdIR8Hb6ZKN/1fJlhd7G8sS
	zLJzWrAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YDK-00000004DG8-0cYr;
	Thu, 31 Oct 2024 16:40:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XtC-00000004A7d-3thM;
	Thu, 31 Oct 2024 16:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03D99A44531;
	Thu, 31 Oct 2024 16:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DBDC4FEF0;
	Thu, 31 Oct 2024 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391553;
	bh=ruV57zycALUYqXq7sbjMoyguiyhwCg4fRE28NR5VSPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsnDtzRRfxlfOkFUaj6rZqBLg+p2gcnjAvRPw4V6CrDB8wT2BrWE3euDB/8iZ0aAR
	 On2Y7EGfqwG/IV8Z3QKnIrCZ6Fzrz7Rc0LsNS2z0hism7t5QggS4JKgLnHEn2fMFXl
	 /Ire5a5Mubh/y81nD6qOiNSUugtDFmrrypFh1hVLy64ji7m5hD76o8iggNHvCx/zG8
	 eamtz2EJOg1VfqvU38OquRYZ+bxgWIQAvONv0fwJHOdzY4jIhAEFXmq71qTZZT447/
	 0zSpgYYnJy012F6HjA7/VEjc+eJmIreGQE/BdvA+oNGcmjuAiNkrOcDZguQH7u3KsY
	 QSsPeoW2emTlw==
Date: Thu, 31 Oct 2024 16:19:06 +0000
From: Lee Jones <lee@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add bindings for
 MT6328
Message-ID: <20241031161906.GL10824@google.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018081050.23592-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_091915_050430_DA60C880 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, 18 Oct 2024, Yassine Oudjana wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add compatible strings for the MT6328 PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml      | 2 ++

Doesn't seem to apply cleanly.

Please rebase and resubmit.

-- 
Lee Jones [李琼斯]

