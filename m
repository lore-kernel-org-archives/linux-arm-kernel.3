Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8053EFC9EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbBsZhdmuEywCxUlSJjMjbb6aGs/QRCw6eAEBgq1Sj4=; b=RBm9Pc5wXRCA53bGKrAx4Sj9nh
	gNUiGdyOYOgcfT2t1Tw/OrYCSKEns6nZZ2rcUkQYwnsa/kr2MwARUp/VGUHi2xDHVBZ/FNxC1e+HO
	qP8VE85beaMlbtWp5xDBs8QE7zDVIFsuQB+R9JRCsUmfUsLSAbVwnVXfgGrX6lEwgIVjAwyPhUhlp
	JAx0jl4R7dSEqVthLeOXqRv1LQfDtRAUh/6RNIDSTN0O9KaR01xmxNA+EVYBP/QbD6K3bldmlIjp9
	soWkA3o8nqUTHg8BXOQboB9E3JqCPkSl0vOhqdDJSOUoHoZJBTgXymz7NaIgVi2aMlRo+XqWQXUhg
	IGAHABag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytCg-00000005HZC-2fkC;
	Sat, 07 Mar 2026 15:04:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytCe-00000005HYc-077o;
	Sat, 07 Mar 2026 15:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E86AC40861;
	Sat,  7 Mar 2026 15:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43197C19422;
	Sat,  7 Mar 2026 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772895866;
	bh=oCfkRjhztakwBoRUIlo4c4xfYh6OciAHaZzWwJwhHWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDbxv9DsATZ11dBfMILI/t2am5ClvAF40FJqSfHCikzMfW0aHrXr0VO56g13BnB08
	 7wKm/N7a3WfRNon/eprTWUGK4ZE4zWeMxUmffKWE/Y+lCXdy42IJONdJ7FHjQCp5BX
	 omLNwzvYzlRFnnE/4HRBD6LYPVsTtPDE2uJVKP0C7SxZa4dXyz3XIvM2wlvoUEbAz+
	 TJwJFtqJUCnfM4ZpNz+uMjew7MACArz+joSsuJuVZdBUo6SHD4I5DbvBMGwJ6d8/dy
	 znHksHALaCJBaYHyz75/DpmGBjZJFzypLFBS3YAQI4FPEreldLhBbWtm/bU3PuWa+M
	 WNxQsjcC4eVWQ==
Date: Sat, 7 Mar 2026 16:04:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Val Packett <val@packett.cool>, 
	Gary Bisson <bisson.gary@gmail.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] Add support for mt6392 PMIC
Message-ID: <20260307-sensible-enigmatic-crab-7680d4@quoll>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_070428_085654_FF6B3630 
X-CRM114-Status: GOOD (  15.22  )
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

On Fri, Mar 06, 2026 at 12:03:04PM +0000, Luca Leonardo Scorcia wrote:
> The MediaTek mt6392 PMIC is usually found on devices powered by
> the mt8516/mt8167 SoC, and is yet another mt6397 variant.
> 
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.
> 
> This series only enables three functions: regulators, keys, and RTC.
> 
> I have added a handful of device tree improvements to fix some
> dtbs_check errors and addressed the comments from last year's
> reviews. The series has been tested on Xiaomi Mi Smart Clock x04g.
> 
> v2: Review feedback - replaced explicit compatibles with fallbacks
> 
> Fabien Parent (5):
>   dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
>   dt-bindings: regulator: add support for MT6392

This is incomplete - where is the actual schema for the regulators?

Best regards,
Krzysztof


