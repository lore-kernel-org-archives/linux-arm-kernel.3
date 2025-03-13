Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A06AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ekvzqVyQtDbkp1LpeVVc222Pfg7zr+MkRQiiDkoQtQ=; b=E5pOVD9fE8C8hHeLfRl+gQGRvA
	BH5kADELa3C3oss0D233+IUCZaCjpIoNZqwd3czVoXqZtBfxMiPoqje/B72Lz/Y5XRxmJSi91xb2c
	MI0KYVlmNHWuuIvHdfqQUlwBrkp63Qmj7REiXt5KITPss5u1oBYKJ/4kVR+UtGvdgMuD6ImvzQFnS
	h2Q7sye/z0oHZlnVA+a6nYtvpUbJkpnAfWxGJSBKop3ahTkLCtnDdWAn9fPLCAxSkDyR0u63cPUhx
	FCRmoccAPh3Io26xSA6YzJqgw+w/SPgVdl2EuT8jxdp5XMDqbW1j74S929tM+29K8BCtUblegKc3i
	m7OR0ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9g-0000000Bysk-0T85;
	Thu, 13 Mar 2025 17:15:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslwp-0000000BuYY-1C8a;
	Thu, 13 Mar 2025 17:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2DDE5C6068;
	Thu, 13 Mar 2025 17:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE776C4CEDD;
	Thu, 13 Mar 2025 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741885338;
	bh=THq6mHlOJLV8EKqHAnKoFlUZWn392yIEy47QMjShAlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i5g9nS0xdkkWOO2oyUMVw6JOyWHfOuPKYcRdCeAhlp8NtPFR3V0QhwKDazBHOhspa
	 /hClD780+aGg4tvEKi6dKWcJ1aYELECR7nu8sgVScVYj9sr1RMjeOLuzN9IaMfVk8t
	 Pd+ftQu+RjxikPmqzGIYhjHTy/YntzBKN0hSTXLhACVi89tbCvPFn4S7H3DO+IcuFP
	 MFSE9WUiligV7g2g1NZjGbd7XiBBBSVPWUAMWyDM/1v9seEo34+49mnKqt1ZPoI4jv
	 oHiQZh9XiL9g08aauK8pV+TMQbB+1bhkgkws6TeDQgSIr7qsomMwqxxqr37BlVNo/4
	 etOof65Xcr0Kw==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Andrew Perepech <andrew.perepech@mediatek.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-2-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
 <20250305-mt6359-accdet-dts-v4-2-e5ffa5ee9991@collabora.com>
Subject: Re: (subset) [PATCH v4 02/19] mfd: mt6397-core: Add mfd_cell for
 mt6359-accdet
Message-Id: <174188533371.3796672.1232285311249129492.b4-ty@kernel.org>
Date: Thu, 13 Mar 2025 17:02:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_100219_378900_11BE795E 
X-CRM114-Status: UNSURE (   6.57  )
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

On Wed, 05 Mar 2025 15:58:17 -0300, Nícolas F. R. A. Prado wrote:
> Add an mfd_cell for mt6359-accdet and describe its IRQ resources to
> allow the mt6359-accdet driver to probe.
> 
> 

Applied, thanks!

[02/19] mfd: mt6397-core: Add mfd_cell for mt6359-accdet
        commit: 1b9e922a8df918812aff4090207abf4a8cb5aefa

--
Lee Jones [李琼斯]


