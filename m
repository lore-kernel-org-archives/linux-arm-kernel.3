Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012E2D6A22C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZJFmOhk3f7XxiHA3bQAYEzXSuU8rnOF4aCb3/emWew=; b=W7r2I11NCQ4cLtkrnU5ZJoQRir
	sZqNQpdQBG4ecT8133PF7HlnZ+PWGBuUaBNNFGQIhr4k8l+Geld8QvAemm1Cky1epT7SHumvSaZTc
	BAMT0AcwR58k/8zPY8Z21jLwXuHh9Z3b5NI1jre1Xwj9Z4O6eMapISwApvZrqHgmTMlBFeytbReOo
	9ff9YNBdAAKh8/RXGIK3ir8XAEKfACUjZNvOEFhw9zt7hz64g8iroVp93d1mIQgNqGD+t89RbwYec
	oDhBL5rYHYq0dcB0ReNA2XMAPQ9YjoHaGwK04hAEdulpTC+QN+8WqYHA9yta4lcDcP0k8khXZikc6
	CCUioHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgSZ-00000000lCb-2S4p;
	Thu, 14 Nov 2024 20:28:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgRd-00000000l30-1wNc;
	Thu, 14 Nov 2024 20:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FF775C5C72;
	Thu, 14 Nov 2024 20:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D361C4CECD;
	Thu, 14 Nov 2024 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616080;
	bh=npLoLJoAPPsZYqUWMpHUst1wrbIpESWfDtFjjjAbU+8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f8/7ZThBui4dd7ly9b/K+mT8be48ezcJJS2qWByfGvCM4ertgejTdw9hiLn0BR6Ig
	 Iz9Cep47Ho5vQm8xrnyHoyrdYIKIYd23wfKoaRjYx9bTzE5bC8i3XHGGpSZP/HWQBf
	 b80+MMtvLdoGNIRrtxrSnEEsyjgcjystJDDLXeo/o1FkxyzVD3vDR7FyeSHpM7zJyk
	 vCLd4gUC/V4wsr3VtELYnz31enaQRDbALi8t2PF6QWPplI3PqXL+MlAOPwwZ5+3QMl
	 Q12XY6uNUBvf4fIZKACtR3XCuSNIG+OcIalrz3AuyRt2d2/kkcCc+xZH5FbQvoKfy0
	 mT5MDnwdoTe+A==
Message-ID: <f3f028f62ddc376f9a8cd504faffac82.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241114072601.265011-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241114072601.265011-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: clock: actions,owl-cmu: convert to YAML
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
To: Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 12:27:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_122801_539341_5DA87E04 
X-CRM114-Status: UNSURE (   5.86  )
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

Quoting Ivaylo Ivanov (2024-11-13 23:26:00)
> Convert the Actions Semi Owl CMU bindings to DT schema.
>=20
> Changes during conversion:
>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
>    oscillator as a parent for some clocks, require it.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next

