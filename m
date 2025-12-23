Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF62E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVarYBIeBO+55WDxOEnN9fZ3HbnDNkNOdesrja6aM7M=; b=U6wqPo6M5eu8ZA0X/sMDiM3Rze
	NE3kDpBQNO5Ek9vaSM1DiKWscR47Cnk3rcGt3MD0aHEIdaD7Us/ShBIYmvwGfBISMM22J137wlXYP
	/ja4G8nrdVpwSnFPfru7CCv7g2In6YGrA8Bi+mwx7vsb9vl5xQbDHXJwWnRRw1OXEKfmGWcvSzK0C
	qrfXlnJDNlMFBHOwNlwY0f8sinsG8jckBMau+0BGk45ohgchWQRIv/B4r/g6JgOdJmanL5FMq9LFq
	GZc66u3ZvwXOkwn06JvDw1faeT117TFSTnFz5oifuMeOihZn9wtOjhlsKEvdwVWDDT/uf4XjLSAeu
	Sdii2zrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3In-0000000Fbb5-2LWv;
	Tue, 23 Dec 2025 14:23:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Il-0000000FbaQ-2QjI;
	Tue, 23 Dec 2025 14:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D18D4362E;
	Tue, 23 Dec 2025 14:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B362FC113D0;
	Tue, 23 Dec 2025 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499830;
	bh=Id/MQ+hS6mA/o9uWhl8mU6pLWx/xDznbKci2OLxUVLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEcgACL8LYIrAfV4GxuED7vv8b7L370QHoyLgkzJEM96uqk9YVABahcduo0rM8psP
	 e0+/3xRhL8khUckbZsshVyqARqZCCUm+utOMKihVZvgXCVChZPbaD9g9DT1IBrJAxj
	 ff8uJyZQMzZgFkQbi5PDK1wCxKUzrKRxyuXV8rK5d3+AEvKcWNlGatmtX9O4W+lMLk
	 7i7a+PbTX5OsGc/2xxcRHrxCZW5O+3WD3V79mS+nyc7ajKVNodNA055uxtBk0sf3nI
	 4W5ubSQvxLJWHoWxfGEpy37VfF4UrLagZW1ZPGl/VbvJ9ZHwluCTvoNSdAhQhJjLcn
	 b0LoFMlNL0Kbg==
Date: Tue, 23 Dec 2025 15:23:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY document
Message-ID: <20251223-adder-of-imminent-recreation-ea90c0@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-1-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-1-5457d0ebcdb4@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_062351_638208_0BCF5944 
X-CRM114-Status: UNSURE (   6.55  )
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

On Mon, Dec 22, 2025 at 04:45:00PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add device tree bindings for the Axiado AX3000 eMMC PHY. The bindings
> define the required properties for configuring the external Arasan

Ah, and also:

A nit, subject: drop second/last, redundant "document". The
"dt-bindings" prefix is already stating that these are documents.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


