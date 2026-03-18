Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7574AFCD0CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7okRwHbmOLYwcX9nZRHtRjeIdOYWsIJrwtONmfXo3Q=; b=Rvuu7hsvfEuh9WO3iWOMuFww2x
	T0B/TgQM3mxSvpX33cQiiWw4j8XkLQn6M6OCna63OiBAfUVH16z1hhqQQEa1MI+E2TMb+fiXV2frg
	9UlQTm2Hm+9rlgLmA8dQmTpzQXN+dFhLKVaXtW+5V7IeLug9gfCL0iPYydqKOZNlSgLjjTlWDdNII
	ytEPN4u+M8+FSi96b1arZj+LSct5o9/9rtCfwV1/wLoHu2N9iZwVxgZxz1e0NsgRY/kx/JOeqBpNH
	F6L0+50xD5h/Y6+8U4xBH5tmWARFuA+K6cr529rlF/aR9cYP9OrTXZEMDy/0GmRQVNCBzdgBkpGnz
	dQvJm6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lcr-00000007x4D-3fgy;
	Wed, 18 Mar 2026 07:47:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lcp-00000007x3f-3OOT;
	Wed, 18 Mar 2026 07:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B017F4345A;
	Wed, 18 Mar 2026 07:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ECBC2BCAF;
	Wed, 18 Mar 2026 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773820050;
	bh=VDiIhLFFonrPUteX43LY9+5XNgD2tV9IN6RK86KlBeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDz15YjXx23S4PukSS4zG1ixMHYOaF0o2HiXgBgyWaSJ1KiBKSJ0uUoLB4tF37Qvp
	 IbynjUFxrG+U/quK/7jTBv2AfWXcVN5b3kZ5PmSIsgoPJttKoCrDVPM6yffQgVtCog
	 n84PUu9HcvMBBcalXHeNSIk4eAZwXcNBHguMgFCX8z+w3218Dr9cZCKF7wFNuM9wrZ
	 +s1Hk1mZSqigFCbgTu2QWBS39p8oErfj6L7Hz3IIURBLqyb1/bCLjBPEJaeR7bIbaD
	 POLoSQrWMke1OYFSYAgDwK/NXr/h59ccz7Pw/PPRvCxjPfwFOCwRWFVZ3ySeOeEvuU
	 ZuUMe4SXyU7fg==
Date: Wed, 18 Mar 2026 08:47:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392
 PMIC
Message-ID: <20260318-natural-hummingbird-from-sirius-ada960@quoll>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317184507.523060-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_004731_873405_D060BFDB 
X-CRM114-Status: UNSURE (   8.97  )
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

On Tue, Mar 17, 2026 at 06:43:04PM +0000, Luca Leonardo Scorcia wrote:
> @@ -92,6 +100,7 @@ properties:
>                - mediatek,mt6328-regulator
>                - mediatek,mt6358-regulator
>                - mediatek,mt6359-regulator
> +              - mediatek,mt6392-regulator

So this also should be dropped. I understand that we added compatibles
to MFD device children 10-15 years ago, but what is the point of doing
this still? What is the benefit? See also rules in overall-design in
writing-bindings.

>                - mediatek,mt6397-regulator
>            - items:
>                - enum:

Best regards,
Krzysztof


