Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E1AE95A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igOfcg9KKA0FJfoCI82WYXp2Y+NpSlqCrrcK+S1kTug=; b=ci50qLyzaHyds2q1rwz5SvyLv2
	uX1+X34ZTi+YpeXsT22UbR277kkuUxtpRCa7f7poxNtTct5xn7d3zcz1IqgxahEGXoYq0gkKJXZ5A
	hEdI7dtmdBHBa2bV8GSwhju1PN5K8F7tAzZEQbt7eRNAix73KeOUqOQy/82QGvS8QjWoWu7svvhOh
	7Gg6EdHts7keZY6meJAbV4naaNGwE5h+gr1+P7pmnKZg7Eb0pnrE8GkRl7c7DfaP0tqX5381BjPGx
	2XxafApPq3l3gbaLZA966zHn0G/YjSEg5HjOuT8ZrnLlUmuhDBOmJdvBjjDAnXLsbBdbXMMW91fh2
	G3yS3abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZWa-00000004qpb-1EZF;
	Tue, 30 Dec 2025 13:12:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZWY-00000004qpT-3gth
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF9426000A;
	Tue, 30 Dec 2025 13:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D45C4CEFB;
	Tue, 30 Dec 2025 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100349;
	bh=R9HgzKj5DnzpWmoZYp/RfmX5CpfHXY11qVPk79TsB5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nF7Qzn3cth3kLyyzG2eMYUXQDEt0v3SlUgOrIohWf1o/Le99cybzvEEqIUninVPJb
	 iRLEi+rPjAFbXedGeRvcwJvBnjz5BX91Dp4qV5QKBFfbcMhXtSDPQqeUZDHcJzuZP7
	 16HmPYT/kPsPoy6gfv/UrWrg+UxX+JdTgMUWtVZ1gzf67gfghP0XygJEqJiusRSO4j
	 V9ZVgaDvzsUKCPbCiY2n/MrBq5w3+VvWx6PRyH6vJzK3EDIweXY1f9t2AIz+VevxbA
	 C/9j5s0i4oquZk9MxSDi/siR8DJYkLinhX6eOFQ4Syod2YW2tsYdPLp7CJOeNpLs4q
	 SNpPjp1spyxzw==
Date: Tue, 30 Dec 2025 21:12:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/3] arm64: dts: freescale: Use hyphen in node names
Message-ID: <aVPPtx-8Mg_lLLNE@dragon>
References: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, Dec 23, 2025 at 04:26:25PM +0100, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied all, thanks!

