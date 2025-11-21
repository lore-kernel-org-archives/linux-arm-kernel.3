Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93985CFA473
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC6eLut1Yf09opHOVTaJBeB1nlKjA4v68z7bew5ZoVo=; b=a6WYQGrlqpffwXoC/BL2S7muJa
	7osGRwuFMQnZtJJX++02l7TlmhbsIPAq2Wvrv3+6GNHttS1Hg4y5ljk0Q/nyvE2NNq/1tZyIF7hew
	ySbKwQ2IZImARN6dQ8sxRPX/S26aJ+wd40sTIbpZ76dpF+uOxps6ANGdT8yFhXZw8HavwyANqm37O
	OuxDRx2uBEDc3lq6fXQuewWPLglM4iqqM0zN2FYU5T4X3I3J2q0Jp2YJEK6RpENu7GyyFlTNwhM+J
	J2hq8QTNoZPSuTA93k3GuC3SAYpNvoqtttSGkrymdRqI1HSTpS9oBIlEnD5NR+YomwFKVgYbt/+i/
	QE1cU5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZh-00000007ps8-0H7l;
	Fri, 21 Nov 2025 05:20:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZg-00000007prz-0t0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C1916021D;
	Fri, 21 Nov 2025 05:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EDFC4CEF1;
	Fri, 21 Nov 2025 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702446;
	bh=WC6eLut1Yf09opHOVTaJBeB1nlKjA4v68z7bew5ZoVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Nu6xjMYRFI/JlWLprau9hzGZe8ly/4zqDx3Xvb9/hINt8cfFQq7vqt5tgXyvaaFf8
	 GXoJ7sn+kwRcmUwYUmrhWeOO+lTsNRhkjcaSSyHxQigQM56oZRssXDjy6FS2MKG5sO
	 IUlAmHycszpV77MQu80apcaUSSkoBEN7DYP7X/oFdGiOeW9ASBNtDAJzQATfUQqvVv
	 aFm2gixa1uO06hynDfEadFfb5hBfZuJuZ9WlhbBmhvLAwfOe5MjdxJG5CTYehWQrk4
	 SYC7G1icNswTvhY/SqGFN/8elNKzi5283Uo9niLhPKZ3AtHkeaykGrsIuWxJXjuXbS
	 JiiyltYRWyh4Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114065358.854817-2-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp> <20251114065358.854817-2-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH 1/2] clk: visconti: Do not define number of clocks in bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:53:17 -0800
Message-ID: <176369359764.11952.15909609410140938429@localhost.localdomain>
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

Quoting Yuji Ishikawa (2025-11-13 22:53:57)
> Remove use of TMPV770X_NR_CLK.
> Instead, define number of clocks inside the driver directory.
>=20
> The same for TMPV770X_NR_RESET and TMPV770X_NR_PLL.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next

