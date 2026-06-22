Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FA0CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9yXc4y5TjSK3lJ8YLzi5eKybWJ0QmDtjiJE8WrpXYk=; b=S2Ej4ltF2Ic6/7VEnMKTofiq44
	q8uXkh37123a/E+aaRpzjTgheZVF5/3sQcwPdEwMKzNnNJthQ5SJygpwTFEzy5EFLgMQziQeQq/am
	oU/aa1pPlm2geBdp67ZmpUVcoMm9ADLQYSZJzB2stzq/vBGJDKM3HpjM72YInYdkzZZxyJRM+kSLb
	ATKewbTaJN1r4H0KqS8Y4NoYx5KVmJK9nLYcXEjcYZGORmCpnFFZJavCNGS/KHq78S6t08VDAo2F1
	FNIkceSQHSAUAJF1fBwafZSPdVgWYGT3cXAHdz4yCclrTjupeqrMXImSrwYzxlIg2wyD05VLCCk+z
	tFFXV8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYWF-00000004VUD-1vnZ;
	Mon, 22 Jun 2026 06:52:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYWE-00000004VU1-2mz3;
	Mon, 22 Jun 2026 06:52:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F7FC6008A;
	Mon, 22 Jun 2026 06:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D021F1F000E9;
	Mon, 22 Jun 2026 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111149;
	bh=K9yXc4y5TjSK3lJ8YLzi5eKybWJ0QmDtjiJE8WrpXYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1V+JVAD9trv53sLLNI0iV+YhGCMKyzDcpRbwvmYVkSrS0sStVnE0N/AVl+aU9J6C
	 k6IGomCbSWF/kXzQh/+Ajm5ON4aU/DE0hoL46Xmoccvz1Xl6HFq7LC5mSHofd6x/Sw
	 F5Q1Ftzug8RO+ROJSUDM0GekGn83GU0hKcG3kNMMWClzSew0eDhJf/S4nrEAJ+ls25
	 aKZe3b45rW9FUW1/4gwW/w6QyHMr8Aeb5nOQBqoQB3JnTlDG7iNsBYnm3mK2V+2hIf
	 P1n72+fSuu6ih+qkkCgzm0UnOVOhITITjXCuIdF4sG3j5S9VyFlCwa/0WS51ZtwJIU
	 6TH1T3MdhNojA==
Date: Mon, 22 Jun 2026 08:52:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Val Packett <val@packett.cool>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260622-independent-auspicious-saluki-f9e6bb@quoll>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
 <20260621081634.467858-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260621081634.467858-2-l.scorcia@gmail.com>
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

On Sun, Jun 21, 2026 at 10:13:26AM +0200, Luca Leonardo Scorcia wrote:
>                - enum:
>                    - mediatek,mt6359-rtc
> @@ -99,6 +107,7 @@ properties:
>                - mediatek,mt6331-regulator
>                - mediatek,mt6358-regulator
>                - mediatek,mt6359-regulator
> +              - mediatek,mt6392-regulator
>                - mediatek,mt6397-regulator
>            - items:
>                - enum:
> @@ -663,3 +672,69 @@ examples:
>              compatible = "mediatek,mt6397-rtc";
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pmic {
> +        compatible = "mediatek,mt6392", "mediatek,mt6323";

You already have three examples, that's rather close to max expected
number of them. I suggest dropping.

Anyway,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


