Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7533CDE003
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 04:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9gnqhkC7tG7M3NmKKfkco2hQBQzGue8GrDxF+AAz+c=; b=qczLZn9YfmEsY+ISWV2v1P34+3
	ILvral7RXGtYT3eSEziay1QnCIOYdqUq/0MIwnbGJIUjon8vDYqFKDDG8gQX+V5MyXYdlFvPVghqO
	DoYAqKKVHmulc6Ab3R+BTwHsnNnO1yCfVwjxsTN9S1SjW4p99+2030dP2WuDWvoLILWlO9HMUd+Fm
	d0QOurMCbkjrqbvnlR79kJ15v326fIqvnXdIMPU/ItQn9qwu0qvihNpejosmamzNTGVxeGC8bxAuJ
	gD7yXEKPk7Oe6KIHIfAkfIitJZQA4YTIr3io+4OVN21EIBafa1xq5TJV9PnM6J5iOGcP1uwNTl0w2
	XQxK5eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl7f-0000000BWVV-0bNW;
	Fri, 14 Nov 2025 04:09:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl7c-0000000BWV8-3FMD;
	Fri, 14 Nov 2025 04:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB040438DD;
	Fri, 14 Nov 2025 04:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF69C4CEF1;
	Fri, 14 Nov 2025 04:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763093355;
	bh=R9gnqhkC7tG7M3NmKKfkco2hQBQzGue8GrDxF+AAz+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nXuWm3zN7t6C8XMQU25qeHAqyjzsWBObfm22x9p9K9wgNsFlFp72uaxb+g7bNh7Ah
	 QkR/vm8rfu3ltWa8tke6WoyClc0JLmxFNw4Jn59uJK3SVf0TmCL2DT+nzsXJtW2E8o
	 dl8A10Y/h8hZBMwYp/Xn/nEiWIiTh4e7Iqkoo6tH9TFsYjIVYuDt4kktfGEKmCPUSm
	 ylM6R6i+l41Iu56wDbMYHnnEk59/+2RXwHk5hj7EmOAOcZyRfcDnogk3m+eZrPX5wb
	 HSjLvDukuZB8cQ6gGVYl8BwTFsUo6TpWsHgDrGt3DSapNQ6PI2hwmltGaEbqlDDKwQ
	 qKgBMfVqGJfsQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110035645.892431-2-mikhail.kshevetskiy@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu> <20251110035645.892431-2-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: clock: airoha: Add reset support to EN7523 clock binding
From: Stephen Boyd <sboyd@kernel.org>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Andreas Gnau <andreas.gnau@iopsys.eu>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Thu, 13 Nov 2025 20:09:13 -0800
Message-ID: <176309335369.11952.3651392650337156154@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_200916_832893_A1CDC9D8 
X-CRM114-Status: UNSURE (   5.28  )
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

Quoting Mikhail Kshevetskiy (2025-11-09 19:56:43)
> Introduce reset capability to EN7523 device-tree clock binding
> documentation.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

