Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54287FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XPWXgF9Zk1Aw83vTfm10JB9TXEL3/AhiMRwRXofkSY=; b=uiVZbE+52Xf1hUZy0kLBw9qKpW
	2IxvYkmeeb0bun7W8K1SfN6PadLhxWwlILWfQYAUDbRL6pIDSSOk3c6RAIEIbxwsfTaLtL4IxX9Uw
	mX3hPD7oDu1l8cnTz4M3eBdu6XHS2yES7UDcoTk9AWJA8WHF31doZVVfmY8MJal+hmEiXtgstIjxA
	huWuhDrmRRMjv8Pnt60eJhjqjsdT+I+LaKc4Q8Qwtmpghpo1HEia6eEGkIE+V33QLtTUPlh7P5P7L
	2g0EM+wSRnvLrMfj1bPMIwxnkRiJ1wfAZnFY+GJpqQ3+vU/vP95VAfTnjPt8VEe7PHL4dqTv0b2Gy
	u7LTUACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtM-00000002s1F-1WXn;
	Wed, 29 Apr 2026 03:47:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtD-00000002rsx-0P9c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B43F642CC1;
	Wed, 29 Apr 2026 03:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFA7C2BCB4;
	Wed, 29 Apr 2026 03:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434426;
	bh=7XPWXgF9Zk1Aw83vTfm10JB9TXEL3/AhiMRwRXofkSY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iU73x+VoSqUZjW7ECVa5JA0Sjo4132s07dPLGTyFypUx+PiToZfA2NQBakYkF892g
	 POm5NhdGU5exuYYC30Oodgz1s2a3QctuAQufEKJR+XjxD+mjfHbqbey+FMikdgGRli
	 tJm4ZDgorSpCJev5+qgKmo7SgsZk+wk92NLsgp3CS7ESteuKMApnYENizWRXFhhftF
	 OgBusILmXDpbbG2XdFaJ+88uKptAcEO5EvCnxuL3xWPaKYincd25pDrdq/sWP5HLKt
	 99xLPswURPt3YuJrLiIuW9+4/QTnXXIoalV3taj+0K7h7VCACXOUV+j1Cu1IhR1XA2
	 PsMDkYY2w7bFQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260414-pxa1908-clk-reset-v1-3-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz> <20260414-pxa1908-clk-reset-v1-3-94bae5f3a8cf@dujemihanovic.xyz>
Subject: Re: [PATCH 3/4] clk: mmp: pxa1908-apbcp: Add reset cells
From: Stephen Boyd <sboyd@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Duje =?utf-8?q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Tue, 28 Apr 2026 19:08:30 -0700
Message-ID: <177742851052.5403.11325429550235456238@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204707_168080_E8ADB985 
X-CRM114-Status: UNSURE (   8.07  )
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

Quoting Duje Mihanovi=C4=87 (2026-04-14 12:51:52)
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20
> It has been concluded by comparing the gate clock masks and vendor code
> between PXA1908/28 that PXA1908's APBCP, similarly to PXA1928's APBC,
> has controllable reset lines. Describe these in the driver for
> correctness.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---

Applied to clk-next

