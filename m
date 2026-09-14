Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A26C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l35PSRApsaTGs+mJ1KLuOuYsuZ+qz+hDK5/Ju9T4UMk=; b=OsateI4/wPH+DfHIlOSLhdmCVb
	Y9AZdWt6eRxFcuODEXjJ9yV/2C62BTQOCSXV6q48ksMox7ZMU14F4SmDe+hcCPmVm1iK0RpM/yY6k
	FJvhbqIsW3w9fuFn6hPDG9hng5560jMRSwpRsMlAJmPPGJ+lOU42v9KwvwbyMSSTGvKyG1B3YxzaT
	350FIqZ47SyQFj/KBlKqWQ9jmbZurBzKN/pP66B1Jxhvmowsqnb8c3PN/G+J7okIVIAVPQVn36bnt
	S9TqsXKmHtmuoG2jqx3Gnt+sZobzOvjid+RpK+BOJS5hbVSOgDZaITsenTo2+GoH4bNASgMscr5kz
	pohyREPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EbA-00000004kSP-1DJw;
	Mon, 14 Sep 2026 21:52:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Eb9-00000004kSE-1Rdb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 759AF60252;
	Mon, 14 Sep 2026 21:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D88F1F000FF;
	Mon, 14 Sep 2026 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789422742;
	bh=l35PSRApsaTGs+mJ1KLuOuYsuZ+qz+hDK5/Ju9T4UMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LC/NrdwZNGK+ASmYkJR2z60jZ7Owx89/VUiiZt45znb3bTs4aHAawUWaTW7N20eqR
	 G5Ee2xcJlPR5N++ZOs4KchoQGKFqQ300fnDp2lVdfHbX6aj5GIcXjVvljNRbpHSxCm
	 tlYIfcWn+1USATM0xT8r+Z8+hiIl9SvkOWTpU6h/O85luo36C6eE5eg8cY0Tg/yTX1
	 JVdPEEqTOA3OCy0DRt423oNM4+J8tCZ4/JOW+rdFEgHSRuTyJxVs+9Ob/Jp39BfQ5r
	 xxXwCo2VjpvpHfLXEKrU6zV3JDtR701+E/lEHFrMzlJWil/L8TQYX/Kil5nO9mfl9E
	 so3OaeKRZzuqQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Judith Mendez <jm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910155509.1425682-1-jm@ti.com>
References: <20260910155509.1425682-1-jm@ti.com>
Subject: Re: (subset) [PATCH v3 0/3] Support AM62P silicon revision
 detection via uniphier-efuse
Message-Id: <178942274041.683176.599438200260103620.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 22:52:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 10 Sep 2026 10:55:06 -0500, Judith Mendez wrote:
> This series adds support for reading AM62P silicon revision from the
> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
> driver by adding ti,am62p-efuse as a compatible string. The three patches
> update the devicetree binding to document the new compatible, configure
> the driver as mandatory builtin for K3 architectures, and extend the driver
> to support AM62P devices. The uniphier-efuse driver is simple enough to be
> reused for efuse register reads on the AM62P SoC.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
      commit: c66d971968218d7f746e85701d4c226746654690
[2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
      commit: 0bf05ce85c82783c103a3beb28fa6607dae8ea79

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


