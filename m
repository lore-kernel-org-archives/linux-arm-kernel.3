Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE5AE6E815
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 05:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFcwzhh7o8K49qee07mTb1ZNamBqMLC0xMDOttqkxoc=; b=sbKSlybeh1yfD8C028A+VEri5z
	Qg2ZSCb1rZ9Af22aFnFPu3o2F0YCg/tT6E437HVLwJeZdLMJwqRU/7bGG0nm9oyPnORiqMOeaiRaZ
	lDEQxSnaRhxEK6hq5caiCXNXZjdbf6fpsTI5/s8nQQFaMOWf+I1s2n+mtERmkIzIEreE6nRWQUV+S
	fczHD9WaDV9CYbH6gt3HXvyOIUR5N8HUUc7sddLk2QHjxbSp+blbaVBBGZsLCe97YeWkRsz3duyoV
	SVNBPXSBTbNN1zjLQfLL6E91sJPprathTDCWvgqaHIp6aPeCgpWSoyPiLyi/xOJalExUk7xtDgGyx
	CsdUWL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVZy-00000007wwF-37iE;
	Wed, 04 Feb 2026 05:37:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVZw-00000007wvQ-3Jdh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 05:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11E8944469;
	Wed,  4 Feb 2026 05:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BE6C116C6;
	Wed,  4 Feb 2026 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183447;
	bh=EFcwzhh7o8K49qee07mTb1ZNamBqMLC0xMDOttqkxoc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=rFuEwu/9kDzzBtD8Ll5QgwLXf5hxKzaNTh8vznwgOmu4RJbvV+oetgIpPD9YV644J
	 BcfpsIVJiZNVsaandhKHKQxL9QatAxDOJKgU8KN1CWB6HaRhxEREez4xr2M7iDZ7bU
	 cJqfKh+ilD1aoICMlqm+tMvXuSDDadPP6BuBvjgCNJii2HW2QeLznHyWPUwmkZ+hTH
	 Ni4yYewr604F2Jwlgv18Al3GlF4zQ+Jz7H4aJtzF687zbmxaX5QxXVQVsJtrXZ9wZT
	 jI6V9LLr6NS4EG/u4jiPZv6uOeer07fyZPoUphi9dxZZKHBfdIdWmdl783vRJbPCch
	 jFwP8a9JdOQ+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com> <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: aspeed: Add VIDEO reset definition
From: Stephen Boyd <sboyd@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 03 Feb 2026 21:37:26 -0800
Message-ID: <177018344610.4027.10487603254575363313@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_213728_850518_DBA70659 
X-CRM114-Status: UNSURE (   6.45  )
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

Quoting Jammy Huang (2025-10-02 18:58:44)
> ASPEED clock controller provides a couple of resets. Add the define of
> video to allow referring to it.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Applied to clk-next

