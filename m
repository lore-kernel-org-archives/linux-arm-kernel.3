Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E945E6E815
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdUNyXOvujvhPt+hXHM1uvHJZ3UgKsPIS+vRCXku+ig=; b=XyfGRMGZopfU3rSTXwZ1e3ahsl
	TSMPtHgsjxcLmCPYCkV+RDWOXsU4f10Z3Tk8TaD/8piZ10lR9Uv4/fG7dmH9f3N5ix2bLQO3zenBW
	vZbKC9vEekRTeiIAxp+LyNjmEwOZNXHnrYKwSMGVRooHsABcl/AYCX4qxnhAvM15v0M045o/qob3H
	vUsxSVMm0vxkQogcqCn3+NNnbIEerETgbBi4liCScoAd241zY2rAPtQ32XJTDU346U4KfKGTlLpjX
	A3LCIl/E2uHBQsLoYftE1m+LLc98DQoE+V9vIUKVKJtE0SUX36S25j2vwc9oXs9rzsV0/ecYoHEHb
	x+iMqJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVZu-00000007wub-1weE;
	Wed, 04 Feb 2026 05:37:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVZs-00000007wu8-2WTE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 05:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44C36409FC;
	Wed,  4 Feb 2026 05:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABFDC4CEF7;
	Wed,  4 Feb 2026 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183443;
	bh=DdUNyXOvujvhPt+hXHM1uvHJZ3UgKsPIS+vRCXku+ig=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=fxsq36n5ccJTll8D2V0Z1aqU012l7/JwvLvNMdXjDncIAAJmX0c63uLJ0FZYN3Yo0
	 +1CnSRlBLRuOX7xqgsmeN3zEjP9G8KdIzuWXhbnazgqYW5fwKr1+k7NcDRcQ6Brp2G
	 shMYb2y5roWPQdmBQMg8jttozAnyMQ3EvJZbYH0pzRQ5VMtMReZKnqluivJ2Or1A9b
	 1bHovcbErXdOwzoSIv5Snct+ryaf920nis7CSGgFkcEivv1aw0vw0eFGqMTMaYml0j
	 XnkRutUDdS3rrhCS4sbOU9IplV6bNXYufT+A7CbaodtvgjhN70UbfAclUiAuqK7O3S
	 rCPAOtCNBnxzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com> <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add reset for HACE/VIDEO
From: Stephen Boyd <sboyd@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 03 Feb 2026 21:37:21 -0800
Message-ID: <177018344119.4027.5055693146328954429@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_213724_658570_C8701A76 
X-CRM114-Status: UNSURE (   5.70  )
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

Quoting Jammy Huang (2025-10-02 18:58:45)
> Add mappings of reset per hw's definition.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Applied to clk-next

