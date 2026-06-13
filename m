Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D2CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEysZ/0DkPd0piQVp3pbkXyZYXB1A1PGVxjA1JGEr80=; b=pLoCLXpTswgxcbbQf5tmAj30nx
	RoVqj2o3QAAhOFNmKyuLt5bqBMRZNDaL0wCkfIgGDkaz6DlTkDnswnDM0VvBbnaS9i7s7C10js4Ue
	fpdksPtJWoJLfNv4GdZX6ec3d+SkBG9//ABc4DBtHJ6EMraNwjWhGTiO8jnQIicuGJNd6EOty6Ind
	rZ7yXV2EM3tf3iGlfXtXxv2CVhHZpnHt0TwVMahsNTDAKEh2+MdobUGuR4opSis7mLXf/WOzTMU51
	xaPYUIX3lJ4hLOeJJnCZapW43+QZf4OBz0KzW5D+Xa4kifJDr1+0c4/zbNDIua5nMBlaCGu+VFIQK
	ag94tD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLBn-0000000C9rE-35AZ;
	Sat, 13 Jun 2026 10:02:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLBl-0000000C9r2-3D4c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 10:02:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF0B460018;
	Sat, 13 Jun 2026 10:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1B51F000E9;
	Sat, 13 Jun 2026 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781344924;
	bh=NEysZ/0DkPd0piQVp3pbkXyZYXB1A1PGVxjA1JGEr80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KU2bo1eM0fpUY/PBLY4g2BPfUKFqpCvImfjVsrxfZDWtXke7DFuGz9lFbTA+CNYUs
	 vqqcwysVNVXExzw2+87SAeHl44IgIbBtE7HotGj901wuVU5ZJpMlPlyrjJVpyRaI5i
	 INtwMpleAmsLA9UrFrrlIvKQzjQPivvSlRYeABoyW5GxL50HKvJ1cD3jfwVbhdiUoH
	 LWLF7eYoABZOEhicCISpJ3aZpbOHJDpwTtAb4nT94aa1dgV78MaxjG32UWLjV3hYut
	 wRsXafN/UMsgIZlYv1OF0itr9wvB+eXnrR/XP1eLLvVReyZ603KZu5LtZoGXqTQ4yS
	 XqNNzw8LKLFAA==
Date: Sat, 13 Jun 2026 12:02:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Message-ID: <20260613-hasty-lynx-of-examination-2bd8c4@quoll>
References: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
 <20260613-exynos990-peris-fix-v2-v2-2-3dff7ade75b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613-exynos990-peris-fix-v2-v2-2-3dff7ade75b3@gmail.com>
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

On Sat, Jun 13, 2026 at 12:19:52AM -0500, Denzeel Oliva wrote:
> Correct eight PERIS gate clock parents to match the hardware clock
> tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
> gate.

Separate commit. Fixing clock parents is something completely different
than adding new clock gate.

Best regards,
Krzysztof


