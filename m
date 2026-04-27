Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B98FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1h5j5+eiXV3DPEygN/MxYdDZ6F/XfnVoRspfDqolbQo=; b=b2Ui1sCZMfwSyQ7EhROkrU/D/Q
	r/D4YdcVEpIULdDc+6AvD3RCl2KGhyNhKVuLTJmeKwtlvaqAdD0/zWcae3wpj5w3sie2Wn2obnMQs
	KyiKty3nILpdO4F6rigZYZivrZOmhzHUmZv3FwbwzbAaW65TtUxmMsPRCujfvuFuqzyu0cL6uKE6Q
	W/++YISt1B2Q45LzXFrIkfJj2Sp0MGLN4YVcgpBHBcb/mRzKNkrbWQ3YOjYNLEXnTc7ID5FiQlmVM
	qQH9dHxm/WLSpuHY9CfLHJVjCU510mT0pxtcOLxRoZdZReHL0u3G7AaXCNlU0YUTCW4RRyx7yi5zO
	5Si3kUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMNe-0000000H26i-1IIW;
	Mon, 27 Apr 2026 13:52:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMNd-0000000H26X-1Fvr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC29D6014B;
	Mon, 27 Apr 2026 13:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447BFC19425;
	Mon, 27 Apr 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297928;
	bh=lsJOmTUcAu0z5/TAAJg5YU30Hd+zFvlOGUzZYlCCFVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M9wasWs+kX1157BtlmeT/XCUGBiBfBcx7VM19UG0pPhERJucZ1KbNYesnSwTdPtNo
	 aCkDdFb4NbnO/v9JZcC/ObluckiS6MM+aHwILzKI6lR5n0HkKPN78lhxssnGCvLly6
	 KPH2upNo+AM3S9++DAYqQaxAKmqmoPV92xXeW46IFAGjrKs7vZJTsuJeFyM66F0EfP
	 3vYYvrjm5QSXwFFzA/0BE42ag38guhXggh5F5W8qp2Co7PP6ep51xembSFQ7VvEL1e
	 IhRgbmY7twggmNHs50CykkTIIkXp2ZdggfXYC7DY6ZFXW40LsU8u+eKGdX8iAB/Buj
	 8zGIJ+uTehw7A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
References: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
Message-Id: <177729792499.37277.15065378345942727553.b4-ty@b4>
Date: Mon, 27 Apr 2026 15:52:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
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


On Wed, 25 Mar 2026 00:26:32 +0000, Alexey Klimov wrote:
> Without poweroff node Exynos850-based board continue to draw current
> (around ~60 mA with my test setup) after poweroff. Kernel also reports
> different lockup problems and RCU stalls warnings continuosly after
> last kernel messages about hardware being switched off.
> Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
> register that actually switches the SoC off.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos850: Add syscon-poweroff node
      https://git.kernel.org/krzk/linux/c/47d4dc90181c8ffa9ebcbd058e312873a46aeaca

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


