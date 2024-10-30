Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E82ED6B6DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV0CJUVYk+pJK8bM5R2R8JIpg8iSnCYQ7BBihu9uQzg=; b=z2IBRCLEyI/tIKoq1e2t+EEYw9
	fxy3qlQfSLwpLWvs+1KI2oTfZEe0hG6zhO++Pft7Xi5w74R62cLlgxMl/IBvscgokMo8MbyFPleV4
	jHjG+xvph//4Uzz3iNiN0YTF+wwRhil2FjxjZpPFzCxlkblJVp5mW0xJ2eSZ4t/3qj5Id15YCEJNa
	NO9UyNrjyszJBxpAp7acCTTulnJ079BqJzr67kiKQkYyQ1yecj9+XcDgxvP8NLKVsVTV42M0OJ2kv
	T+2mhUyalI8sHf3/3TeYibbio4MzMbioTX3OO213jUla68ce6Eqningy7kuWzjJ7rHALgyP5NulZz
	a+BLH7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ft9-00000001mNi-3wZ1;
	Wed, 30 Oct 2024 21:06:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Fpb-00000001lvt-4AaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 21:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67159A4334C;
	Wed, 30 Oct 2024 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB83FC4CECE;
	Wed, 30 Oct 2024 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730322138;
	bh=dV0CJUVYk+pJK8bM5R2R8JIpg8iSnCYQ7BBihu9uQzg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=tcPLhnp5GzJZQ2VpKma7dkoBKrGxTJLc4urxLyX2ZX2D+mCJMmZ5A/5k/eY+Kjs23
	 +i3Ap3fcbmnmY5KdVDasrOjRZefl56qhuvJ0JHp2SSOucvfzDTpuLvwQhI/8Uo1FYg
	 rmzmL5HDTNHsAgB/jCDwSjju4+HqSuEQhAZU1TYuNyFIrKRK+1SRxbmSaCqjrwKHwC
	 5JL1tKZIYwWJ1zsu1x4LbTAagHgvaNFiZHNoowfDBa6tLhVjgPWPjhkEUK4kWaBfLP
	 iefzW0+e4peqz6SR7V8ullh4BlBJUY/5nPrnpV7U6Mu/DkorDlj/cCS6kLGltbgXjk
	 Og0oNm4t49KWg==
Message-ID: <9d9e16d140e50b9c16ae6d3f58de719a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241028053018.2579200-4-ryan_chen@aspeedtech.com>
References: <20241028053018.2579200-1-ryan_chen@aspeedtech.com> <20241028053018.2579200-4-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
From: Stephen Boyd <sboyd@kernel.org>
To: andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, joel@jms.id.au, krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, ryan_chen@aspeedtech.com
Date: Wed, 30 Oct 2024 14:02:16 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_140220_112731_5D06215A 
X-CRM114-Status: UNSURE (   5.51  )
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

One more thing. Please remove the period from the subject. No other
patch in this series has a period at the end.

