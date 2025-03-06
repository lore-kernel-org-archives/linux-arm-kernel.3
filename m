Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06CAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 00:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0jexsz4Wxrqqk8gxPBvWplk5xhjM+SjaxN91QcSHFU=; b=1XB1hTWbh42NfbcTzQaCFjK60u
	Ge73p45vzcObFR7pt7Gq2m9BXXdP89D9jXHRfjKgJWIR4L0O+Lg/WhOjAStMJarB6eSuq8iXhitjp
	leiGHYLl5NVt1wO4VO+8ZwyTDG60d6a/joWPPPFGa4BX0zgeUE+K4+5dGJnxHG4VLNbLPexxPdzMH
	iKaCspv4Cn1PrGWgH4RcWXqkKrWVSdmKMpVevZhp5YJ7p83I6LXzjJaJ0YIEQb4uTo82VKzh828Ow
	2IrCUb4juiRXeQsUj1eiwXJ48+xQDgTH/Fd9TLE7IOdQ2MLsM+S+IfeMAqD94/1xGCfBnFJmmSLsM
	8vwdGuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzJT-00000009iU4-2Wq0;
	Thu, 06 Mar 2025 00:42:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzHs-00000009iMN-3nEN;
	Thu, 06 Mar 2025 00:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3D96A463FB;
	Thu,  6 Mar 2025 00:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35A2C4CED1;
	Thu,  6 Mar 2025 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741221631;
	bh=spSyanY6lDrTp4+hUvjUAceIgKiQRFt9KTi6mE0l0WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tu6cTkdvPoLQBKt2y/ctCltQcUs578ttgYaqT+9P8WCOzeCN+KQAdPooLUq0p7ifC
	 LXmV3wyHRMH73JIqXofxR1Bsr+PbvF6Sk91wUwRr15/yiH1J7d2ZjRXRr9stmi2Y41
	 4YobdTP7NzBS0yyw99givCjWxqJ1++rAgI+lwSStzhUx67Hoxj/mZhsHwAfo2sXKs+
	 pGW3nKBh6LX9/LRrJgYubthnI/vWP4Y+AKYCQkDgkeZE0acWx3++QM6y5eaP/BqdUE
	 ey372jXyHj/pbw+bLkBINGuUvNpxx04Z61baOpcVSAdMFYMT0xN0lixFEhENq9NU8P
	 /fkWuv57Bd+Hw==
Date: Wed, 5 Mar 2025 16:40:29 -0800
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Andrew Perepech <andrew.perepech@mediatek.com>
Subject: Re: [PATCH v3 03/20] mfd: mt6397-core: Add mfd_cell for mt6359-accdet
Message-ID: <20250306004029.GB8350@google.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
 <20250304-mt6359-accdet-dts-v3-3-5b0eafc29f5b@collabora.com>
 <a8fbb536-a246-4650-8085-d576652b0301@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8fbb536-a246-4650-8085-d576652b0301@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_164033_005747_79ECAFC2 
X-CRM114-Status: GOOD (  10.12  )
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

On Tue, 04 Mar 2025, Mark Brown wrote:

> On Tue, Mar 04, 2025 at 12:15:44PM -0300, Nícolas F. R. A. Prado wrote:
> > From: Andrew Perepech <andrew.perepech@mediatek.com>
> > 
> > Add an mfd_cell for mt6359-accdet and describe its IRQ resources to
> > allow the mt6359-accdet driver to probe.
> 
> Lee, is this OK to merge via ASoC?

Yeah, should be okay.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

