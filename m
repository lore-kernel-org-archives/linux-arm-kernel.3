Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43654C47BC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aparsFSrp6XnRna4YQTvJQnXZRiw88Wp44fRn5RO9fQ=; b=t27AtcKDuDaF4scZsU2AtnZc8A
	+vKu3JrtKDaTeUWNFokfU07l/hNj2sLYR1FCuhB63yIauYxpuCdkaf83i1O4Cd2MLH0peXmZ0lTuQ
	+ONIzyby2/yuy9U6RwahEsmZFzntbKFsJdV+5tGt1diledB13C68fhYR+ds2E9IoP11sbPa9yYY62
	dk4otA+gQiuZG97sqSFGPTKrXoPahM+LqTOXK1c/z5QFKmvfnHG44XmRBJjU+fjAqgjiX5hUQ16fb
	dXmDx1mxcXbfVXtrlL38ZTTp5wh1hBziynat6KmsfcQESMWCrvIjY42PWmBTmkMUJ5GU3Gnij8ZSV
	3aBhthvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2YO-0000000Ccpd-2iOh;
	Tue, 06 Jan 2026 08:36:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2YL-0000000Ccoo-1hee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6111435EE;
	Tue,  6 Jan 2026 08:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9893C116C6;
	Tue,  6 Jan 2026 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767688592;
	bh=U00KxS3/ZhhNiYqvWFcBYyPf4dVD0BanaZcaPOSnAS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MkvixbXQ0QRrU3U/nQUdVMvCJc+09gEH31nQVeU5pbdKLyWFOHxGwhUjRjmTJEf/J
	 B8IF5K8mh4CkOdnQF9npWQAvQBWoNSPbEx+ekHlWDFvR494xTmWqc5CFop03v4T+Cx
	 T1cQ7T6h7nEX6WxbHyS9jOuFljPVnUAYOV9+T4VT+uKmaMMgoGtZk73c+SheRFhFP9
	 D/wzWFdPW9sxONPA5MbfL0lEso3UlVShNf2X+7LG8tGSV21mlulOPrL+kvq1P12BVw
	 jnALxFHDz1hSl90HMjTmnXhNBwvNN/Jg1Qp9LUKKPuDEbmtGEvdjemBNZFj82TeNBL
	 ZjjzFxn0/Xr4g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260105212858.3454174-1-robh@kernel.org>
References: <20260105212858.3454174-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Drop
 unnecessary select schema
Message-Id: <176768859059.30458.3102029260720066018.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 09:36:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_003634_066398_4E5104AD 
X-CRM114-Status: UNSURE (   6.19  )
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


On Mon, 05 Jan 2026 15:28:57 -0600, Rob Herring (Arm) wrote:
> The "select" schema is not necessary because "syscon" compatible is already
> excluded from the default select logic.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select schema
      https://git.kernel.org/krzk/linux/c/4acd805157102eef1b98794450d2e599c7497542

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


