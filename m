Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997ADC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S59pn4AdRIyLRvhOPucHITzh03WSsw1V0FjkG04Ptb0=; b=ZBVFQY7Y8EHZOicc5PLDlgXdTM
	od+PHhybnel81dsDiBa+n48LBMI0kmTtxtexpAodLSVlRM6WBYYEEq4pwdCFih3SqgcfhOCImG2B/
	lEY9LfUyfWhFL6kGRvJ4osoF/sVEm1eUUgn2hQCd7uPUaJqlQqQ4T10D8nTRQVXzSN7UNtTe303nE
	pFfnobtpuB6uccR9BfBt+RBGlPq/K3oK9nCCGtBDqQ8PV0FR0nS6nwf64uG38wG0++zd37oE0rS22
	LSSsnBTt4Z9BbzCt0DiG4l4qXPKxPhV0a3jcAKGwRlMdUr1GSPeEUh60U1Bb/Yz61xcM1NvlotzBA
	RXQX9dFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vqn-00000002WqB-21k7;
	Fri, 04 Sep 2026 15:29:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vqm-00000002Wq5-2u3R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F27D6406A7;
	Fri,  4 Sep 2026 15:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABB31F00A3D;
	Fri,  4 Sep 2026 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535747;
	bh=S59pn4AdRIyLRvhOPucHITzh03WSsw1V0FjkG04Ptb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W9x9RfFkJ8m8OgJCTWC/xbbbaPZcAmvbxvyJ3GPOLaOuthWQ5lFs6B18rMiGPx00j
	 susXE+7eT96H9NfANCHEL4C6ACjzneUdJiTgp4dkmj1JpyjUOGtGAKTZqOZARpQbsR
	 gKknyVbzF4POr2qPGTibRc6FvzkLlxN/6u7H+fdPv4q1QKNAYWo73sziVAuSqhCALb
	 M/rwoMzeEF/JT2J12choMcRcVAS+QZwona2ZxJiDXSB+pHd5xzzkJQv2zbNextZYaO
	 254wN6xHcv9eg0LKNmR6cD0gzfSre7GlyNBt0E4NKFJEvXXaKbI7Y+k0B2CYrcOYHu
	 YShFytmkrKh7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Aiden Isik <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
Subject: Re: [PATCH v2 0/2] chipid: samsung: exynos-chipid: Add Exynos5515
 ChipID
Message-Id: <178853574392.59617.6944146590996935524.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:29:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Tue, 18 Aug 2026 16:05:41 +0100, Aiden Isik wrote:
> This patchset adds support for the Exynos5515 SoC's ChipID to the
> ChipID driver, and documents the samsung,exynos5515-chipid compatible.

Applied, thanks!

[1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compatible
      https://git.kernel.org/krzk/linux/c/3de7d6f8dd121d5d4b74182765be5ee8f3954d29
[2/2] soc: samsung: exynos-chipid: Add Exynos5515 SoC support
      https://git.kernel.org/krzk/linux/c/2f04ec82e51da9d5af5cb48c9f24c0318655b0f7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


