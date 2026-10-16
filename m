Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30870CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niwuhZlVTOt+qv1gKnE+ldqS5I46ejBDnz5q59j54M0=; b=ZfEhYLn5VGhq3IEV6ndmefhKI9
	WdQQVGERKdfjE8nPGXB0392BfQmzeO0CWCILOZRHqjx+SH5HOxNaq2oYGD/Sie9DY2/qyBEiCoNqX
	zYIQn0H2e7GuSgO4qKbdj+OglYxHhs+3cXUy01L2TB3Mi5SDsVg35fFeAUynHDfdLb1KtPjyGY+zd
	CNUPmsn9hLEb+yYOV2+qMlUyaIqafcVwl3BIgNvgGD81bQb7r+1eUsMlrQMln0vO7PjvOfqOPY7tM
	jrHg+4vyoi/0zr5Rk5VJaelbDQjqO5Jg4VNuQy9ZMOb1SWYJzD/oNlZRIKPg3yA16teVxxWobvH9b
	1nqVSb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd7s-00000002JTY-48oh;
	Fri, 16 Oct 2026 08:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd7r-00000002JTP-279P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33E6240370;
	Fri, 16 Oct 2026 08:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030361F000C4;
	Fri, 16 Oct 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138635;
	bh=niwuhZlVTOt+qv1gKnE+ldqS5I46ejBDnz5q59j54M0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cXZwcUAoR/bhHRyRB0AywNuxxW1CuRdhon4wOKuOCdr3TCzUgUn9etwqaJuLLbF8e
	 Iql7LlbqqTyZSmOF5MBssIq3miyN0d4cR/Q5hAf8ZNPfhrcJYTlIywoopUcMpWaWvw
	 AuAbkF+ICsXh0G9oNmJAEoVMjW+IxjzkCfy/Ry6WtUNHfDJhnBEXlFiVCV5+sVb/Cw
	 mfGyGeO9NGFLo1xXvUSIQ2tzNFLJgbWAxZfqH6Pw5USloYE9NVIIsRay+gXhIc7Ybx
	 98kRrtaqbt3tLM7ElYFy8OHlZ9xt3d+K49Ft+X0oRlZz7MlY2bzCP30hkzW/5vz5qJ
	 XDCBpQ4k764eA==
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
Subject: Re: (subset) [PATCH 2/4] dt-bindings: mfd: syscon: add Ambarella
 CV75 secure scratchpad
Message-Id: <179213863179.2671759.15755325800663682230.b4-ty@b4>
Date: Fri, 16 Oct 2026 09:17:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Fri, 09 Oct 2026 19:00:23 +0800, Long Zhao wrote:
> Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
> scratchpad registers on CV75.

Applied, thanks!

[2/4] dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
      commit: 1c92a441330ce392fb17b348c84fa50c60493b20

--
Lee Jones [李琼斯]


