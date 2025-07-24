Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3FFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdtfimAfbnNoflFww3wHpTZAa3JCqSHF6qHluxoM+AY=; b=bm5+lKfSlpDQZ6hRcR2aGFpExK
	7OOIrck/qr9dbw3zgVCbSWDZmiskAU4ma+Dyh+JqMtlm4w+qNy1sIPzx8O2JhOqRYDkLReA+ThX0c
	Nd2AeDoeS7h03QZWD8bIiVNYCEGVzhnlNw0NrvcBRNnUuJAO8M+RtkzusDJfdv7IoA2MSJC3urGdC
	2hBTO9TTQVwcqthvSFSXHIkADmIMvz4Zy7flmxR+gltJ0ZAPpXX+g2KjrW7Y0jzucw8/5Ep72ta1S
	cjK7n/2VFM7SsGmEzp3Zl6oa4Pw7PzBGvfk82nHzJW7eR7pvm2fkOztFVgXRu00wByQ/CDgkGAn8N
	XCuxeCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3NB-00000008TbP-2ah4;
	Thu, 24 Jul 2025 21:21:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Km-00000008TNU-1lj9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:18:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CED5860008;
	Thu, 24 Jul 2025 21:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF81C4CEED;
	Thu, 24 Jul 2025 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391915;
	bh=IdtfimAfbnNoflFww3wHpTZAa3JCqSHF6qHluxoM+AY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qBuEp15ApxOomIh8MRz8TTIrolzvjwiIC+cs7NxzalnErdv6R7ZKg9tRNCP2Rqh+E
	 bjcVZL4+xgm3T2ljWQua4Xj4V1luh/wzvwIga1MCyNhTGQRK7XvcBkosx5vt6W/Y4+
	 nzN5lXkLFQk8cb9xnz7sVnCpXBI5PbT7P7u4T/aCKlLO4E58YXbMR+sMXEU1tFikRU
	 rXaBwdxchLI5LI7Veq7kueiulurmWX+VYsH99mYio6TkWgdbMGEEbb62ZTynIqL4qS
	 mSPMoqB+08774dcbilb/j7YvodDwBcJWe2R3Fx65f+BGIxKKxOOnNQ6sQ1KFa6U0TL
	 msjwhq0lpJvhQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250630232644.3700781-1-robh@kernel.org>
References: <20250630232644.3700781-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert moxa,moxart-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Thu, 24 Jul 2025 14:18:34 -0700
Message-ID: <175339191465.3513.9610109190156131662@lazor>
User-Agent: alot/0.11
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

Quoting Rob Herring (Arm) (2025-06-30 16:26:43)
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

