Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C181C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31T3cY8R212Z8aHTs5rhNTvbbB/uMz7MjuMUCXin76Y=; b=0czMq2jJaVQ24L25+z4iDiTH+i
	RyX9AdGU+RHIT2g/svFShBOpgkyhdgTxvQTvBHk8DESlr8SZoBq3kqejClY2TSR0nOawBOTxDfhqj
	UXOsUqTfbr65ml8IGtLFWcfUdapDJzwIypkaDBdRKpN/c0ZpfUqbSCRwXp4boElG+XoMddN+9DjwG
	LrWcJlSrNg/eqmMlMEKhWFsdax+mrembHmCL4MITP0DJa53yesdZUKlyG1UoujRkY1MmoxhzHg511
	D0PTOtL7Y8ldVQ9+twRStGfRJ4l2Um3SrEihUxA7mSF9LV3V8Q91dTioRDZ12EDaONPLQ86JHu7ct
	kVQvetaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx73z-00000006TCH-2daF;
	Tue, 25 Mar 2025 16:23:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5wH-00000006Ico-3lFO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D57143CE2;
	Tue, 25 Mar 2025 15:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C688C4CEE4;
	Tue, 25 Mar 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915497;
	bh=31T3cY8R212Z8aHTs5rhNTvbbB/uMz7MjuMUCXin76Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=apa/XgsnwVd9nOb104wW3rJPdy4fsX4KHS7YuNwZNx7IXRYb2rMvZpWyh3H96xzkl
	 HD7zsjTZAzj0u2HBcFWHipwm96K6sLdM9o2s6qs1e2NSekXo7yhuH03nuzSEsCfcy6
	 3PqXuCLLAr5vVcB6mjV9xUXT+LifQtVX8zzRDG0EU6HiXOvl1fIkq9UkUNFxQneKkx
	 VbH+xCdBzG+XWvJvO/E/3nADw72B42cTxghDKAMX/JhmJ2fNEMTpKuxHO9VFDRWQy3
	 cMsy/zmsiAVnRNRZaZSqyer7kk3IAEgxTBgXt/S18OD4aj2uAjTWvvHgHb3GL8bNrU
	 d9HfLvCQylkFw==
Message-ID: <a3c5e4c369397efcf92dfb4ab6b0fb34@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250323-s2mpg10-v1-26-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org> <20250323-s2mpg10-v1-26-d08943702707@linaro.org>
Subject: Re: [PATCH 26/34] clk: s2mps11: add support for S2MPG10 PMIC clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Tue, 25 Mar 2025 08:11:35 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_081137_955387_B7EA5EBA 
X-CRM114-Status: UNSURE (   8.30  )
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

Quoting Andr=C3=A9 Draszik (2025-03-23 15:39:42)
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

