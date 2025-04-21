Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14348C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWN+exUnbJEZ3SaK2LG2iJG9B4egBXfIyEX9EdcYSGY=; b=LSTJ6gotrCl+PAWhTrL05HpGsP
	OfTJQGyojFr6zqrm/9X6WiMelmyAI8ZYgVeaqG/tu0pZuVgaBqjO99l5AK1RghQb9DD3Q/gWzVt6U
	dvtytzXqvMITX5bmPMgp8jegwGsvusuET+hoE5txurlMSXHFcmvKL8oCdgxCh8CDKmb4seyd22xLE
	wK5SdH0v62LMmoT/T0+R5Z/cTKazWS90HOoktkaTTkcXjEFJQcstIpCl4s4K6CKrC5DmaHbXts1UW
	jgnqBehxoSq59zwhlyand0Z0uXDAWGMik5fRufM5QJZ8Edf70u7dFr+T8TGw5C4/AUNtqEqSewPGH
	fkbCf2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tDL-00000004bCP-32oR;
	Mon, 21 Apr 2025 15:37:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tBU-00000004azS-0gtX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AD63A4BD30;
	Mon, 21 Apr 2025 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8701DC4CEE4;
	Mon, 21 Apr 2025 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745249746;
	bh=CNcB+iCvJ2cwygcDuB+sL6/PpkRT2R0AC4Opt0P+wZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luyQ7B4ugsLZEkcEvRDvCYtKngIAPUNJ3ra/MclmXQCfCzUyYWSiOx+Dy26TaflBc
	 wsJbDTLGaU+Tih4pdNOvoUFF1sRnUfymDhBzTz2hS2mQ05xXnBWsQLhRvtkrniFiYG
	 1yN/i3lPVIvGF7sJ99p93/M/3sleWsqjYVnEehNgK8PtUgccpm2TIWs0l79w717x1L
	 zmV2/fVl8itCllUUupT9VAegHm7JqlECG0Ko6gIA8wli9C2LBTar+dL4y2Jby1yBia
	 Ha6aBTGC5rDWpd6NKC96Jth35B3XYN7sJdEfrlq0LVDo1mOO0nEho2gR9dyyEgebk0
	 x9LI8aM3xSj0g==
Date: Mon, 21 Apr 2025 10:35:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	Larisa.Grigore@nxp.com, thomas.fossati@linaro.org, S32@nxp.com,
	ghennadi.procopciuc@nxp.com, tglx@linutronix.de,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: Add NXP System Timer Module
Message-ID: <174524973711.2547826.10808274774618846859.robh@kernel.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
 <20250417151623.121109-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417151623.121109-2-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_083548_268868_79855A83 
X-CRM114-Status: UNSURE (   9.70  )
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


On Thu, 17 Apr 2025 17:16:18 +0200, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,s32g2-stm.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


